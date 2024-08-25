#!/bin/bash

# Function to check for errors
check_error() {
  if [ $? -ne 0 ]; then
    echo "Error occurred during the script execution. Exiting."
    exit 1
  fi
}

# Update and install necessary packages
echo "Updating package lists..."
sudo apt-get update -y
check_error

echo "Installing necessary packages..."
sudo apt-get install -y wget curl
check_error

# Install Node Exporter
echo "Downloading Node Exporter..."
wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz
check_error

echo "Extracting Node Exporter..."
tar xvfz node_exporter-1.5.0.linux-amd64.tar.gz
check_error

echo "Installing Node Exporter..."
sudo cp node_exporter-1.5.0.linux-amd64/node_exporter /usr/local/bin/
check_error

echo "Starting Node Exporter..."
sudo nohup node_exporter &
check_error

# Create Docker Compose file
echo "Creating Docker Compose file..."
cat <<EOF > docker-compose.yml
version: '3.8'

services:
  prometheus:
    image: prom/prometheus
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml
    ports:
      - "9090:9090"
    deploy:
      replicas: 1

  grafana:
    image: grafana/grafana
    ports:
      - "3000:3000"
    volumes:
      - grafana_data:/var/lib/grafana
    deploy:
      replicas: 1

  cadvisor:
    image: google/cadvisor:latest
    ports:
      - "8080:8080"
    volumes:
      - /:/rootfs:ro
      - /var/run:/var/run:ro
      - /sys:/sys:ro
      - /var/lib/docker/:/var/lib/docker:ro
      - /dev/disk/:/dev/disk:ro
    deploy:
      replicas: 1

  postgres_exporter:
    image: quay.io/prometheuscommunity/postgres-exporter
    environment:
      DATA_SOURCE_NAME: "postgresql://username:password@localhost:5432/dbname?sslmode=disable"
    ports:
      - "9187:9187"
    deploy:
      replicas: 1

volumes:
  grafana_data:
EOF

check_error

# Create Prometheus configuration file
echo "Creating Prometheus configuration file..."
cat <<EOF > prometheus.yml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'node_exporter'
    static_configs:
      - targets: ['localhost:9100']

  - job_name: 'cadvisor'
    static_configs:
      - targets: ['localhost:8080']

  - job_name: 'postgres_exporter'
    static_configs:
      - targets: ['localhost:9187']
EOF

check_error

# Start Docker Compose services
echo "Starting Docker Compose services..."
docker-compose up -d
check_error

# Instructions
echo "Setup complete!"
echo "You can access Prometheus at http://<your-server-ip>:9090"
echo "You can access Grafana at http://<your-server-ip>:3000 (default username: admin, password: admin)"
echo "Grafana can be configured to add Prometheus as a data source and import dashboards."
echo "Make sure to replace username, password, and dbname with your PostgreSQL credentials in the docker-compose.yml file."

echo "Setup complete. You may need to configure Grafana and set up alerting rules in Prometheus manually."

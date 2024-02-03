#!/bin/bash

echo "Enter the name for a new project"
read input

cargo generate --git https://github.com/slint-ui/slint-rust-template --name $input
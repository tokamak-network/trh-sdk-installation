#!/bin/bash
# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="MacOS"
elif [[ "$OSTYPE" == "linux"* ]]; then
    OS="Linux"
else
    echo "Unsupported operating system"
    exit 1
fi

echo "Detected OS: $OS"

# Download Go
echo "Installing Go..."
if [[ "$OS" == "Linux" ]]; then
    wget https://go.dev/dl/go1.22.6.linux-amd64.tar.gz
    # Remove existing Go installation and extract new one
    sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.6.linux-amd64.tar.gz
    # Clean up downloaded archive
    rm go1.22.6.linux-amd64.tar.gz
elif [[ "$OS" == "MacOS" ]]; then
    wget https://go.dev/dl/go1.22.6.darwin-amd64.pkg
    # Install Go package
    sudo installer -pkg go1.22.6.darwin-amd64.pkg -target /
    # Clean up downloaded package
    rm go1.22.6.darwin-amd64.pkg
fi

# Set shell config file based on OS
if [[ "$OS" == "Linux" ]]; then
    SHELL_CONFIG="$HOME/.bashrc"
else
    SHELL_CONFIG="$HOME/.zshrc"
fi

# Add required PATH exports if not already present
if ! grep -q "export PATH=\$PATH:/usr/local/go/bin" "$SHELL_CONFIG"; then
    echo "export PATH=\$PATH:/usr/local/go/bin" >> "$SHELL_CONFIG"
fi

if ! grep -q "export PATH=\$HOME/go/bin:\$PATH" "$SHELL_CONFIG"; then
    echo "export PATH=\$HOME/go/bin:\$PATH" >> "$SHELL_CONFIG"
fi

if ! grep -q "export PATH=\$PATH:\$HOME/.foundry/bin" "$SHELL_CONFIG"; then
    echo "export PATH=\$PATH:\$HOME/.foundry/bin" >> "$SHELL_CONFIG"
fi

# Source shell config to apply changes immediately
source "$SHELL_CONFIG"

echo "✅ Go has been installed successfully!"

# Install TRH SDK CLI
echo "Installing TRH SDK CLI..."
go install github.com/tokamak-network/trh-sdk@c6197454572c931ab5105444de5b8047c63e6cf8

echo "✅ TRH SDK has been installed successfully!"


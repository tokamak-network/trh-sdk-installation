# TRH SDK Installation Guide

This repository contains scripts and instructions for installing the TRH SDK (Tokamak Rollup Helper Software Development Kit) and its dependencies.

## Prerequisites

- Linux or MacOS operating system
- Internet connection
- Basic command line knowledge

## What Gets Installed

The setup script will install:

1. Go Programming Language (version 1.22.6)
2. TRH SDK CLI tool
3. Required PATH environment variables

## Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/tokamak-network/trh-sdk-installation.git
   cd trh-sdk-installation
   ```

2. Run the setup script:

   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```

3. Source the shell config:

   MacOS:

   ```bash
   source ~/.zshrc
   ```

   Linux:

   ```bash
   source ~/.bashrc
   ```

4. Verify the installation:

   ```bash
   trh-sdk --help
   ```

## Troubleshooting

If you encounter any issues, please refer to the [TRH SDK Troubleshooting Guide](https://www.notion.so/tokamak/Troubleshooting-Guide-19fd96a400a38007bc76e36993b9582b) for troubleshooting tips.

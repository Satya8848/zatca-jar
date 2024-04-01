#!/bin/bash

# Step 1: Install jq
echo "Installing jq..."
# Add code to download and install jq
# Example: sudo apt-get install jq
sudo apt-get install jq

# Step 2: Download sdk.zip file
echo "Downloading sdk.zip file..."
# Add code to download sdk.zip file
# Example: wget https://example.com/sdk.zip
git clone https://github.com/aasif-patel/zatca_sdk3.3.git

# Step 3: Run command sh ~/.bash_profile
echo "Running command: sh ~/.bash_profile..."
sh ~/.bash_profile

# Step 4: Unzip the sdk.zip file
echo "Unzipping sdk.zip file..."
#unzip sdk.zip

# Step 5: Navigate to the root folder of the sdk
echo "Navigating to the root folder of the sdk..."
cd zatca_sdk3.3

# Step 6: Run install.sh
echo "Running command: ./install.sh..."
./install.sh

# Step 7: Run sh ~/.bash_profile
echo "Running command: sh ~/.bash_profile..."
sh ~/.bash_profile

# Step 8: Navigate to $FATOORA_HOME
echo "Navigating to $FATOORA_HOME..."
cd $FATOORA_HOME

# Step 9: Run command chmod +x fatoora
echo "Running command: chmod +x fatoora..."
chmod +x fatoora

echo "Installation completed successfully."

# Step 10: To check installation, run fatoora -help
echo "To check installation, run: fatoora -help"

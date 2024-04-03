#!/bin/bash

# Step 1: Install jq
# echo "Java Installation..."

# apt install default-jdk

# export JAVA_HOME=/usr/bin/java

# export PATH=$JAVA_HOME/bin:$PATH

# source ~/.bashrc

echo "Installing jq..."
# Add code to download and install jq
# Example: apt-get install jq
apt-get install jq

# Step 2: Download sdk.zip file
echo "Downloading sdk.zip file..."
# Add code to download sdk.zip file
# Example: wget https://example.com/sdk.zip
git clone https://github.com/aasif-patel/zatca_sdk3.3.git

# Step 3: Run command sh ~/.bash_profile
echo "Running command: touch ~/.bash_profile..."
touch ~/.profile



# Step 5: Navigate to the root folder of the sdk
echo "Navigating to the root folder of the sdk..."
cd zatca_sdk3.3

# Step 6: Run install.sh
echo "Running command: ./install.sh..."

export FATOORA_HOME="${PWD}"

export PATH=$PATH:$FATOORA_HOME/Apps/
#export PATH
#export FATOORA_HOME



touch ~/.zshrc
touch ~/.profile




SDK_CONFIG="${PWD}/Configuration/config.json"


echo "export PATH=$PATH:$FATOORA_HOME/Apps/" >> ~/.bash-profile
echo "export FATOORA_HOME=${PWD}/Apps" >> ~/.bash-profile
echo "export SDK_CONFIG=$SDK_CONFIG" >> ~/.bash-profile

echo "export PATH=$PATH:$FATOORA_HOME/Apps/" >> ~/.zshrc
echo "export FATOORA_HOME=${PWD}/Apps" >> ~/.zshrc
echo "export SDK_CONFIG=$SDK_CONFIG" >> ~/.zshrc





source ~/.profile
source ~/.zshrc

cd Configuration

parentDir="$(dirname "$PWD")"

xsdPath=$(jq -r '.xsdPath' defaults.json)
xsdPathFileName="$(basename $xsdPath)"

enSchematron=$(jq -r '.enSchematron' defaults.json)
enSchematronFileName="$(basename $enSchematron)"

zatcaSchematron=$(jq -r '.zatcaSchematron' defaults.json)
zatcaSchematronFileName="$(basename $zatcaSchematron)"

certPath=$(jq -r '.certPath' defaults.json)
certPathFileName="$(basename $certPath)"

pkPath=$(jq -r '.privateKeyPath' defaults.json)
pkPathFileName="$(basename $pkPath)"

pihPath=$(jq -r '.pihPath' defaults.json)
pihPathFileName="$(basename $pihPath)"

usagePath=$(jq -r '.usagePathFile' defaults.json)
usagePathFileName="$(basename $usagePath)"


jq -n '{"xsdPath":$one, "enSchematron":$two, "zatcaSchematron":$thr,"certPath":$fou, "privateKeyPath":$fiv  ,"pihPath":$six ,"inputPath":$sev,"usagePathFile":$eight}' \
  --arg one "${parentDir}/Data/Schemas/xsds/UBL2.1/xsd/maindoc/$xsdPathFileName" \
  --arg two "${parentDir}/Data/Rules/schematrons/$enSchematronFileName"   \
  --arg thr "${parentDir}/Data/Rules/schematrons/$zatcaSchematronFileName" \
  --arg fou "${parentDir}/Data/Certificates/$certPathFileName" \
  --arg fiv "${parentDir}/Data/Certificates/$pkPathFileName" \
  --arg six "${parentDir}/Data/PIH/$pihPathFileName"  \
  --arg sev "${parentDir}/Data/Input"  \
  --arg eight "${parentDir}/Configuration/$usagePathFileName"  >config.json

cd ../

# Step 7: Run sh ~/.bash_profile
echo "Running command: sh ~/.bash_profile..."
sh ~/.profile

# Step 8: Navigate to $FATOORA_HOME
echo "Navigating to $FATOORA_HOME..."
cd $FATOORA_HOME

# Step 9: Run command chmod +x fatoora
echo "Running command: chmod +x fatoora..."
chmod +x fatoora

echo "Installation completed successfully."

# Step 10: To check installation, run fatoora -help
# echo "To check installation, run: fatoora -help"
# fatoora -help


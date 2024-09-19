#!/bin/sh

# Check if environment variables for username and password are set
if [ -z "$ADGUARD_USERNAME" ] || [ -z "$ADGUARD_PASSWORD" ]; then
    echo "Error: ADGUARD_USERNAME and ADGUARD_PASSWORD must be set as environment variables."
    exit 1
fi

# Replace placeholders in the AdGuardHome.yaml file
sed -i "s/{USERNAME_PLACEHOLDER}/$ADGUARD_USERNAME/g" /opt/adguardhome/conf/AdGuardHome.yaml
sed -i "s/{PASSWORD_PLACEHOLDER}/$ADGUARD_PASSWORD/g" /opt/adguardhome/conf/AdGuardHome.yaml

# Start AdGuardHome server
exec /opt/adguardhome/AdGuardHome --no-check-update -c /opt/adguardhome/conf/AdGuardHome.yaml -w /opt/adguardhome/work

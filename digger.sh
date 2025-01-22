#!/bin/bash

# Check if the domain name and output choice are provided as arguments
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <domain_name> <short/long>"
    exit 1
fi

domain=$1
output_choice=$2

# Check if the output choice is valid
if [ "$output_choice" == "short" ]; then
    dig_option="+short"
elif [ "$output_choice" == "long" ]; then
    dig_option=""
else
    echo "Invalid option. Please enter 'short' or 'long'."
    exit 1
fi

# Run all dig commands and display the relevant sections together
{
    echo "DNS A record for $domain:"
    dig A $domain $dig_option
    echo -e "\nDNS MX record for $domain:"
    dig MX $domain $dig_option
    echo -e "\nDNS NS record for $domain:"
    dig NS $domain $dig_option
    echo -e "\nDNS TXT record for $domain:"
    dig TXT $domain $dig_option
    echo -e "\nDNS SOA record for $domain:"
    dig SOA $domain $dig_option
}

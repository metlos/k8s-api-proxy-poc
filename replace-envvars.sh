#!/bin/bash

SCRIPT="{"; 
for E in $(env | grep -o -E '^[^ ]*?='); do 
	KEY=$(echo "${E}" | cut -d"=" -f1)
	SCRIPT="$SCRIPT sub(/\{\{${KEY}\}\}/, ENVIRON[\"${KEY}\"]);"
done; 

SCRIPT="${SCRIPT} print}"
awk "${SCRIPT}" 


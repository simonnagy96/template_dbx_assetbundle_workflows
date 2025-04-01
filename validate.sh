#!/bin/sh

if [[ "$AUTHENTICATION_TYPE" == "token" ]]; then
  if [[ -z "$DATABRICKS_TOKEN" ]]; then
    echo "Error: 'DATABRICKS_TOKEN' must be provided when 'AUTHENTICATION_TYPE' is 'token'."
    exit 1
  fi
elif [[ "$AUTHENTICATION_TYPE" == "azure-managed-identity" ]]; then
  if [[ -z "$ARM_CLIENT_ID" ]]; then
    echo "Error: 'ARM_CLIENT_ID' must be provided when 'AUTHENTICATION_TYPE' is 'azure-managed-identity'."
    exit 1
  fi
else
  echo "Authentication type is not supported by pipeline."
  exit 1
fi
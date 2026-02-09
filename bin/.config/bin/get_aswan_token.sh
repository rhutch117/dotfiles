#!/usr/bin/env zsh

KCHOST=http://localhost:8080
# KCHOST=http://keycloak.local.sphinxdefense.com
REALM=aswan
CLIENT_ID=${CLIENT_ID:-orchestrator_service}
CLIENT_SECRET=${CLIENT_SECRET:-orchestrator_service_client_secret}

TOKEN=$(curl -sS \
  -d "client_id=$CLIENT_ID" -d "client_secret=$CLIENT_SECRET" \
  -d "grant_type=client_credentials" -d "scopes=profile" \
  "$KCHOST/realms/$REALM/protocol/openid-connect/token")


TOKEN=$(echo "$TOKEN" | jq -r '.access_token')

export TOKEN
echo "TOKEN has been set"

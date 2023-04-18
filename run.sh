#!/bin/bash
export MVD_UI_PATH="$(pwd)/../DataDashboard"
docker compose --profile ui -f system-tests/docker-compose.yml up -d --build


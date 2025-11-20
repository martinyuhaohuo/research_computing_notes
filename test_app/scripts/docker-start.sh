#!/bin/bash

# Resolve script directory
Resolve script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Project root is one level above scripts/
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Move to project root (where docker-compose.yml is)
cd "$PROJECT_ROOT"

echo "🚀 Building Docker images..."
docker compose build

echo "🚀 Starting all services..."
docker compose up -d

echo "✅ All services started!"
docker compose ps
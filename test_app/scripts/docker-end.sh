#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
cd "$PROJECT_ROOT"

echo "🛑 Stopping all services..."
docker compose down

echo "🧹 Cleaning unused Docker resources (optional)..."
docker system prune -f

echo "✅ All services stopped!"

#!/bin/bash

set -e

cd /terraria

PORT="${PORT:-7777}"
WORLDNAME="${WORLDNAME:-world}"
MAXPLAYERS="${MAXPLAYERS:-8}"
DIFFICULTY="${DIFFICULTY:-0}"
PASSWORD="${PASSWORD:-}"

mkdir -p /terraria/worlds

WORLD="/terraria/worlds/${WORLDNAME}.wld"

ARGS=(
    -port "$PORT"
    -world "$WORLD"
    -autocreate 2
    -worldname "$WORLDNAME"
    -maxplayers "$MAXPLAYERS"
    -difficulty "$DIFFICULTY"
)

if [ -n "$PASSWORD" ]; then
    ARGS+=(-password "$PASSWORD")
fi

exec ./TerrariaServer.bin.x86_64 "${ARGS[@]}"

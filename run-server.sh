#!/bin/bash
set -euo pipefail

exec mono TerrariaServer.exe -config "/terraria/configs/serverconfig.txt"

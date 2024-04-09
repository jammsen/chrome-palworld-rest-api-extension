#!/bin/bash

echo 'echo "[Node: Version $(node --version)]----[TypeScript: $(tsc --version)]----[Date: $(date +"%d.%m.%Y:%H:%M")]----[System: $(uname)]----[User: $(whoami)]"' >> ~/.bashrc
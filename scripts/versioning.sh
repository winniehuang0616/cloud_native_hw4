#!/bin/bash
VERSION="v$(date +'%Y.%m.%d')-$(git rev-parse --short HEAD)"
echo "Version: $VERSION"

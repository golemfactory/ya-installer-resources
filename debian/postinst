#!/bin/bash

set -e

resources_dir="${RESOURCES_UNPACK_DIR:-/usr/lib/yagna/installer/}"

ya-provider pre-install
golemsp manifest-bundle add "${resources_dir}"

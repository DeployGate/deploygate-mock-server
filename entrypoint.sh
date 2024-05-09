#!/usr/bin/env bash

set -euo pipefail

bundle exec thin -R config.ru start

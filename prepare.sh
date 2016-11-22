#!/bin/bash

set -euo pipefail

sudo apt-get install apache2 && apt-get install apache2-utils

cp ./ports.conf ./root/etc/apache2/

#!/bin/bash

set -euo pipefail

apt-get install -y --without-yes apache2 && apt-get install -y --without-yes apache2-utils &

cp ./ports.conf /etc/apache2/

#!/usr/bin/env bash

set -e

git clone https://github.com/i3/i3
pushd i3
git apply ../fix_double_border_between_tabs.patch
meson build
pushd build
ninja
if ! [ -f "/usr/bin/i3.bak" ]; then
  echo "/usr/bin/i3 -> /usr/bin/i3.bak"
  sudo mv /usr/bin/i3 /usr/bin/i3.bak
fi
sudo mv i3 /usr/bin/i3
popd
popd
rm -rf i3

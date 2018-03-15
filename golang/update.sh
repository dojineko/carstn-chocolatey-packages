#!/bin/bash

if [ "$1" = "" ]; then
  echo "Usage: $0 version"
  echo "Update the choco package to a given version"
  echo "Example: $0 1.7.4"
  exit 1
fi

if [[ "${OSTYPE}" != "darwin"* && "${OSTYPE}" != "linux-gnu"* ]]; then
  echo "This version support Mac and Windows Subsystem for Linux"
  exit 2
fi

version=$1

url="https://dl.google.com/go/go${version}.windows-386.msi"
url64="https://dl.google.com/go/go${version}.windows-amd64.msi"

checksum=$(curl "${url}.sha256")
checksum64=$(curl "${url64}.sha256")

sed -i.bak "s/<version>.*<\/version>/<version>${version}<\/version>/" golang.nuspec

sed -i.bak "s!^\$url = '.*'!\$url = '${url}'!" tools/chocolateyinstall.ps1
sed -i.bak "s/^\$checksum = '.*'/\$checksum = '${checksum}'/" tools/chocolateyinstall.ps1
sed -i.bak "s!^\$url64 = '.*'!\$url64 = '${url64}'!" tools/chocolateyinstall.ps1
sed -i.bak "s/^\$checksum64 = '.*'/\$checksum64 = '${checksum64}'/" tools/chocolateyinstall.ps1

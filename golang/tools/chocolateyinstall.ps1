$ErrorActionPreference = 'Stop'

$url = 'https://dl.google.com/go/go1.10.windows-386.msi'
$checksum = 'bad7550085269fd5c9d6ef7ed0b22f2c539554802d3bf03010760f8a5b25fa15'
$url64 = 'https://dl.google.com/go/go1.10.windows-amd64.msi'
$checksum64 = '4b09094c811e0856b134628800a7820fd3e15e7f4a4fe16f0da42b5ca1a1c86c'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64
  softwareName  = 'golang*'
  checksum      = $checksum
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs

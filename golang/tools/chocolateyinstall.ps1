$ErrorActionPreference = 'Stop'

$url = 'https://dl.google.com/go/go1.9.4.windows-386.msi'
$checksum = '5143baa5f7fba4bc4d4c4470943b192d0671de009d80d75df8744aba341bf560'
$url64 = 'https://dl.google.com/go/go1.9.4.windows-amd64.msi'
$checksum64 = 'eb2328ca1d15e3fd538b06b451540dec9981202083cc921201112160ae6b0020'

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

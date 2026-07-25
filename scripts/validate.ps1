[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repositoryRoot = Split-Path -Parent $PSScriptRoot

Push-Location (Join-Path $repositoryRoot 'terraform')
try {
    terraform fmt -check -recursive
    terraform init -backend=false
    terraform validate
}
finally {
    Pop-Location
}

Push-Location (Join-Path $repositoryRoot 'terraform/bootstrap')
try {
    terraform fmt -check
    terraform init -backend=false
    terraform validate
}
finally {
    Pop-Location
}

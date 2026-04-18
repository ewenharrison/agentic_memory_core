param(
    [string]$Destination = ".\exports\agentic_workspace_core"
)

$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$destinationPath = if ([System.IO.Path]::IsPathRooted($Destination)) {
    $Destination
} else {
    Join-Path $repoRoot $Destination
}

$includePaths = @(
    "README.core.md",
    "PUBLISHING.core.md",
    "profile.core",
    "workspace\_templates",
    "workspace\repo",
    "workspace\workflows",
    "workspace\registry",
    "workspace\registry\index.core.md",
    "workspace\projects\sample-project",
    ".github\workflows\tier2-cloud-maintenance.yml",
    "scripts\post-teams-update.ps1",
    "scripts\run-tier2-cloud-task.ps1",
    "scripts\export-agentic-memory-core.ps1"
)

if (Test-Path -LiteralPath $destinationPath) {
    Remove-Item -LiteralPath $destinationPath -Recurse -Force
}

New-Item -ItemType Directory -Path $destinationPath -Force | Out-Null

foreach ($relativePath in $includePaths) {
    $sourcePath = Join-Path $repoRoot $relativePath
    if (-not (Test-Path -LiteralPath $sourcePath)) {
        Write-Warning "Skipping missing path: $relativePath"
        continue
    }

    $targetPath = Join-Path $destinationPath $relativePath
    if ($relativePath -eq "README.core.md") {
        $targetPath = Join-Path $destinationPath "README.md"
    }
    if ($relativePath -eq "PUBLISHING.core.md") {
        $targetPath = Join-Path $destinationPath "PUBLISHING.md"
    }
    if ($relativePath -eq "profile.core") {
        $targetPath = Join-Path $destinationPath "profile"
    }
    if ($relativePath -eq "workspace\\registry\\index.core.md") {
        $targetPath = Join-Path $destinationPath "workspace\\registry\\index.md"
    }
    $targetParent = Split-Path -Parent $targetPath
    if ($targetParent) {
        New-Item -ItemType Directory -Path $targetParent -Force | Out-Null
    }

    Copy-Item -LiteralPath $sourcePath -Destination $targetPath -Recurse -Force
}

$exportRegistryPath = Join-Path $destinationPath "workspace\registry"
$exportRegistryIndexPath = Join-Path $exportRegistryPath "index.md"
$coreRegistryIndexSource = Join-Path $repoRoot "workspace\registry\index.core.md"

if (Test-Path -LiteralPath $exportRegistryIndexPath) {
    Remove-Item -LiteralPath $exportRegistryIndexPath -Force
}

Get-Content -LiteralPath $coreRegistryIndexSource -Raw | Set-Content -LiteralPath $exportRegistryIndexPath

@"
# Local secrets
config/

# Export artefacts
exports/

# OS / editor noise
.DS_Store
Thumbs.db
.vscode/
"@ | Set-Content -LiteralPath (Join-Path $destinationPath ".gitignore")

Write-Host "Exported framework-only core bundle to: $destinationPath"

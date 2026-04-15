param(
    [string]$Destination = ".\exports\agentic_memory_core"
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
    "memories\_templates",
    "memories\repo",
    "memories\workflows",
    "memories\registry",
    "memories\registry\index.core.md",
    "memories\projects\sample-project",
    "scripts\post-teams-update.ps1",
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
    if ($relativePath -eq "memories\\registry\\index.core.md") {
        $targetPath = Join-Path $destinationPath "memories\\registry\\index.md"
    }
    $targetParent = Split-Path -Parent $targetPath
    if ($targetParent) {
        New-Item -ItemType Directory -Path $targetParent -Force | Out-Null
    }

    Copy-Item -LiteralPath $sourcePath -Destination $targetPath -Recurse -Force
}

$exportRegistryPath = Join-Path $destinationPath "memories\registry"
$exportRegistryIndexPath = Join-Path $exportRegistryPath "index.md"
$coreRegistryIndexSource = Join-Path $repoRoot "memories\registry\index.core.md"

if (Test-Path -LiteralPath $exportRegistryIndexPath) {
    Remove-Item -LiteralPath $exportRegistryIndexPath -Force
}

Copy-Item -LiteralPath $coreRegistryIndexSource -Destination $exportRegistryIndexPath -Force

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

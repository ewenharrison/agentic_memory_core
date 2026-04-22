param(
    [Parameter(Mandatory = $true)]
    [string]$InputPath,

    [string]$OutputPath,

    [string]$PandocPath
)

$ErrorActionPreference = "Stop"

$resolvedInput = Resolve-Path -LiteralPath $InputPath
$inputItem = Get-Item -LiteralPath $resolvedInput.Path

$defaultOutput = $false
if (-not $OutputPath) {
    $OutputPath = [System.IO.Path]::ChangeExtension($inputItem.FullName, ".docx")
    $defaultOutput = $true
}

$outputDirectory = Split-Path -Parent $OutputPath
if ($outputDirectory -and -not (Test-Path -LiteralPath $outputDirectory)) {
    New-Item -ItemType Directory -Path $outputDirectory | Out-Null
}

if ($PandocPath -and -not (Test-Path -LiteralPath $PandocPath)) {
    throw "Pandoc was not found at the specified path: $PandocPath"
}

if (-not $PandocPath) {
    $pandocCommand = Get-Command pandoc -ErrorAction SilentlyContinue
    if ($pandocCommand) {
        $PandocPath = $pandocCommand.Source
    }
    else {
        $windowsLocalPandoc = Join-Path $env:LOCALAPPDATA "Pandoc\pandoc.exe"
        if (Test-Path -LiteralPath $windowsLocalPandoc) {
            $PandocPath = $windowsLocalPandoc
        }
        else {
            throw "Pandoc was not found. Install it and ensure it is on PATH, or pass -PandocPath."
        }
    }
}

$temporaryOutput = Join-Path $env:TEMP ("markdown-word-export-" + [guid]::NewGuid().ToString() + ".docx")

& $PandocPath `
    $inputItem.FullName `
    --from gfm `
    --to docx `
    --output $temporaryOutput

if ($LASTEXITCODE -ne 0) {
    throw "Pandoc failed with exit code $LASTEXITCODE."
}

try {
    Move-Item -LiteralPath $temporaryOutput -Destination $OutputPath -Force
}
catch {
    if ($defaultOutput) {
        $fallbackOutput = Join-Path $inputItem.DirectoryName ("{0}-{1}.docx" -f $inputItem.BaseName, (Get-Date -Format "yyyyMMdd-HHmmss"))
        Move-Item -LiteralPath $temporaryOutput -Destination $fallbackOutput -Force
        $OutputPath = $fallbackOutput
        Write-Warning "The default Word output appears to be locked, so the rendered file was saved to a timestamped fallback path."
    }
    else {
        Remove-Item -LiteralPath $temporaryOutput -Force -ErrorAction SilentlyContinue
        throw
    }
}

$outputItem = Get-Item -LiteralPath $OutputPath
[pscustomobject]@{
    Input = $inputItem.FullName
    Output = $outputItem.FullName
    SizeKB = [Math]::Round($outputItem.Length / 1KB, 1)
    LastWriteTime = $outputItem.LastWriteTime.ToString("yyyy-MM-dd HH:mm:ss")
}

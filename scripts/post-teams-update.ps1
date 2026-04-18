param(
    [Parameter(Mandatory = $true)]
    [string]$Project,

    [string]$File = "",

    [string]$Title = "",

    [switch]$PlainText
)

$ErrorActionPreference = "Stop"

function Get-WebhookUrl {
    $configPath = Join-Path $PSScriptRoot "..\\config\\teams-webhook-url.txt"

    if ($env:TEAMS_WEBHOOK_URL) {
        return $env:TEAMS_WEBHOOK_URL
    }

    if (Test-Path $configPath) {
        $value = (Get-Content $configPath -Raw).Trim()
        if ($value) {
            return $value
        }
    }

    throw "No Teams webhook URL found. Set TEAMS_WEBHOOK_URL or create config/teams-webhook-url.txt."
}

function Get-DefaultFile {
    param([string]$Project)

    $candidate = Join-Path $PSScriptRoot "..\\workspace\\projects\\$Project\\collab\\teams-update.md"
    if (Test-Path $candidate) {
        return $candidate
    }

    throw "No default update file found for project '$Project'. Expected $candidate"
}

function Get-WebhookMode {
    param([string]$WebhookUrl)

    if ($WebhookUrl -match 'logic.azure.com|powerautomate|workflow') {
        return "workflow"
    }

    if ($WebhookUrl -match 'webhook.office.com|outlook.office.com/webhook') {
        return "incoming_webhook"
    }

    return "unknown"
}

function Convert-MarkdownToPlainText {
    param([string]$Markdown)

    $text = $Markdown
    $text = $text -replace '\[([^\]]+)\]\([^)]+\)', '$1'
    $text = $text -replace '^#\s+', ''
    $text = $text -replace '^##\s+', ''
    $text = $text -replace '^###\s+', ''
    $text = $text -replace '^\-\s+', '* '
    $text = $text -replace '^\d+\.\s+', '* '
    return $text.Trim()
}

$webhookUrl = Get-WebhookUrl
$webhookMode = Get-WebhookMode -WebhookUrl $webhookUrl
$resolvedFile = if ($File) { $File } else { Get-DefaultFile -Project $Project }

if (-not (Test-Path $resolvedFile)) {
    throw "Update file not found: $resolvedFile"
}

$rawMarkdown = Get-Content $resolvedFile -Raw
$plainText = Convert-MarkdownToPlainText -Markdown $rawMarkdown
$messageTitle = if ($Title) { $Title } else { "Project update: $Project" }

if ($PlainText) {
    $payload = @{
        text = "$messageTitle`n`n$plainText"
    } | ConvertTo-Json -Depth 4
} else {
    $payload = @{
        type = "message"
        attachments = @(
            @{
                contentType = "application/vnd.microsoft.card.adaptive"
                contentUrl = $null
                content = @{
                    '$schema' = "http://adaptivecards.io/schemas/adaptive-card.json"
                    type = "AdaptiveCard"
                    version = "1.2"
                    body = @(
                        @{
                            type = "TextBlock"
                            text = $messageTitle
                            weight = "Bolder"
                            size = "Medium"
                            wrap = $true
                        },
                        @{
                            type = "TextBlock"
                            text = $plainText
                            wrap = $true
                        }
                    )
                }
            }
        )
    } | ConvertTo-Json -Depth 8
}

try {
    $response = Invoke-RestMethod -Method Post -ContentType "application/json" -Body $payload -Uri $webhookUrl
    Write-Output "Posted update for '$Project' from '$resolvedFile' using mode '$webhookMode'."
    if ($null -ne $response) {
        Write-Output ($response | ConvertTo-Json -Depth 8 -Compress)
    }
} catch {
    Write-Error "Teams post failed using mode '$webhookMode': $($_.Exception.Message)"
    throw
}

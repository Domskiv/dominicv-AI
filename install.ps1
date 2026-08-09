param(
    [string]$ProjectPath = (Get-Location).Path
)

$CompanionRoot = $PSScriptRoot

# Strip trailing >, spaces, quotes, or slashes that sneak in from copy-pasting a PS prompt
$ProjectPath = $ProjectPath.TrimEnd('>', ' ', '\', '/', '"', "'")

# Create the project directory if it doesn't exist
if (-not (Test-Path $ProjectPath)) {
    New-Item -ItemType Directory -Force -Path $ProjectPath | Out-Null
}

$ProjectPath = (Resolve-Path $ProjectPath).Path
$SkillsTarget = "$env:USERPROFILE\.claude\skills"
$AgentsTarget = "$ProjectPath\.claude\agents"
$CompanionDir = "$ProjectPath\.companion"

Write-Host ""
Write-Host "Sleepy Dev Companion"
Write-Host "Installing into: $ProjectPath"
Write-Host ""

# Install skills globally
Write-Host "Skills -> $SkillsTarget"
New-Item -ItemType Directory -Force -Path $SkillsTarget | Out-Null
Get-ChildItem "$CompanionRoot\skills" -Directory | ForEach-Object {
    $dest = "$SkillsTarget\$($_.Name)"
    if (Test-Path $dest) { Remove-Item $dest -Recurse -Force }
    Copy-Item $_.FullName $dest -Recurse
    Write-Host "  + $($_.Name)"
}

# Install agents to project
Write-Host "Agents -> $AgentsTarget"
New-Item -ItemType Directory -Force -Path $AgentsTarget | Out-Null
Get-ChildItem "$CompanionRoot\agents" -Filter "*.md" | ForEach-Object {
    Copy-Item $_.FullName "$AgentsTarget\$($_.Name)" -Force
    Write-Host "  + $($_.BaseName)"
}

# Create .companion directory and files
New-Item -ItemType Directory -Force -Path $CompanionDir | Out-Null
if (-not (Test-Path "$CompanionDir\stack.md")) {
    New-Item -ItemType File -Path "$CompanionDir\stack.md" | Out-Null
}
if (-not (Test-Path "$CompanionDir\log.md")) {
    New-Item -ItemType File -Path "$CompanionDir\log.md" | Out-Null
}
Write-Host "Context -> $CompanionDir"
Write-Host "  + stack.md"
Write-Host "  + log.md"

# Add .companion to .gitignore
$GitIgnore = "$ProjectPath\.gitignore"
if (Test-Path $GitIgnore) {
    $content = Get-Content $GitIgnore -Raw
    if ($content -notmatch "\.companion") {
        Add-Content $GitIgnore "`n.companion/"
        Write-Host "  + .companion/ added to .gitignore"
    }
} else {
    ".companion/" | Out-File $GitIgnore -Encoding utf8
    Write-Host "  + .gitignore created"
}

# Copy CONTEXT.md template if not present
$ContextTarget = "$ProjectPath\CONTEXT.md"
if (-not (Test-Path $ContextTarget)) {
    Copy-Item "$CompanionRoot\templates\CONTEXT.md" $ContextTarget
    Write-Host "  + CONTEXT.md created"
}

Write-Host ""
Write-Host "Done. Run /companion in $ProjectPath to start."
Write-Host ""

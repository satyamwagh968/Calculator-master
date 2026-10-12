# Upload files to GitHub using API
$wc = New-Object System.Net.WebClient
$wc.Headers.Add("User-Agent", "Calculator")
$wc.Headers.Add("Authorization", "token YOUR_GITHUB_TOKEN")

$repoOwner = "satyamwagh968"
$repoName = "Calculator-master"
$branch = "main"

# Get all Java and resource files
$files = Get-ChildItem -Path "C:\Users\satyam\OneDrive\Desktop\Calculator-master\src" -Recurse -File
foreach ($file in $files) {
    $relativePath = $file.FullName.Replace("C:\Users\satyam\OneDrive\Desktop\Calculator-master\", "")
    $content = [System.IO.File]::ReadAllBytes($file.FullName)
    $base64 = [Convert]::ToBase64String($content)
    
    # API endpoint to create/update file
    $apiUrl = "https://api.github.com/repos/$repoOwner/$repoName/contents$relativePath"
    
    $body = @{
        message = "Add $($file.Name)"
        content = $base64
        branch = $branch
    } | ConvertTo-Json -Depth 10
    
    try {
        $result = $wc.UploadString($apiUrl, "PUT", $body)
        Write-Host "Successfully uploaded: $($file.Name)" -ForegroundColor Green
    } catch {
        Write-Host "Failed: $($file.Name) - $_" -ForegroundColor Red
    }
}

Write-Host "Upload complete!"
﻿$token = 'nuywbv31cx4fu7ok0i37'
$revision = (git rev-parse HEAD)
$branch= &git rev-parse --abbrev-ref HEAD

$headers = @{
  "Authorization" = "Bearer $token"
  "Content-type" = "application/json"
}

$body = @{
    accountName="arnonax"
    projectSlug="testessentials-92qwm"
    commitId=$revision
    branch=$branch
}
$body = $body | ConvertTo-Json

Invoke-RestMethod -Uri 'https://ci.appveyor.com/api/builds' -Headers $headers  -Body $body -Method POST
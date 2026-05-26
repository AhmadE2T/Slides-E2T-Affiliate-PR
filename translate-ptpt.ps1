$sourcePath = "c:\Users\sahma\Desktop\Slides E2T Affiliate EN\assets\index-UFoGpxLQ.js"
$targetPath = "c:\Users\sahma\Desktop\Slides E2T Affiliate EN\assets\index-UFoGpxLQ.fix.js"
$content = [System.IO.File]::ReadAllText($sourcePath)
$scriptPath = "c:\Users\sahma\Desktop\Slides E2T Affiliate EN\translate-ptpt.mjs"
node $scriptPath
if ($LASTEXITCODE -ne 0) {
  exit $LASTEXITCODE
}

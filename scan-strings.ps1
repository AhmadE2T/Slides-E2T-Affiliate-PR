$path = "c:\Users\sahma\Desktop\Slides E2T Affiliate EN\assets\index-UFoGpxLQ.fix.js"
$c = [System.IO.File]::ReadAllText($path)
$regex = '"([^"\\]|\\.)*"'
$matches = [regex]::Matches($c, $regex)
$set = New-Object System.Collections.Generic.HashSet[string]

foreach ($m in $matches) {
  $s = $m.Value.Trim('"')
  if ($s.Length -lt 8) { continue }
  if ($s -notmatch '[A-Za-z]') { continue }
  if ($s -notmatch '\s') { continue }
  if ($s -match '^(absolute|relative|flex|grid|text-|bg-|border|w\[|h\[|px\[|py\[|mt\[|mb\[|pt\[|pb\[|leading|tracking|uppercase|lowercase|rounded|overflow|justify|items|font-|object-|translate|scale|opacity|z-|top\[|left\[|right\[|bottom\[)') { continue }
  if ($s -match '^(http|https|data:|modulepreload|anonymous|application|charset|viewport|vite|module|crossorigin|srcset)') { continue }
  if ($s -match '^[A-Za-z0-9_./:-]+$') { continue }
  [void]$set.Add($s)
}

$set | Sort-Object | Set-Content -Path "c:\Users\sahma\Desktop\Slides E2T Affiliate EN\string-candidates.txt" -Encoding utf8
Write-Output "WROTE"

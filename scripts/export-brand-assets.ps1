param(
  [string]$ProjectRoot = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
if ($PSVersionTable.PSVersion.Major -lt 7) {
  throw 'Run this script with PowerShell 7+ (pwsh). Windows PowerShell 5 can corrupt Thai text rendering.'
}
Add-Type -AssemblyName System.Drawing

$brandRoot = Join-Path $ProjectRoot 'public\brand\imagegen'
$profileMaster = Join-Path $brandRoot 'logo-profile-master.png'
$coverMaster = Join-Path $brandRoot 'facebook-cover-background-doodle.png'

if (-not (Test-Path -LiteralPath $profileMaster)) {
  throw "Missing ImageGen profile master: $profileMaster"
}
if (-not (Test-Path -LiteralPath $coverMaster)) {
  throw "Missing ImageGen cover master: $coverMaster"
}

function New-Canvas([int]$Width, [int]$Height) {
  $bitmap = [System.Drawing.Bitmap]::new(
    $Width,
    $Height,
    [System.Drawing.Imaging.PixelFormat]::Format32bppArgb
  )
  $bitmap.SetResolution(96, 96)
  return $bitmap
}

function Set-HighQuality([System.Drawing.Graphics]$Graphics) {
  $Graphics.CompositingMode = [System.Drawing.Drawing2D.CompositingMode]::SourceOver
  $Graphics.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality
  $Graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
  $Graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
  $Graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
  $Graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit
}

function Export-ResizedPng(
  [string]$Source,
  [string]$Destination,
  [int]$Width,
  [int]$Height,
  [System.Drawing.Rectangle]$SourceRect
) {
  $image = [System.Drawing.Image]::FromFile($Source)
  try {
    $bitmap = New-Canvas $Width $Height
    try {
      $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
      try {
        Set-HighQuality $graphics
        $graphics.DrawImage(
          $image,
          [System.Drawing.Rectangle]::new(0, 0, $Width, $Height),
          $SourceRect,
          [System.Drawing.GraphicsUnit]::Pixel
        )
      }
      finally { $graphics.Dispose() }
      $bitmap.Save($Destination, [System.Drawing.Imaging.ImageFormat]::Png)
    }
    finally { $bitmap.Dispose() }
  }
  finally { $image.Dispose() }
}

$profileImage = [System.Drawing.Image]::FromFile($profileMaster)
try {
  $profileFull = [System.Drawing.Rectangle]::new(0, 0, $profileImage.Width, $profileImage.Height)
  # Tight crop retains the ImageGen tile while making the mark readable at header/favicon sizes.
  $tileInset = [int][Math]::Round($profileImage.Width * 0.085)
  $tileSize = $profileImage.Width - (2 * $tileInset)
  $profileTile = [System.Drawing.Rectangle]::new($tileInset, $tileInset, $tileSize, $tileSize)
}
finally { $profileImage.Dispose() }

Export-ResizedPng $profileMaster (Join-Path $brandRoot 'facebook-profile-1080.png') 1080 1080 $profileFull
Export-ResizedPng $profileMaster (Join-Path $brandRoot 'facebook-profile-320.png') 320 320 $profileFull
Export-ResizedPng $profileMaster (Join-Path $brandRoot 'logo-mark-imagegen-512.png') 512 512 $profileTile
Export-ResizedPng $profileMaster (Join-Path $brandRoot 'favicon-imagegen-64.png') 64 64 $profileTile

$coverImage = [System.Drawing.Image]::FromFile($coverMaster)
try {
  $coverRect = [System.Drawing.Rectangle]::new(0, 0, $coverImage.Width, $coverImage.Height)
}
finally { $coverImage.Dispose() }

$coverWidth = 1640
$coverHeight = 923
Export-ResizedPng $coverMaster (Join-Path $brandRoot 'facebook-cover-1640x923-no-text.png') $coverWidth $coverHeight $coverRect

$cover = [System.Drawing.Image]::FromFile($coverMaster)
try {
  $bitmap = New-Canvas $coverWidth $coverHeight
  try {
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    try {
      Set-HighQuality $graphics
      $graphics.DrawImage(
        $cover,
        [System.Drawing.Rectangle]::new(0, 0, $coverWidth, $coverHeight),
        $coverRect,
        [System.Drawing.GraphicsUnit]::Pixel
      )

      $ink = [System.Drawing.SolidBrush]::new([System.Drawing.ColorTranslator]::FromHtml('#2F3338'))
      $teal = [System.Drawing.SolidBrush]::new([System.Drawing.ColorTranslator]::FromHtml('#218F8D'))
      $muted = [System.Drawing.SolidBrush]::new([System.Drawing.ColorTranslator]::FromHtml('#596362'))
      $eyebrowFont = [System.Drawing.Font]::new('Tahoma', 18, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point)
      $titleFont = [System.Drawing.Font]::new('Tahoma', 48, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Point)
      $subtitleFont = [System.Drawing.Font]::new('Tahoma', 19, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Point)
      try {
        $graphics.DrawString('META LEARNING', $eyebrowFont, $teal, 150, 142)
        $graphics.DrawString('Meta Learning', $titleFont, $ink, 142, 206)
        $graphics.FillRectangle($teal, 150, 322, 92, 8)
        $graphics.DrawString('มาเรียนรู้ว่าเราเรียนรู้กันอย่างไร', $subtitleFont, $muted, 150, 362)
      }
      finally {
        $eyebrowFont.Dispose()
        $titleFont.Dispose()
        $subtitleFont.Dispose()
        $ink.Dispose()
        $teal.Dispose()
        $muted.Dispose()
      }
    }
    finally { $graphics.Dispose() }
    $bitmap.Save((Join-Path $brandRoot 'facebook-cover-1640x923.png'), [System.Drawing.Imaging.ImageFormat]::Png)
  }
  finally { $bitmap.Dispose() }
}
finally { $cover.Dispose() }

Get-ChildItem -LiteralPath $brandRoot | Sort-Object Name | Select-Object Name, Length

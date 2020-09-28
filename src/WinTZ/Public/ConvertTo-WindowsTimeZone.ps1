function ConvertTo-WindowsTimeZone {
  <#
  .SYNOPSIS
    Takes an IANA time zone and converts it to a Windows time zone.
  .DESCRIPTION
    IANA time zones are returned by most web endpoints. We can translate any
    given IANA time zone (e.g. America/New_York) into a proper Windows time zone
    (e.g. Eastern Standard Time).

    This function leverages the unicode.org windowsZones.xml file to translate
    IANA to Windows time zones.
  .EXAMPLE
    ConvertTo-WindowsTimeZone 'America/New_York'
    Returns the Windows time zone 'Eastern Standard Time'
  .EXAMPLE
    ConvertTo-WindowsTimeZone
    Returns the Windows time zone based on the public IP address.
  .PARAMETER IANATimeZone
    IANA time zone string.
    Reference: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
  #>
  [CmdletBinding()]
  param (
    [string]$IANATimeZone = (Get-IANATimeZone)
  )
  try {
    $url = "https://raw.githubusercontent.com/unicode-org/cldr/master/common/supplemental/windowsZones.xml"
    [xml]$xml = (Invoke-WebRequest -Uri $url -ContentType 'application/xml').Content
    $zones = $xml.supplementalData.windowsZones.mapTimezones.mapZone | Where-Object territory -Match 001
  }
  catch {
    throw "Failed to obtain time zone XML map from GitHub: $_"
  }

  $win_tz = ($zones | Where-Object type -Match $IANATimeZone).other

  Write-Verbose "IANA Time Zone ($IANATimeZone) = Windows Time Zone ($win_tz)"

  return $win_tz
}
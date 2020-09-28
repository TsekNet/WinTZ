function Get-IANATimeZone {
  <#
  .SYNOPSIS
      Returns the IANA Time Zone based on public IP address.
  .DESCRIPTION
      There are two endpoints used to obtain the IANA Time Zone:

      - ifconfig.me: Get the public IP address of the host
      - ip-api.com: Translate the public IP into an IANA time zone
  .EXAMPLE
      Get-IANATimeZone
      Returns the IANA time zone for the current host.
  .EXAMPLE
      Get-IANATimeZone 8.8.8.8
      Returns the IANA time zone for the IP address 8.8.8.8
  .PARAMETER IPAddress
      Specifies the IP address to get the IANA time zone for.
  .OUTPUTS
      IANA time zone, as a string
  #>
  [CmdletBinding()]
  param (
    [string]$IPAddress = (Invoke-WebRequest -Uri 'https://ifconfig.me/ip' -ContentType 'text/plain').Content.Trim()
  )
  Write-Verbose "Public IP: $IPAddress"

  try {
    $iana_tz = (Invoke-RestMethod -Method Get -Uri "http://ip-api.com/json/$IPAddress").timezone
  }
  catch {
    throw "Failed to get public IP address: $_"
  }

  Write-Verbose "IANA Timezone: $iana_tz"

  return $iana_tz
}
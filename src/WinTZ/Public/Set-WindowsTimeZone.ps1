﻿function Set-WindowsTimeZone {
  <#
  .SYNOPSIS
    Sets the Windows time zone.
  .DESCRIPTION
   By Default, this function automatically determines the Windows Time Zone from
   the host's public IP address.

   Optionally, a IANATimeZone can be specified, such as 'America/New_York' to be
   converted into a Windows time zone.
  .EXAMPLE
    Set-WindowsTimeZone -Force
    Sets the Windows time zone based on public IP address, without prompting for
    confirmation.
  .EXAMPLE
    Set-WindowsTimeZone -IANATimeZone 'America/New_York'
    Sets the Windows time zone to 'Eastern Standard Time', which is derived from
    the IANA time zone 'America/New_York', and prompts the user for confirmation.
  .PARAMETER IANATimeZone
    IANA time zone string.
    Reference: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
  .PARAMETER Force
    Controls whether or not the user is prompted to change the time zone.
  #>
  [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
  param (
    [string]$IANATimeZone,
    [switch]$Force
  )

  if ($IANATimeZone) {
    $windows_time_zone = ConvertTo-WindowsTimeZone -IANATimeZone $IANATimeZone
  }
  else {
    $windows_time_zone = ConvertTo-WindowsTimeZone
  }

  Write-Output "Setting Windows Time Zone to $windows_time_zone"

  if ($Force -or $PSCmdlet.ShouldProcess('Windows Time Zone', 'set')) {
    try {
      Set-TimeZone -Name $windows_time_zone
    }
    catch {
      throw "Failed to set timezone: $_"
    }
  }
}
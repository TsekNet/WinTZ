function Set-WindowsTimeZone {
  <#
  .SYNOPSIS
    Sets the Windows time zone.
  .DESCRIPTION
    This prompt adds the following functionality:

    - Invocation ID count (how many times a command was executed)
    - The custom output of the current directory, with optional trimming if the current directory is determined to be too long.
    - Posh-Git integration
    - Built-in timers for each command executed in the console
    - The current local time
    - A custom ASCII symbol placed before the cursor
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

  $windows_time_zone = ConvertTo-WindowsTimeZone -IANATimeZone $IANATimeZone
  Write-Output "Setting Windows Time Zone to $windows_time_zone"

  try {
    if ($Force -or $PSCmdlet.ShouldProcess('Windows Time Zone', 'overwrite')) {
      Set-TimeZone -Name $windows_time_zone
    }
  }
  catch {
    throw "Failed to set timezone: $_"
  }
}
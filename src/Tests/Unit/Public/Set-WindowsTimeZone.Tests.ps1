#region Test Configuration
Set-Location -Path $PSScriptRoot
$MODULE = 'WinTZ'
Get-Module $MODULE | Remove-Module -Force
$MANIFEST = [System.IO.Path]::Combine('..', '..', '..', $MODULE, "$MODULE.psd1")
Import-Module $MANIFEST -Force
#endregion

InModuleScope $MODULE {
  Describe "Set-WindowsTimeZone function tests" -Tag Unit {

    Mock ConvertTo-WindowsTimeZone { return 'Eastern Standard Time' }
    Mock Write-Output
    Mock Set-TimeZone

    It "Time Zone is set successfully" {
      Set-WindowsTimeZone -Force
      Assert-MockCalled ConvertTo-WindowsTimeZone
      Assert-MockCalled Write-Output
      Assert-MockCalled Set-TimeZone
    }
    It "Set-TimeZone throws an error" {
      Mock Set-TimeZone { throw }
      { Set-WindowsTimeZone -Force } | Should Throw
      Assert-MockCalled ConvertTo-WindowsTimeZone
      Assert-MockCalled Write-Output
    }
  }
}
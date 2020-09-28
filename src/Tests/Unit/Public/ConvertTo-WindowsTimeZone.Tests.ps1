#region Test Configuration
Set-Location -Path $PSScriptRoot
$MODULE = 'WinTZ'
Get-Module $MODULE | Remove-Module -Force
$MANIFEST = [System.IO.Path]::Combine('..', '..', '..', $MODULE, "$MODULE.psd1")
Import-Module $MANIFEST -Force
#endregion

InModuleScope $MODULE {
  Describe "ConvertTo-WindowsTimeZone function tests" -Tag Unit {

    Mock Write-Verbose

    It "Returned correct time zone" {
      ConvertTo-WindowsTimeZone -IANATimeZone 'America/New_York' | Should -BeExactly 'Eastern Standard Time'
      Assert-MockCalled Write-Verbose -Exactly 1 -Scope It
    }
    It "Invoke-WebRequest throws an error" {
      Mock Invoke-WebRequest { throw }
      { ConvertTo-WindowsTimeZone -IANATimeZone 'America/New_York' } | Should Throw
      Assert-MockCalled Write-Verbose -Exactly 0 -Scope It
    }
  }
}
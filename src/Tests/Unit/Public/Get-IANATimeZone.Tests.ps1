#region Test Configuration
Set-Location -Path $PSScriptRoot
$MODULE = 'WinTZ'
Get-Module $MODULE | Remove-Module -Force
$MANIFEST = [System.IO.Path]::Combine('..', '..', '..', $MODULE, "$MODULE.psd1")
Import-Module $MANIFEST -Force
#endregion

InModuleScope $MODULE {
  Describe "Get-IANATimeZone function tests" -Tag Unit {

    Mock Write-Verbose

    It "Returned correct IANA Time Zone" {
      Get-IANATimeZone -IPAddress '8.8.8.8' | Should -BeExactly 'America/New_York'
      Assert-MockCalled Write-Verbose -Exactly 2 -Scope It
    }
    It "Invoke-RestMethod throws an error" {
      Mock Invoke-RestMethod { throw }
      { Get-IANATimeZone -IPAddress '8.8.8.8' } | Should Throw
      Assert-MockCalled Write-Verbose -Exactly 1 -Scope It
    }
  }
}
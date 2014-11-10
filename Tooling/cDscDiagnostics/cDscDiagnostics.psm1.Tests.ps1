Import-Module .\cDscDiagnostics.psm1

Describe "Trace-cDscOperation" {
    Context "does it call its internal functions" {
        Mock -ModuleName cDscDiagnostics Add-ClassTypes {}
        Mock -ModuleName cDscDiagnostics Trace-DscOperationInternal {}
        Mock -ModuleName cDscDiagnostics Log {}

        $result = Trace-cDscOperation -ComputerName $env:ComputerName;

        It "should call Add-ClassType" {
            Assert-MockCalled Add-ClassTypes -ModuleName cDscDiagnostics -Times 1
        }

        It "should call Trace-DscOperationInternal" {
            Assert-MockCalled Trace-DscOperationInternal -ModuleName cDscDiagnostics -Times 1
        }

        It "should call Log" {
            Assert-MockCalled Log -ModuleName cDscDiagnostics -Times 1
        }
    }
}
Configuration ScriptTest {

    # Import the module that contains the resources we're using.
    Import-DscResource -ModuleName PsDesiredStateConfiguration
    
    Script ScriptExample
    {
        SetScript = 
        { 
            $sw = New-Object System.IO.StreamWriter("C:\Users\Public\TestLocalDesiredStateConfigFile.txt")
            $sw.WriteLine("Some sample string")
            $sw.Close()
        }
        TestScript = { Test-Path "C:\Users\Public\TestLocalDesiredStateConfigFile.txt" }
        GetScript = { @{ Result = (Get-Content C:\Users\Public\TestLocalDesiredStateConfigFile.txt) } }          
    }

} 

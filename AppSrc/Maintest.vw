Use Windows.pkg
Use DFClient.pkg

Activate_View Activate_oMaintest for oMaintest
Object oMaintest is a dbView

    Set Border_Style to Border_Thick
    Set Size to 200 300
    Set Location to 12 30
    Set Label to "Maintest"
    Set pbAutoActivate to True

    Object oTestFile is a Form
        Set Size to 12 173
        Set Location to 7 86
        Set Label to "File:"
        
        Procedure Activating
            Forward Send Activating
            Set Value to "D:\FileTest\Test æøåÆØÅ.txt"
        End_Procedure
    
    End_Object

    Object oCreateTextFile is a Button
        Set Size to 14 58
        Set Location to 33 18
        Set Label to "Create textfile"
    
        // fires when the button is clicked
        Procedure OnClick
            Send CreateTextFile
        End_Procedure
    
    End_Object

    
    Procedure CreateTextFile
        String sFile
        Get Value of oTestFile to sFile
        Send DoDumpString of oFilesystem "Text with æøåÆØÅ." sFile
    End_Procedure
    

End_Object

Use Windows.pkg
Use DFClient.pkg

Activate_View Activate_oMaintest for oMaintest
Object oMaintest is a dbView

    Set Border_Style to Border_Thick
    Set Size to 200 300
    Set Location to 12 30
    Set Label to "Maintest"
    Set pbAutoActivate to True

    Object oFile is a Form
        Set Size to 12 173
        Set Location to 7 86
        Set Label to "File:"
        
        Procedure Activating
            Forward Send Activating
            Set Value to "D:\FileTest"
        End_Procedure
    
    End_Object

End_Object

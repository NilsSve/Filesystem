﻿Use Windows.pkg
Use DFClient.pkg

Activate_View Activate_oMaintest for oMaintest
Object oMaintest is a dbView

    Set Border_Style to Border_Thick
    Set Size to 241 300
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

    Object ogrpBinary is a Group
        Set Size to 100 269
        Set Location to 32 15
        Set Label to "Binary file methods"

        Object oCreateTextFile is a Button
            Set Size to 14 58
            Set Location to 18 11
            Set Label to "Create text file"
        
            // fires when the button is clicked
            Procedure OnClick
                Send CreateTextFile
            End_Procedure
        
        End_Object
        Object oButton1 is a Button
            Set Size to 14 58
            Set Location to 18 80
            Set Label to "Read text file"
        
            // fires when the button is clicked
            Procedure OnClick
                Send ReadTextFile
            End_Procedure
        
        End_Object
        Object oTextLN is a Button
            Set Size to 14 58
            Set Location to 18 148
            Set Label to "Readln text file"
            Set Enabled_State to False
            
        
            // fires when the button is clicked
            Procedure OnClick
                Send ReadlnTextFile
            End_Procedure
        
        End_Object
        Object oGetFileSize is a Button
            Set Size to 14 58
            Set Location to 38 11
            Set Label to "Get file size"
        
            // fires when the button is clicked
            Procedure OnClick
                Send GetFileSize
            End_Procedure
        
        End_Object
    End_Object

    Object ogrpFile is a Group
        Set Size to 100 269
        Set Location to 134 15
        Set Label to "File methods"
    End_Object

    
    Procedure CreateTextFile
        String sFile
        Get Value of oTestFile to sFile
        Send DoDumpString of oFilesystem "Text with æøåÆØÅ." sFile
    End_Procedure
    
    Procedure ReadTextFile
        String sFile sText
        Integer iFilenumber
        Boolean bOk
        Get Value of oTestFile to sFile
        Get BinaryFileNextFilenumber of oFilesystem to iFilenumber
        Get BinaryFileOpen of oFilesystem iFilenumber sFile to bOk
        If (bOk) Begin
            Get BinaryFileReadText of oFilesystem iFilenumber to sText
            Get BinaryFileClose of oFilesystem iFilenumber to bOk
            If (SizeOfString(sText) < 1000) Begin
                Send Info_Box sText
            End
        End
    End_Procedure
    
    // ToDo: Not ready to be tested yet.
    Procedure ReadlnTextFile
        String sFile sLine
        Integer iFilenumber iFilenumber2
        Boolean bOk bEndOfFile
        Get Value of oTestFile to sFile
        Get BinaryFileNextFilenumber of oFilesystem to iFilenumber
        Get BinaryFileOpen of oFilesystem iFilenumber sFile to bOk
        If (bOk) Begin
            Get BinaryFileNextFilenumber of oFilesystem to iFilenumber2
            Get BinaryFileOpen of oFilesystem iFilenumber2 (sFile + ".copy") False True to bOk
            Repeat
                Get BinaryFileReadCachedLN of oFilesystem iFilenumber (&sLine) (&bEndOfFile) to bOk
                If (bOk) Begin
                    Get BinaryFileWriteText of oFilesystem iFilenumber2 (&sLine) to bOk
                End
            Until (not(bOk) or (bEndOfFile))
            Get BinaryFileClose of oFilesystem iFilenumber to bOk
            Get BinaryFileClose of oFilesystem iFilenumber2 to bOk
        End
        Send Info_Box "Done."
    End_Procedure

    Procedure GetFileSize
        String sFile
        Integer iFilenumber
        Boolean bOk
        BigInt biFileSize
        Get Value of oTestFile to sFile
        Get BinaryFileNextFilenumber of oFilesystem to iFilenumber
        Get BinaryFileOpen of oFilesystem iFilenumber sFile to bOk
        If (bOk) Begin
            Get BinaryFileSize of oFilesystem iFilenumber to biFileSize
            Send Info_Box biFileSize
            Get BinaryFileClose of oFilesystem iFilenumber to bOk
        End
    End_Procedure

End_Object

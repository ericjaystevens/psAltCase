#Requires -Version 3.0
function convertTo-CamelCase {

    <#
    .SYNOPSIS
        Converst string to CamelCase, by removing spaces and starting each word with a capital letter.
    
    .PARAMETER inputString
        string to convert.
    
    .PARAMETER deliminators
        List of characters to treat as word deliminators. Spaces are the default.

    .EXAMPLE
        convertTo-CamelCase -inputString "My name with spaces"  
        MyNameWithSpaces

    .EXAMPLE
        convertTo-CamelCase -inputString "My-name-with-dashes and spaces" -deliminator " ", "-"
        MyNameWithDashesAndSpaces   
    
    .OUTPUTS
        String
     
    .NOTES
        Author:  Eric Jay Stevens
    #>
    [CmdletBinding()]
    [OutputType('string')]
    param (
        [Parameter(ValueFromPipeline)]
        [string[]] $inputString,
        
        [char[]]$delimiter = @(" ")
    )
    foreach ($sentance in $inputString){
        foreach ($delim in $delimiter){
            $newSentance = ""
            foreach ($word in ($sentance.split($delimiter)) ){
                $word = $word.toLower()
                $newSentance += $word.Substring(0,1).ToUpper() + $word.Substring(1)
            }
        } 
    }

    Write-Output $newSentance 

}    
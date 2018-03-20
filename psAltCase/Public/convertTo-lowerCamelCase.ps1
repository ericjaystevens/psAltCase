#Requires -Version 3.0
function convertTo-lowerCamelCase {

    <#
    .SYNOPSIS
        Converst string to lower camel case, by removing spaces and starting each word but the first with a capital letter.
    
    .PARAMETER inputString
        string to convert.
    
    .PARAMETER deliminators
        List of characters to treat as word deliminators.

    .EXAMPLE
        convertTo-LowerCamelCase -inputString "My name with spaces"  
        myNameWithSpaces

    .EXAMPLE
        convertTo-LowerCamelCase -inputString "My-name-with-dashes and spaces" -deliminator " ", "-"
        myNameWithDashesAndSpaces   
    
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
        
        [char[]]$deliminator = @(" ")
    )
    foreach ($sentance in $inputString){
        foreach ($delim in $deliminator){
            $newSentance = ""
            foreach ($word in ($sentance.split($deliminator)) ){
                $word = $word.toLower()
                $newSentance += $word.Substring(0,1).ToUpper() + $word.Substring(1)
            }
        } 
    }

    $outString = $newSentance.Substring(0,1).toLower() + $newSentance.Substring(1)
    Write-Output $outString 

}    
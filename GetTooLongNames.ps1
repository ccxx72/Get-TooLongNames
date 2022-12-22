function Get-TooLongNames {
    param(
        [string]$Path,
        [string]$OutputFile
    )


    Get-ChildItem $Path -Recurse | foreach {
       if ($_.FullName.Length -gt 250) {
            Write-Host "$($_.Name)  -  $($_.FullName.Length)" 
           $_ | Out-file $OutputFile -Append
           "Path Lenght " + $_.FullName.Length | Out-file $OutputFile -Append
        }
    }
}

Get-TooLongNames -Path "PATH" -OutputFile "FILENAME"
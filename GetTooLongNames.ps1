function Get-TooLongNames {
    param(
        [string]$Path,
        [string]$OutputFile
    )

    # Creare un array per i risultati
    $results = @()

    Get-ChildItem $Path -Recurse | foreach {
       if ($_.FullName.Length -gt 250) {
            Write-Host "$($_.Name) - $($_.FullName.Length)" 
            $result = [PSCustomObject]@{
                Name = $_.Name
                Path = $_.FullName
                Length = $_.FullName.Length
            }

            # Aggiungere il risultato all'array
            $results += $result
        }
    }

    # Esportare i risultati in un file CSV
    $results | Export-Csv -Path $OutputFile -NoTypeInformation
}

# Chiamare la funzione e specificare il percorso e il file di output
Get-TooLongNames -Path "PATH" -OutputFile "FILENAME"

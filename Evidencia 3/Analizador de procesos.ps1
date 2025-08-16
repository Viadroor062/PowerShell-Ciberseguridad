#Analizador de procesos
$procesos = Get-Process
$alertas = @()
foreach ($p in $procesos){
    if ($p.WorkingSet -gt 100MB){
       $alertas +="$($p.Name) usa $([math]::Round($p.WorkingSet / 1MB, 2)) MB"
    }
}
if ($alertas.Count -gt 0){
    Write-Output "Procesos con alto consumo:"
    $alertas | ForEach-Object {Write-Output $_}
} else {
    Write-Output "No hay procesos criticos"
}
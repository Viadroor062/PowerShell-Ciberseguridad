function Obtener-UsuariosInactivos {
<#
.SYNOPSIS
Obtiene usuarios locales habilitados que nunca han iniciado sesión.

.DESCRIPTION
Esta funcion busca cuentas locales habilitados que nunca han iniciado sesión

.EXAMPLE
Obtener-UsuariosInactivos

.NOTES
Puede ayudar a detectar cuentas innecesarias o riesgosas en auditorías básicas.
#>
    Get-LocalUser | Where-Object { $_.Enabled -eq $true -and -not $_.LastLogon }
}
function Obtener-ServiviosExternos {
<#
.SYNOPSIS
Obtiene servicios en ejecución que no pertenecen explicitamente a Windows.

.SYNOPSIS
Obtiene servicios en ejecución que no pertenecen explicitamente a Windows.

.EXAMPLE
Obtener-ServiciosExternos

.Notes
Util para detectar software de terceros corriendo en segundo plano.
#>
    Get-Service | Where-Object { $_.Status -eq "Running" -and $_.DisplayName -notmatch "Windows" }
}

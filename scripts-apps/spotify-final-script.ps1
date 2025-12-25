# Ruta a tu archivo .bat
$rutaBAT = "misc/unistall-spotify.bat"

# Ejecutar el .bat en una nueva ventana y esperar a que termine
Start-Process -FilePath $rutaBAT -Wait

# Ejecutar como administrador
Start-Process -FilePath $rutaBAT -Verb RunAs -Wait

# Ejecutar con argumentos
Start-Process -FilePath $rutaBAT -ArgumentList "param1", "param2" -Wait
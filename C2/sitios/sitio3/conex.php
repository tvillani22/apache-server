<?php

include_once '.env.php';

$db_servername = 'mariadb'; //nombre del servicio desde el docker-compose o 'localhost'
$db_user = 'unsam';
$db_password = $PASS;
$db = 'db_visitas';

$conn = mysqli_connect($db_servername,$db_user,$db_password,$db);

if (!$conn) {
    echo "Error: No se pudo conectar a MySQL." . PHP_EOL;
    echo "errno de depuración: " . mysqli_connect_errno() . PHP_EOL;
    echo "error de depuración: " . mysqli_connect_error() . PHP_EOL;
    exit;
  }  
  /*echo "Éxito: Conexión apropiada a MARIADB!" . PHP_EOL;*/
  /*echo "Información del host: " . mysqli_get_host_info($conn) . PHP_EOL;*/

?>
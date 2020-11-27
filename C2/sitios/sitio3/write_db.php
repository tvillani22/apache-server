<?php

  include_once 'conex.php';

  $nomb = $_POST['nombre'];

  $maria = "INSERT INTO visitas (Nombre) VALUES ('$nomb');";
  $conn->query($maria);
  header("Location: index.php?escritura_correcta")

?>
<?php

  include_once 'conex.php';

  $maria = "DELETE FROM visitas;";
  $maria2 = "ALTER TABLE visitas AUTO_INCREMENT = 1;";
  $conn->query($maria);
  $conn->query($maria2);
header("Location: index.php?borrado_correcto")

?>
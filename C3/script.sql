CREATE DATABASE IF NOT EXISTS db_visitas;
CREATE TABLE IF NOT EXISTS db_visitas.visitas
(
    Num INT(2) AUTO_INCREMENT primary key,
    Nombre TEXT NOT NULL CHECK(Nombre<>'')
);

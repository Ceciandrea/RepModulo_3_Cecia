CREATE SCHEMA `alkewallet` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;

-- tabla usuarios 
CREATE TABLE `alkewallet`.`usuarios` (
  `id_usuario` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `correo_electronico` VARCHAR(45) NULL,
  `contraseña` VARCHAR(45) NULL,
  `saldo` INT NULL,
  `fecha_creacion` DATE NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;

ALTER TABLE `alkewallet`.`usuarios` 
CHANGE COLUMN `id_usuario` `id_usuario` INT NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `correo_electronico` `correo_electronico` VARCHAR(45) NOT NULL ,
CHANGE COLUMN `contraseña` `contrasena` VARCHAR(45) NOT NULL ;



-- tabla transaccion
CREATE TABLE `alkewallet`.`transaccion` (
  `idtransaccion` INT NOT NULL AUTO_INCREMENT,
  `sender_user_id` VARCHAR(45) NULL,
  `receiver_user_id` VARCHAR(45) NULL,
  `transaction_date` DATE NULL,
  PRIMARY KEY (`idtransaccion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci


-- tabla moneda
CREATE TABLE `alkewallet`.`moneda` (
  `divisa_id` INT NOT NULL AUTO_INCREMENT,
  `divisa_nombre` VARCHAR(45) NULL,
  `divisa_simbolo` VARCHAR(45) NULL,
  PRIMARY KEY (`divisa_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;

-- LLAVES FORANEAS
-- foreign key sender user id
ALTER TABLE `alkewallet`.`transaccion` 
ADD INDEX `fk_sender_user_id_idx` (`sender_user_id` ASC);
;
ALTER TABLE `alkewallet`.`transaccion` 
ADD CONSTRAINT `fk_sender_user_id`
  FOREIGN KEY (`sender_user_id`)
  REFERENCES `alkewallet`.`usuarios` (`id_usuario`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- foreign key receiver_user_id
  ALTER TABLE `alkewallet`.`transaccion` 
ADD INDEX `fk_receiver_user_id_idx` (`receiver_user_id` ASC);
;
ALTER TABLE `alkewallet`.`transaccion` 
ADD CONSTRAINT `fk_receiver_user_id`
  FOREIGN KEY (`receiver_user_id`)
  REFERENCES `alkewallet`.`usuarios` (`id_usuario`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- poblar tabla usuario
INSERT INTO `alkewallet`.`usuarios` (`nombre`, `correo_electronico`, `contrasena`, `saldo`, `fecha_creacion`) VALUES ('Mackarena Diaz', 'macarena_diaz@gmail.com', 'maca123', '35000', '2020-06-12');
INSERT INTO `alkewallet`.`usuarios` (`nombre`, `correo_electronico`, `contrasena`, `saldo`, `fecha_creacion`) VALUES ('Luz hernandez', 'luz.hernandez@hotmail.com', 'luzmary432', '125000', '2022-10-03');
INSERT INTO `alkewallet`.`usuarios` (`nombre`, `correo_electronico`, `contrasena`, `saldo`, `fecha_creacion`) VALUES ('Roberto Lagos', 'robert28@gmail.com', 'compu1!', '350200', '2018-03-28');
INSERT INTO `alkewallet`.`usuarios` (`nombre`, `correo_electronico`, `contrasena`, `saldo`, `fecha_creacion`) VALUES ('Ana Arias', 'Any76Qgmail.com', 'anitarachel45!', '800000', '2020-02-07');
INSERT INTO `alkewallet`.`usuarios` (`nombre`, `correo_electronico`, `contrasena`, `saldo`, `fecha_creacion`) VALUES ('cecia Hernandez', 'cecia.hernandeza@gmail.com', 'gatitomiau#', '5200', '2021-04-07');

-- eliminar columna fecha_creacion 
alter table usuarios 
drop column fecha_creacion;



alter table transaccion
add column cantidad int; 


-- poblar tabla transacciones 
INSERT INTO `alkewallet`.`transaccion` (`sender_user_id`, `receiver_user_id`, `transaction_date`, `cantidad`) VALUES ('4', '1', '2023-10-30', '50000');
INSERT INTO `alkewallet`.`transaccion` (`sender_user_id`, `receiver_user_id`, `transaction_date`, `cantidad`) VALUES ('2', '5', '2023-12-08', '100000');
INSERT INTO `alkewallet`.`transaccion` (`sender_user_id`, `receiver_user_id`, `transaction_date`, `cantidad`) VALUES ('3', '2', '2024-02-07', '35000');
INSERT INTO `alkewallet`.`transaccion` (`sender_user_id`, `receiver_user_id`, `transaction_date`, `cantidad`) VALUES ('1', '4', '2024-03-25', '2500');
INSERT INTO `alkewallet`.`transaccion` (`sender_user_id`, `receiver_user_id`, `transaction_date`, `cantidad`) VALUES ('5', '3', '2023-11-07', '10000');



-- poblar tabla moneda
INSERT INTO `alkewallet`.`moneda` (`divisa_nombre`, `divisa_simbolo`) VALUES ('CLP', '$');
INSERT INTO `alkewallet`.`moneda` (`divisa_nombre`, `divisa_simbolo`) VALUES ('Dolar', 'us$');
INSERT INTO `alkewallet`.`moneda` (`divisa_nombre`, `divisa_simbolo`) VALUES ('Euro', '€');


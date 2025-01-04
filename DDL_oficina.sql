-- oficina mecância
create database if not exists workshop;
use workshop;
show tables;

CREATE TABLE clients (
  idClient int AUTO_INCREMENT,
  Fname varchar(15) NOT NULL,
  Minit varchar(3) DEFAULT NULL,
  Lname varchar(30) NOT NULL,
  CPF char(9) DEFAULT NULL,
  contato char(11) DEFAULT NULL,
  PRIMARY KEY (idClient),
  UNIQUE KEY un_C_cpf (CPF)
);

CREATE TABLE mecteam (
  idMecteam int AUTO_INCREMENT,
  Indentify varchar(55) NOT NULL,
  Setor varchar(10) NOT NULL,
  PRIMARY KEY (idMecteam),
  UNIQUE KEY un_MC_Indentify (Indentify)
);

CREATE TABLE mechanic (
  idMechanic int AUTO_INCREMENT,
  idMecteam int DEFAULT NULL,
  Fname varchar(15) NOT NULL,
  Minit varchar(3),
  Lname varchar(30) NOT NULL,
  Adress varchar(255),
  Specialization varchar(50) NOT NULL,
  PRIMARY KEY (idMechanic),
  KEY fk_M_idmecteam (idMecteam),
  CONSTRAINT fk_M_idmecteam FOREIGN KEY (idMecteam) REFERENCES mecteam (idMecteam) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE vehicle (
  idClient int,
  idVehicle int AUTO_INCREMENT,
  Brand varchar(45) NOT NULL,
  Model varchar(45) NOT NULL,
  PRIMARY KEY (idVehicle),
  KEY fk_V_idclient (idClient),
  CONSTRAINT fk_V_idclient FOREIGN KEY (idClient) REFERENCES clients (idClient) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE part (
  idPart int AUTO_INCREMENT,
  Size varchar(10) NOT NULL,
  Weight float NOT NULL,
  Tipo varchar(25) NOT NULL,
  Pvalue float not null,
  PRIMARY KEY (idPart)
);

CREATE TABLE orders (
  idOrder int AUTO_INCREMENT,
  service varchar(50) NOT NULL,
  issueDate date NOT NULL,
  idClient int,
  idVehicle int,
  idMecteam int,
  PRIMARY KEY (idOrder),
  KEY fk_O_idclient (idClient),
  KEY fk_O_idvehicle (idVehicle),
  KEY fk_O_idmecteam (idMecteam),
  CONSTRAINT fk_O_idclient FOREIGN KEY (idClient) REFERENCES clients (idClient) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_O_idmecteam FOREIGN KEY (idMecteam) REFERENCES mecteam (idMecteam) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_O_idvehicle FOREIGN KEY (idVehicle) REFERENCES vehicle (idVehicle) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE service (
  idService int AUTO_INCREMENT,
  idMecteam int,
  Descriptions varchar(255),
  Dates date NOT NULL,
  scheduleTime varchar(10),
  OStatus enum('Não iniciado','Iniciado','Finalizado') DEFAULT 'Não iniciado',
  PRIMARY KEY (idService),
  KEY fk_S_idMecteam (idMecteam),
  CONSTRAINT fk_S_idMecteam FOREIGN KEY (idMecteam) REFERENCES mecteam (idMecteam) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE reparation (
  idService int,
  RType varchar(45) NOT NULL,
  KEY fk_R_idService (idService),
  CONSTRAINT fk_R_idService FOREIGN KEY (idService) REFERENCES service (idService) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE service_order (
  idService_order int AUTO_INCREMENT,
  issueDate date NOT NULL,
  totalValue float NOT NULL,
  idOrder int,
  SOstatus enum('Em processamento','Aceita') DEFAULT 'Aceita',
  completionDate date NOT NULL,
  PRIMARY KEY (idService_order),
  KEY fk_SO_idorder (idOrder),
  CONSTRAINT fk_SO_idorder FOREIGN KEY (idOrder) REFERENCES orders (idOrder) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE service_revision (
  idService int NOT NULL,
  timeInterval varchar(45) NOT NULL,
  currentMileage float NOT NULL,
  PRIMARY KEY (idService),
  CONSTRAINT fk_SR_idservice FOREIGN KEY (idService) REFERENCES service (idService) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE sopart (
  idService_order int NOT NULL,
  idPart int NOT NULL,
  Quantity int NOT NULL,
  PRIMARY KEY (idService_order,idPart),
  KEY fk_SOP_idpart (idPart),
  CONSTRAINT fk_SOP_idpart FOREIGN KEY (idPart) REFERENCES part (idPart) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_SOP_idservice_order FOREIGN KEY (idService_order) REFERENCES service_order (idService_order) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE soservice (
  idService_order int,
  idService int,
  Value_per_service float,
  KEY fk_SOS_idservice_order (idService_order),
  KEY fk_SOS_idservice (idService),
  CONSTRAINT fk_SOS_idservice FOREIGN KEY (idService) REFERENCES service (idService) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_SOS_idservice_order FOREIGN KEY (idService_order) REFERENCES service_order (idService_order) ON DELETE CASCADE ON UPDATE CASCADE
);

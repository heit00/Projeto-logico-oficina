-- inserção de dados

-- Inserir dados na tabela de clientes
INSERT INTO clients (Fname, Minit, Lname, CPF, contato) VALUES
('Carlos', 'M', 'Silva', '123456789', '11987654321'),
('Ana', 'B', 'Costa', '987654321', '11976543210'),
('João', 'D', 'Oliveira', '112233445', '11965432100'),
('Mariana', 'A', 'Souza', '223344556', '11954321098'),
('Rafael', 'L', 'Pereira', '334455667', '11943210987'),
('Patrícia', 'S', 'Santos', '445566778', '11932109876'),
('Luís', 'G', 'Almeida', '556677889', '11921098765'),
('Fernanda', 'C', 'Martins', '667788990', '11910987654'),
('Eduardo', 'J', 'Lima', '778899001', '11909876543'),
('Roberta', 'T', 'Freitas', '889900112', '11908765432');

-- Inserir dados na tabela de mecteam
INSERT INTO mecteam (Indentify, Setor) VALUES
('Mec001', 'Mecânica'),
('Mec002', 'Elétrica'),
('Mec003', 'Funilaria');

-- Inserir dados na tabela de mecânicos
INSERT INTO mechanic (idMecteam, Fname, Minit, Lname, Adress, Specialization) VALUES
(1, 'Carlos', 'S', 'Santos', 'Rua A, 123', 'Mecânico de motores'),
(2, 'André', 'J', 'Lima', 'Rua B, 456', 'Eletricista'),
(3, 'Juliana', 'M', 'Oliveira', 'Rua C, 789', 'Funileira'),
(1, 'Roberto', 'D', 'Pereira', 'Rua D, 101', 'Mecânico de suspensão'),
(2, 'Fabiana', 'R', 'Costa', 'Rua E, 102', 'Instaladora de sistemas elétricos');

-- Inserir dados na tabela de veículos
INSERT INTO vehicle (idClient, Brand, Model) VALUES
(1, 'Toyota', 'Corolla'),
(2, 'Ford', 'Fusion'),
(3, 'Chevrolet', 'Onix'),
(4, 'Honda', 'Civic'),
(5, 'Hyundai', 'HB20'),
(6, 'Fiat', 'Palio'),
(7, 'Nissan', 'Kicks'),
(8, 'Renault', 'Duster'),
(9, 'Volkswagen', 'Gol'),
(10, 'Jeep', 'Compass');

-- Inserir dados na tabela de peças
INSERT INTO part (Size, Weight, Tipo, Pvalue) VALUES
('15x6', 5.5, 'Pneu', 300.00),
('16x7', 6.0, 'Roda', 350.00),
('20x8', 12.5, 'Capô', 1200.00),
('22x10', 15.0, 'Parachoque', 800.00),
('13x5', 3.0, 'Vidro', 200.00);

-- Inserir dados na tabela de ordens
INSERT INTO orders (service, issueDate, idClient, idVehicle, idMecteam) VALUES
('Troca de óleo', '2025-01-02', 1, 1, 1),
('Instalação elétrica', '2025-01-03', 2, 2, 2),
('Alinhamento e balanceamento', '2025-01-04', 3, 3, 1),
('Troca de suspensão', '2025-01-05', 4, 4, 1),
('Troca de faróis', '2025-01-06', 5, 5, 2);

-- Inserir dados na tabela de serviços
INSERT INTO service (idMecteam, Descriptions, Dates, scheduleTime, OStatus) VALUES
(1, 'Troca de óleo do motor', '2025-01-02', '08:00', 'Não iniciado'),
(2, 'Reparo na fiação elétrica', '2025-01-03', '09:00', 'Iniciado'),
(1, 'Alinhamento e balanceamento', '2025-01-04', '10:00', 'Finalizado'),
(1, 'Troca de peças de suspensão', '2025-01-05', '11:00', 'Não iniciado'),
(2, 'Instalação de novos faróis', '2025-01-06', '12:00', 'Iniciado');

-- Inserir dados na tabela de reparação
INSERT INTO reparation (idService, RType) VALUES
(1, 'Troca de peça'),
(2, 'Reparo no sistema elétrico'),
(3, 'Ajuste de alinhamento'),
(4, 'Substituição de peças de suspensão'),
(5, 'Instalação de novos faróis');

-- Inserir dados na tabela de service_order
INSERT INTO service_order (issueDate, totalValue, idOrder, SOstatus, completionDate) VALUES
('2025-01-02', 250.00, 1, 'Aceita', '2025-01-02'),
('2025-01-03', 500.00, 2, 'Em processamento', '2025-01-04'),
('2025-01-04', 150.00, 3, 'Aceita', '2025-01-04'),
('2025-01-05', 400.00, 4, 'Em processamento', '2025-01-06'),
('2025-01-06', 350.00, 5, 'Aceita', '2025-01-06');

-- Inserir dados na tabela de service_revision
INSERT INTO service_revision (idService, timeInterval, currentMileage) VALUES
(1, 'A cada 10.000 km', 25000.5),
(2, 'A cada 15.000 km', 30000.7),
(3, 'A cada 20.000 km', 35000.2),
(4, 'A cada 5.000 km', 5000.0),
(5, 'A cada 10.000 km', 40000.1);

-- Inserir dados na tabela de sopart
INSERT INTO sopart (idService_order, idPart, Quantity) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 1),
(5, 5, 2);

-- Inserir dados na tabela de soservice
INSERT INTO soservice (idService_order, idService, Value_per_service) VALUES
(1, 1, 250.00),
(2, 2, 500.00),
(3, 3, 150.00),
(4, 4, 400.00),
(5, 5, 350.00);



-- Создание таблиц

-- Таблица документов
CREATE TABLE IF NOT EXISTS Documents (
    DocumentID SERIAL PRIMARY KEY,
    DocumentType VARCHAR(50),
    Series VARCHAR(20),
    Number VARCHAR(20),
    IssuedBy VARCHAR(255),
    IssueDate DATE
);

-- Таблица медицинских организаций
CREATE TABLE IF NOT EXISTS MedicalOrganizations (
    OrganizationID SERIAL PRIMARY KEY,
    OrganizationName VARCHAR(255),
    Address VARCHAR(255)
);

-- Таблица пациентов
CREATE TABLE IF NOT EXISTS Patients (
    PatientID SERIAL PRIMARY KEY,
    LastName VARCHAR(100),
    FirstName VARCHAR(100),
    Patronymic VARCHAR(100),
    BirthDate DATE,
    DocumentID INT,
    OrganizationID INT,
    FOREIGN KEY (DocumentID) REFERENCES Documents(DocumentID),
    FOREIGN KEY (OrganizationID) REFERENCES MedicalOrganizations(OrganizationID)
);

-- Таблица диагнозов
CREATE TABLE IF NOT EXISTS Diagnoses (
    DiagnosisID SERIAL PRIMARY KEY,
    ICD10Code VARCHAR(10),
    DiagnosisName VARCHAR(255)
);

-- Таблица Медицинские услуги
CREATE TABLE IF NOT EXISTS Services (
    ServiceID SERIAL PRIMARY KEY,
    ServiceName VARCHAR(255)
);

-- Таблица Оказанная медицинская помощь
CREATE TABLE IF NOT EXISTS MedicalCare (
    CareID SERIAL PRIMARY KEY,
    PatientID INT,
    DiagnosisID INT,
    ServiceID INT,
    TreatmentDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DiagnosisID) REFERENCES Diagnoses(DiagnosisID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);

-- =====================================================
-- ТЕСТОВЫЕ ДАННЫЕ
-- =====================================================

-- Документы
INSERT INTO Documents
(DocumentType, Series, Number, IssuedBy, IssueDate)
VALUES
('Паспорт', '4501', '123456', 'ОВД Москва', '2015-03-10'),
('Паспорт', '4502', '654321', 'ОВД Санкт-Петербург', '2016-07-21'),
('Паспорт', '4503', '987654', 'ОВД Казань', '2018-11-05'),
('Паспорт', '4504', '123456', 'ОВД Москва', '2015-03-10'),
('Паспорт', '4505', '654321', 'ОВД Санкт-Петербург', '2016-07-21'),
('Паспорт', '4506', '987654', 'ОВД Казань', '2018-11-05');


-- Медицинские организации
INSERT INTO MedicalOrganizations
(OrganizationName, Address)
VALUES
('Городская поликлиника №1', 'ул. Ленина, 10'),
('Центральная больница', 'пр. Мира, 25'),
('Медицинский центр Здоровье', 'ул. Советская, 7');

-- Пациенты
INSERT INTO Patients
(LastName, FirstName, Patronymic, BirthDate, DocumentID, OrganizationID)
VALUES
('Иванов', 'Иван', 'Иванович', '1990-05-10', 1, 1),
('Петров', 'Петр', 'Петрович', '1985-09-22', 2, 2),
('Сидорова', 'Анна', 'Сергеевна', '2008-01-15', 3, 3),
('Ковалев', 'Александр', 'Александрович', '1950-03-10', 4, 1),
('Смирнова', 'Екатерина', 'Ивановна', '1988-12-25', 5, 2),
('Михайлов', 'Дмитрий', 'Викторович', '2000-07-18', 6, 3);


-- Диагнозы
INSERT INTO Diagnoses
(ICD10Code, DiagnosisName)
VALUES
('J00', 'Острый назофарингит (насморк)'),
('E11', 'Сахарный диабет II типа'),
('I10', 'Эссенциальная [первичная] гипертензия'),
('C00', 'Злокачественное новообразование губы'),
('C01', 'Злокачественные новообразования основания языка'),
('C02', 'Злокачественное новообразование других и неуточненных частей языка'),
('C03', 'Злокачественное новообразование десны'),
('C04', 'Злокачественное новообразование дна полости рта'),
('C05', 'Злокачественное новообразование неба'),
('C06', 'Злокачественное новообразование других и неуточненных отделов рта'),
('C07', 'Злокачественное новообразование околоушной слюнной железы'),
('C08', 'Злокачественное новообразование других и неуточненных больших слюнных желез'),
('C97', 'Злокачественное новообразование самостоятельных (первичных) множественных локализаций');

-- Медицинские услуги
INSERT INTO Services
(ServiceName)
VALUES
('Первичный прием терапевта'),
('Общий анализ крови'),
('Электрокардиография'),
('Повторный прием врача');

-- Оказанная медицинская помощь
INSERT INTO MedicalCare
(PatientID, DiagnosisID, ServiceID, TreatmentDate)
VALUES
(1, 1, 1, '2026-05-01'),
(1, 7, 2, '2026-05-01'),
(2, 2, 1, '2026-05-03'),
(2, 2, 4, '2026-05-10'),
(3, 3, 1, '2026-05-05'),
(3, 6, 4, '2026-05-05'),
(4, 10, 1, '2026-05-05'),
(5, 5, 3, '2026-05-05');

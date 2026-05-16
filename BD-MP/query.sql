-- запрос, выбирающий данные: ФИО, диагноз, наименование медицинской организации прикрепления, наименование услуги , удовлетворяющие следующим критериям (одновременно):
-- 1. Возраст от 20 до 50 лет
-- 2. Имеющие коды диагнозов от С00 до С97
SELECT
    p.LastName || ' ' || p.FirstName || ' ' || p.Patronymic
        AS "ФИО",

    d.DiagnosisName
        AS "Диагноз",

    mo.OrganizationName
        AS "Медицинская организация",

    s.ServiceName
        AS "Услуга"

FROM MedicalCare mc

JOIN Patients p
    ON mc.PatientID = p.PatientID

JOIN Diagnoses d
    ON mc.DiagnosisID = d.DiagnosisID

JOIN Services s
    ON mc.ServiceID = s.ServiceID

JOIN MedicalOrganizations mo
    ON p.OrganizationID = mo.OrganizationID

WHERE
    DATE_PART('year', AGE(p.BirthDate))
        BETWEEN 20 AND 50

    AND d.ICD10Code >= 'C00'
    AND d.ICD10Code <= 'C97';

--
-- Create views
--

-- Drop tables in order to avoid FK constraint
DROP VIEW IF EXISTS v_bill;

--
-- View - Bill
--
CREATE VIEW v_bill
AS
SELECT
    b.id AS bill_id,
    b.name AS bill_name,
    b.amount AS bill_amount,
    b.deadline AS bill_deadline,
    b.ocr AS bill_ocr,
    b.category AS bill_category,
    b.priority AS bill_priority,
    b.frequency AS bill_frequency,
    b.comments AS bill_comments,
    c.id AS company_id,
    c.name AS company_name,
    c.customer_id AS company_customer_id,
    c.giro AS company_giro,
    GROUP_CONCAT(bp.person_id) AS person_id,
    b.paid AS bill_payed,
    b.paid_date AS bill_payed_date
FROM bill AS b

JOIN company AS c
    ON b.company_id = c.id

JOIN bill2person AS bp
    ON bp.bill_id = b.id

GROUP BY bill_id;

--
-- View - Person accounts
--
CREATE VIEW v_person_accounts
AS
SELECT
    p.id AS person_id,
    CONCAT(p.firstname, " ", p.lastname) AS person_name,
    p.email AS person_email,
    a.id AS account_id,
    a.number AS account_number,
    a.type AS account_type,
    a.bank AS account_bank,
    (SELECT COUNT(*) FROM account2person WHERE account2person.person_id = p.id) AS account_count
FROM person AS p

JOIN account2person AS ap
    ON ap.person_id = p.id

JOIN account AS a
    ON ap.account_id = a.id

GROUP BY person_id, account_id
ORDER BY person_id, account_bank, account_type, account_number;
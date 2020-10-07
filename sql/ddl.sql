--
-- Create views
--

-- Drop tables in order to avoid FK constraint
DROP VIEW IF EXISTS v_bill;
DROP VIEW IF EXISTS v_invoice;
DROP VIEW IF EXISTS v_person_accounts;

--
-- View - Bill
--
CREATE VIEW v_bill
AS
SELECT
    b.id AS bill_id,
    b.name AS bill_name,
    b.category AS bill_category,
    b.priority AS bill_priority,
    b.frequency AS bill_frequency,
    b.payday AS bill_payday,
    b.comment AS bill_comment,
    c.id AS company_id,
    c.name AS company_name,
    c.customer_id AS company_customer_id,
    c.giro AS company_giro,
    GROUP_CONCAT(bp.person_id) AS person_id,
    ROUND((SELECT AVG(amount) FROM invoice WHERE invoice.bill_id = b.id), 2) AS average_amount,
    (SELECT COUNT(*) FROM invoice WHERE invoice.bill_id = b.id AND invoice.paid IS NOT NULL) AS paid,
    (SELECT COUNT(*) FROM invoice WHERE invoice.bill_id = b.id AND invoice.paid IS NULL) AS unpaid,
    (SELECT COUNT(*) FROM finance WHERE finance.bill_id = b.id) AS is_finance,
    (SELECT COUNT(*) FROM subscription WHERE subscription.bill_id = b.id) AS is_subscription
FROM bill AS b

JOIN company AS c
    ON b.company_id = c.id

JOIN bill2person AS bp
    ON bp.bill_id = b.id

GROUP BY bill_id;

--
-- View - Invoices
--
CREATE VIEW v_invoice
AS
SELECT
	i.id AS invoice_id,
    i.ocr AS invoice_ocr,
    i.amount AS invoice_amount,
    i.deadline AS invoice_deadline,
    i.paid AS invoice_paid,
    b.name AS bill_name,
    b.category AS bill_category,
    b.priority AS bill_priority,
    b.comment AS bill_comment,
    c.name AS company_name,
    c.customer_id AS company_customer_id,
    c.giro AS company_giro,
    GROUP_CONCAT(bp.person_id) AS person_id,
    (SELECT COUNT(*) FROM finance WHERE finance.bill_id = b.id) AS is_finance,
    (SELECT COUNT(*) FROM subscription WHERE subscription.bill_id = b.id) AS is_subscription
FROM invoice AS i

JOIN bill AS b
    ON i.bill_id = b.id

JOIN company AS c
    ON b.company_id = c.id

JOIN bill2person AS bp
    ON b.id = bp.bill_id

GROUP BY invoice_id;

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
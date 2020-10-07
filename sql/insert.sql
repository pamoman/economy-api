--
-- Choose database
--
use economy;

--
-- Add categories
--
INSERT INTO category(name) VALUES
    ("Nöje"),
    ("Mat"),
    ("Hus"),
    ("Bil"),
    ("Drift");

--
-- Add priorities
--
INSERT INTO priority(level) VALUES
    ("Max"),
    ("High"),
    ("Medium"),
    ("Low"),
    ("Min");

--
-- Add frequencies
--
INSERT INTO frequency(months) VALUES
    (1),
    (3),
    (6),
    (12);

--
-- Add allocations
--
INSERT INTO allocation(percent) VALUES
    (5),
    (10),
    (15),
    (20),
    (25),
    (30),
    (35),
    (40),
    (45),
    (50),
    (55),
    (60),
    (65),
    (70),
    (75),
    (80),
    (85),
    (90),
    (95),
    (100);

--
-- Add persons
--
INSERT INTO person(firstname, lastname, email, password, level) VALUES
    ("Paul", "Moreland", "pauljm80@gmail.com", "$2a$10$mMlU0eIJek1zGOf8zLUVTOv.IMRQcwhsFtbkiA5amAG8n/m1l6kyy", "admin"),
    ("Hanna", "Moreland", "hallstrom_hanna@hotmail.com", "$2a$10$kjlm5zVinkl2tO2J28j1luE2mHGYgGzT2L1u/fP34oX/hbtOFSqYO", "admin"),
    ("Daniel", "Moreland", "danielmore03@gmail.com", "$2a$10$CshfEs7g0gAWtIpO5Ym40egKxXqj9rQhpsPDHzwwKV1as754pDbfW", "user"),
    ("Elliot", "Moreland", "legominer06@icloud.com", "$2a$10$QFXisKcHG3B1eHyKPMe8A.lW50QmMxP7kRgUQzfRiJ9D2KqSqqeOu", "user");

--
-- Add accounts
--
INSERT INTO account(number, type, bank) VALUES
    ("0001", "Private", "Nordea"),
    ("0002", "Private", "Nordea"),
    ("0003", "Private", "Nordea"),
    ("0004", "Private", "Nordea"),
    ("0005", "Shared", "Nordea"),
    ("1001", "Investment", "Avanza"),
    ("1002", "Investment", "Avanza");

--
-- Connect account(s) to person(s)
--
INSERT INTO account2person(account_id, person_id) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 1),
    (5, 2),
    (6, 1),
    (7, 3);

--
-- Add companies
--
INSERT INTO company(name, customer_id, giro) VALUES
    ("Telia", "telia123", 0123456789),
    ("Nordea", "nordea123", 0123456789),
    ("Ford", "ford123", 0123456789),
    ("ST1", "st1123", 0123456789);

--
-- Add bills
--
INSERT INTO bill(name, company_id, account_id, category, priority, frequency, payday, comment) VALUES
    ("Bredband", 1, 5, "Drift", "High", 3, 27, "Fiber"),
    ("Nas 882 Service", 3, 5, "Bil", "High", 1, 27, "Reperation"),
    ("Bensin", 4, 5, "Bil", "High", 1, 27, null);

--
-- Add finance (Part payment bills)
--
INSERT INTO finance(bill_id, amount, payments) VALUES
    (2, 3000, 3);

--
-- Add subscriptions
--
INSERT INTO subscription(bill_id, amount, expires, reminder) VALUES
    (1, 359, "2021-09-01", 1);

--
-- Connect bill(s) to person(s)
--
INSERT INTO bill2person(bill_id, person_id, allocation) VALUES
    (1, 1, 50),
    (1, 2, 50),
    (2, 1, 50),
    (2, 2, 50),
    (3, 1, 50),
    (3, 2, 50);

--
-- Add invoices
--
INSERT INTO invoice(bill_id, ocr, amount, deadline) VALUES
    (1, 123456789, 359, "2020-10-27"),
    (2, 123456789, 1000, "2020-10-27");

--
-- Add paid invoices
--
INSERT INTO invoice(bill_id, ocr, amount, deadline, paid) VALUES
    (3, 123456789, 2000, "2020-08-27", "2020-08-25"),
    (3, 123456789, 3000, "2020-09-27", "2020-09-26");

--
-- Add wages
--
INSERT INTO wage(person_id, account_id, amount, payday) VALUES
    (1, 1, 20000, "2020-10-27"),
    (2, 2, 23000, "2020-10-27");
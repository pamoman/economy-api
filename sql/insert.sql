--
-- Choose database
--
use economy;

--
-- Add persons
--
INSERT INTO person(firstname, lastname, email) VALUES
    ("Paul", "Moreland", "pauljm80@gmail.com"),
    ("Hanna", "Moreland", "hallstrom_hanna@hotmail.com"),
    ("Daniel", "Moreland", "danielmore03@gmail.com"),
    ("Elliot", "Moreland", "legominer06@icloud.com");

--
-- Add accounts
--
INSERT INTO account(number, type, bank) VALUES
    ("0001", "Private", "Nordea"),
    ("0002", "Private", "Nordea"),
    ("0003", "Private", "Nordea"),
    ("0004", "Private", "Nordea"),
    ("0005", "Savings", "Nordea"),
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
    ("Nordea", "nordea123", 0123456789);


--
-- Add bills
--
INSERT INTO bill(name, company_id, amount, deadline, ocr, category, priority, frequency, comments) VALUES
    ("Bredband", 1, 1100, "2020-10-28", 0123456789, "Utility", "High", 3, "Fiber");

--
-- Connect bill(s) to person(s)
--
INSERT INTO bill2person(bill_id, person_id, allocation) VALUES
    (1, 1, 50),
    (1, 2, 50);

--
-- Add wages
--
INSERT INTO wage(person_id, account_id, amount, payday) VALUES
    (1, 1, 20000, "2020-10-27"),
    (2, 2, 23000, "2020-10-27");

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
-- Add categories
--
INSERT INTO category(name) VALUES
    ("Entertainment"),
    ("Food"),
    ("House"),
    ("Car"),
    ("Utility");

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
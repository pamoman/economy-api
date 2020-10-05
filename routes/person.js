const express = require('express');
const router = express.Router();
const db = require("../src/db.js");

// Index route
router.get("/", async (req, res) => {
    res.json(
        await db.fetchAll("v_person_accounts")
    );
});

// Person column route
router.get("/:name/:value", async (req, res) => {
    let name = req.params.name;
    let value = req.params.value;
    let where = `${name} = "${value}"`;

    res.json(
        await db.fetchAllWhere("person", where)
    );
});

module.exports = router;

const express = require('express');
const router = express.Router();
const db = require("../src/db.js");

// Index route
router.get("/", async (req, res) => {
    res.json(
        await db.fetchAll("v_invoice")
    );
});

module.exports = router;

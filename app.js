/**
 * An Express server.
 */

"use strict";
require('dotenv').config();

const port = 8334;
const express = require("express");
const app = express();
const cors = require('cors');
const bodyParser = require("body-parser");

// Import route files
const index = require('./routes/index.js');
const person = require('./routes/person.js');
const bill = require('./routes/bill.js');
const account = require('./routes/account.js');
const allocation = require('./routes/allocation.js');
const category = require('./routes/category.js');
const company = require('./routes/company.js');
const frequency = require('./routes/frequency.js');
const priority = require('./routes/priority.js');
const wage = require('./routes/wage.js');

// This is middleware called for all routes.
// Middleware takes three parameters.
app.use((req, res, next) => {
    console.log(req.method);
    console.log(req.path);
    next();
});

app.use(cors()); //Cross-Origin Resource Sharing (CORS)

app.use(bodyParser.json()); // for parsing application/json
app.use(bodyParser.urlencoded({ extended: true })); // for parsing application/x-www-form-urlencoded

// Allocate routes to files
app.use("/", index);
app.use("/person", person);
app.use("/bill", bill);
app.use("/account", account);
app.use("/allocation", allocation);
app.use("/category", category);
app.use("/company", company);
app.use("/frequency", frequency);
app.use("/priority", priority);
app.use("/wage", wage);

// Add routes for 404 and error handling
// Catch 404 and forward to error handler
// Put this last
app.use((req, res, next) => {
    var err = new Error("Not Found");

    err.status = 404;
    next(err);
});

app.use((err, req, res, next) => {
    if (res.headersSent) {
        return next(err);
    }

    res.status(err.status || 500).json({
        "errors": [
            {
                "status": err.status,
                "title":  err.message,
                "detail": err.message
            }
        ]
    });
});

// Start up server
const server = app.listen(port, () => console.log(`Economy API listening on port ${port}!`));

module.exports = server;

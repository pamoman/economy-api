#!/usr/bin/env bash
# shellcheck disable=SC2181

#
# Load a SQL file into dlg_classroom
#
function loadSqlIntoEconomy
{
    echo ">>> $4 ($3)"
    mysql "-u$1" "-p$2" economy < "$3" > /dev/null
    if [ $? -ne 0 ]; then
        echo "The command failed, you may have issues with your SQL code."
        echo "Verify that all SQL commands can be exeucted in sequence in the file:"
        echo " '$3'"
        exit 1
    fi
}

#
# Recreate and reset the database.
#
echo ">>> Reset economy"
loadSqlIntoEconomy "root" "Manuchamps99" "setup.sql" "Initiera database"
loadSqlIntoEconomy "pamoman" "pamomanpass" "ddl.sql" "Add views into economy"
loadSqlIntoEconomy "pamoman" "pamomanpass" "insert.sql" "Insert into economy"

echo ">>> Finished!"

const fs = require('fs');
const path = require('path');
const db = require('./db-config');

const migrationsDirectory = path.join(__dirname, 'migrations');

const runMigration = (filePath, fileName) => {
    fs.readFile(filePath, { encoding: 'utf-8' }, (err, data) => {
        if (err) {
            console.error(`Unable to read migration file: ${fileName}`, err);
            return;
        }
        db.serialize(() => {
            db.exec(data, err => {
                if (err) {
                    console.error(`Couldn't run migration from file: ${fileName}`, err);
                } else {
                    console.log(`Ran migration from file: ${fileName}`);
                }
            });
        });
    });
}

const processFile = (fileName) => {
    if (path.extname(fileName) === '.sql') {
        const filePath = path.join(migrationsDirectory, fileName);
        runMigration(filePath, fileName);
    }
}

fs.readdir(migrationsDirectory, (err, files) => {
    if (err) {
        console.error('Unable to read migrations directory.', err);
        return;
    }
    files.forEach(processFile);
});

module.exports = db
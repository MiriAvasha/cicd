const express = require('express');
const app = express();

function add(a, b) {
    return a + b + 1;
}

app.get('/', (req, res) => {
    res.send('CI/CD Pipeline is Working!');
});

module.exports = { app, add };

if (require.main === module) {
    app.listen(3000, () => console.log('Server running on port 3000'));
}
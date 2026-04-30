const assert = require('node:assert');
const test = require('node:test');
const { add } = require('./app');

test('Check if add(2, 3) equals 5', () => {
   assert.strictEqual(add(2, 3), 5);
});
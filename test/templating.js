'use strict'

const cp = require('child_process')
const path = require('path')
const test = require('tape')
const fs = require('fs')

const TEMPLATER_PATH = path.resolve(__dirname, '..', 'src', 'mo.sh')

/**
 * fill in template @file using @values
 * @param {string} file filepath
 * @param {object} key-value pairs
 * @returns {string}
 */
const shTemplater = function({ file, values }) {
  const envWithValues = Object.assign({}, process.env, values)
  const r = cp.spawnSync(TEMPLATER_PATH, [file], { env: envWithValues }).stdout.toString()
  return r
}

test('test.template', (t) => {
  const inputValues = {
    input1: 'abc',
    input2: 'efg123',
    input3: '_BIG AR$3 SPACES_',
    present: 'im here'
  }
  const inputFile = path.resolve(__dirname, 'inputs/test.template')
  const outputFile = path.resolve(__dirname, 'outputs/test.expected')
  const expected = fs.readFileSync(outputFile).toString()
  const rSh = shTemplater({ file: inputFile, values: inputValues })
  t.equals(rSh, expected)
  t.end()
})

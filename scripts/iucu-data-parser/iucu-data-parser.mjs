#!/usr/bin/env zx

import { parse } from 'path';
import { readFileSync, writeFileSync } from 'fs';
import { parse as parseCsv } from 'csv-parse/sync';
import { stringify } from 'csv-stringify/sync';
import _ from 'lodash';
import { transformRecords } from './helpers/transformRecords.mjs';

echo`iucu-data-parser`;

const inputFile = process.argv[3];
const { name: fileName } = parse(inputFile);
const outputFile = `${fileName}.transformed.csv`;

echo`Parsing file: ${inputFile}`;

const content = readFileSync(`${inputFile}`);

const records = parseCsv(content, {
  columns: header =>
    header.map(column => _.camelCase(column)),
  skip_empty_lines: true
});

// echo();
// const headers = JSON.stringify(Object.keys(records[0]), null, 2);
const headers = ['Date', 'Num', 'Transation', 'Notes', 'Code', 'R', 'Deposit', 'Outgoing', 'Actual Balance', 'Reconciled Balance', 'Category'];
const rows = records.map(transformRecords);
const data = stringify([headers, ...rows]);

echo`Writing to file: ${outputFile}`;

writeFileSync(outputFile, data);

echo`Complete!`;

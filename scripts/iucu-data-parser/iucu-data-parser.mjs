#!/usr/bin/env zx

import { readFileSync, writeFileSync } from 'fs';
import _ from 'lodash';
import { parse as parseCsv } from 'csv-parse/sync';
import { stringify } from 'csv-stringify/sync';
import { transformRecords } from './helpers/transformRecords.mjs';

echo`iucu-data-parser`;

const inputFile = process.argv[3];
const outputFile = process.argv[4];

echo`Parsing file: ${inputFile}`;

const content = readFileSync(`${inputFile}`);

const records = parseCsv(content, {
  columns: header =>
    header.map(column => _.camelCase(column)),
  skip_empty_lines: true
});

const headers = ['Date', 'Num', 'Transation', 'Notes', 'Code', 'R', 'Deposit', 'Outgoing', 'Actual Balance', 'Reconciled Balance', 'Category'];
const rows = records.map(transformRecords);
const data = stringify([headers, ...rows]);

echo`Writing to file: ${outputFile}`;

writeFileSync(outputFile, data);

echo`Complete!`;

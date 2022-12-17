#!/usr/bin/env zx

import { readFileSync, writeFileSync } from 'fs';
import _ from 'lodash';
import { parse as parseCsv } from 'csv-parse/sync';
import { stringify } from 'csv-stringify/sync';
import { transformRecords } from './helpers/transformRecords.mjs';

echo`google-survey-parser`;

const inputFile = process.argv[3];
const outputFile = process.argv[4];

echo`Parsing file: ${inputFile}`;

const content = readFileSync(`${inputFile}`);

const records = parseCsv(content, {
  // columns: header =>
  //   header.map(column => _.camelCase(column)),
  skip_empty_lines: true
});

const [questionsRow, ...answers] = records;
const data = [];
const respondentName = 2;

questionsRow.forEach((question, questionIndex) => {
  if (questionIndex < 3) return;
  
  data.push(`${question} \n\n`);

  answers.forEach((answer) => {
    const questionAnswer = answer[questionIndex];

    if (questionAnswer) {
      data.push(`${answer[respondentName]}:\n`);
      data.push(`${questionAnswer}\n\n`);
    }
  });

  data.push('\n\n');
});

const output = data.join('');

echo`Writing to file: ${outputFile}`;

writeFileSync(outputFile, output);

echo`Complete!`;

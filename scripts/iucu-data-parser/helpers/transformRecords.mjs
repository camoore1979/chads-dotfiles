import { handleTransformations } from './transformers/handleTransformations.mjs';

export const transformRecords = (transactionRecord) => {

  const {
    // transactionNumber,
    date,
    description,
    memo,
    amountDebit,
    amountCredit,
    checkNumber,
    // fees
  } = transactionRecord;

  const dateFormatted = date;
  // const transaction = description;
  // const notes = '';
  // const code = '';
  const reconciled = 'R';
  const amountDeposited = Math.abs(amountCredit);
  const amountOutgoing = Math.abs(amountDebit);
  const { code, transaction, notes, category } = handleTransformations(transactionRecord) || {};

  return [
    dateFormatted,    // date
    checkNumber,      // check number
    transaction || description,      // transaction
    notes,            // notes
    code,             // code
    reconciled,       // reconciled
    amountDeposited,  // deposit
    amountOutgoing,   // outgoing
    '',               // actual balance
    '',               // reconciled balance
    category,
    `description: ${description} ^|^ memo: ${memo}`
  ];
};
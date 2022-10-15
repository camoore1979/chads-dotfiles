import { getCategory } from './transformers/getCategory.mjs';

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
  const transaction = description;
  const notes = '';
  const code = '';
  const reconciled = 'R';
  const amountDeposited = Math.abs(amountCredit);
  const amountOutgoing = Math.abs(amountDebit);
  const category = getCategory(transactionRecord);

  return [
    dateFormatted,    // date
    checkNumber,      // check number
    transaction,      // transaction
    notes,            // notes
    code,             // code
    reconciled,       // reconciled
    amountDeposited,  // deposit
    amountOutgoing,   // outgoing
    '',               // actual balance
    '',               // reconciled balance
    category,
    `transaction: ${transaction} ^|^ description: ${description} ^|^ memo: ${memo}`
  ];
};
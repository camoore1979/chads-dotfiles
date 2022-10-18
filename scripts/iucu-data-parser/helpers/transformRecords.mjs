import { getBankTransactionDescription } from './transformers/getBankTransactionDescription.mjs';
import { handleTransformations } from './transformers/handleTransformations.mjs';

export const transformRecords = (transactionRecord) => {

  const {
    amountCredit,
    amountDebit,
    checkNumber,
    date,
    description,
    memo
  } = transactionRecord;

  const bankTransactionDescription = getBankTransactionDescription(description, memo);
  const dateFormatted = date;
  const reconciled = 'R';
  const amountDeposited = Math.abs(amountCredit);
  const amountOutgoing = Math.abs(amountDebit);
  const { category, code, notes, transaction } = handleTransformations(transactionRecord) || {};

  return [
    dateFormatted,    // date
    category,         // category
    checkNumber,      // check number
    transaction || bankTransactionDescription,      // transaction
    notes,      // bank memo
    `${description} (${memo})`,             // bank description
    code,             // code
    reconciled,       // reconciled
    amountDeposited,  // deposit
    amountOutgoing    // outgoing
  ];
};
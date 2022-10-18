const searchAndSlice = (stringToModify, stringToMatch) => {
  const indexOfStringToMatch = stringToModify.search(stringToMatch);
  return indexOfStringToMatch > -1 ? stringToModify.slice(0, indexOfStringToMatch) : stringToModify;
};

export const getBankTransactionDescription = (description, memo) => {
  let cleanDescription = description;
  cleanDescription = cleanDescription.replace('Withdrawal Home Banking', '');
  cleanDescription = cleanDescription.replace('Withdrawal DEBIT TRAN', '');
  cleanDescription = cleanDescription.replace('Withdrawal at ', '');
  cleanDescription = cleanDescription.replace('Withdrawal ', '');
  cleanDescription = cleanDescription.trim();

  let cleanMemo = memo;
  cleanMemo = searchAndSlice(cleanMemo, 'Date');
  cleanMemo = searchAndSlice(cleanMemo, 'Internet Access');
  cleanMemo = searchAndSlice(cleanMemo, 'Card');
  cleanMemo = cleanMemo.replace('%%', '');
  cleanMemo = cleanMemo.trim();

  if (cleanDescription && cleanMemo) {
    return `${cleanDescription} (${cleanMemo})`;
  }

  if (cleanDescription) {
    return cleanDescription;
  }

  return cleanMemo;
};
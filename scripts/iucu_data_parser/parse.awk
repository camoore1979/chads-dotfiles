#! /usr/bin/awk -f 

BEGIN {
  FS = ",";
  OFS = ",";
  transactions[""]=0;
  COLUMN_DATE = 1;
  COLUMN_CHECK_NUMBER = 2;
  COLUMN_TRANSACTION = 3;
  COLUMN_NOTES = 4;
  COLUMN_EMPTY = 5;
  COLUMN_CODE = 6;
  COLUMN_RECONCILED = 7;
  COLUMN_CREDIT = 8;
  COLUMN_DEBIT = 9;
  count = 1;
  print "Date", "Num", "Transaction", "Notes", "Code", "R", "Deposit", "Outgoing";
}
{
  theDate = $2;

  checkNumber = int($8);
  if (checkNumber == 0) checkNumber = "";

  description = $3;
  description = substr(description,1,length(description)-1);
  code = "";
  transaction = "";
  if (index(description,"Withdrawal") > 0) {
    code = "DC";
    transaction = substr(description,12);
  } else if (index(description,"Draft") > 0) {
    code = "CH";
    transaction = substr(description,7);
  } else if (index(description,"Deposit") > 0) {
    code = "D";
    transaction = substr(description,9);
  }
  if (index(transaction,"Transfer To Share") > 0 || index(transaction,"From Share") > 0) {
    code = "T";
  }

  memo = substr($4,2,length($4)-2); # Remove quotation marks
  notes = "";

  if (index(transaction,"DEBIT TRAN") > 0) {
    transaction = substr(transaction,12);
    memo1 = substr(memo,1,index(memo, "Date")-1);
    memo2 = substr(memo,index(memo, "Card"), length(memo));
    transaction = memo1 " " memo2;
    notes = memo2;
  } else {
    transaction = transaction " " memo;
  }

  if (index(transaction,"Home Banking") > 0) {
    transaction = substr(transaction,14);
  }
  if (index(transaction,"Internet Access") > 0) {
    transaction = substr(transaction,1, index(transaction,"Internet Access"));
  }

  transactions[count, COLUMN_DATE] = theDate;
  transactions[count, COLUMN_CHECK_NUMBER] = checkNumber;
  transactions[count, COLUMN_TRANSACTION] = transaction;
  transactions[count, COLUMN_NOTES] = notes;
  transactions[count, COLUMN_EMPTY] = "";
  transactions[count, COLUMN_CODE] = code;
  transactions[count, COLUMN_RECONCILED] = "R";
  transactions[count, COLUMN_CREDIT] = $6;
  transactions[count, COLUMN_DEBIT] = substr($5,2);

  count++;
}
END {
  for (i=count-1; i>0; i--) {
    print transactions[i, COLUMN_DATE],
          transactions[i, COLUMN_CHECK_NUMBER],
          transactions[i, COLUMN_TRANSACTION],
          transactions[i, COLUMN_NOTES],
          transactions[i, COLUMN_EMPTY],
          transactions[i, COLUMN_CODE],
          transactions[i, COLUMN_RECONCILED],
          transactions[i, COLUMN_CREDIT],
          transactions[i, COLUMN_DEBIT];

  }
}
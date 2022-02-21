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
  COLUMN_ACTUAL = 10
  COLUMN_BALANCE = 11
  COLUMN_CATEGORY = 12
  COLUMN_DESCRIPTION = 13;
  COLUMN_MEMO = 14;
  count = 1;
  print "Date", "Num", "Transaction", "Notes", "Code", "R", "Deposit", "Outgoing";
}
{
  theDate = $2;
  checkNumber = int($8);
  if (checkNumber == 0) checkNumber = "";

  description = $3;
  memo = $4;
  transaction = "";
  notes = "";
  code = "";
  category = "";

  if (index(description,"Withdrawal") > 0) {
    # transaction = substr(description,index(description,"Withdrawal")+11);
    if (index(description,"Withdrawal Home Banking") > 0) {
      code = "T";
      transaction = substr(memo,1, index(memo, "Internet")-2);
    } else if (index(description,"Withdrawal at ATM") > 0) {
      code = "W";
      transaction = description;
      notes = substr(memo,index(memo, "Card"), 13);
    } else if (index(description,"Withdrawal DEBIT TRAN") > 0) {
      code = "DC";
      transaction = substr(memo,1,index(memo, "Date")-2);
      notes = substr(memo,index(memo, "Card"), 13);
    } else if (index(memo,"Card") > 0) {
      code = "DC";
      transaction = substr(description,index(description,"Withdrawal")+11);
      notes = substr(memo,index(memo, "Card"), 13);
    } else {
      code = "W";
      transaction = substr(description,10);
      notes = substr(memo,index(memo, "Card"), 13);
    }
  } else if (index(description,"Draft") > 0) {
    code = "CH";
    transaction = substr(description,index(description,"Draft")+6);
  } else if (index(description,"Deposit") > 0) {

    if (index(description,"Deposit by Check") > 0) {
      code = "D";
      transaction = description;
    } else if (index(description,"Deposit Transfer from") > 0) {
      code = "T";
      transaction = substr(description,8);
    } else if (index(description,"Deposit Home Banking Transfer") > 0) {
      code = "T";
      transaction = description;
      notes = substr(memo,index(memo, "Card"), 13);
    } else {
      code = "D";
      transaction = description;
      notes = memo;
    }
  } else if (index(description,"Transfer Fee") > 0) {
    code = "FEE";
    transaction = description;
  }

  if (index(description, "ALLSTATE") > 0) {
    category = "auto insurance";
  } else if (index(description, "Withdrawal CAPITOL ONE") > 0) {
    category = "emergency fund";
  } else if (index(description, "Deposit CATALENT") > 0) {
    category = "catalent";
  } else if (index(description, "Deposit POLARIS") > 0) {
    category = "polaris";
  } else if (index(description, "KROGER") > 0) {
    category = "groceries";
  }

  if (index(memo, "AUDIBLE") > 0) {
    category = "books/periodicals";
  } else if (index(memo, "CRU-DONATIONS") > 0) {
    category = "cru";
  } else if (index(memo, "DISNEYPLUS") > 0) {
    category = "entertainment (recurring)";
  } else if (index(memo, "HBOMAX") > 0) {
    category = "entertainment (recurring)";
  } else if (index(memo, "INTERVARSITY") > 0) {
    category = "intervarsity";
  } else if (index(memo, "MSBILL.INFO") > 0) {
    category = "technology";
  } else if (index(memo, "PRIME VIDEO") > 0) {
    category = "recreation";
  } else if (index(memo, "SPOTIRY") > 0) {
    category = "entertainment (recurring)";
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
  transactions[count, COLUMN_ACTUAL] = 0;
  transactions[count, COLUMN_BALANCE] = 0;
  transactions[count, COLUMN_CATEGORY] = category;
  transactions[count, COLUMN_DESCRIPTION] = $3;
  transactions[count, COLUMN_MEMO] = $4;

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
          transactions[i, COLUMN_DEBIT],
          transactions[i, COLUMN_ACTUAL],
          transactions[i, COLUMN_BALANCE],
          transactions[i, COLUMN_CATEGORY],
          transactions[i, COLUMN_DESCRIPTION],
          transactions[i, COLUMN_MEMO];

  }
}






  # if (index(transaction,"Transfer To Share") > 0 || index(transaction,"From Share") > 0) {
  #   code = "T";
  # }
  # if (index(transaction,"DEBIT TRAN") > 0) {
  #   transaction = substr(transaction,index(transaction,"DEBIT TRAN")+11);
  #   memo1 = substr(memo,1,index(memo, "Date")-1);
  #   memo2 = substr(memo,index(memo, "Card"), length(memo));
  #   transaction = memo1 " " memo2;
  #   notes = memo2;
  # } else {
  #   transaction = transaction " " memo;
  # }
  # if (index(transaction,"Home Banking") > 0) {
  #   transaction = substr(transaction,index(transaction,"Home Banking")+13);
  # }
  # if (index(transaction,"Internet Access") > 0) {
  #   transaction = substr(transaction,1, index(transaction,"Internet Access")-1);
  # }
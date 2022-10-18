import { CATEGORY_BOOKS_PERIODICALS, CATEGORY_DEBT_MITSUBISHI, CATEGORY_DEBT_MORTGAGE, CATEGORY_ENTERTAINMENT, CATEGORY_GIVING_CRU, CATEGORY_GIVING_INTERVARSITY, CATEGORY_GROCERIES, CATEGORY_SAVINGS_EMERGENCY, CATEGORY_SAVINGS_REGULAR, CODE_AUTOPAY, CODE_DEBIT_CARD, CODE_WITHDRAWAL } from '../../constants.mjs';
import { performTransformation } from '../performTransformation.mjs';

const handleGiving = ({ description, memo }) => performTransformation([description, memo], 'cru-donation', {
  category: CATEGORY_GIVING_CRU, code: CODE_AUTOPAY, transaction: 'Cru Donation'
}) ||
  performTransformation([description, memo], 'intervarsity', {
    category: CATEGORY_GIVING_INTERVARSITY, code: CODE_AUTOPAY, transaction: 'InterVarsity Donation'
  });

const handleSavings = ({ description, memo }) => performTransformation([description, memo], 'Withdrawal CAPITAL ONE', {
  category: CATEGORY_SAVINGS_EMERGENCY, code: CODE_WITHDRAWAL, transaction: 'Transfer to Capital One 360 Savings'
}) ||
  performTransformation([description, memo], 'Transfer to Share 0002', {
    category: CATEGORY_SAVINGS_REGULAR, code: CODE_AUTOPAY, transaction: 'Transfer to Share 0002 (Tonya\'s Savings)'
  }) ||
  performTransformation([description, memo], 'Transfer to Share 0003', {
    category: CATEGORY_SAVINGS_REGULAR, code: CODE_AUTOPAY, transaction: 'Transfer to Share 0003 (Chad\'s Savings)'
  });

const handleDebt = ({ description, memo }) => performTransformation([description, memo], 'Old National', {
  category: CATEGORY_DEBT_MORTGAGE, code: CODE_AUTOPAY, transaction: 'Old National Bank (mortgage)'
}) ||
  performTransformation([description, memo], 'Transfer to Loan 0006', {
    category: CATEGORY_DEBT_MITSUBISHI, code: CODE_AUTOPAY, transaction: 'Transfer to Loan 0006 (Mitsubishi Lancer)'
  });

const handleGroceries = ({ description, memo }) => performTransformation([description, memo], 'Kroger', {
  category: CATEGORY_GROCERIES, code: CODE_DEBIT_CARD
}) ||
  performTransformation([description, memo], 'samsclub', {
    category: CATEGORY_GROCERIES, code: CODE_DEBIT_CARD
  }) ||
  performTransformation([description, memo], 'sams club', {
    category: CATEGORY_GROCERIES, code: CODE_DEBIT_CARD
  }) ||
  performTransformation([description, memo], 'dollar ge', {
    category: CATEGORY_GROCERIES, code: CODE_DEBIT_CARD
  });

const handleBooksPeriodicals = ({ description, memo }) => performTransformation([description, memo], 'newyorktimes', {
  category: CATEGORY_BOOKS_PERIODICALS, code: CODE_AUTOPAY, transaction: 'New York Times subscription'
}) ||
  performTransformation([description, memo], 'gannett', {
    category: CATEGORY_BOOKS_PERIODICALS, code: CODE_AUTOPAY, transaction: 'Bloomington Herald-Times (Gannett papers) subscription'
  }) ||
  performTransformation([description, memo], 'half price books', {
    category: CATEGORY_BOOKS_PERIODICALS, code: CODE_DEBIT_CARD
  }) ||
  performTransformation([description, memo], 'caveat emptor', {
    category: CATEGORY_BOOKS_PERIODICALS, code: CODE_DEBIT_CARD
  });

const handleEntertainment = ({ description, memo }) => performTransformation([description, memo], 'netflix', {
  category: CATEGORY_ENTERTAINMENT, code: CODE_AUTOPAY
}) || performTransformation([description, memo], 'disney plus', {
  category: CATEGORY_ENTERTAINMENT, code: CODE_AUTOPAY
}) ||
  performTransformation([description, memo], 'youtube', {
    category: CATEGORY_ENTERTAINMENT, code: CODE_AUTOPAY
  });

export const outgoingHandlers = [handleGiving, handleSavings, handleDebt, handleGroceries, handleBooksPeriodicals, handleEntertainment];

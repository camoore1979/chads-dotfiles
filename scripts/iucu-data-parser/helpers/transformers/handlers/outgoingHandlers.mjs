import {
  CATEGORY_BOOKS_PERIODICALS, CATEGORY_CAR_FUEL, CATEGORY_CHAD_SPENDING, CATEGORY_DEBT_AMERICAN_EXPRESS, CATEGORY_DEBT_CARS, CATEGORY_DEBT_MORTGAGE, CATEGORY_DEBT_ONB_LOAN, CATEGORY_ELECTRICITY, CATEGORY_ENTERTAINMENT, CATEGORY_GIVING_CAMPUS_MINISTRY, CATEGORY_GROCERIES, CATEGORY_GYM, CATEGORY_INSURANCE_AUTO, CATEGORY_INSURANCE_LIFE, CATEGORY_INTERNET, CATEGORY_RECREATION, CATEGORY_RESTAURANTS, CATEGORY_SAVINGS_CHRISTMAS, CATEGORY_SAVINGS_EMERGENCY, CATEGORY_SAVINGS_REGULAR, CATEGORY_TECHNOLOGY, CATEGORY_TONYA_SPENDING, CODE_AUTOPAY, CODE_DEBIT_CARD, CODE_TRANSFER, CODE_WITHDRAWAL
} from '../../constants.mjs';
import { performTransformation } from '../performTransformation.mjs';

const handleGiving = ({ description, memo }) => performTransformation([description, memo], 'cru-donation', {
  category: CATEGORY_GIVING_CAMPUS_MINISTRY, code: CODE_AUTOPAY, transaction: 'Cru Donation'
}) ||
  performTransformation([description, memo], 'intervarsity', {
    category: CATEGORY_GIVING_CAMPUS_MINISTRY, code: CODE_AUTOPAY, transaction: 'InterVarsity Donation'
  }) ||
  performTransformation([description, memo], 'campus outreach', {
    category: CATEGORY_GIVING_CAMPUS_MINISTRY, code: CODE_AUTOPAY, transaction: 'Campus Outreach Donation'
  });

const handleSavings = ({ description, memo }) => performTransformation([description, memo], 'Withdrawal CAPITAL ONE', {
  category: CATEGORY_SAVINGS_EMERGENCY, code: CODE_WITHDRAWAL, transaction: 'Transfer to Capital One 360 Savings'
}) ||
  performTransformation([description, memo], 'Transfer to Share 0002', {
    category: CATEGORY_SAVINGS_REGULAR, code: CODE_TRANSFER, transaction: 'Transfer to Share 0002 (Tonya\'s Savings)'
  }) ||
  performTransformation([description, memo], 'Transfer to Share 0003', {
    category: CATEGORY_SAVINGS_REGULAR, code: CODE_TRANSFER, transaction: 'Transfer to Share 0003 (Chad\'s Savings)'
  }) ||
  performTransformation([description, memo], 'Transfer to Share 0006', {
    category: CATEGORY_SAVINGS_CHRISTMAS, code: CODE_TRANSFER, transaction: 'Transfer to Share 0006 (Christmas)'
  });

const handleDebt = ({ description, memo }) => performTransformation([description, memo], 'Old National', {
  category: CATEGORY_DEBT_MORTGAGE, code: CODE_AUTOPAY, transaction: 'Old National Bank (mortgage)'
}) ||
  performTransformation([description, memo], 'old natl bank', {
    category: CATEGORY_DEBT_ONB_LOAN, code: CODE_AUTOPAY, transaction: 'Old National Bank (personal loan)'
  }) ||
  performTransformation([description, memo], 'Transfer to Loan 0006', {
    category: CATEGORY_DEBT_CARS, code: CODE_AUTOPAY, transaction: 'Transfer to Loan 0006 (Mitsubishi Lancer)'
  }) ||
  performTransformation([description, memo], 'amex epayment', {
    category: CATEGORY_DEBT_AMERICAN_EXPRESS, code: CODE_AUTOPAY, transaction: 'American Express payment'
  });

const handleAutoGas = ({ description, memo }) => performTransformation([description, memo], ['Kroger #2', 'GETGO'], { category: CATEGORY_CAR_FUEL, code: CODE_DEBIT_CARD });

const handleGroceries = ({ description, memo }) => performTransformation([description, memo], ['Kroger',
  'samsclub',
  'dollar ge'], { category: CATEGORY_GROCERIES, code: CODE_DEBIT_CARD });

const handleBooksPeriodicals = ({ description, memo }) => performTransformation([description, memo], ['nytimes', 'newyorktimes'], {
  category: CATEGORY_BOOKS_PERIODICALS, code: CODE_AUTOPAY, transaction: 'New York Times subscription'
}) ||
  performTransformation([description, memo], 'gannett', {
    category: CATEGORY_BOOKS_PERIODICALS, code: CODE_AUTOPAY, transaction: 'Bloomington Herald-Times (Gannett papers) subscription'
  }) ||
  performTransformation([description, memo], ['half price books', 'caveat emptor'], { category: CATEGORY_BOOKS_PERIODICALS, code: CODE_DEBIT_CARD });

const handleEntertainment = ({ description, memo }) => performTransformation([description, memo], 'netflix', {
  category: CATEGORY_ENTERTAINMENT, code: CODE_AUTOPAY, transaction: 'Netflix subscription'
}) || performTransformation([description, memo], 'disney plus', {
  category: CATEGORY_ENTERTAINMENT, code: CODE_AUTOPAY, transaction: 'Disney Plus subscription'
}) ||
  performTransformation([description, memo], 'youtube', {
    category: CATEGORY_ENTERTAINMENT, code: CODE_AUTOPAY, transaction: 'YouTube Premium subscription'
  }) ||
  performTransformation([description, memo], 'hbomax.com', {
    category: CATEGORY_ENTERTAINMENT, code: CODE_AUTOPAY, transaction: 'HBO Max subscription'
  }) ||
  performTransformation([description, memo], 'spotify', {
    category: CATEGORY_ENTERTAINMENT, code: CODE_AUTOPAY, transaction: 'Spotify subscription'
  });

const handleUtilities = ({ description, memo }) => performTransformation([description, memo], 'dukeenergy', {
  category: CATEGORY_ELECTRICITY, code: CODE_AUTOPAY, transaction: 'Duke Energy Electric Bill'
}) || performTransformation([description, memo], 'smithvilletelephonecom', {
  category: CATEGORY_INTERNET, code: CODE_AUTOPAY, transaction: 'Smithville Telephone Bill'
});

const handleRecreation = ({ description, memo }) => performTransformation([description, memo], 'Prime Video', {
  category: CATEGORY_RECREATION, code: CODE_AUTOPAY, transaction: 'Amazon Prime Video rental'
});

const handleGym = ({ description, memo }) => performTransformation([description, memo], 'youngmenschristi', { category: CATEGORY_GYM, code: CODE_AUTOPAY });

const handleInsurance = ({ description, memo }) => performTransformation([description, memo], 'allstate', { category: CATEGORY_INSURANCE_AUTO, code: CODE_AUTOPAY })
  || performTransformation([description, memo], 'midland', { category: CATEGORY_INSURANCE_LIFE, code: CODE_AUTOPAY });

const tonyaSpendingList = [
  'jrdav'
];
const handleTonyaSpending = ({ description, memo }) => performTransformation([description, memo], tonyaSpendingList, { category: CATEGORY_TONYA_SPENDING, code: CODE_DEBIT_CARD });

const chadSpendingList = [
  'eatthai',
  'cloverleaf',
  'smoker friendly',
  'the briar'
];
const handleChadSpending = ({ description, memo }) => performTransformation([description, memo], chadSpendingList, { category: CATEGORY_CHAD_SPENDING, code: CODE_DEBIT_CARD });

const restaurantsList = [
  'papa john',
  'texas roadhouse',
  'dominos'
];
const handleRestaurants = ({ description, memo }) => performTransformation([description, memo], restaurantsList, { category: CATEGORY_RESTAURANTS, code: CODE_DEBIT_CARD });

const technologyList = [
  'amazon web services'
];
const handleTechnology = ({ description, memo }) => performTransformation([description, memo], technologyList, { category: CATEGORY_TECHNOLOGY, code: CODE_AUTOPAY });

export const outgoingHandlers = [
  handleAutoGas,
  handleBooksPeriodicals,
  handleDebt,
  handleChadSpending,
  handleEntertainment,
  handleGiving,
  handleGroceries,
  handleGym,
  handleInsurance,
  handleSavings,
  handleRecreation,
  handleRestaurants,
  handleTechnology,
  handleTonyaSpending,
  handleUtilities
];

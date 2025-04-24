import {
  CATEGORY_BOOKS_PERIODICALS, CATEGORY_CAR_FUEL, CATEGORY_CHAD_PURCHASES, CATEGORY_DEBT_AMERICAN_EXPRESS, CATEGORY_DEBT_IUCU_HELOC, CATEGORY_DEBT_MORTGAGE, CATEGORY_ELECTRICITY, CATEGORY_ENTERTAINMENT, CATEGORY_GIVING_CAMPUS_MINISTRY, CATEGORY_GIVING_COMPASSION_INTERNATIONAL, CATEGORY_GROCERIES, CATEGORY_GYM, CATEGORY_INSURANCE_AUTO, CATEGORY_INSURANCE_LIFE, CATEGORY_INTERNET, CATEGORY_RECREATION, CATEGORY_RESTAURANTS, CATEGORY_SAVINGS_CHAD, CATEGORY_SAVINGS_EMERGENCY, CATEGORY_SAVINGS_HOUSE, CATEGORY_SAVINGS_TONYA, CATEGORY_TECHNOLOGY, CATEGORY_TONYA_PURCHASES, CODE_AUTOPAY, CODE_DEBIT_CARD, CODE_TRANSFER, CODE_WITHDRAWAL
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
  }) ||
  performTransformation([description, memo], 'compassion internation', {
    category: CATEGORY_GIVING_COMPASSION_INTERNATIONAL, code: CODE_AUTOPAY, transaction: 'Compassion International Support'
  });

const handleSavings = ({ description, memo }) => performTransformation([description, memo], 'Withdrawal CAPITAL ONE', {
  category: CATEGORY_SAVINGS_EMERGENCY, code: CODE_WITHDRAWAL, transaction: 'Transfer to Capital One 360 Savings'
}) ||
  performTransformation([description, memo], 'Transfer To Share 0001', {
    category: CATEGORY_SAVINGS_HOUSE, code: CODE_TRANSFER, transaction: 'To Regular Savings (Share 0001)'
  }) ||
  performTransformation([description, memo], 'Transfer to Share 0002', {
    category: CATEGORY_SAVINGS_TONYA, code: CODE_TRANSFER, transaction: 'To Tonya\'s Savings (Share 0002)'
  }) ||
  performTransformation([description, memo], 'Transfer to Share 0003', {
    category: CATEGORY_SAVINGS_CHAD, code: CODE_TRANSFER, transaction: 'To Chad\'s Savings (Share 0003)'
  });

const handleDebt = ({ description, memo }) => performTransformation([description, memo], 'Old National', {
  category: CATEGORY_DEBT_MORTGAGE, code: CODE_AUTOPAY, transaction: 'Old National Bank (mortgage)'
}) ||
  performTransformation([description, memo], 'Transfer to Loan 0100', {
    category: CATEGORY_DEBT_IUCU_HELOC, code: CODE_AUTOPAY, transaction: 'Transfer to Loan 0100 (IUCU HELOC)'
  }) ||
  performTransformation([description, memo], 'amex epayment', {
    category: CATEGORY_DEBT_AMERICAN_EXPRESS, code: CODE_AUTOPAY, transaction: 'American Express payment'
  });

const gasList = [
  'Kroger #2', 'GETGO'
];
const handleAutoGas = ({ description, memo }) => performTransformation([description, memo], gasList, { category: CATEGORY_CAR_FUEL, code: CODE_DEBIT_CARD });

const handleGroceries = ({ description, memo }) => performTransformation([description, memo], ['Kroger',
  'samsclub',
  'SAMS CLUB',
  'dollar ge'], { category: CATEGORY_GROCERIES, code: CODE_DEBIT_CARD });

const handleUtilities = ({ description, memo }) => performTransformation([description, memo], 'dukeenergy', {
  category: CATEGORY_ELECTRICITY, code: CODE_AUTOPAY, transaction: 'Duke Energy Electric Bill'
}) || performTransformation([description, memo], 'smithvilletelephonecom', {
  category: CATEGORY_INTERNET, code: CODE_AUTOPAY, transaction: 'Smithville Telephone Bill'
});

const carInsuranceList = [
  'allstate', 'state farm'
];
const handleInsurance = ({ description, memo }) => performTransformation([description, memo], carInsuranceList, { category: CATEGORY_INSURANCE_AUTO, code: CODE_AUTOPAY })
  || performTransformation([description, memo], 'midland', { category: CATEGORY_INSURANCE_LIFE, code: CODE_AUTOPAY })
  ;

const tonyaSpendingList = [
  'jrdav'
];
const handleTonyaSpending = ({ description, memo }) => performTransformation([description, memo], tonyaSpendingList, { category: CATEGORY_TONYA_PURCHASES, code: CODE_DEBIT_CARD });

const chadSpendingList = [
  'eatthai',
  'cloverleaf',
  'smoker friendly',
  'the briar'
];
const handleChadSpending = ({ description, memo }) => performTransformation([description, memo], chadSpendingList, { category: CATEGORY_CHAD_PURCHASES, code: CODE_DEBIT_CARD });

const restaurantsList = [
  'papa john',
  'texas roadhouse',
  'dominos'
];
const handleRestaurants = ({ description, memo }) => performTransformation([description, memo], restaurantsList, { category: CATEGORY_RESTAURANTS, code: CODE_DEBIT_CARD });

const gymList = [
  'youngmenschristian', 'iron pit gym'
];
const handleGym = ({ description, memo }) => performTransformation([description, memo], gymList, { category: CATEGORY_GYM, code: CODE_AUTOPAY });

const technologyList = [
  'amazon web services'
];
const handleTechnology = ({ description, memo }) => performTransformation([description, memo], technologyList, { category: CATEGORY_TECHNOLOGY, code: CODE_AUTOPAY });

const handleBooksPeriodicals = ({ description, memo }) =>
  performTransformation([description, memo], ['half price books', 'caveat emptor'], { category: CATEGORY_BOOKS_PERIODICALS, code: CODE_DEBIT_CARD });

const handleRecreation = ({ description, memo }) => performTransformation([description, memo], 'Prime Video', {
  category: CATEGORY_RECREATION, code: CODE_AUTOPAY, transaction: 'Amazon Prime Video rental'
});

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

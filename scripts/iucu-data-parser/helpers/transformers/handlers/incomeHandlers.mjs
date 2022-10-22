import {
  CATEGORY_INCOME_CATALENT, CATEGORY_INCOME_POLARIS, CATEGORY_INCOME_PULL_FROM_SAVINGS, CODE_DEPOSIT, CODE_TRANSFER
} from '../../constants.mjs';
import { performTransformation } from '../performTransformation.mjs';

const handleIncome = ({ description }) => performTransformation([description], CATEGORY_INCOME_POLARIS, {
  category: CATEGORY_INCOME_POLARIS, code: CODE_DEPOSIT, transaction: 'Paycheck: POLARIS Laboratories, Inc.'
}) || performTransformation([description], CATEGORY_INCOME_CATALENT, {
  category: CATEGORY_INCOME_CATALENT, code: CODE_DEPOSIT, transaction: 'Paycheck: Catalent Pharma.'
});

const handleTransfersFrom = ({ description, memo }) => performTransformation([description, memo], 'from share', { category: CATEGORY_INCOME_PULL_FROM_SAVINGS, code: CODE_TRANSFER });



export const incomeHandlers = [handleIncome, handleTransfersFrom];

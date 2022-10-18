import { CATEGORY_INCOME_CATALENT, CATEGORY_INCOME_POLARIS, CODE_DEPOSIT } from '../../constants.mjs';
import { performTransformation } from '../performTransformation.mjs';

const handleIncome = ({ description }) => performTransformation([description], CATEGORY_INCOME_POLARIS, {
  category: CATEGORY_INCOME_POLARIS, code: CODE_DEPOSIT, transaction: 'Paycheck: POLARIS Laboratories, Inc.'
}) || performTransformation([description], CATEGORY_INCOME_CATALENT, {
  category: CATEGORY_INCOME_CATALENT, code: CODE_DEPOSIT, transaction: 'Paycheck: Catalent Pharma.'
});


export const incomeHandlers = [handleIncome];

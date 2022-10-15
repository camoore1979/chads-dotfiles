import { CODE_DEPOSIT, CATEGORY_POLARIS } from '../../constants.mjs';
import { performTransformation } from '../performTransformation.mjs';

export const handleIncomePolaris = ({ description }) => performTransformation([description], CATEGORY_POLARIS, {
  category: CATEGORY_POLARIS, code: CODE_DEPOSIT, notes: 'Chad\'s paycheck', transaction: 'Paycheck: CATEGORY_POLARIS Laboratories, Inc.'
});

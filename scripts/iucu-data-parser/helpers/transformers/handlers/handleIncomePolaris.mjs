import { CODE_DEPOSIT, polaris } from '../../constants.mjs';
import { performTransformation } from '../performTransformation.mjs';

export const handleIncomePolaris = ({ description }) => performTransformation([description], polaris, {
  category: polaris, code: CODE_DEPOSIT, notes: 'Chad\'s paycheck', transaction: 'Paycheck: POLARIS Laboratories, Inc.'
});

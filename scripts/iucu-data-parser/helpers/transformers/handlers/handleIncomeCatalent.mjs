import { CATEGORY_CATALENT, CODE_DEPOSIT } from '../../constants.mjs';
import { performTransformation } from '../performTransformation.mjs';

export const handleIncomeCatalent = ({ description }) => performTransformation([description], CATEGORY_CATALENT, {
  category: CATEGORY_CATALENT, code: CODE_DEPOSIT, notes: 'Tonya\'s paycheck', transaction: 'Paycheck:CATEGORY_CATALENT Pharma.'
});

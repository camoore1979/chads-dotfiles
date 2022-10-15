import { CODE_DEPOSIT, catalent } from '../../constants.mjs';
import { performTransformation } from '../performTransformation.mjs';

export const handleIncomeCatalent = ({ description }) => performTransformation([description], catalent, {
  category: catalent, code: CODE_DEPOSIT, notes: 'Tonya\'s paycheck', transaction: 'Paycheck: Catalent Pharma.'
});

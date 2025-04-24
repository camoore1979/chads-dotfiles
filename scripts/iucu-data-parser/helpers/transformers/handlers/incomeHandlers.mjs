import {
  CATEGORY_INCOME_POLARIS, CATEGORY_INCOME_PRECISION, CATEGORY_INCOMING_CHAD_SAVINGS, CATEGORY_INCOMING_EMERGENCY_SAVINGS, CATEGORY_INCOMING_HELOC, CATEGORY_INCOMING_REG_SAVINGS, CATEGORY_INCOMING_TONYA_SAVINGS, CODE_DEPOSIT, CODE_TRANSFER
} from '../../constants.mjs';
import { performTransformation } from '../performTransformation.mjs';

const handleIncome = ({ description }) => performTransformation([description], CATEGORY_INCOME_POLARIS, {
  category: CATEGORY_INCOME_POLARIS, code: CODE_DEPOSIT, transaction: 'Paycheck: POLARIS Laboratories, Inc.'
}) || performTransformation([description], CATEGORY_INCOME_PRECISION, {
  category: CATEGORY_INCOME_PRECISION, code: CODE_DEPOSIT, transaction: 'Paycheck: PRECISION EYE'
});

const handleTransfersFrom = ({ description, memo }) =>
  performTransformation([description, memo], 'from share 0001', { category: CATEGORY_INCOMING_REG_SAVINGS, code: CODE_TRANSFER })
  || performTransformation([description, memo], 'from share 0002', { category: CATEGORY_INCOMING_TONYA_SAVINGS, code: CODE_TRANSFER })
  || performTransformation([description, memo], 'from share 0003', { category: CATEGORY_INCOMING_CHAD_SAVINGS, code: CODE_TRANSFER })
  || performTransformation([description, memo], 'from share 0003', { category: CATEGORY_INCOMING_EMERGENCY_SAVINGS, code: CODE_TRANSFER })
  || performTransformation([description, memo], 'from share 0003', { category: CATEGORY_INCOMING_HELOC, code: CODE_TRANSFER });



export const incomeHandlers = [handleIncome, handleTransfersFrom];

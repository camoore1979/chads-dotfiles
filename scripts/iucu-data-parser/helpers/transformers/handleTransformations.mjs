import { handleIncomeCatalent } from './handlers/handleIncomeCatalent.mjs';
import { handleIncomePolaris } from './handlers/handleIncomePolaris.mjs';
import { handleOutgoingPeriodicals } from './handlers/handleOutgoingPeriodicals.mjs';

// const handleOutgoingPeriodicals = ({ description, memo }) => 
//   transform([description, memo], newYorkTimes, booksPeriodicals);

const transformHandlers = [
  handleIncomeCatalent,
  handleIncomePolaris,
  handleOutgoingPeriodicals
];

export const handleTransformations = (transactionRecord) => {
  const transform = transformHandlers.find(handler => handler(transactionRecord));
  return transform ? transform(transactionRecord) : undefined;
};
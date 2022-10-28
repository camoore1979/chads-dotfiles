import { incomeHandlers } from './handlers/incomeHandlers.mjs';
import { outgoingHandlers } from './handlers/outgoingHandlers.mjs';

const transformHandlers = [
  ...outgoingHandlers,
  ...incomeHandlers,
];

export const handleTransformations = (transactionRecord) => {
  const transform = transformHandlers.find(handler => handler(transactionRecord));
  return transform ? transform(transactionRecord) : undefined;
};
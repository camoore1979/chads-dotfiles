import { CODE_AUTOPAY, booksPeriodicals, gannett, newYorkTimes } from '../../constants.mjs';
import { performTransformation } from '../performTransformation.mjs';

export const handleOutgoingPeriodicals = ({ description, memo }) => performTransformation([description, memo], newYorkTimes, {
  category: booksPeriodicals, code: CODE_AUTOPAY, transaction: 'New York Times subscription'
}) ||
performTransformation([description, memo], gannett, {
  category: booksPeriodicals, code: CODE_AUTOPAY, notes: 'Gannett Newspapers', transaction: 'Bloomington Herald-Times'
});

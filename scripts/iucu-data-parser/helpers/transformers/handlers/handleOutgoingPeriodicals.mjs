import { CODE_AUTOPAY, CATEGORY_BOOKS_PERIODICALS, gannett, newYorkTimes } from '../../constants.mjs';
import { performTransformation } from '../performTransformation.mjs';

export const handleOutgoingPeriodicals = ({ description, memo }) => performTransformation([description, memo], newYorkTimes, {
  category: CATEGORY_BOOKS_PERIODICALS, code: CODE_AUTOPAY, transaction: 'New York Times subscription'
}) ||
performTransformation([description, memo], gannett, {
  category: CATEGORY_BOOKS_PERIODICALS, code: CODE_AUTOPAY, notes: 'Gannett Newspapers', transaction: 'Bloomington Herald-Times'
});

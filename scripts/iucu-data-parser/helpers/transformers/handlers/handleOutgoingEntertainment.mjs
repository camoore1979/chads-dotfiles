import { CATEGORY_BOOKS_PERIODICALS, CODE_AUTOPAY, netflix } from '../../constants.mjs';
import { performTransformation } from '../performTransformation.mjs';

export const handleOutgoingEntertainment = ({ description, memo }) => performTransformation([description, memo], netflix, {
  category: CATEGORY_BOOKS_PERIODICALS, code: CODE_AUTOPAY, transaction: 'Subscription: Netflix'
}) ;

// ||
// performTransformation([description, memo], gannett, {
//   category: CATEGORY_BOOKS_PERIODICALS, code: CODE_AUTOPAY, notes: 'Gannett Newspapers', transaction: 'Bloomington Herald-Times'
// })

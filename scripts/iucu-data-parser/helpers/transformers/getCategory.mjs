import { booksPeriodicals, catalent, newYorkTimes, polaris } from '../constants.mjs';
import { isWithinString } from '../isWithinString.mjs';

const transform = (stringsToSearch, searchString, valueToReturn) => {
  if (stringsToSearch.some((stringToSearch) => isWithinString(stringToSearch, searchString))) {
    return valueToReturn;
  }
  return false;
};

const categoryIsIncomePolaris = ({ description }) => 
  transform([description], polaris, polaris);

const categoryIsIncomeCatalent = ({ description }) => 
  transform([description], catalent, catalent);

const categoryIsOutgoingPeriodicals = ({ description, memo }) => 
  transform([description, memo], newYorkTimes, booksPeriodicals);

const categoryTransformers = [
  categoryIsIncomeCatalent,
  categoryIsIncomePolaris,
  categoryIsOutgoingPeriodicals
];

export const getCategory = (transactionRecord) => {
  const categoryTransformer = categoryTransformers.find(transformer => transformer(transactionRecord));
  return categoryTransformer ? categoryTransformer(transactionRecord) : '';
};
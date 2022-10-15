import { isWithinString } from '../isWithinString.mjs';


export const performTransformation = (stringsToSearch, searchString, valueToReturn) => {
  if (stringsToSearch.some((stringToSearch) => isWithinString(stringToSearch, searchString))) {
    return valueToReturn;
  }
  return false;
};

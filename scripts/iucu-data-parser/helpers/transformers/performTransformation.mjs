import { isWithinString } from '../isWithinString.mjs';


export const performTransformation = (stringsToSearch, searchStringsArg, valueToReturn) => {
  let searchStrings;

  if (Array.isArray(searchStringsArg)) {
    searchStrings = searchStringsArg;
  } else if (typeof searchStringsArg === 'string') {
    searchStrings = [searchStringsArg];
  }

  for (let i = 0; i < searchStrings.length; i++) {
    const searchString = searchStrings[i];
    if (stringsToSearch.some((stringToSearch) => isWithinString(stringToSearch, searchString))) {
      return valueToReturn;
    }
  }
  return false;
};

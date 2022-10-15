export const isWithinString = (stringToSearch, searchString) => {
  if (!stringToSearch || !searchString) return false;
  return stringToSearch.toLowerCase().includes(searchString.toLowerCase());
};

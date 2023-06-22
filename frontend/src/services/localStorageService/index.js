export const getStorageData = (key) => localStorage.getItem(key);

export const getParsedStorageData = (key) => {
  return JSON.parse(getStorageData(key));
};

export const setStorageData = (key, value) => {
  const data = typeof value === "string" ? value : JSON.stringify(value);

  localStorage.setItem(key, data);
};

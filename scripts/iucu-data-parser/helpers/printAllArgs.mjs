export const printAllArgs = () => {
  for (let i = 0;i <= process.argv.length; i++) {
    echo(`Argument ${i}: ${process.argv[i]}`);
  }
};
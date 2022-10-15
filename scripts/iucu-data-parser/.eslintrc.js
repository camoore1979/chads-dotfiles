module.exports = {
  'env': {
    'node': true
  },
  'extends': 'eslint:recommended',
  'globals': {
    'echo': 'readonly'
  },
  'overrides': [{
    files: '*.mjs'
  }],
  'parserOptions': {
    'ecmaVersion': 'latest',
    'sourceType': 'module'
  },
  'root': true,
  'rules': {
    'array-bracket-spacing': ['error', 'never'],
    'comma-spacing': ['error', { 'before': false, 'after': true }],
    'indent': [
      'error',
      2
    ],
    'linebreak-style': [
      'error',
      'unix'
    ],
    'object-curly-spacing': ['error', 'always'],
    'quotes': [
      'error',
      'single'
    ],
    'semi': [
      'error',
      'always'
    ]
  }
};

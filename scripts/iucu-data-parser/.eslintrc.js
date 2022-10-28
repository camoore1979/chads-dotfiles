module.exports = {
  'env': { 'node': true },
  'extends': 'eslint:recommended',
  'globals': { 'echo': 'readonly' },
  'overrides': [{ files: '*.mjs' }],
  'parserOptions': {
    'ecmaVersion': 'latest',
    'sourceType': 'module'
  },
  'plugins': [
    'sort-destructure-keys',
    'sort-imports-requires',
    'sort-keys-fix'
  ],
  'root': true,
  'rules': {
    'array-bracket-spacing': ['error', 'never'],
    'array-element-newline': ['error', {
      'ArrayExpression': { 'minItems': 3 },
      'ArrayPattern': { 'minItems': 3 },
    }],
    'comma-spacing': ['error', { 'after': true, 'before': false }],
    'indent': [
      'error', 2
    ],
    'linebreak-style': [
      'error', 'unix'
    ],
    // 'max-len': ['error', { 'code': 80 }],
    'object-curly-newline': ['error', {
      'ExportDeclaration': { 'minProperties': 3, 'multiline': true },
      'ImportDeclaration': { 'minProperties': 3, 'multiline': true },
      'ObjectExpression': { 'minProperties': 3, 'multiline': true },
      'ObjectPattern': { 'minProperties': 3, 'multiline': true }
    }],
    'object-curly-spacing': ['error', 'always'],
    'quotes': [
      'error', 'single'
    ],
    'semi': [
      'error', 'always'
    ],
    'sort-destructure-keys/sort-destructure-keys': 2,
    'sort-imports-requires/sort-imports': ['error', { unsafeAutofix: true }],
    'sort-imports-requires/sort-requires': ['error', { unsafeAutofix: true }],
    'sort-keys-fix/sort-keys-fix': 'error'
  }
};

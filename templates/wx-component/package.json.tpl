{
  "name": "${name}",
  "version": "0.0.1",
  "description": "${description}",
  "main": "miniprogram_dist/index.js",
  "scripts": {
    "dev": "gulp dev --develop",
    "watch": "gulp watch --develop --watch",
    "build": "gulp",
    "dist": "npm run build",
    "clean-dev": "gulp clean --develop",
    "clean": "gulp clean",
    "test": "jest ./test/* --silent --bail",
    "coverage": "jest ./test/* --coverage --bail",
    "lint": "eslint \"src/**/*.js\"",
    "lint-tools": "eslint \"tools/**/*.js\" --rule \"import/no-extraneous-dependencies: false\""
  },
  "miniprogram": "miniprogram_dist",
  "jest": {
    "testEnvironment": "jsdom",
    "testURL": "https://jest.test",
    "collectCoverageFrom": [
      "src/**/*.js"
    ],
    "moduleDirectories": [
      "node_modules",
      "src"
    ]
  },
  "repository": {
    "type": "git",
    "url": "git+${repository}"
  },
  "author": "${author}",
  "license": "${license}",
  "devDependencies": {
    "babel-core": "^6.26.3",
    "babel-loader": "^7.1.5",
    "babel-plugin-module-resolver": "^3.1.1",
    "babel-preset-env": "^1.7.0",
    "colors": "^1.3.1",
    "eslint": "^5.3.0",
    "eslint-config-airbnb-base": "13.1.0",
    "eslint-loader": "^2.1.0",
    "eslint-plugin-import": "^2.14.0",
    "eslint-plugin-node": "^7.0.1",
    "eslint-plugin-promise": "^3.8.0",
    "gulp": "^4.0.0",
    "gulp-clean": "^0.4.0",
    "gulp-if": "^2.0.2",
    "gulp-install": "^1.1.0",
    "gulp-less": "^4.0.1",
    "gulp-rename": "^1.4.0",
    "gulp-sourcemaps": "^2.6.4",
    "jest": "^23.5.0",
    "miniprogram-simulate": "latest",
    "through2": "^2.0.3",
    "vinyl": "^2.2.0",
    "webpack": "^4.16.5",
    "webpack-node-externals": "^1.7.2"
  },
  "dependencies": {}
}

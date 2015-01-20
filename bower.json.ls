#!/usr/bin/env lsc -cj
angular-version = '1.3.8'

name: "angular-livescript-seed"
repo: "clkao/angular-livescript-seed"
version: "0.0.1"
main: "_public/js/app.js"
ignore: ["**/.*", "node_modules", "components"]
dependencies:
  "commonjs-require-definition": "~0.1.2"
  jquery: "~2.0.3"
  angular: angular-version
  "angular-mocks": angular-version
  "angular-scenario": angular-version
  "angular-material": "master"
  "angular-ui-router": "0.2.11"
  "icono": "*"

overrides:
  "angular":
    dependencies: jquery: "*"
  "angular-mocks":
    main: "README.md"
  "angular-scenario":
    main: "README.md"

resolutions:
  angular: angular-version

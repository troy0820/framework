#!/usr/bin/env bash

# set a variable for the current directory
framework_dir="$(dirname $(cd "${0%/*}"; echo $(pwd)))"

# work in the correct directory
cd ${framework_dir}

# pull down dependencies with composer
composer install --dev

# test coding standards
echo
echo "Running PHP Code Sniffer..."
${framework_dir}/vendor/bin/phpcs --standard=PSR2 --extensions=php src tests

# generate the code coverage report
echo
echo "Generating code coverage report..."
${framework_dir}vendor/bin/phpunit --coverage-html reports/coverage --coverage-clover clover.xml tests
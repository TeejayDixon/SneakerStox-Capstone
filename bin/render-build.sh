#!/usr/bin/env bash
# exit on error
set -o errexit

# Add build commands for front end
rm -rf public
npm install --prefix client && npm run build --prefix client
cp -a client/build/. public/

#Build commands for back end
bundle install
bundle exec rake db:reset db:migrate
bundle exec rake db:seed

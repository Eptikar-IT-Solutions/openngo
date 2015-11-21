#!/bin/sh
clear
echo "Pulling New Changes"
git pull
echo "Migrating the Database"
rake db:migrate RAILS_ENV=production
echo "Precompiling Assets"
bundle exec rake assets:precompile RAILS_ENV=production
echo "Restarting The App"
touch tmp/restart.txt
echo "openngo is UP!"

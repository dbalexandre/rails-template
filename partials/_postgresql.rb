puts "Creating postgresql database.yml ...".magenta

copy_static_file 'config/database.yml'
gsub_file 'config/database.yml', /PROJECT/, @app_name

git :add => '.'
git :commit => "-aqm 'Add database.yml.'"
puts "\n"
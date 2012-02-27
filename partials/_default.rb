puts "Adding default files ...".magenta

copy_static_file 'app/views/layouts/application.html.haml'
copy_static_file 'Procfile'

%w{attr_accessible_security.rb requires.rb}.each do |component|
  copy_static_file "config/initializers/#{component}"
end

%w{permalink.rb debug_helper.rb}.each do |component|
  copy_static_file "lib/#{component}"
end

%w{permalink_spec.rb debug_helper_spec.rb}.each do |component|
  copy_static_file "spec/lib/#{component}"
end

%w{integration.rake deploy.rake}.each do |component|
  copy_static_file "lib/tasks/#{component}"
end

gsub_file 'lib/tasks/deploy.rake', /PROJECT/, @app_name
gsub_file 'lib/tasks/integration.rake', /PROJECT/, @app_name

git :add => '.'
git :commit => "-aqm 'Add default stuff.'"
puts "\n"
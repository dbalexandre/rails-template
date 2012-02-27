puts "Initializing new Git repo ...".magenta

git :init
git :add => "."
git :commit => "-aqm 'Initial commit.'"

puts "\n"
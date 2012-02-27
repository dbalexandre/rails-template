#!/usr/bin/env ruby

@app_name = ARGV.first
FileUtils.mkdir @app_name

File.open(File.join(@app_name, ".rvmrc"),'r') do |f|
  f << %{#export APP_URL=http://dev:3000/
#export AMAZON_S3_BUCKET=#{@app_name}-dev
#export AMAZON_ACCESS_KEY_ID=x
#export AMAZON_SECRET_ACCESS_KEY=x
#export FACEBOOK_APP_KEY=x
#export FACEBOOK_APP_SECRET=x
rvm 1.9.3@#{@app_name} --create
}
end

exec "cd #{@app_name}; gem install rails"

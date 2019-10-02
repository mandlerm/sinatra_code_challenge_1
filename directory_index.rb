require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require 'pathname'

# [x] Pre: add files to data directory

# [x] 1. create '/' path
# [x] 2. pull list of files from data directory
# [x] 3. format data to only display file name
# [x] 4. Create template to display info
# [x] 5. erb: list

# 6. route "/:filename"
# 7. create temlate to display file
# 8: route view to erb: #{file}

get "/" do
  files = Dir.glob("data/*")
  @filenames = files.map { |f| Pathname.new(f).basename }
  erb :home
end

get "/:file" do |f|
  @file = File.read("data/#{f}")
  @title = f.split(".")[0]
  erb :file_display
end

require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

# [x] Pre: add files to data directory

# 1. create '/' path
# 2. pull list of files from data directory
# 3. format data to only display file name
# 4. Create template to display info
# 5. erb: list

# 6. route "/:filename"
# 7. create temlate to display file
# 8: route view to erb: #{file}

get "/" do
  @file_names = Dir.glob("data/*")
  erb :file_display

end

require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  # @filenames = Dir.glob("data/*").map { |f| File.basename(f, ".") }.sort

  @filenames = Dir.glob("data/*").select { |f| File.ftype(f) == "file" }.map{|file| File.basename(file)}.sort

  if params[:sort] == 'reverse'
    @filenames.reverse!
    @reverse = true
  end

  erb :home
end

get "/show/:file" do |f|
  @file = File.read("data/#{f}")
  @title = f.split(".")[0]
  erb :file_display
end

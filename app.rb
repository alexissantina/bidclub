require("sinatra")
require 'sinatra/activerecord'
require("sinatra/reloader")
also_reload("lib/**.rb")
require_relative("lib/art")
#require("./lib/task")

get("/") do
  erb(:index)
end

get('/art') do
  @arts = Art.all()
  erb(:arts)
end

get('/art/new') do
  erb(:arts_form)
end

post("/arts") do
  name = params.fetch("name")
  artist = params.fetch("artist")
  price = params.fetch("price")
#  purchaser = params.fetch("purchaser")
  art = Art.new({:name=> name, :artist=> artist, :price=> price})
  art.save()
  erb(:success)
end

get('/art/:id/edit') do
  @art = Art.find(params.fetch('id').to_i)
  erb(:art_edit)
end

patch('/art/:id') do
  name = params.fetch('name')
  @art = Art.find(params.fetch('id').to_i
  @art.update({:name => name})
  @arts = Art.all
  erb(:index)
end

get('/arts/:id') do
  @art = Art.find(params.fetch("id"))
  erb(:art)
end

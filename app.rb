require("sinatra")
require 'sinatra/activerecord'
require("sinatra/reloader")
also_reload("lib/**.rb")
require_relative("lib/art")
#require("./lib/task")

get("/") do
  @arts = {Art.all()}
#  @art = Art.find(params.fetch('id'))
  erb(:index)
end

get('/art') do
  @arts = {Art.all()}
  erb(:arts)
end

get('/art/new') do
  erb(:arts_form)
end

post("/arts") do
  name = params.fetch("name")
  artist = params.fetch("artist")
  price = params.fetch("price")
  medium = params.fetch("medium")
  height = params.fetch('height')
  width = params.fetch('width')
  edition = params.fetch('edition')
  art = {Art.new({:name=> name, :artist=> artist, :price=> price, :medium=> medium, :height=> height, :width=> width, :edition=> edition})}
  art.save()
  erb(:success) #:layout_options => { :views => 'views/layout' }
end

get('/art/:id/edit') do
  @arts = {Art.all()}
  @art = {Art.find(params.fetch('id'))}
  erb(:edit)
end

patch('/art/:id') do
  @art = {Art.find(params.fetch('id'))}
  name = params.fetch('name')
  artist = params.fetch('artist')
  medium = params.fetch('medium')
  edition = params.fetch('edition')
  price = params.fetch('price')
  width = params.fetch('width')
  height = params.fetch('height')
  @art.update({:name => name, :artist => artist, :medium => medium, :edition => edition, :price => price, :width => width, :height => height})
  @arts = {Art.all()}
  erb(:success)
end

get('/art/:id') do
  @art = {Art.find(params.fetch("id"))}
  erb(:art)
end

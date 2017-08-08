require 'bundler/setup'
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  @arts = Art.all()
  # @art = Art.find(params.fetch('id'))
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
  medium = params.fetch("medium")
  height = params.fetch('height')
  width = params.fetch('width')
  edition = params.fetch('edition')
  @new_art = Art.new({:name=> name, :artist=> artist, :price=> price, :medium=> medium, :height=> height, :width=> width, :edition=> edition})
  if @new_art.save()
    redirect("/art/".concat(@new_art.id().to_s()))
  else
    erb(:index)
  end
end

get('/art/:id/edit') do
  @arts = Art.all()
  @art = Art.find(params.fetch('id'))
  erb(:edit)
end

patch('/art/:id') do
  @art = Art.find(params.fetch('id'))
  name = params.fetch('name')
  artist = params.fetch('artist')
  medium = params.fetch('medium')
  edition = params.fetch('edition')
  price = params.fetch('price')
  width = params.fetch('width')
  height = params.fetch('height')
  # @art.skip_name_validation = true
  
  @art.update({:name => name, :artist => artist, :medium => medium, :edition => edition, :price => price, :width => width, :height => height})
  @arts = Art.all()
  erb(:success)
end

get('/art/:id') do
  @art = Art.find(params.fetch("id").to_i)
  erb(:art)
end

delete('/art/:id') do
  @art = Art.find(params.fetch("id"))
  if @art.destroy()
    redirect('/')
  else
    erb(:art)
  end
end

require_relative('../models/animal')
require_relative('../models/owner')
require('pry')

also_reload('./models/*')
# above if you make changes, anything inside models will be reloaded

# *****list of animals and their addmission date*****
get '/animals/?' do # index
  @animals = Animal.all()
  erb(:"animals/index")
end

# *****list of animals and their adoption status*****
get '/animals' do # index
  @animals = Animal.all()
  erb(:"animals/index")
end

# ******* show ***************************************
get '/animals/:id' do # show
  @animal = Animal.find( params[:id] )
  erb( :"animals/show" )
end

# ********* create ************************************
post '/animals' do # create
  @animals = Animal.new( params )
  @animals.save()
  erb( :create )
end

# ********** edit ***************************************
get '/animals/:id/edit' do # edit
  @animals = animal.find( params[:id] )
  erb( :edit )
end

# ************ update ************************************
post '/animals/:id' do # update
  Animal.new( params ).update
  redirect to '/animals'
end

# ************ delete *************************************
post '/animals/:id/delete' do # delete
  order = Animal.find( params[:id] )
  order.delete()
  redirect to '/animals'
end

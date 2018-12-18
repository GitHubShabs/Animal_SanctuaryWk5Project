require_relative('../models/animal')
require_relative('../models/owner')
require('pry')

also_reload('./models/*')
# above if you make changes, anything inside models will be reloaded

# *****list of animals and their addmission date*****
get '/animals' do # index
  @animals = Animal.all()
  erb(:"animals/index")
end

# *****list of animals and their adoption status*****
get '/animals' do # index
  @animals = Animal.all()
  erb(:"animals/index")
end

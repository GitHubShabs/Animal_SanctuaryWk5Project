require_relative('../models/animal')
require_relative('../models/owner')

also_reload('./models/*')
# above if you make changes, anything inside models will be reloaded

# *****index****************************************
get '/owners' do # index
  @owners = Owner.all()
  erb(:"owners/index")
end


# ********* new - form to get new owners*************
get '/owners/new' do # new
  # @owners = Owner.new()
  # @owners.save()
  erb( :"owners/new" )
end

# ********* create ** create new owners ************
post '/owners' do # create
  @owners = Owner.new()
  @owners.save()
  erb( :"owners/create" )
end






# ******* show ***************************************
get '/owners/:id' do # show
  @owners = Owner.find()
  erb( :"owners/show" )
end

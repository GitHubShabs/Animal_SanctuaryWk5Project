require_relative('../models/animal')
require_relative('../models/owner')

also_reload('./models/*')
# above if you make changes, anything inside models will be reloaded

# *****index****************************************
get '/owners' do # index
  @owners = Owner.all()
  erb(:"owners/index")
end

# ******* show ***************************************
get '/owners/:id' do # show
  @owners = Owner.find( params[:id] )
  erb( :show )
end

# ********* create ************************************
post '/owners' do # create
  @owners = Owner.new( params )
  @owners.save()
  erb( :create )
end

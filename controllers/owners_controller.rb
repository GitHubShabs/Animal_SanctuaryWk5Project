require_relative('../models/animal')
require_relative('../models/owner')

also_reload('./models/*')
# above if you make changes, anything inside models will be reloaded

# *****index*****
get '/owners' do # index
  @owners = Owner.all()
  erb(:"owner/index")
end

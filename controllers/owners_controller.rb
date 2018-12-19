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
  @owners = Owner.new(params)
  @owners.save()
  erb( :"owners/create" )
end


# ******* show ***************************************
get '/owners/:id' do # show

  @owners = Owner.find(params['id'])
  erb( :"owners/show" )
end


 # ******* delete owner entry ************************
 get '/owners/:id/delete' do # delete
   @owners = Owner.find( params[:id] )
   @owners.delete()
   redirect to '/owners'
 end


# ******* edit entry ************************

 get '/owners/:id/edit' do # edit
   @owner = Owner.find( params[:id] )
   erb(:"owners/edit")
 end


# ******* update entry ************************

 post '/owners/:id' do # update
   Owner.new( params ).update
   redirect to '/owners'
 end

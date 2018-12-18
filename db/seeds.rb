require_relative('../models/animal')
require_relative('../models/owner')
require('pry')

# Delete function here
Animal.delete_all()
Owner.delete_all()


owner1 = Owner.new({
  'first_name' => 'Mary',
  'last_name' => 'Smith'
})

owner2 = Owner.new({
  'first_name' => 'John',
  'last_name' => 'Walker'
  })

owner3 = Owner.new({
  'first_name' =>'Sarah',
  'last_name' =>'Turner'
  })



owner1.save
owner2.save
owner3.save


animal1 = Animal.new({
  'animal_name' => 'Billy',
  'animal_type' => 'Cat',
  'admin_date' => '05Jan17',
  'adopt_ready' => true,
  'owner_id' => nil})

animal2 = Animal.new({
  'animal_name' => 'Rover',
  'animal_type' => 'Dog',
  'admin_date' =>  '18Jun18',
  'adopt_ready' => false,
  'owner_id' => nil})

animal3 = Animal.new({
  'animal_name' => 'Fred',
  'animal_type' => 'Hamster',
  'admin_date' => '07Mar17',
  'adopt_ready' => true,
  'owner_id' => nil})

animal4 = Animal.new({
  'animal_name' => 'Bunny',
  'animal_type' => 'Rabbit',
  'admin_date' => '02Dec18',
  'adopt_ready' => false,
  'owner_id' => nil})


animal1.save
animal2.save
animal3.save
animal4.save

binding.pry
nil

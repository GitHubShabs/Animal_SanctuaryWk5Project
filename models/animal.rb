require_relative('../db/sql_runner')
class Animal

  attr_reader :id
  attr_accessor :animal_name, :animal_type, :admin_date, :adopt_ready, :owner_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @animal_name = options['animal_name']
    @animal_type = options['animal_type']
    @admin_date = options['admin_date']
    @adopt_ready = options['adopt_ready']
    @owner_id = options['owner_id'].to_i if options['id']
  end

  def save()
      sql = "INSERT INTO animals
      (
        animal_name,
        animal_type,
        admin_date,
        adopt_ready,
        owner_id
      )
      VALUES
      (
        $1, $2, $3, $4, $5
      )
      RETURNING id"
      values = [@animal_name, @animal_type, @admin_date, @adopt_ready, @owner_id]
      result = SqlRunner.run(sql, values)
      id = result.first["id"]
      @id = id.to_i
    end

    def Animal.delete_all()
        sql = "DELETE FROM animals"
        SqlRunner.run(sql)
    end

    def Animal.all()
        sql = "SELECT * FROM animals"
        animal_data = SqlRunner.run(sql)
        animal = map_items(animal_data)
        return animal
    end


    def Animal.map_items(animal_data)
        return animal_data.map { |animal| Animal.new(animal) }
    end

end

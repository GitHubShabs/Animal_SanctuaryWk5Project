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

    def owner()
      owner = Owner.find(@owner_id)
      return owner
    end

    def update()
        sql = "UPDATE animals
        SET
        (
          animal_name,
          animal_type,
          admin_date,
          adopt_ready,
          owner_id
        ) =
        (
          $1, $2, $3, $4, $5
        )
        WHERE id = $6"
        values = [@animal_name, @animal_type, @admin_date, @adopt_ready, @owner_id]
        SqlRunner.run(sql, values)
      end

      def delete()
          sql = "DELETE FROM animals
          WHERE id = $1"
          values = [@id]
          SqlRunner.run(sql, values)
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


    def Animal.find(id)
        sql = "SELECT * FROM animals WHERE id = $1"
        values = [id]
        result = SqlRunner.run(sql, values).first
        student = Animal.new(result)
        return animal
    end

    def format_name
        return "#{@animal_name.capitalize} #{@animal_type.capitalize}"
    end


end

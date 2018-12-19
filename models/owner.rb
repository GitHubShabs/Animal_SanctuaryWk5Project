require_relative('../db/sql_runner')
require_relative('./animal.rb')

class Owner
  attr_accessor :first_name, :last_name
  attr_reader :id, :first_name, :last_name

  def initialize(options)
    @id = options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end


  def save()
      sql = "INSERT INTO owners
      (
        first_name,
        last_name
      )
      VALUES
      (
        $1, $2
      )
      RETURNING id"
      values = [@first_name, @last_name]
      result = SqlRunner.run(sql, values)
      id = result.first['id']
      @id = id
    end

    def update()
        sql = "UPDATE owners
        SET
        (
          first_name,
          last_name
        ) =
        (
          $1, $2
        )
        WHERE id = $3"
        values = [@first_name, @last_name]
        SqlRunner.run(sql, values)
      end

    def delete()
          sql = "DELETE FROM owners
          WHERE id = $1"
          values = [@id]
          SqlRunner.run(sql, values)
    end


    def Owner.delete_all()
        sql = "DELETE FROM owners"
        SqlRunner.run(sql)
    end


    def Owner.find(id)
        sql = "SELECT * FROM owners
        WHERE id = $1"
        values = [id]
        result = SqlRunner.run(sql,values).first
        owner = Owner.new(result)
        return owner
    end

    def Owner.all()
        sql = "SELECT * FROM owners"
        owner_data = SqlRunner.run(sql)
        owners = map_items(owner_data)
        return owners
    end

    def Owner.map_items(owner_data)
        return owner_data.map { |owner| Owner.new(owner) }
    end

end

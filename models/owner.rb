require_relative('../db/sql_runner')

class Owner
  attr_accessor :first_name, :last_name

  def initialize(options)
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

    def Owner.delete_all()
        sql = "DELETE FROM owners"
        SqlRunner.run(sql)
    end


end

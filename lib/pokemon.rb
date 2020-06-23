class Pokemon
    attr_reader :id, :db
    attr_accessor :name, :type

    def initialize(id:, name:, type:, db:)
        @name =name
        @type = type
        @db = db
        @id= id
    end

    def self.save(name, type, db)
        sql =  <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
        # @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(id, db)
        sql= <<-SQL
        SELECT * FROM pokemon
        WHERE id = ?
        SQL
        info = db.execute(sql, id).flatten
        Pokemon.new(id: info[0], name: info[1], type: info[2], db: db)
       
    end

    # def self.new_from_db(row)
    #     hash= {id: row[0],
    #     name: row[1],
    #     type: row[2],
    #     db: @db}
    #     self.new(hash)
    # end

end

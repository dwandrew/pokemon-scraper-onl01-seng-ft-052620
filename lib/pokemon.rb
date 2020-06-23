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
        sql =  "
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
        "
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql= "
        SELECT * FROM pokemon
        WHERE id = ?
        "
        info = db.execute(sql, id).flatten
        Pokemon.new(id: info[0], name: info[1], type: info[2], db: db)
    end

end

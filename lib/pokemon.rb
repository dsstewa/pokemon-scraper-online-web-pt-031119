require 'pry'

class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id
  
  def initialize(name, type=nil, db=nil, id=nil)
    @name = name
    @type = type
    @db = db
    @id = id
  end
  
  def self.save(name, type, db)
    sql = <<-SQL 
    INSERT INTO pokemon (name, type) VALUES (?, ? ) 
    SQL
    db.execute(sql,name,type)

  end
  
  def self.find(id,db)
     sql = <<-SQL 
    SELECT * FROM pokemon where id = ?
    SQL
    #binding.pry
    dood = db.execute(sql,id).last
    a = Pokemon.new(dood[1],dood[2],db,dood[0])
    a
    
  end
  
  
  
end

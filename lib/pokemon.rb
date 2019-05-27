require 'pry'

class Pokemon
  attr_accessor :name, :type, :db, :hp
  attr_reader :id
  
  def initialize(name, type=nil, db=nil, id=nil, hp = nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
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
    binding.pry
    a = Pokemon.new(dood[1],dood[2],db,dood[0])
    a
    
  end
  
def alter_hp(hp,db)
  
  sql = <<-SQL
  UPDATE pokemon
  SET hp = ?
  WHERE id = ?;
  SQL
  db.execute(sql,hp,self.id)
  
  
  
end
  
  
  
  
  
  
  
end

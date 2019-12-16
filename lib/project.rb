class Characters
  attr_reader :id, :name
  attr_accessor :name
  @@characters = {}
  @@total_rows = 0

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
  end

  def save()
    @@characters[self.id] = Characters.new(self.name, self.id)
  end

  def self.find(id)
    @@characters[id]
  end

  def ==(character_to_compare)
    self.name() == character_to_compare.name()
  end

  def update(name)
    self.name = name
    @@characters[self.id] = Characters.new(self.name,self.id)
  end

  def self.all
    @@characters.values()
  end

  def delete()
    @@characters.delete(self.id)
  end
  def self.clear
    @@characters = {}
    @@total_rows = 0
  end
end

class Dog
  
  ##Class

  @@all = []

  def self.all
    @@all
  end

  ##Instances

  attr_accessor :owner, :mood
  attr_reader :name

  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = 'nervous'
    @@all << self
  end

end
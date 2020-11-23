require 'pry'

require_relative 'dog.rb'
require_relative 'cat.rb'

class Owner
  
  ####Class methods

  @@all = []

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end
  
  
  ####Instance methods

  attr_accessor
  attr_reader :species, :name

  def initialize(name=nil)
    @species = 'human'
    @name = name
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.each {|dog| dog.mood = 'happy'}
  end

  def feed_cats
    cats.each {|cat| cat.mood = 'happy'}
  end

  def sell_pets
    pets = self.cats.concat(self.dogs)
    pets.each do |pet|
      pet.mood = 'nervous'
      pet.owner = nil
    end
  end


  def list_pets
    num_dogs = self.dogs.length
    num_cats = self.cats.length
    "I have #{num_dogs} dog(s), and #{num_cats} cat(s)."

  end


end

class Owner
  attr_reader :name, :species
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human" 
    self.class.all << self
  end 

  def say_species
    "I am a #{self.species}."
  end

  def self.all 
    @@all 
  end 

  def self.count 
    self.all.size
  end 

  def self.reset_all 
    self.all.clear
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
    Dog.all.each {|dog| dog.mood = "happy"}
  end 

  def feed_cats
    Cat.all.each {|cat| cat.mood = "happy"}
  end 

  def sell_pets_helper(instance)
    instance.mood = "nervous"
    instance.owner = nil
  end 

  def sell_pets
    Cat.all.each do |cat| 
      sell_pets_helper(cat)
    end 
    Dog.all.each do |dog|
      sell_pets_helper(dog)
    end 
  end

  def list_pets 
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end 
end
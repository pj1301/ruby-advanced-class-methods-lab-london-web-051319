require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
      song = self.new
      @@all << song
      song
   end
   
   def self.new_by_name(name)
      song = self.new
      song.name = name
      song
   end

   def self.create_by_name(name) 
      song = self.new 
      song.name = name 
      @@all << song 
      song
   end
   
   def self.find_by_name(name)  
      @@all.find{|song| song.name == name}
   end
   
   def self.find_or_create_by_name(title)
      self.find_by_name(title) || self.create_by_name(title)
    end

   #  def self.alphabetical
   #    new_array = []
   #    order = @@all.collect{|inst|  inst.name}.sort
   #    order.each do |title|
   #       @@all.each do |instance|
   #          if title == instance.name
   #             new_array << instance
   #          end
   #       end
   #    end
   #    new_array
   # end

   def self.alphabetical # Much neater version but the longer form has been left above
      @@all.sort_by{|inst| inst.name}
   end
   
   def self.new_from_filename(filename)
      song = self.new
      song.name = filename.split("").slice!(0..filename.length-5).join("").split(" - ")[1]
      song.artist_name = filename.split("").slice!(0..filename.length-5).join("").split(" - ")[0]
      song
   end
   
   def self.create_from_filename(filename)
      song = self.new
      song.name = filename.split("").slice!(0..filename.length-5).join("").split(" - ")[1]
      song.artist_name = filename.split("").slice!(0..filename.length-5).join("").split(" - ")[0]
      @@all << song
   end

   def self.destroy_all
      @@all.clear
   end

  def save
    self.class.all << self 
  end

end



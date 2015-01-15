class Disc

  attr_reader(:name, :artist)
  
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @artist = attributes.fetch(:artist)

  end
end

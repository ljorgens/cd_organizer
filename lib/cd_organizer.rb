class Disc

  @@collection = []

  attr_reader(:name, :artist)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @artist = attributes.fetch(:artist)
    @id = @@collection.length().+(1)
  end

  define_method(:id) do
    @id
  end

  define_method(:create) do
    @@collection.push(self)
  end

  define_singleton_method(:list_all) do
    @@collection
  end

  define_singleton_method(:list_artist) do
    artist_list = []
    @@collection.each() do |cd|
      artist_list.push(cd.artist()) unless artist_list.include?(cd.artist())
    end
    artist_list
  end

  define_singleton_method(:list_album) do |artist|
    album_covers = []
    @@collection.each() do |cd1|
      if cd1.artist == artist
        album_covers.push(cd1.name())
      end
    end
    album_covers.sort()
  end

  define_singleton_method(:clear) do
    @@collection = []
  end

  define_singleton_method(:search) do |search_term|
    found_cd = nil
      @@collection.each() do |artist|
        if artist.artist() == search_term
          found_cd = artist
        end
      end
      @@collection.each() do |title|
        if title.name() == search_term
          found_cd = title
        end
      end
    found_cd
  end
end

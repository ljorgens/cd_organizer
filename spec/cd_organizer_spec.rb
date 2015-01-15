require ('rspec')
require ('cd_organizer')
require ('pry')

describe (Disc) do
  before() do
    Disc.clear()
  end

  describe ("#name") do
    it("display the name of the album") do
      test_cd = Disc.new({:name => "Tina's Greatest Hits", :artist => "Tina A"})
      expect(test_cd.name()).to(eq("Tina's Greatest Hits"))
    end
  end

  describe ("#artist") do
    it("display the album's artist") do
      test_cd = Disc.new({:name => "Tina's Platnium Hits", :artist => "Tina B"})
      expect(test_cd.artist()).to(eq("Tina B"))
    end
  end

  describe ('#create') do
    it("adds a new album to the collection") do
      test_cd = Disc.new({:name => "Tina's Summertime Hits", :artist => "Tina C"})
      expect(test_cd.create()).to(eq([test_cd]))
    end
  end

  describe('#id') do
    it("assigns a unique id number to each album") do
      test_cd = Disc.new({:name => "Tina's Green Album", :artist => "Tina D"})
      test_cd.create()
      expect(test_cd.id()).to(eq(1))
    end
  end

  describe (".clear") do
    it("Empties the collection") do
      expect(Disc.clear()).to(eq([]))
    end
  end

  describe (".list_album") do
    it("lists albums by a particular artist") do
      test_cd3 = Disc.new({:name => "Tina's Get Rich or Die Trying", :artist => "Tina E"})
      test_cd3.create()
      test_cd1 = Disc.new({:name => "Tina's Holiday Hits", :artist => "Tina E"})
      test_cd1.create()
      test_cd2 = Disc.new({:name => "Tina's Detox", :artist => "Tina E"})
      test_cd2.create()
      expect(Disc.list_album("Tina E")).to(eq(["Tina's Detox", "Tina's Get Rich or Die Trying", "Tina's Holiday Hits"]))
    end
  end

  describe(".list_artist") do
    it("lists all artists in the collection for which there are albums") do
      test_cd3 = Disc.new({:name => "Tina's Get Rich or Die Trying", :artist => "Tina E"})
      test_cd3.create()
      test_cd1 = Disc.new({:name => "Tina's Holiday Hits", :artist => "Tina E"})
      test_cd1.create()
      test_cd2 = Disc.new({:name => "Tina's Detox", :artist => "Tina E"})
      test_cd2.create()
      expect(Disc.list_artist()).to(eq(["Tina E"]))
    end
  end

  describe (".list_all") do
    it("returns all cds in the collection") do
      test_cd1 = Disc.new({:name => "Tina's Holiday Hits", :artist => "Tina E"})
      test_cd1.create()
      test_cd2 = Disc.new({:name => "Tina's Detox", :artist => "Tina E"})
      test_cd2.create()
      expect(Disc.list_all()).to(eq([test_cd1,test_cd2]))
    end
  end

  describe(".search") do
    it("returns album based on search by album name or artist") do
      test_cd1 = Disc.new({:name => "Tina's Holiday Hits", :artist => "Tina E"})
      test_cd1.create()
      test_cd2 = Disc.new({:name => "Tina's Detox", :artist => "Tina E"})
      test_cd2.create()
      expect(Disc.search("Tina's Detox")).to(eq(test_cd2))
    end
  end
end

require ('rspec')
require ('cd_organizer')

describe (Disc) do
  describe ("#name") do
    it("display the name of the album") do
      test_cd = Disc.new({:name => "Tina's Greatest Hits", :artist => "Tina"})
      expect(test_cd.name()).to(eq("Tina's Greatest Hits"))
    end
  end

  describe ("#artist") do
    it("display the album's artist") do
      test_cd = Disc.new({:name => "Tina's Platnium Hits", :artist => "Tina"})
      expect(test_cd.artist()).to(eq("Tina"))
    end
  end
end

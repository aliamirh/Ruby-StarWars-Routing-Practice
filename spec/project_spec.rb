require('rspec')
require('project')

describe '#Characters' do
  before(:each) do
    Characters.clear()
  end

  describe('#save') do
    it('saves Star Wars characters') do
      character = Characters.new('Han Solo', nil)
      character.save()
      character2 = Characters.new('Luke Skywalker', nil)
      character2.save()
      expect(Characters.all).to(eq([character, character2]))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no characters") do
      expect(Characters.all).to(eq([]))
    end
  end

  describe('.clear') do
    it("clears all albums") do
      character = Characters.new("Princess Leia", nil)
      character.save()
      character2 = Characters.new("Darth Vader", nil)
      character2.save()
      Characters.clear()
      expect(Characters.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      character = Characters.new("Grand Moff Tarkin", nil)
      character2 = Characters.new("Grand Moff Tarkin", nil)
      expect(character).to(eq(character2))
    end
  end

  describe('.find') do
    it("finds an album by id") do
      character = Characters.new("Darth Vader", nil)
      character.save()
      character2 = Characters.new("Grand Moff Tarkin", nil)
      character2.save()
      expect(Characters.find(character.id)).to(eq(character))
    end
  end

  describe('#update') do
    it("updates an album by id") do
      character = Characters.new("Darth Vader", nil)
      character.save()
      character.update("Chewbacca")
      expect(character.name).to(eq("Chewbacca"))
    end
  end

  describe('#delete') do
    it("deletes an album by id") do
      character = Characters.new("Darth Vader", nil)
      character.save()
      character2 = Characters.new("Princess Leia", nil)
      character2.save()
      character.delete()
      expect(Characters.all).to(eq([character2]))
    end
  end
end

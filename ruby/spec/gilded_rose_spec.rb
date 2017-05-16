require 'gilded_rose'

describe GildedRose do

subject(:gilded_rose) { described_class.new()}
let (:aged_brie) { double :aged_brie}


  describe "#update_quality" do
      it "sell_in should decrease by 1 unit each time update_quality method is run" do
        apple = Item.new("apple", 10, 15)
        GildedRose.new([apple]).update_quality
        expect(apple.sell_in).to eq 9
      end
    end

  describe "#normal_item" do
      it "quality should decrease by 1 unit before sell date has passed" do
        apple = Item.new("apple", 10, 15)
        GildedRose.new([apple]).update_quality
        expect(apple.quality).to eq 14
      end

      it "quality should decrease by 2 units after sell date has passed" do
        apple = Item.new("apple", 0, 15)
        GildedRose.new([apple]).update_quality
        expect(apple.quality).to eq 13
      end
    end

    describe "#conjured?" do
      it "should return true if name contains 'conjure'" do
        conjured = Item.new("conjured", 10, 15)
        example = GildedRose.new([conjured])
        expect(example.conjured?(conjured)).to eq true
      end
    end

    describe "#conjured" do
      it "quality should decrease by 2 units if above minimum quality" do
        conjured = Item.new("conjured", 10, 15)
        GildedRose.new([conjured]).update_quality
        expect(conjured.quality).to eq 13
      end
    end


    describe "#exception?" do
    it "should return true if the item is part of the exceptions list" do
      brie = Item.new("Aged Brie", 10, 15)
      example = GildedRose.new([brie])
      expect(example.exception?(brie)).to eq true
  end
end

end

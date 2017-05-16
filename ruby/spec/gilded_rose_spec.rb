require 'gilded_rose'

describe GildedRose do

subject(:gilded_rose) { described_class.new()}

  describe "#update_quality"
    context 'normal items' do
      it "quality should decrease in sell_in by 1 unit each day" do
        apple = Item.new("apple", 10, 15)
        GildedRose.new([apple]).update_quality
        expect(apple.sell_in).to eq 9
    end

      it "sell_in should decrease in quality by 1 unit each day " do
        apple = Item.new("apple", 10, 15)
        GildedRose.new([apple]).update_quality
        expect(apple.quality).to eq 14
      end
    end

    describe "#exception?"
    it "should return true if the item is an exception" do
      brie = Item.new("Aged Brie", 10, 15)
      example = GildedRose.new([brie])
      expect(example.exception?(brie)).to eq true
  end
end

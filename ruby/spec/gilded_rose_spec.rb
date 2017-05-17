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

  describe "#aged_brie" do
    it "quality should increase by 1 unit if below maximum quality" do
      brie = Item.new("Aged Brie", 10, 15)
      GildedRose.new([brie]).update_quality
      expect(brie.quality).to eq 16
    end
  end

  describe "#sulfuras" do
    it "has no sell in date and quality does not decrease" do
      sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 0, 30)
      GildedRose.new([sulfuras]).update_quality
      expect(sulfuras.sell_in).to eq 0
      expect(sulfuras.quality).to eq 30
    end
  end

  describe "#backstage_passes" do
    it "increases in quality by 2 units when sell in days are 10 days or less" do
      backstage = Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 15)
      GildedRose.new([backstage]).update_quality
      expect(backstage.quality).to eq 17
    end

    it "increases in quality by 3 units when sell in days are 5 days or less" do
      backstage = Item.new("Backstage passes to a TAFKAL80ETC concert", 6, 15)
      GildedRose.new([backstage]).update_quality
      expect(backstage.quality).to eq 18
    end

    it "quality drops to 0 units when sell in days is 0" do
      backstage = Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 30)
      GildedRose.new([backstage]).update_quality
      expect(backstage.quality).to eq 0
    end
  end
end

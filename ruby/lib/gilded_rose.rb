class GildedRose

  MINIMUM_QUALITY = 0
  MAXIMUM_QUALITY = 50
  SELL_DATE_PASSED = 0

  def initialize(items)
    @items = items
  end

  def exception?(item)
    exceptions = ["Aged Brie", "Backstage passes to a TAFKAL80ETC concert", "Sulfuras, Hand of Ragnaros"]
      exceptions.include?(item.name) ? true : false
  end

  def aged_brie(item)
    if below_maximum_quality?(item)
      item.quality += 1
    end
  end


  def backstage(item)
    if item.sell_in == 0
      item.quality = 0
    elsif item.sell_in > 10
      item.quality += 1
    elsif item.sell_in <= 10
      item.quality += 2
      if item.sell_in <= 5
      item.quality += 1
      end
    else
    end
  end

  def exception(item)
    case item.name
    when "Aged Brie"
      aged_brie(item)
    when "Backstage passes to a TAFKAL80ETC concert"
      backstage(item)
    when "Sulfuras, Hand of Ragnaros"
    end
  end

  def conjured?(item)
    item.name.include?("conjure") ? true : false
  end

  def conjured(item)
    if above_minimum_quality?(item)
      item.quality -= 2
    end
  end

  def normal_item(item)
    if above_minimum_quality?(item) && !sell_date_passed?(item)
        item.quality -= 1
    elsif above_minimum_quality?(item) && sell_date_passed?(item)
        item.quality -= 2
      else
    end
  end


  def update_quality()
    @items.each do |item|
      update_sell_in(item)
      if exception?(item)
          exception(item)
      elsif conjured?(item)
          conjured(item)
      else
          normal_item(item)
      end
    end
  end

  private

  def update_sell_in(item)
    item.sell_in -= 1 if item.sell_in > SELL_DATE_PASSED
  end

  def below_maximum_quality?(item)
    true if item.quality < MAXIMUM_QUALITY
  end

  def above_minimum_quality?(item)
    true if item.quality > MINIMUM_QUALITY
  end

  def sell_date_passed?(item)
    true if item.sell_in <= SELL_DATE_PASSED
  end

end




class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end

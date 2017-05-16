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
    if item.quality < 50 && item.quality >= 0
      item.quality += 1
    end
  end

  def exception(item)
    case item.name
    when "Aged Brie"
      aged_brie(item)
    when "Backstage passes to a TAFKAL80ETC concert"
      backstage(item)
    when "Sulfuras, Hand of Ragnaros"
      sulfuras(item)
    end
  end

  def conjured?(item)
    item.name.include? "conjure"
  end

  def conjured(item)
    if above_minimum_quality?(item)
      item.quality -= 2
    end
  end

  def above_minimum_quality?(item)
    true if item.quality > MINIMUM_QUALITY
  end

  def sell_date_passed?(item)
    true if item.sell_in <= SELL_DATE_PASSED
  end

  def normal_item(item)
    if above_minimum_quality?(item) && !sell_date_passed?(item)
        item.quality -= 1
    elsif above_minimum_quality?(item) && sell_date_passed?(item)
        item.quality -= 2
    end
  end


  def update_quality()
    @items.each do |item|
      item.sell_in -= 1
      if exception?(item)
          exception(item)
      elsif conjured?(item)
          conjured(item)
      else
          normal_item(item)
      end
    end
  end

end


#         if item.quality < 50
#           item.quality = item.quality + 1
#           if item.name == "Backstage passes to a TAFKAL80ETC concert"
#             if item.sell_in < 11
#               if item.quality < 50
#                 item.quality = item.quality + 1
#               end
#             end
#             if item.sell_in < 6
#               if item.quality < 50
#                 item.quality = item.quality + 1
#               end
#             end
#           end
#         end
#       end
#       if item.name != "Sulfuras, Hand of Ragnaros"
#         item.sell_in = item.sell_in - 1
#       end
#       if item.sell_in < 0
#         if item.name != "Aged Brie"
#           if item.name != "Backstage passes to a TAFKAL80ETC concert"
#             if item.quality > 0
#               if item.name != "Sulfuras, Hand of Ragnaros"
#                 item.quality = item.quality - 1
#               end
#             end
#           else
#             item.quality = item.quality - item.quality
#           end
#         else
#           if item.quality < 50
#             item.quality = item.quality + 1
#           end
#         end
#       end
#     end
#   end
# end




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

require './lib/gilded_rose'
apple = Item.new("apple", 10, 10)
orange = Item.new("orange", 10, 15)
brie = Item.new("Aged Brie", 10, 10)
hello = GildedRose.new([apple, orange, brie])

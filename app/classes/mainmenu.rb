class Menu
  attr_accessor :x, :y, :w, :h, :r, :g, :b, :a, :anchor_x, :anchor_y, :blendmode_enum

  def initialize
    @x = 320
    @y = 180
    @w = 640
    @h = 360
    @r = 0
    @g = 0
    @b = 32
  end

  def draw
    [
      {x:@x, y:@y, w:@w, h:@h, r:@r, g:@g, b:@b}.solid!
    ]
  end
end

class MainMenu < Menu

  def initialize
    super
    @menu_items = ["New", "Sample", "Item"]
    @selected_item = 0
  end

  def up
    if @selected_item > 0
      @selected_item -= 1
    end
  end

  def down
    if @menu_items.count()-1 > @selected_item
      @selected_item += 1
    end
  end

  def draw
    menu = super
    @menu_items.each_with_index do |item, index|
      menu << {x:328, y:532-(40*index), w:640, h:40,  text:item, r:255, g:255, b: 255}.label!
    end

    menu << {x:320, y:500-40*@selected_item, w:640, h:40, b:64, a:215}.solid!
    menu
  end
end

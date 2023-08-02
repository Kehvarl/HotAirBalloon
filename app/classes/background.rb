class Solid
  attr_accessor :x, :y, :w, :h, :r, :g, :b, :a, :anchor_x, :anchor_y, :blendmode_enum

  def primitive_marker
    :solid
  end
end

class Background < Solid
  def initialize()
    self.x = 0
    self.y = 0
    self.w = 1280
    self.h = 720
    self.r = 0
    self.g = 0
    self.b = 128
    self.blendmode_enum =  1
  end

end

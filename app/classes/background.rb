class Background
  def initialize()
  end

  def draw
    {x:0, y:0, w:1280, h:720, r:0, g:0, b:255}.solid!
  end
end

class Playfield < Background
  def initialize
    super
    @sky = {x:0, y:0, w:1280, h:720, r:0, g:0, b:192}.solid!
    @ground = {x:0, y:0, w:1280, h:64, r:96, g:64, b:0}.solid!
    @mountain_x = 1000
  end

  def draw
     out = [@sky, @ground]
     out << make_mountain(@mountain_x, 0, 240, 320, 64, 64, 64)
     @mountain_x -= 1
     out
  end

  def make_mountain x, y, w, h, r, g, b
  {
    x: x, y: y, x2: x+w, y2: y, x3: x+(w/2), y3: y+h,
    r: r || 0,
    g: g || 0,
    b: b || 0,
    a: 255
  }.solid!
end
end

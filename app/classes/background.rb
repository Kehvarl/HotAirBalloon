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
    @mountains = [{x:1000, y:0, w:240, h:320}]
  end

  def mountain_collision? other
    false
  end

  def collision? other
    @mountain_collision? other
  end

  def draw
     out = [@sky, @ground]
     @mountains.each do |m|
       out << make_mountain(m.x, m.y, m.w, m.h, 64, 64, 64)
       m.x -= 1
     end
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

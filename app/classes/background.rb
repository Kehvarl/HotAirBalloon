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
  end

  def draw
     out = [
       {x:0, y:0, w:1280, h:620, r:0, g:0, b:32}.solid!,
       {x:0, y:0, w:1280, h:620, r:0, g:0, b:64}.solid!,
       {x:0, y:0, w:1280, h:520, r:0, g:0, b:128}.solid!,
       {x:0, y:0, w:1280, h:420, r:0, g:0, b:192}.solid!,
       {x:0, y:0, w:1280, h:320, r:0, g:0, b:255}.solid!
     ]
     out << make_triangle(430, 0, 850, 0, 640, 210, 64, 64, 64, 255)
     out
  end

  def make_triangle *opts
  x, y, x2, y2, x3, y3, r, g, b, a = opts
  {
    x: x, y: y, x2: x2, y2: y2, x3: x3, y3: y3,
    r: r || 0,
    g: g || 0,
    b: b || 0,
    a: a || 255
  }.solid!
end
end

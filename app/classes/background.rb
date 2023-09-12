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
    @mountains = [{x:1000, y:64, w:240, h:320, off_screen:false}]
    @bgmountains = [{x:1200, y:64, w:320, h: 640, off_screen:false}]
  end

  def draw
     out = [@sky, @ground]
     if @bgmountains[-1].x + @bgmountains[-1].w <= 1300
       @bgmountains << {x:rand(25)+1280, y:64, w:rand(320)+240, h:rand(240)+240}
     end
     @bgmountains.each do |m|
       out << make_mountain(m.x, m.y, m.w, m.h, 96, 96, 8)
       m.x -= 0.66
       if m.x+m.w <= 0
         m.off_screen = true
       end
     end
     @bgmountains = @bgmountains.select {|m| !m.off_screen}

     if @mountains[-1].x + @mountains[-1].w <= 1300
       @mountains << {x:rand(25)+1280, y:64, w:rand(240)+120, h:rand(320)+120}
     end
     @mountains.each do |m|
       out << make_mountain(m.x, m.y, m.w, m.h, 64, 64, 64)
       m.x -= 1
       if m.x+m.w <= 0
         m.off_screen = true
       end
     end
     @mountains = @mountains.select {|m| !m.off_screen}
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

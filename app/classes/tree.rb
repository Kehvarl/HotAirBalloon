
class Tree
  attr_accessor :vx, :vy, :off_screen, :x, :y, :w, :h, :render_hitbox, :hitbox
  def initialize
    @x = 1280
    @y = 64
    @w = 8 + rand(32)
    @h = 16 + rand(8)
    @t = 4 + @h/8
    @vx = -1
    @vy = 0
    @frame = 0
    @off_screen = false
    @render_hitbox = false
  end

  def tick  speed
    @x += @vx * speed
    if @x <= 0
      @off_screen = true
    end
  end

  def hitbox
    {x: @x-(@w/2)+@t/2, y: @y+@h, w: @w, h: @w}
  end

  def draw
    out = [
      {x: @x, y: @y, w:@t, h: @h,
        path: "sprites/square/gray.png"
      }.sprite!,
      {x: @x-(@w/2)+@t/2, y: @y+@h, w: @w, h: @w,
        path: "sprites/square/green.png"
      }.sprite!
    ]
    if @render_hitbox
      out << {x: @x-(@w/2)+@t/2, y: @y+@h, w: @w, h: @w, r: 255, g: 0, b: 0}.border!
    end
    out
  end

end

class Balloon
  attr_accessor :vx, :vy, :x, :y, :w, :h, :collissions, :render_hitbox
  def initialize args
    @args = args
    @x = 602
    @y = 480
    @w = 64
    @h = 64
    @vx = 0
    @vy = 0
    @render_hitbox = false
  end

  def tick speed
    @y += ([-1,0,0,1].sample() + @vy)
    @vy = @vy - [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1].sample()
    if @y <= 64
      @vy = [@vy,0].max
    end
  end

  def collision_boxes
    [
      {x: @x, y: @y+146, w: 64, h: 16},
      {x: @x-16, y: @y+48, w: 96, h: 98},
      {x: @x, y: @y+32, w: 64, h: 16},
      {x: @x+16, y: @y, w: 32, h: 32}
    ]
  end

  def collision? other
    cb = self.collision_boxes
    cb.any?{ |b| @args.geometry.intersect_rect?(b, other)}
  end

  def draw
    out = [
      {x: @x-16, y: @y+32, w: 96, h: 128, path: 'sprites/Baloon-Sheet.png'}.sprite!,
      {x: @x+16, y: @y, w: 32, h: 32, path: 'sprites/square/gray.png'}.sprite!
    ]

    if @render_hitbox
      cb = self.collision_boxes
      cb.each do |c|
        out << {x: c.x, y: c.y, w: c.w, h: c.h, r: 255, g: 255, b: 255}.border!
      end
    end
    out
  end
end

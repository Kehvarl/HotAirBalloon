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
    @render_hitbox = true
  end

  def tick
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

class Gameplay < Gamestate
  def initialize args
    super args
    @menu = MainMenu.new()
    @balloon = Balloon.new(args)
    @birds = []
    @num_birds = rand(10) + 3
  end

  def handle_keys args
    if args.inputs.keyboard.key_held.up or args.inputs.keyboard.key_held.w
      @balloon.vy += 1
    elsif args.inputs.keyboard.key_down.down or args.inputs.keyboard.key_down.s
      @balloon.vy -= 1
    end
  end

  def tick args
    super
    @balloon.tick

    @birds.each do |bird|
      bird.tick()
    end

    collisions = @birds.find_all { |b| @balloon.collision?(b)}


    @birds = @birds.select {|bird| !bird.off_screen}
    @birds = @birds.select {|bird| !@balloon.collision?(bird)}

    if rand(100) > 95 and @birds.length < @num_birds
      @birds << Bird.new()
    end

    args.outputs.primitives << args.state.Background
    args.outputs.primitives << @balloon.draw()
    @birds.each do |bird|
      args.outputs.primitives << bird.draw()
    end
  end

end

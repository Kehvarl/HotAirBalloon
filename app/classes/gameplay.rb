class Balloon
  attr_accessor :vx, :vy
  def initialize
    @x = 602
    @y = 480
    @w = 64
    @h = 64
    @vx = 0
    @vy = 0
  end

  def tick
    @y += ([-1,0,0,1].sample() + @vy)
    @vy = @vy - [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1].sample()
    if @y <= 64
      @vy = [@vy,0].max
    end
  end

  def draw
    [
      {x: @x, y: @y, w: @w, h: @h, path: 'sprites/circle/blue.png'}.sprite!,
      {x: @x+16, y: @y-32, w: @w-32, h: @h-32, path: 'sprites/square/gray.png'}.sprite!
    ]
  end
end

class Gameplay < Gamestate
  def initialize
    super
    @menu = MainMenu.new()
    @balloon = Balloon.new()
    @birds = []
    @num_birds = rand(7) + 3
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

    @birds = @birds.select {|bird| !bird.off_screen}

    # @num_birds += [-1,0,1].sample()

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

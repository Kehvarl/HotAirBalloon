class Balloon
  def initialize
    @x = 602
    @y = 480
    @w = 64
    @h = 64
  end

  def tick
    @y += [-1,0,0,1].sample()
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
  end

  def handle_keys args
  end

  def tick args
    super
    @balloon.tick
    args.outputs.primitives << args.state.Background
    args.outputs.primitives << @balloon.draw()
  end
end

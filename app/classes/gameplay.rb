class Gameplay < Gamestate
  def initialize
    super
    @menu = MainMenu.new()
  end

  def handle_keys args
  end

  def tick args
    super

    args.outputs.primitives << args.state.Background
    args.outputs.primitives << {x: 602, y: 480, w: 64, h: 64, path: 'sprites/circle/blue.png'}.sprite!
    args.outputs.primitives << {x: 618, y: 450, w: 32, h: 32, path: 'sprites/square/gray.png'}.sprite!
  end
end

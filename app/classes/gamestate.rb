class Gamestate
  attr_accessor :next_state
  def initialize
    @next_state = nil
  end

  def tick args
  end
end

class MainMenuState < Gamestate

  def initialize
    super
    @menu = MainMenu.new()
  end

  def tick args
    super
    if args.inputs.keyboard.key_up.down || args.inputs.keyboard.key_up.s
      @menu.down()
    elsif args.inputs.keyboard.key_up.up || args.inputs.keyboard.key_up.w
      @menu.up()
    end
    args.outputs.primitives << args.state.Background
    args.outputs.primitives << @menu.draw()
  end
end

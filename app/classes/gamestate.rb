class Gamestate
  attr_accessor :next_state
  def initialize args
    @next_state = nil
  end

  def handle_keys args
  end

  def tick args
    handle_keys args
  end
end

class MainMenuState < Gamestate

  def initialize args
    super args
    @menu = MainMenu.new()
  end

  def handle_keys args
    if args.inputs.keyboard.key_up.down || args.inputs.keyboard.key_up.s
      @menu.down()
    elsif args.inputs.keyboard.key_up.up || args.inputs.keyboard.key_up.w
      @menu.up()
    elsif args.inputs.keyboard.key_up.enter
      @menu.select()
    elsif args.inputs.keyboard.key_down.escape
      @next_state = :previous

    end
  end

  def tick args
    super

    if @menu.message != nil
      @next_state = @menu.message
      @menu.message = nil
    end
    args.outputs.primitives << args.state.Background.draw()
    args.outputs.primitives << @menu.draw()
  end
end

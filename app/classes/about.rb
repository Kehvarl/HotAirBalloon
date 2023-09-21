class About < Gamestate

  def initialize args
    super args
      @x = 320
      @y = 180
      @w = 640
      @h = 360
      @r = 0
      @g = 0
      @b = 32
  end

  def handle_keys args
    if args.inputs.keyboard.key_up.enter
      @next_state = :previous
    elsif args.inputs.keyboard.key_down.escape
      @next_state = :previous
    end
  end

  def tick args
    super

    about = [
      {x:@x, y:@y, w:@w, h:@h, r:@r, g:@g, b:@b}.solid!
    ]

    about << {x:328, y:532, w:640, h:40, text:"Hot Air Balloon", size_enum: 8, r:255, g:255, b: 255}.label!
    about << {x:328, y:498, w:640, h:40, text:"Try not to crash", size_enum: 0, r:255, g:255, b: 255}.label!


    args.outputs.primitives << args.state.Background.draw()
    args.outputs.primitives << about
  end
end

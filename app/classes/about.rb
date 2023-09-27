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
      @title = "About: Hot Air Balloon"
      @text = [
        "Welcome to the thrilling game of Hot Air Ballon!",
        "Use the arrow keys to raise and lower your balloon.",
        "Try not to get tangled in any trees!",
        "And watch out for the migrating dragonlings,",
        "they'll damage your balloon and slow you down.",
        "",
        "",
        "",
        "ESC to return to Menu."
      ]
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

    about << {x:328, y:532, w:640, h:40, text:@title, size_enum: 8, r:255, g:255, b: 255}.label!
    @text.each_with_index do |line, index|
      about << {x:328, y:488-(20*index), w:640, h:40, text:line, size_enum: 0, r:255, g:255, b: 255}.label!
    end

    # Need a better solution to this
    # I bet I could use some automation to clean it up

    args.outputs.primitives << args.state.Background.draw()
    args.outputs.primitives << about
  end
end

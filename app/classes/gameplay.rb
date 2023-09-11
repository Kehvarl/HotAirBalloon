class Gameplay < Gamestate
  def initialize args
    super args
    @balloon = Balloon.new(args)
    @birds = []
    @num_birds = rand(10) + 3
    args.state.Background  = Playfield.new()
  end

  def handle_keys args
    if args.inputs.keyboard.key_down.up or args.inputs.keyboard.key_down.w
      @balloon.vy += 1
    elsif args.inputs.keyboard.key_down.down or args.inputs.keyboard.key_down.s
      @balloon.vy -= 1
    elsif args.inputs.keyboard.key_down.escape
      @next_state = :mainmenu
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

    args.outputs.primitives << args.state.Background.draw()
    args.outputs.primitives << @balloon.draw()
    @birds.each do |bird|
      args.outputs.primitives << bird.draw()
    end
  end

end

class Gameplay < Gamestate
  def initialize args
    super args
    @balloon = Balloon.new(args)
    @birds = []
    @num_birds = rand(10) + 3
    @trees = []
    @num_trees = rand(8) + 4
    @spawn_tree = 0
    args.state.Background  = Playfield.new()
    @speed = 1
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
    @balloon.tick @speed

    @birds.each do |bird|
      bird.tick 1
    end

    collisions = @birds.find_all { |b| @balloon.collision?(b)}
    treecollision = @trees.find_all {|t| @balloon.collision?(t.hitbox)}

    @birds = @birds.select {|bird| !bird.off_screen}
    @birds = @birds.select {|bird| !@balloon.collision?(bird)}

    @trees = @trees.select{|tree| !treecollision.any?(tree)}

    if treecollision.length > 0
        @speed = 0
        args.state.Background.speed = 0
    end

    if rand(100) > 95 and @birds.length < @num_birds
      @birds << Bird.new()
    end

    @trees.each do |tree|
      tree.tick @speed
    end

    @trees = @trees.select {|tree| !tree.off_screen}
    @spawn_tree -=1
    if @spawn_tree <= 0 and @trees.length < @num_trees
      @spawn_tree = rand(128) + 96
      @trees << Tree.new()
    end

    args.outputs.primitives << args.state.Background.draw()
    args.outputs.primitives << @balloon.draw()
    @birds.each do |bird|
      args.outputs.primitives << bird.draw()
    end

    @trees.each do |tree|
      args.outputs.primitives << tree.draw()
    end
  end

end

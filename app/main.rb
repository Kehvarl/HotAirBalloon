require ('app/classes/background.rb')

def init args
  args.state.gamestate = :mainmenu
  args.state.Background = Background.new()
end


def tick args
  if args.state.tick_count == 0
    init args
  end

  case args.state.gamestate
  when :mainmenu
      mainmenu_tick(args)
  else
    puts "Invalid State"
    args.state.gamestate = :mainmenu
  end
end

def mainmenu_tick args
  args.outputs.primitives << args.state.Background
end

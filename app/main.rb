def init args
  args.state.gamestate = :mainmenu
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
  args.outputs.solids << {x:0, y:0, w:1280, h:720, r:0, g:0, b:128}
end

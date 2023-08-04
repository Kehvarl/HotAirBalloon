require ('app/classes/background.rb')
require ('app/classes/mainmenu.rb')

def init args
  args.state.gamestate = :mainmenu
  args.state.Background = Background.new()
  args.state.MainMenu = MainMenu.new()
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
  if args.inputs.keyboard.key_up.down || args.inputs.keyboard.key_up.s
    args.state.MainMenu.down()
  elsif args.inputs.keyboard.key_up.up || args.inputs.keyboard.key_up.w
    args.state.MainMenu.up()
  end
  args.outputs.primitives << args.state.Background
  args.outputs.primitives << args.state.MainMenu.draw()
end

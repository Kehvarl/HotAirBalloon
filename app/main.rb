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
  args.outputs.primitives << {x:320, y:180, w:640, h:360, b:32}.solid!
  args.outputs.primitives << {x:328, y:532, w:640, h:40,  text:"New", r:255, g:255, b: 255}.label!
  args.outputs.primitives << {x:320, y:500, w:640, h:40, b:64, a:215}.solid!

end

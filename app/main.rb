require ('app/classes/background.rb')
require ('app/classes/mainmenu.rb')
require ('app/classes/gamestate.rb')

def init args
  args.state.gamestate = :mainmenu
  args.state.Background = Background.new()
  args.state.Current = MainMenuState.new()
  args.state.Previous = nil
end


def tick args
  if args.state.tick_count == 0
    init args
  end

  args.state.Current.tick args

  case args.state.Current.next_state
  when :mainmenu
    args.state.Current = MainMenuState.new()
  when :gameplay
    puts "Not yet implemented"
  when :about
    puts "About Hot Air Balloon"
  when :quit
    args.gtk.request_quit
  end
end

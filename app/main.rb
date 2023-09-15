require ('app/classes/background.rb')
require ('app/classes/mainmenu.rb')
require ('app/classes/gamestate.rb')
require ('app/classes/bird.rb')
require ('app/classes/tree.rb')
require ('app/classes/balloon.rb')
require ('app/classes/gameplay.rb')

def init args
  args.state.gamestate = :mainmenu
  args.state.Background = Background.new()
  args.state.Current = MainMenuState.new(args)
  args.state.Previous = nil
end


def tick args
  if args.state.tick_count == 0
    init args
  end

  args.state.Current.tick args

  case args.state.Current.next_state
  when :previous
    args.state.Current.next_state = nil
    args.state.Current = args.state.Previous
  when :mainmenu
    args.state.Current.next_state = nil
    args.state.Previous = args.state.Current
    args.state.Current = MainMenuState.new(args)
  when :gameplay
    args.state.Current.next_state = nil
    args.state.Previous = args.state.Current
    args.state.Current = Gameplay.new(args)
  when :about
    args.state.Current.next_state = nil
    puts "About Hot Air Balloon"
    args.state.Current.next_state = nil
  when :quit
    args.gtk.request_quit
  end
end

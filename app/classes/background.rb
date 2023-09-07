class Background
  def initialize()
  end

  def draw
    {x:0, y:0, w:1280, h:720, r:0, g:0, b:255}.solid!
  end
end

class Playfield < Background
  def initialize
    super
  end

  def draw
     out = [
       {x:0, y:0, w:1280, h:620, r:0, g:0, b:32}.solid!,
       {x:0, y:0, w:1280, h:620, r:0, g:0, b:64}.solid!,
       {x:0, y:0, w:1280, h:520, r:0, g:0, b:128}.solid!,
       {x:0, y:0, w:1280, h:420, r:0, g:0, b:192}.solid!,
       {x:0, y:0, w:1280, h:320, r:0, g:0, b:255}.solid!
     ]
     out
  end
end

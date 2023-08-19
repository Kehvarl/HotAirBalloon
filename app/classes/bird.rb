
class Bird
  attr_accessor :vx, :vy, :off_screen
  def initialize
    @x = 1280
    @y = [240, 480, 640, 700].sample()
    @y += rand(240)-120
    @w = 32
    @h = 32
    @vx = [-1,-1,-1,-1,-1.5,-2,-3].sample()
    @vy = 0
    @frame = 0
    @max_frame = 5
    @flap_rate = 7 + rand(7)
    @frame_counter = @flap_rate
    @off_screen = false
  end

  def tick
    @frame_counter -= 1
    if @frame_counter <= 0
      @frame_counter = @flap_rate
      @frame += 1
      if @frame > @max_frame
        @frame = 0
      end
    end
    @y += [-2,-1,0,0,0,0,0,1,2].sample() + @vy
    @x += @vx
    if @y <= 0 or @y >= 720-@h
      @vy = -@vy
    end
    if @x <= 0
      @off_screen = true
    end
  end

  def draw
    [
      {
        x: @x,
        y: @y,
        w: @w,
        h: @h,
        path: "sprites/misc/dragon-#{@frame}.png",
        flip_horizontally:true
      }.sprite!
    ]
  end
end

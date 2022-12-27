# 방향을 정하는 모듈
module Direction
  LEFT = "left"
  RIGHT = "right"
  TOP = "up"
  UNDER = "down"

  def Direction.move(e, o, speed = 1)
    case e.key
    when LEFT
      o.x -= speed
    when RIGHT
      o.x += speed
    when TOP
      o.y -= speed
    when UNDER
      o.y += speed
    else
      return
    end
  end
end

require 'ruby2d'

check_in = lambda do |o1, os, x, y|
  os.each do |o|
    if o.contains? o1.x, o1.y
      o1.x, o1.y = x, y
    end
  end
end

set title: "Game"
w = get :width
h = get :height
# 장애물
block = []

text = Text.new("Hello", x: w/2, y:  h/2, rotate: 0, font: Font.default)
text.x -= text.width
text.y -= text.height

block << Rectangle.new(x: 0, y: 0)

Window.on :key_held do |e|
  x, y = text.x, text.y
  Direction::move(e, text, speed=2)
  if text.x < 0 || text.x + text.width > w; text.x = x end
  if text.y < 0 || text.y + text.height > h; text.y = y end
  check_in.call(text, block, x, y)
end

show

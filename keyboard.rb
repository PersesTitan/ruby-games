require 'ruby2d'

set title: "Game"
text = Text.new("Hello", x: 0, y:  0, rotate: 0, font: Font.default)
Window.on :key_held do |e|
  text.text = e.key
end

show


class Bomb
	attr_reader :x, :y
	def initialize(player, window)
		@img = Gosu::Image.new("media/bomb.png")
		@x = rand * 640
		@y = rand * 480
		@time = 3
		@player = player
		@window  = window 
		@explode_time = 300
		@exploded = false
		@start_time = Gosu::milliseconds
	end

	def draw
		@img.draw( @x - @img.width / 2.0, @y - @img.height / 2.0,
			ZOrder::Bombs, 1, 1)
	end
	def exploded?
		return Gosu::milliseconds - @start_time > @explode_time
	end


end
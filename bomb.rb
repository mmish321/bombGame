
class Bomb
	attr_reader :x, :y
	def initialize(player, window)
		@img = Gosu::Image.new("media/bomb.png")
		@img_explosion = Gosu::Image.new("media/explosion.png")
		@x = rand * 640
		@y = rand * 480
		@player = player
		@window  = window 
		@explode_time = 5000
		@exploded = false
		@start_time = Gosu::milliseconds
		@exploded_drawn = false
	end

	def draw
		if self.exploded?  == true 
			@exploded_drawn = true
			@img_explosion.draw(@x - @img_explosion.width / 2.0, @y - @img_explosion.height / 2.0,
			ZOrder::Bombs, 1, 1)
		else
			@img.draw( @x - @img.width / 2.0, @y - @img.height / 2.0,
				ZOrder::Bombs, 1, 1)
		end
	end

	def hit_by_laser?(lasers)
		lasers.each {|laser|
			if Gosu::distance(@x, @y, laser.x, laser.y) < 35 then
				 @exploded = true
				 return @exploded
			end
		}
	end
	def exploded?
		if @exploded == true
			return @exploded
		else
			@exploded = (Gosu::milliseconds - @start_time) > @explode_time 
			return @exploded
		end
	end
	def exploded_drawn?
		return @exploded_drawn
	end
end
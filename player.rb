class Player
	TURN_INCREMENT = 4.5
	ACCELERATION = 0.5
	COLLISION_DISTANCE = 35
	def initialize
		@health = 100
		@image = Gosu::Image.new("media/starfighter.bmp")
		@x = @y = @vel_x = @vel_y = @angle = 0.0
		@score = 0
	end
	
	def health
		@health
	end

	def warp(x , y)
		@x, @y = x, y
	end

	def turn_left
		@angle -= 4.5
	end

	def turn_right
		@angle += 4.5
	end

	def accelerate
		@vel_x += Gosu::offset_x(@angle, 0.5)
		@vel_y += Gosu::offset_y(@angle, 0.5)
	end

	def move
		@x += @vel_x
		@y += @vel_y
		@x %= 640
		@y %= 480

		@vel_x *= 0.95
		@vel_y *= 0.95
		
	end

	def draw
		@image.draw_rot(@x, @y, 1, @angle)
	end

	def score
		@score
	end

 def collect_stars(stars)
   stars.reject! do |star|
     if Gosu::distance(@x, @y, star.x, star.y) < 35 then
       @score += 10
       true
     else
       false
     end
  end

  def run_into_bombs(bombs)
   bombs.reject! do |bomb|
   	 if Gosu::distance(@x, @y, bomb.x, bomb.y) < 35 then
        @health -= 25
        true
      else
        false
      end
  end

end
end
end

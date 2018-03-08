local ent = ents.Derive("base")

function ent:setPos(x,y)
	self.x = x
	self.y = y
end

function ent:load( x, y )
	ccheck = 0
	self:setPos( x, y)
	self.image = love.graphics.newImage("textures/circle-128.png")
	--picks random number between 0 and 128
	--self.birth = love.timer.getTime() + math.random(0, 128)
	self.size = math.random(3, 6)
end

function ent:update(dt)
	--dt = per second
	--Target1position + 32 positions per second - x coordinate movement
	ccheck = ccheck + 15 * dt
	if ccheck > 255 then
		ccheck = 255
	end
	
	self.x = self.x + 100 * dt
	if self.x >= (800 + 256) then
		self.x = -math.random(100, 500)
	end
	
	--if color is almost white, and a decrease in size is greater than zero...
	--decrease the size of the dots! MWAHAHAHA!
	if ccheck > 220 then
		if (self.size - 0.2 * dt) > 2 then
			self.size = self.size - 0.2 * dt
		end
	end
end

function ent:Click(n)
	addScore(n)
	self.x = -math.random(100, 500)
end

function ent:Clickfail()
	addFail(1)
end

function ent:draw()
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.draw(self.image, self.x, self.y, 0, self.size/10, self.size/10, 0, 0)
end

return ent;
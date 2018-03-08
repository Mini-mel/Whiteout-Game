--Called when the game is first started
function load()
	love.graphics.setBackgroundColor( 255, 255, 255)

	timedBn = love.graphics.newImage("textures/timeclick.png")
	timedSelBn = love.graphics.newImage("textures/time.png")
	AccBn = love.graphics.newImage("textures/accclick.png")
	AccSelBn = love.graphics.newImage("textures/acc.png")

	buttons = 	{
				{bnOn = timedBn, bnOff = timedSelBn, x = 400, y = 300 - 64, w = 256, h = 64, action = "timegame"},
				{bnOn = AccBn, bnOff = AccSelBn, x = 400, y = 300 + 64, w = 256, h = 64, action = "accgame"}
				}
end

--only visible to this file
local function drawButton(off, on, x, y, w, h, mx, my)
	--if mouse is inside button
	local hityes = isHit(mx, my, x - (w/2), y - (h/2), w, h)
	
	--default color
	love.graphics.setColor(255, 255, 255, 255)

	if hityes then
		love.graphics.draw(on, x, y, 0, 1, 1, (w/2), (h/2))
	else
		love.graphics.draw(off, x, y, 0, 1, 1, (w/2), (h/2))
	end
end
	
	
--Anything that is visible to the player, drawn to the next frame: 60 frames per second
function love.draw()
	love.graphics.setColor(0, 0, 0)
	love.graphics.setNewFont( 40 )
	love.graphics.print("Whiteout", 259, 128)
	love.graphics.setNewFont(15)
	love.graphics.print("Melody Coleman")
	local x = love.mouse.getX()
	local y = love.mouse.getY()
	
	love.graphics.setColor(255, 255, 255)
	for k, v in pairs(buttons) do
		drawButton(v.bnOff, v.bnOn, v.x, v.y, v.w, v.h, x, y)
	end
end


--What happens when a mouse is clicked
function love.mousepressed(x, y, button)
	if button == "l" then
		for k, v in pairs(buttons) do
			local hit = isHit(x, y, v.x - (v.w/2), v.y - (v.h/2), v.w, v.h)
			
			if hit then
				if v.action == "timegame" then
					loadState("WhiteoutTimed")
				elseif v.action == "accgame" then
					loadState("WhiteoutAcc")
				end
			end
		end		
	end
end

--if pointer is between perameters of hitbox, return true
--if not, return false
function isHit(x1, y1, x, y, wx, wy)
	if x1 > x and x1 < x + wx then
		if y1 > y and y1 < y + wy then
			return true
		end
	end
	return false
end
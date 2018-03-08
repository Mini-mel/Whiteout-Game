--Called when the game is first started (overridden by states)
function load()
	require ("states/WhiteoutTimed/entities")
    ents.Startup()
	love.graphics.setBackgroundColor( 0, 0, 0)

	score = 0
	c = 0
	time1 = love.timer.getTime()
	
	math.randomseed( os.time() )
	--makes -num- targets
	for i = 1, 5 do
		ents.Create("circle", -math.random(100, 600), math.random(100, 600))
	end
	
	math.randomseed( os.time() * 2.5)
	for i = 1, 5 do
		ents.Create("square", math.random(100, 600), -math.random(100, 600))
	end
	
	math.randomseed( os.time() * 3.5)
	for i = 1, 6 do
		print (-math.random(100, 600))
		ents.Create("triangle", -math.random(100, 600), math.random(100, 600))
	end
	
	math.randomseed( os.time() * 1.5)
	for i = 1, 6 do
		ents.Create("star", -math.random(100, 600), math.random(100, 600))
	end
end


--Anything that is visible to the player, drawn to the next frame: 60 frames per second
function love.draw()
	ents:draw()
	
	--for score
	love.graphics.setColor(0, 0, 0)
	love.graphics.setNewFont(15)
	love.graphics.print("Score: " .. score, 16, 16, 0, 1, 1)
	countdown(time1, 0, 0)
end

--Repeats
function love.update(dt)
	c = c + 15 * dt
	if c <= 255 then
		love.graphics.setBackgroundColor( c, c, c)
	end
	ents:update(dt)
end

--What happens when a mouse is clicked
function love.mousepressed(x, y, button)
	if button == "l" then
		ents.shoot(x,y)
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

function addScore(n)
	score = score + tonumber(n)
end

function countdown(start, x, y)
    local time2 = love.timer.getTime()
    local timeDiff = math.floor(time2 - time1)
	
    local seconds = 30 - timeDiff
   -- checks, if the countdown is 0:00 and stops displaying
    if seconds < 1 then
		loadState("endgame")
	end 
	
   love.graphics.setColor(255,255,255)
   love.graphics.print("Seconds left: "..seconds, x, y)
end

function getScore()
	return score
end
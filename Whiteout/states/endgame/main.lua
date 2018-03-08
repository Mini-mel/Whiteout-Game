--Called when the game is first started
function load()
	love.graphics.setBackgroundColor( 0, 0, 0)
end

function love.draw()
	love.graphics.setColor(255, 255, 255)
	love.graphics.setNewFont( 30 )
	love.graphics.print("Your score was: " .. tostring(getScore()) .. "", 240, 200)
	love.graphics.print("Mwahahaha....", 240, 200 - 64)
end
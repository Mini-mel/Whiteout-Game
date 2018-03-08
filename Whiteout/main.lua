function loadState(name)
	--reset the state before loading a new one
	state = {}

	love.draw = nil
	love.mousepressed = nil
	love.mousereleased = nil
	love.update = nil
	--puts name of state in the middle of the path, and requires its existance before load is called
	local path = "states/" .. name
	require(path .. "/main")
	load()
end

function love.load()
	--requires main file
	loadState("menu")
end
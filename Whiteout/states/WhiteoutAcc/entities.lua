ents = {}
ents.objects = {}

local regi = {}
local id = 0
local hitprev = false

function ents.Startup()
	regi["circle"] = love.filesystem.load( "states/WhiteoutAcc/entities/circle.lua")
	regi["square"] = love.filesystem.load( "states/WhiteoutAcc/entities/square.lua")
	regi["triangle"] = love.filesystem.load( "states/WhiteoutAcc/entities/triangle.lua")
	regi["star"] = love.filesystem.load( "states/WhiteoutAcc/entities/star.lua")
end

--derives info from base entity into specific entity
function ents.Derive(name)
	return love.filesystem.load( "states/WhiteoutAcc/entities/" .. name .. ".lua")()
end


--spawn a new object
function ents.Create(name, x, y)
	
	--if x and y don't exist, they equal 0
	if not x then
		x = 0
	end


	if not y then
		y = 0
	end
	
	if regi[name] then
		id = id + 1
		
		local ent = regi[name]()
		ent:load()
		ent.type = name
		ent:setPos(x, y)
		ent.id = id
		
		--returns amount of objects in table
		ents.objects[#ents.objects + 1] = ent
		return ents.objects[#ents.objects]
	else
		print("Entity " .. name .. " does not exist in register")
		return false;
	end
end

function ents:update(dt)
	for i, ent in pairs(ents.objects) do
		if ent.update then
			ent:update(dt)
		end
	end
end

function ents:draw()
	for i, ent in pairs(ents.objects) do
		if ent.draw then
			ent:draw()
		end
	end
end

function ents.shoot(x,y)
local firsthit = true
--because it registers multiple misses at once. so it should only count when things are clicked
	for i, ent in pairs(ents.objects) do
		--if clickable (destroyable) entity
		if ent.Click then
			--if its type is a....check hit
			if ent.type == "circle" or ent.type == "square" or ent.type == "octgon" or ent.type == "star" or ent.type == "triangle" or ent.type == "xmark" then
				local hit = isHit(x, y, ent.x, ent.y, 128*(ent.size/10), 128*(ent.size/10))
				if hit then
					firsthit = false
					ent:Click(1)
				end
			end
		end
	end
	
	if firsthit then
		addFail(1)
	end
end
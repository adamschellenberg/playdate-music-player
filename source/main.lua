import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/crank"

local gfx <const> = playdate.graphics

-- local playerSprite = nil

-- local playerSpeed = 4

local function loadMusic()
	music = {}
	musicChannel = playdate.sound.channel.new()
	local track, err = playdate.sound.fileplayer.new("sounds/sample", 1)
	music = track
	musicChannel:addSource(music)
	music:setStopOnUnderrun(false)
end

local function playMusic()
	if music:isPlaying() == false then
		music:play(0)
	end
end

local function pauseMusic()
	if music:isPlaying() == true then
		music:pause()
	end
end

local function initialize()
	local playerImage = gfx.image.new("images/player")
	playerSprite = gfx.sprite.new(playerImage)
	playerSprite:moveTo(200, 120)
	playerSprite:add()

	local backgroundImage = gfx.image.new("images/background")
	gfx.sprite.setBackgroundDrawingCallback(
		function(x, y, width, height)
			gfx.setClipRect(x, y, width, height)
			backgroundImage:draw(0, 0)
			gfx.clearClipRect()
		end
	)

	loadMusic()
	

end

initialize()

function playdate.update()
	if playdate.buttonIsPressed(playdate.kButtonA) then
		playMusic()
	end
	if playdate.buttonIsPressed(playdate.kButtonB) then
		pauseMusic()
	end
	-- if playdate.buttonIsPressed(playdate.kButtonDown) then
	-- 	playerSprite:moveBy(0, playerSpeed)
	-- end
	-- if playdate.buttonIsPressed(playdate.kButtonLeft) then
	-- 	playerSprite:moveBy(-playerSpeed, 0)
	-- end
	
	gfx.sprite.update()
end



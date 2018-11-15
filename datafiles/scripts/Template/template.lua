Dir = game.luaScriptDir -- Lua readable script directory
gmDir = game.gmScriptDir -- GameMaker readable script directory

task = require('lua.task') -- Task Scheduler

-- Loading Assets
function importAssets()
	
end

-- Runs after loading
function initialize()
	
end

-- Run every game step
function step()
	task.update()
	
end

-- Main Coroutine (optional)
task.spawn(function()
	
end)
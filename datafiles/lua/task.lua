-- Modified from https://github.com/bjornbytes/quilt/blob/master/quilt.lua
local task = {}
task.key = {}
task.coroutines = {}

local key = 0

-- Queue up functions for next update
function task.spawn(func)
	if type(func) ~= 'function' then return end
	table.insert(task.coroutines, coroutine.create(func))
	key = key + 1
	table.insert(task.key, key)
	return key
end

-- Die thread to death
-- Using a loop looking for a matching key.
-- Done this way in order to be deterministic.
-- If anyone can do it better, do it better.
function task.suspend(k)
	for i in ipairs(task.key) do
		if task.key[i] == k then
			table.remove(task.coroutines, i)
			table.remove(task.key, i)
			return
		end
	end
end

function task.update()
	for i in ipairs(task.coroutines) do
		assert(coroutine.resume(task.coroutines[i]))
		if coroutine.status(task.coroutines[i]) == 'dead' then
			task.suspend(task.key[i])
		end
	end
end

-- Wait function
function task.wait(__a)
	local __i
	for __i = 1, __a do
		coroutine.yield()
	end
end

return task
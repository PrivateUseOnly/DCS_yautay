env.info( 'CUSTOM *** DYNAMIC LOAD SCRIPTS *** ' )
local base = _G

local FRAMEWORKS = {"F:\\repo\\DCS\\DCS_Missions\\DCS_Maps\\Kavkaz\\Base\\Scripts\\paths.lua", "F:\\repo\\DCS\\DCS_Missions\\lib\\Moose.lua", "F:\\repo\\DCS\\DCS_Missions\\lib\\DCS-SimpleTextToSpeech.lua", }
local SCRIPTS = {"F:\\repo\\DCS\\DCS_Missions\\DCS_Maps\\Kavkaz\\Base\\Scripts\\0_1_const.lua", "F:\\repo\\DCS\\DCS_Missions\\DCS_Maps\\Kavkaz\\Base\\Scripts\\1_1_variables.lua", "F:\\repo\\DCS\\DCS_Missions\\DCS_Maps\\Kavkaz\\Base\\Scripts\\1_2_common.lua", "F:\\repo\\DCS\\DCS_Missions\\DCS_Maps\\Kavkaz\\Base\\Scripts\\2_2_clients.lua", "F:\\repo\\DCS\\DCS_Missions\\DCS_Maps\\Kavkaz\\Base\\Scripts\\3_3_range.lua", "F:\\repo\\DCS\\DCS_Missions\\DCS_Maps\\Kavkaz\\Base\\Scripts\\9_1_atis.lua", }

__Script = {}
__Script.Include = function(IncludeFile)
	if not __Script.Includes[IncludeFile] then
		__Script.Includes[IncludeFile] = IncludeFile
		local f = assert(base.loadfile(IncludeFile))
		if f == nil then
			error ("ERROR Could not load Script file " .. IncludeFile )
		else
			env.info( "CUSTOM file -> " .. IncludeFile .. " dynamically loaded." )
			return f()
		end
	end
end

__Script.Includes = {}

for i, v in pairs(FRAMEWORKS) do
	__Script.Include(v)
end

for i, v in pairs(SCRIPTS) do
	__Script.Include(v)
end

BASE:TraceOnOff(true)
env.info( 'CUSTOM *** DYNAMIC LOAD END *** ' )
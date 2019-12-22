Config = {}

-- Configs
Config.RegularPrice = 100
Config.WhitelistedJobsPrice = 20
Config.RepairDistanceAroundBlip = 30
Config.ProgressBarTime = 10000

-- Language Labels
Config.BlipLabel = 'Repair Zone'
Config.Command = 'repair'
Config.SuggestionCommand = '/repair'
Config.SuggestionLabel = '[RepairZone] Repair Vehicle'
Config.ProgressLabel = 'Repairing Vehicle'
Config.ProgressBarTime = 10000

Config.RepairZone = {
	[1] = { ["x"] = -337.0,["y"] = -135.0, ["z"] = 39.0},
	[2] = { ["x"] = 110.0,["y"] = 6626.0, ["z"] = 31.79},
	[3] = { ["x"] = 537.58,["y"] = -179.13, ["z"] = 54.48}, 
	[4] = { ["x"] = 1775.56,["y"] = 3334.21, ["z"] = 41.25}, 
	[5] = { ["x"] = 1146.67,["y"] = -773.63, ["z"] = 57.64},
	[6] = { ["x"] = 2505.5, ["y"] = 4100.86, ["z"] = 38.44}, 
	[7] = { ["x"] = 2009.32,["y"] = 3792.18, ["z"] = 32.18},
	[8] = { ["x"] = 480.4,["y"] = -1317.66, ["z"] = 29.0},
	[9] = { ["x"] = -1421.0,["y"] = -436.0, ["z"] = 36.0},
	[10] = { ["x"] = 254.75,["y"] = -1799.45, ["z"] = 27.0},
	[11] = { ["x"] = -33.97,["y"] = -1645.74, ["z"] = 29.23},
	[12] = { ["x"] = -212.56,["y"] = -1358.42, ["z"] = 31.26},
	[13] = { ["x"] = 258.0,["y"] = 2594.0, ["z"] = 44.0},
	[14] = { ["x"] = -32.0,["y"] = -1090.0, ["z"] = 26.0},
	[15] = { ["x"] = -211.0,["y"] = -1325.0, ["z"] = 31.0},
	[16] = { ["x"] = 437.44,["y"] = 3576.65, ["z"] = 33.2}
}

Config.WhitelistedJob = {
	'police',
	'ambulance',
	'taxi',
	'mechanic'
}
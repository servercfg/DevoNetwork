--[[
    FiveM Scripts
    Copyright C 2018  Sighmir

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    at your option any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

cfg = {}

cfg.blips = false -- blips/markeringer på mappet.

cfg.seconds = 600 -- sekunder at røve i. (10 minutter)

cfg.cooldown = 3600 -- tid mellem røverierne i banken. (Én time)

cfg.cops = 4 -- minimum betjente på arbejde.
cfg.permission = "bank.police" -- tilladelse givet til politiet.

cfg.banks = { -- liste af bankene
	["Midtby Bank"] = {
		position = { ['x'] = 147.0697479248, ['y'] = -1045.05859375, ['z'] = 29.368026733398 },
		reward = math.random(200000,400000),
		nameofbank = "Midtby Bank",
		lastrobbed = 0 -- den er altid på 0
	},
	["Nordea Bank"] = {
		position = { ['x'] = -2957.6674804688, ['y'] = 481.45776367188, ['z'] = 15.697026252747 },
		reward = math.random(200000,400000),
		nameofbank = "Nordea Bank (Vestlig Motorvej)",
		lastrobbed = 0
	},
	["Jyske Bank"] = {
		position = { ['x'] = -107.06505584717, ['y'] = 6474.8012695313, ['z'] = 31.62670135498 },
		reward = math.random(200000,400000),
		nameofbank = "Jyske Bank (Paleto Bay)",
		lastrobbed = 0
	},
	["Sydbank"] = {
		position = { ['x'] = -1212.2568359375, ['y'] = -336.128295898438, ['z'] = 36.7907638549805 },
		reward = math.random(200000,400000),
		nameofbank = "Sydbank (Rockford Hills - Vestlig Los Santos)",
		lastrobbed = 0
	},
	["Alm. Brand Bank"] = {
		position = { ['x'] = 309.967376708984, ['y'] = -283.033660888672, ['z'] = 53.1745223999023 },
		reward = math.random(200000,400000),
		nameofbank = "Alm. Brand Bank (Alta - Nord for LS Midtby)",
		lastrobbed = 0
	},
	["Danmarks Nationalbank"] = {
		mincops = 5,
		position = { ['x'] = 255.001098632813, ['y'] = 225.855895996094, ['z'] = 101.005694274902 },
		reward = math.random(400000,600000),
		nameofbank = "Danmarks Nationalbank (Downtown Vinewood)",
		lastrobbed = 0
	}
}

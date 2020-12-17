local cfg = {}

-- start wallet/bank values
cfg.open_wallet = 25000
cfg.open_bank = 25000

-- money display css
cfg.display_css = [[
@font-face {
	font-family: 'hyperion';
	src: url('https://byhyperion.net/stylesheet/fonts/american_captain1.ttf');
}
.div_money{
	position: absolute;
	top: 100px;
	right: 20px;
	font-size: 30px;
	font-weight: bold;
	letter-spacing: 1px;
	color: white;
	text-shadow: -1px -1px 0 #000, 1px -1px 0 #000, -1px 1px 0 #000, 1px 1px 0 #000;
	font-family: "hyperion";
}
.div_money .symbol{
	font-size: 25px;
	color: #00ac51; 
}
]]

return cfg
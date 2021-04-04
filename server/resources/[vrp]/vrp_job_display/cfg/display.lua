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

--      height: 50px;
--      width: 50px;
--	  top: 180px;
--      right: 20px;

--  top: 155px;
--  right: 20px;
--  font-size: 20px;
-- 240
-- 270


local cfg = {}

cfg.firstjob = "Arbejdsløs" -- set this to your first job, for example "citizen", or false to disable

-- text display css
cfg.display_css = [[
@import url('https://fonts.googleapis.com/css?family=Passion+One'); 
.div_job{
  position: absolute;
  top: 100px;
  right: 20px;
  letter-spacing: 1.5px;
  font-size: 29px;
  font-family: "Passion One", PassionOne-Regular;
  background:rgba(32,32,32,0.7);
  padding: 7px;
  max-width: 200px;
  border-radius: 20px;
  color: white;
  text-shadow: 0px 0px 0 rgb(0,0,0),1px 1px 0 rgb(0,0,0),2px 2px  0 rgb(0,0,0),3px 3px 2px rgba(0,0,0,1),3px 3px 1px rgba(0,0,0,0.5),0px 0px 2px rgba(0,0,0,.2);
}
]]

-- icon display css
cfg.icon_display_css = [[
.div_job_icon{
  position: absolute;
  top: 100px;
  right: 20px;
  background-color: rgba(0,0,0,0.40);
  padding: 7px;
  max-width: 200px;
  border-radius: 20px;
  font-size: 20px;
  font-weight: bold;
  color: white;
}
]]

-- list of ["group"] => css for icons
cfg.group_icons = {
  ["Rigspolitichef"] = [[
    .div_job_icon{
      content: url(https://cdn.discordapp.com/attachments/583065426318065699/583065603493855252/betjent.png);
    }
  ]],
}
return cfg
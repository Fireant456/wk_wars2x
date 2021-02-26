--[[---------------------------------------------------------------------------------------

	Wraith ARS 2X
	Created by WolfKnight
	
	For discussions, information on future updates, and more, join 
	my Discord: https://discord.gg/fD4e6WD 
	
	MIT License

	Copyright (c) 2020-2021 WolfKnight

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.

---------------------------------------------------------------------------------------]]--

SYNC = {}


--[[----------------------------------------------------------------------------------
	Sync functions 
----------------------------------------------------------------------------------]]--
function SYNC:SendPowerState( state )
	local otherPed = PLY:GetOtherPed()

	if ( otherPed ~= nil and otherPed ~= 0 ) then 
		local otherPly = GetPlayerServerId( NetworkGetPlayerIndexFromPed( otherPed ) )

		TriggerServerEvent( "wk_wars2x_sync:sendPowerState", otherPly, state )
	end 
end 


--[[----------------------------------------------------------------------------------
	Sync client events
----------------------------------------------------------------------------------]]--
RegisterNetEvent( "wk_wars2x_sync:receivePowerState" )
AddEventHandler( "wk_wars2x_sync:receivePowerState", function( state )
	local power = RADAR:IsPowerOn()

	if ( power ~= state ) then 
		Citizen.SetTimeout( 100, function()
			RADAR:TogglePower()
		end )
	end 
end )
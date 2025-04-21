
repeat wait() until game:IsLoaded()
task.wait(1)
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
   vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
   wait(3)
   vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)


local virtualUser = game:service("VirtualUser")
game:service("Players").LocalPlayer.Idled:Connect(function()
    virtualUser:CaptureController()
    virtualUser:ClickButton2(Vector2.new())
end)


if game.PlaceId ~= 72829404259339 then return end 
getgenv().WantedNotify = {}
getgenv().WantedRangers = {}
getgenv().WantedItemsForChallenge = {}
getgenv().WantedUnitForEvo = {}
getgenv().WantedItemsForEasterEvent = {}
local MacLib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()

local Window = MacLib:Window({
    Title = "L-Hub",
    Subtitle = "Free | V0.45",
    Size = UDim2.fromOffset(800, 650), -- 800 ,650
    DragStyle = 2,
    DisabledWindowControls = {},
    ShowUserInfo = false,
    Keybind = Enum.KeyCode.LeftControl,
    AcrylicBlur = false,
})

local globalSettings = {
	UIBlurToggle = Window:GlobalSetting({
		Name = "UI Blur",
		Default = Window:GetAcrylicBlurState(),
		Callback = function(bool)
			Window:SetAcrylicBlurState(false)
			Window:Notify({
				Title = Window.Settings.Title,
				Description = (bool and "Enabled" or "Disabled") .. " UI Blur",
				Lifetime = 5
			})
		end,
	}),
	NotificationToggler = Window:GlobalSetting({
		Name = "Notifications",
		Default = Window:GetNotificationsState(),
		Callback = function(bool)
			Window:SetNotificationsState(bool)
			Window:Notify({
				Title = Window.Settings.Title,
				Description = (bool and "Enabled" or "Disabled") .. " Notifications",
				Lifetime = 5
			})
		end,
	}),
	ShowUserInfo = Window:GlobalSetting({
		Name = "Show User Info",
		Default = Window:GetUserInfoState(),
		Callback = function(bool)
			Window:SetUserInfoState(false)
			Window:Notify({
				Title = Window.Settings.Title,
				Description = (bool and "Showing" or "Redacted") .. " User Info",
				Lifetime = 5
			})
		end,
	})
}



Window:Dialog({
    Title = "L-Hub",
    Description = "Script still in beta, report bugs in https://discord.gg/xhUcqNUfr9 \nScript made by kazoun",
    Buttons = {
        {
            Name = "Copy Link",
            Callback = function()
            	setclipboard(tostring("https://discord.gg/xhUcqNUfr9"))
            end,
        },
    }
})


local tabGroups = {
	TabGroup1 = Window:TabGroup()
}

local tabs = {
	Main = tabGroups.TabGroup1:Tab({ Name = "Main", Image = nil }),
    Info = tabGroups.TabGroup1:Tab({ Name = "Info", Image = nil }),
	Upgrade = tabGroups.TabGroup1:Tab({ Name = "Place & Upgrade", Image = nil }),
	Evo = tabGroups.TabGroup1:Tab({ Name = "Evolve", Image = nil }),
	Misc = tabGroups.TabGroup1:Tab({ Name = "Misc", Image = nil }),
	Settings = tabGroups.TabGroup1:Tab({ Name = "Settings", Image = nil })
}

local sections = {
	MainSection1 = tabs.Main:Section({ Side = "Left" }),
	MainSection2 = tabs.Main:Section({ Side = "Right" }),
	MainSection3 = tabs.Main:Section({ Side = "Left" }),
	MainSection15 = tabs.Main:Section({ Side = "Right" }),

    MainSection4 = tabs.Info:Section({ Side = "Left" }),
    MainSection5 = tabs.Info:Section({ Side = "Right" }),
	MainSection6 = tabs.Info:Section({ Side = "Left" }),

	MainSection8 = tabs.Upgrade:Section({ Side = "Right" }),
	MainSection10 = tabs.Upgrade:Section({ Side = "Right" }),
	MainSection14 = tabs.Upgrade:Section({ Side = "Left" }),

	MainSection19 = tabs.Evo:Section({ Side = "Left" }),
	MainSection21 = tabs.Evo:Section({ Side = "Right" }),
	MainSection20 = tabs.Evo:Section({ Side = "Right" }),
	MainSection22 = tabs.Evo:Section({ Side = "Right" }),
	MainSection24 = tabs.Evo:Section({ Side = "Left" }),

	MainSection11 = tabs.Misc:Section({ Side = "Left" }),
	MainSection16 = tabs.Misc:Section({ Side = "Left" }),
	MainSection18 = tabs.Misc:Section({ Side = "Right" }),
	MainSection17 = tabs.Misc:Section({ Side = "Right" }),
	MainSection7 = tabs.Misc:Section({ Side = "Right" }),

	MainSection12 = tabs.Settings:Section({ Side = "Right" }),
	MainSection13 = tabs.Settings:Section({ Side = "Right" }),
	MainSection23 = tabs.Settings:Section({ Side = "Left" }),
}

sections.MainSection1:Header({
	Name = "AutoJoin-Type World"
})

local WorldSelectForAutoComplete = sections.MainSection1:Dropdown({
	Name = "Select Type To Auto Join:",
	Multi = false,
	Required = true,
	Options = {"Story","Ranger","Raid","Challenge","Infinity Castle","Boss-Event","Easter-Event"},
	Default = "",
	Callback = function(Value)
		getgenv().TypePortal = Value 
	end,
}, "PortalSelect")




sections.MainSection2:Header({
	Name = "Story Configs:"
})



local Dropdown = sections.MainSection2:Dropdown({
	Name = "World:",
	Multi = false,
	Required = true,
	Options = {"OnePiece", "Namek", "DemonSlayer", "Naruto","OPM"},
	Default = "",
	Callback = function(Value)
		getgenv().WorldSelect = Value 
	end,
}, "SelectWorldStory")

local Dropdown = sections.MainSection2:Dropdown({
	Name = "Act:",
	Multi = false,
	Required = true,
	Options = {"1","2","3","4","5","6","7","8","9","10"},
	Default = "",
	Callback = function(Value)
	getgenv().ActSelect =Value 
	end,
}, "SelectActStory")

local Dropdown = sections.MainSection2:Dropdown({
	Name = "Difficulty:",
	Multi = false,
	Required = true,
	Options = {"Normal","Hard","Nightmare"},
	Default = "",
	Callback = function(Value)
	getgenv().DifficultySelect =Value 
	end,
}, "SelectDifficultySelect")

sections.MainSection2:Header({
	Name = "Ranger Configs:"
})

local Dropdown = sections.MainSection2:Dropdown({
	Name = "World:",
	Multi = false,
	Required = true,
	Options = {"OnePiece", "Namek", "DemonSlayer", "Naruto","OPM"},
	Default = "",
	Callback = function(Value)
		getgenv().WorldSelectRanger = Value 
	end,
}, "SelectWorldStoryRanger")

local Dropdown = sections.MainSection2:Dropdown({
	Name = "Act:",
	Multi = false,
	Required = true,
	Options = {"1","2","3"},
	Default = "",
	Callback = function(Value)
	getgenv().ActSelectRanger =Value 
	end,
}, "SelectActRanger")

local join = sections.MainSection1:Toggle({
	Name = "Create Config Type World",
	Default = false,
	Callback = function(value)
		getgenv().CreatePortal = value 

		if not value then return end

		if game:GetService("Players").LocalPlayer:FindFirstChild("UnitsFolder") then return end

		coroutine.wrap(function()
			while getgenv().CreatePortal do
				local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
				local replicatedStorage = game:GetService("ReplicatedStorage")
				local playRoomEvent = replicatedStorage:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event")

				if getgenv().TypePortal == "Story" then

					if not playerGui.PlayRoom.Main.GameStage.Visible then
						playRoomEvent:FireServer("Create")
						task.wait(0.5)

						playRoomEvent:FireServer("Change-World", { World = getgenv().WorldSelect })
						task.wait(0.5)

						playRoomEvent:FireServer("Change-Chapter", {
							Chapter = getgenv().WorldSelect .. "_Chapter" .. getgenv().ActSelect
						})
						task.wait(0.5)

						local args = {
							[1] = "Change-Difficulty",
							[2] = {
								["Difficulty"] = getgenv().DifficultySelect
							}
						}
						
						game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer(unpack(args))

						task.wait(.5)
						playRoomEvent:FireServer("Submit")
						task.wait(0.5)

						playRoomEvent:FireServer("Start")
					end

				elseif getgenv().TypePortal == "Ranger" then
					if not playerGui.PlayRoom.Main.GameStage.Visible then
						playRoomEvent:FireServer("Create")
						task.wait(0.5)

						playRoomEvent:FireServer("Change-Mode", { Mode = "Ranger Stage" })
						task.wait(0.5)

						local args = {
							[1] = "Change-World",
							[2] = {
								["World"] = getgenv().WorldSelectRanger
							}
						}
						
						game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer(unpack(args))

						task.wait(.5)
						playRoomEvent:FireServer("Change-Chapter", {
							Chapter = getgenv().WorldSelectRanger .. "_RangerStage" .. getgenv().ActSelectRanger
						})
						task.wait(0.5)

						playRoomEvent:FireServer("Submit")
						task.wait(0.5)

						playRoomEvent:FireServer("Start")
					end
				elseif getgenv().TypePortal == "Raid" then
                    return
					Window:Notify({
                        Title = "L-Hub",
                        Description = "Still on progress...",
                        Lifetime = 5
                    })
                elseif getgenv().TypePortal == "Infinity Castle" then
                    return
					Window:Notify({
                        Title = "L-Hub",
                        Description = "Still on progress...",
                        Lifetime = 5
                    })
				elseif getgenv().TypePortal == "Boss-Event" then
					local args = {
						[1] = "Boss-Event"
					}
					
					game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer(unpack(args))
                elseif getgenv().TypePortal == "Challenge" then
					
					playRoomEvent:FireServer("Create")
					task.wait(0.5)
					local args = {
						[1] = "Create",
						[2] = {
							["CreateChallengeRoom"] = true
						}
					}
					
					game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer(unpack(args))
					task.wait(0.5)

					playRoomEvent:FireServer("Start")
				elseif getgenv().TypePortal == "Easter-Event" then
					playRoomEvent:FireServer("Create")
					task.wait(0.5)
					local args = {
						[1] = "Easter-Event"
					}
					
					game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer(unpack(args))
					task.wait(0.5)
					playRoomEvent:FireServer("Start")
				end

				task.wait(1)
			end
		end)()
	end,
}, "CreatePortal")





sections.MainSection3:Header({
	Name = "In-Match Configs:"
})

sections.MainSection3:Toggle({
	Name = "Auto Vote Start",
	Default = false,
	Callback = function(value)
		getgenv().AutoVoteStart = value
        while task.wait(.5) do 
			 if AutoVoteStart == true then 
		 
				if game:GetService("Players").LocalPlayer.PlayerGui.HUD.InGame.VotePlaying.Visible == true then 

                    game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("OnGame"):WaitForChild("Voting"):WaitForChild("VotePlaying"):FireServer()

					
				end 

			 else
				wait()
				break
			 end 
			end 
	end,
}, "AutoVoteStartToggle")

sections.MainSection3:Toggle({
	Name = "Auto Play",
	Default = false,
	Callback = function(value)
		getgenv().AutoSelectCard = value
        while task.wait(.5) do 
			 if AutoSelectCard == true then 
		 
				if game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].Data.AutoPlay.Value == false then 

                    game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("Units"):WaitForChild("AutoPlay"):FireServer()

				end 

			 else
				wait()
				break
			 end 
			end 
	end,
}, "AutoPlayToggle")

sections.MainSection3:Toggle({
	Name = "Auto UP Maximum Yen [In-Match]",
	Default = false,
	Callback = function(value)

		if value then 
			Window:Dialog({
				Title = "L-hub notify",
				Description = "this upgrade is for in-match not in lobby. Which mean u need max Yen to upgrade it.",
				Buttons = {
					{
						Name = "Bet daddy kazoun~",
						Callback = function()
							print("Confirmed!")
						end,
					},
				}
			})
		end 
		getgenv().AutoUpgradeYen = value
        while task.wait(.5) do 
			 if AutoUpgradeYen == true then 
		 
				local args = {
					[1] = "MaximumYen"
				}
				
				game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("Gameplay"):WaitForChild("StatsManager"):FireServer(unpack(args))
				

			 else
				wait()
				break
			 end 
			end 
	end,
}, "AutoUpgradeYenToggle")

local methodaction = sections.MainSection3:Dropdown({
	Name = "Select Action After: ",
	Multi = false,
	Required = true,
	Options = {"Retry","Next Stage","Return To Lobby"},
	Default = "None",
	Callback = function(Value)
		getgenv().Method = Value 
	end,
}, "Method")



sections.MainSection4:Header({
	Name = "Player Info:"
})

local player = game.Players.LocalPlayer
local dataFolder = game:GetService("ReplicatedStorage").Player_Data[player.Name].Data

local labels = {"Gem", "Gold", "Exp", "CurseToken", "MaxCollection", "Title"}
local labelObjects = {}
local previousValues = {}

-- Create labels and connect updates
for _, valueName in pairs(labels) do
	local valueObj = dataFolder:FindFirstChild(valueName)
	if valueObj and valueObj:IsA("ValueBase") then
		-- Store the initial value
		previousValues[valueName] = valueObj.Value

		-- Create the label with the initial value
		local label = sections.MainSection4:Label({
			Text = valueName .. ": " .. tostring(valueObj.Value)
		})

		labelObjects[valueName] = label

		-- Listen for changes on Value
		valueObj:GetPropertyChangedSignal("Value"):Connect(function()
			local newValue = valueObj.Value
			local previous = previousValues[valueName]
		
			local newText = valueName .. ": " .. tostring(newValue)
		
			-- Only show difference for number values
			if typeof(newValue) == "number" and typeof(previous) == "number" then
				local difference = newValue - previous
				if difference ~= 0 then
					newText = newText .. " (+" .. tostring(difference) .. " last match)"
				end
			elseif typeof(newValue) == "string" and newValue ~= previous then
				newText = newText .. " (changed from: " .. tostring(previous) .. ")"
			end
		
			label:UpdateName(newText)
			previousValues[valueName] = newValue
		end)
		
	end
end


sections.MainSection5:Header({
	Name = "Player Inventory Info:"
})

local player = game.Players.LocalPlayer
local dataFolder = game:GetService("ReplicatedStorage").Player_Data[player.Name].Items

local labels = {}
local previousAmounts = {}

-- Create initial labels for each value in Data
for _, valueObj in pairs(dataFolder:GetChildren()) do
    if valueObj:IsA("Folder") and valueObj:FindFirstChild("Amount") then
        -- Store the initial value
        previousAmounts[valueObj.Name] = valueObj.Amount.Value

        -- Create the label with the initial value
        local label = sections.MainSection5:Label({
            Text = valueObj.Name .. ": " .. tostring(valueObj.Amount.Value)
        })

        -- Store the label to update later
        labels[valueObj.Name] = label

        -- Listen for changes on Amount.Value
        valueObj.Amount:GetPropertyChangedSignal("Value"):Connect(function()
            local newAmount = valueObj.Amount.Value
            local difference = newAmount - previousAmounts[valueObj.Name]

            -- Update the label text with the difference
            local newText = valueObj.Name .. ": " .. tostring(newAmount)
            if difference ~= 0 then
                newText = newText .. " (+ " .. tostring(difference) .. " last match)"
            end

            labels[valueObj.Name]:UpdateName(newText)

            -- Update the previous value for the next comparison
            previousAmounts[valueObj.Name] = newAmount
        end)
    end
end

sections.MainSection6:Header({
	Name = "Player Stats Info:"
})

local player = game.Players.LocalPlayer
local dataFolder = game:GetService("ReplicatedStorage").Player_Data[player.Name].Stats

local labels = {}
local previousAmounts = {}

-- Create initial labels for each value in Data
for _, valueObj in pairs(dataFolder:GetChildren()) do
    if valueObj:IsA("NumberValue")  then
        -- Store the initial value
        previousAmounts[valueObj.Name] = valueObj.Value

        -- Create the label with the initial value
        local label = sections.MainSection6:Label({
            Text = valueObj.Name .. ": " .. tostring(valueObj.Value)
        })

        -- Store the label to update later
        labels[valueObj.Name] = label

        -- Listen for changes on Amount.Value
        valueObj:GetPropertyChangedSignal("Value"):Connect(function()
            local newAmount = valueObj.Value
            local difference = newAmount - previousAmounts[valueObj.Name]

            -- Update the label text with the difference
            local newText = valueObj.Name .. ": " .. tostring(newAmount)
            if difference ~= 0 then
                newText = newText .. " (+ " .. tostring(difference) .. " last match)"
            end

            labels[valueObj.Name]:UpdateName(newText)

            -- Update the previous value for the next comparison
            previousAmounts[valueObj.Name] = newAmount
        end)
    end
end

sections.MainSection15:Header({
	Name = "Units Dropped In Match:"
})


sections.MainSection15:Toggle({
	Name = "Update If Dropped Units",
	Default = false,
	Callback = function(value)
		getgenv().AutoUpdateUnitDrop = value 
		 while task.wait(.5) do 
			 if getgenv().AutoUpdateUnitDrop  == true then 

				if game:GetService("Players").LocalPlayer:FindFirstChild("RewardsShow") then
				local labels = {}
 local unitsinfo= game:GetService("Players").LocalPlayer.RewardsShow
local function updateTextLabel(valueObj)
    local label = sections.MainSection15:Label({
        Text = valueObj.Name
    })
    labels[valueObj.Name] = label
end

unitsinfo.ChildAdded:Connect(function(valueObj)
    if valueObj:IsA("Folder") and (valueObj.Name =="Yuta" or valueObj.Name == "Ace" or valueObj.Name == "Gogeta" or valueObj.Name == "Madara") then
        updateTextLabel(valueObj)
    end
end)
break
end
			 else
				wait()
				break 
			 end 
			end 

	end,
}, "AutoUpdateUnitsToggle")

sections.MainSection15:Label({
	Text = "Unit dropped will update under here after u toggled."
})


sections.MainSection17:Divider()

sections.MainSection17:Header({
	Name = "Current Challenge Info:"
})


local challengeData = game:GetService("ReplicatedStorage").Gameplay.Game.Challenge:GetChildren()
local itemsFolder = game:GetService("ReplicatedStorage").Gameplay.Game.Challenge:FindFirstChild("Items")
local player = game.Players.LocalPlayer

local labels = {}
local previousAmounts = {}

-- Display all challenge string values
for _, valueObj in pairs(challengeData) do
    if valueObj:IsA("ValueBase") then 
        previousAmounts[valueObj.Name] = valueObj.Value

        local label = sections.MainSection17:Label({
            Text = valueObj.Name .. ": " .. tostring(valueObj.Value)
        })

        labels[valueObj.Name] = label

        valueObj:GetPropertyChangedSignal("Value"):Connect(function()
            local newAmount = valueObj.Value
            local previous = previousAmounts[valueObj.Name]

            local newText = valueObj.Name .. ": " .. tostring(newAmount)
            if newAmount ~= previous then
                newText = newText .. " (changed from: " .. tostring(previous) .. ")"
            end

            labels[valueObj.Name]:UpdateName(newText)
            previousAmounts[valueObj.Name] = newAmount
        end)
    end
end



sections.MainSection7:Divider()
sections.MainSection7:Header({ Name = "Current Items Drop:" })

local itemsFolder = game:GetService("ReplicatedStorage").Gameplay.Game.Challenge:FindFirstChild("Items")
local player = game.Players.LocalPlayer

local labels = {}
local previousNames = {}

if itemsFolder then
    for _, valueObj in pairs(itemsFolder:GetChildren()) do
        if valueObj:IsA("ValueBase") then 
            previousNames[valueObj] = valueObj.Name

            local label = sections.MainSection7:Label({
                Text = valueObj.Name
            })

            labels[valueObj] = label

            -- Update when the .Value changes (optional, but included)
            valueObj:GetPropertyChangedSignal("Value"):Connect(function()
                local newText = valueObj.Name
                labels[valueObj]:UpdateName(newText)
            end)

            -- Update when the .Name changes
            valueObj:GetPropertyChangedSignal("Name"):Connect(function()
                local newName = valueObj.Name
                local oldName = previousNames[valueObj]

                local label = labels[valueObj]
                if label then
                    label:UpdateName(newName .. " (changed from: " .. oldName .. ")")
                end

                previousNames[valueObj] = newName
            end)
        end
    end
end

local items = {}
for i, v in pairs(game:GetService("ReplicatedStorage").Assets.ItemModels.Models:GetDescendants()) do
    if v:IsA("Folder") and v.Name ~= "Gears" and v.Name ~= "[for-showing]" then
        for _, model in pairs(v:GetChildren()) do
            if model:IsA("Model") then
              table.insert(items, model.Name)
            end
        end
    end
end


sections.MainSection18:Header({
	Name = "Auto-Join Specific Rewards Challenges:"
})

local multiitemchallenge = sections.MainSection18:Dropdown({
	Name = "Select Multi Rewards:",
	Search = true,
	Multi = true,
	Required = false,
	Options = items,
	Default = {"None"},
	Callback = function(Value)
		getgenv().WantedItemsForChallenge = {}
		for i, v in pairs(Value) do
			table.insert(getgenv().WantedItemsForChallenge, i)  -- Insert the key (i) into the table
		end
		print("Wanted Multi Items Challenge changed:", table.concat(getgenv().WantedItemsForChallenge, ","))
		
	end,
}, "multiitemchallengeDP")

sections.MainSection18:Toggle({
	Name = "Auto Join Selected Rewards",
	Default = false,
	Callback = function(value)

		if game:GetService("Players").LocalPlayer:FindFirstChild("UnitsFolder") then return end

		getgenv().AutoJoinChallengeSelected = value 
		while task.wait(.5) do 
			 if 	getgenv().AutoJoinChallengeSelected == true then 

					local itemsFolders = game:GetService("ReplicatedStorage").Gameplay.Game.Challenge.Items
local found = {}
for _, items in pairs(itemsFolders:GetChildren()) do
    found[items.Name] = true
end

for _, wantedName in pairs(getgenv().WantedItemsForChallenge) do
    if found[wantedName] then
		local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
		local replicatedStorage = game:GetService("ReplicatedStorage")
		local playRoomEvent = replicatedStorage:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event")

			playRoomEvent:FireServer("Create")
			task.wait(0.5)
			local args = {
				[1] = "Create",
				[2] = {
					["CreateChallengeRoom"] = true
				}
			}
			
			game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer(unpack(args))
			task.wait(0.5)

			playRoomEvent:FireServer("Start")
    end
end

			 else
				wait()
				break 
			 end 
			end
	end,
}, "AutoJoinChallengeSelectedToggle")



local units = {}
if game.PlaceId ~= 72829404259339 then 
for i, v in pairs(game:GetService("Players").LocalPlayer.UnitsFolder:GetChildren()) do
    if v:IsA("Folder") then
        table.insert(units, tostring(v.Name))
    end
end
elseif game.PlaceId == 72829404259339 then
for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Profile.Container.Units.Frame:GetChildren()) do
    if v:IsA("TextButton") and v.Name ~= "None" then
        table.insert(units, tostring(v.Name))
    end
end
end 




getgenv().Unit1ForPlace = "None"
getgenv().Unit2ForPlace = "None"
getgenv().Unit3ForPlace = "None"
getgenv().Unit4ForPlace = "None"
getgenv().Unit5ForPlace = "None"
getgenv().Unit6ForPlace = "None"


sections.MainSection14:Header({
	Name = "Specific Place:"
})

local Place1 = sections.MainSection14:Dropdown({
	Name = "Select Unit [1st]:",
	Multi = false,
	Required = true,
	Options = units,
	Default =  "None",
	Callback = function(Value)
		getgenv().Unit1ForPlace = Value 
		


	end,
}, "UpgradeSmartUnit1ForPlace")
local Place2 = sections.MainSection14:Dropdown({
	Name = "Select Unit [2nd]:",
	Multi = false,
	Required = true,
	Options = units,
	Default = "None",
	Callback = function(Value)
		getgenv().Unit2ForPlace = Value 
		


	end,
}, "UpgradeSmartUnit2ForPlace")
local Place3 = sections.MainSection14:Dropdown({
	Name = "Select Unit [3rd]:",
	Multi = false,
	Required = true,
	Options = units,
	Default =  "None",
	Callback = function(Value)
		getgenv().Unit3ForPlace = Value 
		


	end,
}, "UpgradeSmartUnit3ForPlace")
local Place4 = sections.MainSection14:Dropdown({
	Name = "Select Unit [4th]:",
	Multi = false,
	Required = true,
	Options = units,
	Default =  "None",
	Callback = function(Value)
		getgenv().Unit4ForPlace = Value 
		


	end,
}, "UpgradeSmartUnit4ForPlace")
local Place5 = sections.MainSection14:Dropdown({
	Name = "Select Unit [5th]:",
	Multi = false,
	Required = true,
	Options = units,
	Default =  "None",
	Callback = function(Value)
		getgenv().Unit5ForPlace = Value 
		


	end,
}, "UpgradeSmartUnit5ForPlace")

local Place6 = sections.MainSection14:Dropdown({
	Name = "Select Unit [6th]:",
	Multi = false,
	Required = true,
	Options = units,
	Default =  "None",
	Callback = function(Value)
		getgenv().Unit6ForPlace = Value 
		


	end,
}, "UpgradeSmartUnit6ForPlace")

sections.MainSection14:Button({
	Name = "Reset All Units Selected",
	Callback = function()
		            Place1:UpdateSelection("None")
					Place2:UpdateSelection("None") 
					Place3:UpdateSelection("None") 
					Place4:UpdateSelection("None") 
					Place5:UpdateSelection("None") 
					Place6:UpdateSelection("None")

					Window:Notify({
						Title = Window.Settings.Title,
						Description = "Successfully Reset All Units Selected!"
					})

	end,
})

getgenv().TimeDelay = 1

sections.MainSection14:Input({
	Name = "Delay To Place(s):",
	Placeholder = "seconds",
	AcceptedCharacters = "All",
	Callback = function(input)
		Window:Notify({
			Title = Window.Settings.Title,
			Description = "Successfully set delay to " .. input
		})
	end,
	onChanged = function(input)
		getgenv().TimeDelay = tonumber(input)
	end,
}, "TimeDelayInput")

sections.MainSection14:Toggle({
	Name = "Auto Place Specific Units",
	Default = false,
	Callback = function(value)
		 getgenv().AutoPlaceSpecific = value 
		  while task.wait(getgenv().TimeDelay) do 
			 if  getgenv().AutoPlaceSpecific == true then 
            
				local units = {
					getgenv().Unit1ForPlace or "None",
					getgenv().Unit2ForPlace or "None",
					getgenv().Unit3ForPlace or "None",
					getgenv().Unit4ForPlace or "None",
					getgenv().Unit5ForPlace or "None",
					getgenv().Unit6ForPlace or "None"
				}
				
				for i, v in ipairs(units) do
					if v ~= "None" then
						local args = {
							[1] = game:GetService("Players").LocalPlayer.UnitsFolder:WaitForChild(v)
						}
						game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("Units"):WaitForChild("Deployment"):FireServer(unpack(args))
						print(v .. " was chosen to place")
					end
				end
				
			 else
				wait() 
				break 
			 end 
			end 
	end,
}, "AutoPlaceSpecificToggle")



sections.MainSection14:Paragraph({
	Header = "Note:",
	Body = "If you see ur units not spawn, that mean it reached the limit of that units.  \n\nIf you dont set time delay for Place & Upgrade, the default time delay is 1"
})


sections.MainSection8:Header({
	Name = "Specific Upgrades:"
})



getgenv().Unit1 = "None"
getgenv().Unit2 = "None"
getgenv().Unit3 = "None"
getgenv().Unit4 = "None"
getgenv().Unit5 = "None"
getgenv().Unit6 = "None"

getgenv().SmartUpgrade1 = 10
getgenv().SmartUpgrade2 = 10
getgenv().SmartUpgrade3 = 10
getgenv().SmartUpgrade4 = 10
getgenv().SmartUpgrade5 = 10
getgenv().SmartUpgrade6 = 10

local Upgrade1 = sections.MainSection8:Dropdown({
	Name = "Select Unit [1st]:",
	Multi = false,
	Required = true,
	Options = units,
	Default =  "None",
	Callback = function(Value)
		getgenv().Unit1 = Value 
		


	end,
}, "UpgradeSmartUnit1")
local Upgrade2 = sections.MainSection8:Dropdown({
	Name = "Select Unit [2nd]:",
	Multi = false,
	Required = true,
	Options = units,
	Default =  "None",
	Callback = function(Value)
		getgenv().Unit2 = Value 
		


	end,
}, "UpgradeSmartUnit2")
local Upgrade3 = sections.MainSection8:Dropdown({
	Name = "Select Unit [3rd]:",
	Multi = false,
	Required = true,
	Options = units,
	Default =  "None",
	Callback = function(Value)
		getgenv().Unit3 = Value 
		


	end,
}, "UpgradeSmartUnit3")
local Upgrade4 = sections.MainSection8:Dropdown({
	Name = "Select Unit [4th]:",
	Multi = false,
	Required = true,
	Options = units,
	Default =  "None",
	Callback = function(Value)
		getgenv().Unit4 = Value 
		


	end,
}, "UpgradeSmartUnit4")
local Upgrade5 = sections.MainSection8:Dropdown({
	Name = "Select Unit [5th]:",
	Multi = false,
	Required = true,
	Options = units,
	Default =  "None",
	Callback = function(Value)
		getgenv().Unit5 = Value 
		


	end,
}, "UpgradeSmartUnit5")

local Upgrade6 = sections.MainSection8:Dropdown({
	Name = "Select Unit [6th]:",
	Multi = false,
	Required = true,
	Options = units,
	Default =  "None",
	Callback = function(Value)
		getgenv().Unit6 = Value 
		


	end,
}, "UpgradeSmartUnit6")

sections.MainSection10:Button({
	Name = "Reset All Units Selected",
	Callback = function()
		            Upgrade1:UpdateSelection("None")
					Upgrade2:UpdateSelection("None") 
					Upgrade3:UpdateSelection("None") 
					Upgrade4:UpdateSelection("None") 
					Upgrade5:UpdateSelection("None") 
					Upgrade6:UpdateSelection("None")

					Window:Notify({
						Title = Window.Settings.Title,
						Description = "Successfully Reset All Units Selected!"
					})

	end,
})


getgenv().TimeDelayUpgrade = 1 

sections.MainSection10:Input({
	Name = "Delay To Upgrade(s):",
	Placeholder = "seconds",
	AcceptedCharacters = "All",
	Callback = function(input)
		Window:Notify({
			Title = Window.Settings.Title,
			Description = "Successfully set delay to " .. input
		})
	end,
	onChanged = function(input)
		getgenv().TimeDelayUpgrade = tonumber(input)
	end,
}, "TimeDelayInputUpgrade")

sections.MainSection10:Toggle({
	Name = "Auto Upgrade Selected Units",
	Default = false,
	Callback = function(value)
		getgenv().AutoSmartUpgrade = value

		while task.wait(getgenv().TimeDelayUpgrade) do
			if 	getgenv().AutoSmartUpgrade == true then 

			local units = {
				getgenv().Unit1 or "None",
				getgenv().Unit2 or "None",
				getgenv().Unit3 or "None",
				getgenv().Unit4 or "None",
				getgenv().Unit5 or "None",
				getgenv().Unit6 or "None"
			}

			local smartUpgrades = {
				tonumber(getgenv().SmartUpgrade1) ,
				tonumber(getgenv().SmartUpgrade2),
				tonumber(getgenv().SmartUpgrade3) ,
				tonumber(getgenv().SmartUpgrade4) ,
				tonumber(getgenv().SmartUpgrade5) ,
				tonumber(getgenv().SmartUpgrade6)
			}

			for i = 1, 6 do
				local unit = units[i]
				local smartUpgrade = smartUpgrades[i]

				if unit ~= "None" then
					local scrollingFrame = game:GetService("Players").LocalPlayer.PlayerGui
						.HUD.InGame.UnitsManager.Main.Main.ScrollingFrame

					local unitFrame = scrollingFrame:FindFirstChild(unit)
					if not unitFrame or not unitFrame:FindFirstChild("UpgradeText") then
						warn("❌ Missing UI for " .. unit)
						continue
					end

					local upgradeLabel = unitFrame.UpgradeText 
					local currentUpgrade = tonumber(string.match(upgradeLabel.Text, "Upgrade:</font>%s*(%d+)")) or 0

					print("📊 " .. unit .. " current: " .. currentUpgrade .. " / target: " .. smartUpgrade)

					while currentUpgrade < smartUpgrade and getgenv().AutoSmartUpgrade do
						local unitObj = game:GetService("Players").LocalPlayer.UnitsFolder:FindFirstChild(unit)
						if not unitObj then
							warn("❌ Unit not found in UnitsFolder: " .. unit)
							break
						end

						print("⬆️ Upgrading " .. unit .. " (" .. currentUpgrade .. " → " .. smartUpgrade .. ")")

						local args = { [1] = unitObj }
						game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server")
							:WaitForChild("Units"):WaitForChild("Upgrade"):FireServer(unpack(args))

						task.wait(1)

						-- Refresh upgrade level
						currentUpgrade = tonumber(upgradeLabel.Text:match("%d+")) or 0
					end
				else
					print("⏩ Skipping slot " .. i .. " (None)")
				end
			end 
			end
		end
	end,
}, "AutoSmartUpgradeToggle")


local randomupgrade = sections.MainSection10:Toggle({
	Name = "Auto Random Upgrade",
	Default = false,
	Callback = function(value)
		getgenv().AutoRandomUpgrade = value
        while task.wait(.5) do 
			 if AutoRandomUpgrade == true then 

   for i,v in pairs(game:GetService("Players").LocalPlayer.UnitsFolder:GetChildren()) do 
	local args = {
		[1] = game:GetService("Players").LocalPlayer.UnitsFolder[v.Name]
	}
	
	game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("Units"):WaitForChild("Upgrade"):FireServer(unpack(args))
	
   end 
			 else
				wait()
				break
			 end 
			end 
	end,
}, "AutoRandomUpgradeToggle")


sections.MainSection11:Header({
	Text = "All Rangers Auto Join:"
})



local AutoCompleteForChoose = sections.MainSection11:Dropdown({
	Name = "Auto Join X After Done All:",
	Multi = false,
	Required = true,
	Options = {"Story","Ranger","Raid","Challenge","Infinity Castle","Boss-Event","Easter-Event"},
	Default = "",
	Callback = function(Value)
		getgenv().WaitRangers = Value 
	end,
}, "AutoCompleteForChooseSelect")

local Players = game:GetService("Players")
				local GuiService = game:GetService("GuiService")
				local vim = game:GetService("VirtualInputManager")
	
				local Player = Players.LocalPlayer
				local Gui = Player.PlayerGui
				local inset1, inset2 = GuiService:GetGuiInset()
				local insetOffset = inset1 - inset2
	
				local function click(part, offsetX, offsetY)
					if not part or not part:IsA("GuiObject") then return end
					local topLeft = part.AbsolutePosition + insetOffset
					local center = topLeft + (part.AbsoluteSize / 2)
					local X = center.X + (offsetX or 0)
					local Y = center.Y + (offsetY or 0)
	
					vim:SendMouseButtonEvent(X, Y, 0, true, game, 0)
					task.wait()
					vim:SendMouseButtonEvent(X, Y, 0, false, game, 0)
				end


local playerGui = game:GetService("Players").LocalPlayer.PlayerGui
local replicatedStorage = game:GetService("ReplicatedStorage")
local playRoomEvent = replicatedStorage:WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event")

local completeall = sections.MainSection11:Toggle({
	Name = "Auto Complete All Rangers Stage",
	Default = false,
	Callback = function(value)
		getgenv().AutoCompleteRangersStage = value

		if game:GetService("Players").LocalPlayer:FindFirstChild("UnitsFolder") then return end
	
	if join.State == true then 
		join:UpdateState(false) 
	end 

		while task.wait(.5) do
			if not AutoCompleteRangersStage then break end
	
		
	
				game:GetService("Players").LocalPlayer.PlayerGui.PlayRoom.Enabled =true 
task.wait(.9)
local args = {
    [1] = "Create"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer(unpack(args))
task.wait(.9)
local args = {
    [1] = "Change-Mode",
    [2] = {
        ["Mode"] = "Ranger Stage"
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer(unpack(args))
task.wait(.9)
local args = {
    [1] = "Change-World",
    [2] = {
        ["World"] = "OnePiece"
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer(unpack(args))
task.wait(.9)
local args = {
    [1] = "Change-World",
    [2] = {
        ["World"] = "Namek"
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer(unpack(args))
task.wait(.9)
local args = {
    [1] = "Change-World",
    [2] = {
        ["World"] = "DemonSlayer"
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer(unpack(args))
task.wait(.9)
local args = {
    [1] = "Change-World",
    [2] = {
        ["World"] = "Naruto"
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer(unpack(args))
task.wait(.9)
local args = {
    [1] = "Change-World",
    [2] = {
        ["World"] = "OPM"
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer(unpack(args))
			
	task.wait(.9)
			-- Check if all RangerStageLock are locked
			local allLocked = true
			local chapters = game.Players.LocalPlayer.PlayerGui.PlayRoom.Main.GameStage.Main.Base.Chapter:GetDescendants()
	
			for _, v in pairs(chapters) do
				if v:IsA("Frame") and v.Name == "RangerStageLock" and v.Visible == false then
					allLocked = false
					break
				end
			end
	
			if allLocked then
				getgenv().AutoCompleteRangersStage = false -- Disable the toggle
				warn("[AutoCompleteRangersStage] All stages are locked, stopping automation.")
				task.wait(1)
				local args = {
					[1] = "Remove"
				}
				
				game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer(unpack(args))
				
				click(game:GetService("Players").LocalPlayer.PlayerGui.PlayRoom.Main.Button.Leave)
				task.wait(1)
				WorldSelectForAutoComplete:UpdateSelection(WaitRangers)
				join:UpdateState(true) -- auto join portal
				break
			end
	
			local playRoomEvent = game:GetService("ReplicatedStorage")
				:WaitForChild("Remote")
				:WaitForChild("Server")
				:WaitForChild("PlayRoom")
				:WaitForChild("Event")
	
			
				local priorityOrder = {"OnePiece", "Namek", "DemonSlayer", "Naruto", "OPM"}
local stageOrder = {"RangerStage1", "RangerStage2", "RangerStage3"}

for _, worldName in ipairs(priorityOrder) do
	for _, stageName in ipairs(stageOrder) do
		for _, v in pairs(chapters) do
			if v:IsA("Frame") and v.Name == "RangerStageLock" and v.Visible == false then
				local chapterFrame = v.Parent
				local worldFrame = chapterFrame.Parent

				local fullName = tostring(worldFrame.Name)
				local world, stage = string.match(fullName, "([^_]+)_([^_]+)")

				if world == worldName and stage == stageName then
					print("Selected:", world, stage)

					playRoomEvent:FireServer("Change-World", { World = world })
					task.wait(0.5)

					playRoomEvent:FireServer("Change-Chapter", { Chapter = fullName })
					task.wait(0.5)

					playRoomEvent:FireServer("Submit")
					task.wait(0.5)

					playRoomEvent:FireServer("Start")

					break
				end
			end
		end
	end
end


			end 
	end,
}, "AutoCompleteAllRangersStage")

sections.MainSection11:Toggle({
	Name = "TP Lobby If Ranger Unlocked",
	Default = false,
	Callback = function(value)
		getgenv().AutoLobby = value  
		while task.wait(.5) do 
			if AutoLobby == true then 

				local folder = game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].RangerStage
	local mode = game:GetService("Players").LocalPlayer.PlayerGui.HUD.InGame.Main.GameInfo.Gamemode.Label.Text

				  if game:GetService("Players").LocalPlayer:FindFirstChild("UnitsFolder") and mode ~= "Ranger Stage"  then
if #folder:GetChildren() == 0 then
	local gameId = "72829404259339"
	local TeleportService = game:GetService("TeleportService")
	local player = game.Players.LocalPlayer 
	TeleportService:Teleport(tonumber(gameId), player)
   break 
end
end 

			else
				wait()
				break
			end 
		end 
	end,
}, "AutoLobbyToggle")

sections.MainSection11:Button({
	Name = "Reset Selected",
	Callback = function()
		AutoCompleteForChoose:UpdateSelection("None")


					Window:Notify({
						Title = Window.Settings.Title,
						Description = "Successfully Reset Selected!"
					})

	end,
})

sections.MainSection16:Header({
	Text = "Specific Multiple Rangers Auto Join:"
})

local AutoCompleteForChooseSpecfic = sections.MainSection16:Dropdown({
	Name = "Auto Join X After Done All:",
	Multi = false,
	Required = true,
	Options = {"Story","Ranger","Raid","Challenge","Infinity Castle","Boss-Event","Easter-Event"},
	Default = "",
	Callback = function(Value)
		getgenv().WaitRangersSpecific = Value 
	end,
}, "AutoCompleteForChooseSelectSpecific")

local multispecficDP = sections.MainSection16:Dropdown({
	Name = "Select Multi Specific Rangers:",
	Search = true,
	Multi = true,
	Required = false,
	Options = {"OnePiece_RangerStage1","OnePiece_RangerStage2","OnePiece_RangerStage3","Namek_RangerStage1","Namek_RangerStage2","Namek_RangerStage3","DemonSlayer_RangerStage1","DemonSlayer_RangerStage2","DemonSlayer_RangerStage3","Naruto_RangerStage1","Naruto_RangerStage2","Naruto_RangerStage3","OPM_RangerStage1","OPM_RangerStage2","OPM_RangerStage3"},
	Default = {"None"},
	Callback = function(Value)
		getgenv().WantedRangers = {}
		for i, v in pairs(Value) do
			table.insert(getgenv().WantedRangers, i)  -- Insert the key (i) into the table
		end
		print("Wanted Multi Rangers changed:", table.concat(getgenv().WantedRangers, ","))
		
	end,
}, "MultiSpecificRangerDP")

local playergui =  game:GetService("Players").LocalPlayer.PlayerGui.PlayRoom.Main.GameStage.Main.Base.Chapter

local completespecific = sections.MainSection16:Toggle({
	Name = "Auto Complete Specific Rangers",
	Default = false,
	Callback = function(value)
		getgenv().AutoSpecificRangers = value

		if game:GetService("Players").LocalPlayer:FindFirstChild("UnitsFolder") then return end
	
		if join.State == true then 
			join:UpdateState(false) 
		end 

		while task.wait(.5) do
			if not AutoSpecificRangers then break end

				game:GetService("Players").LocalPlayer.PlayerGui.PlayRoom.Enabled =true 
task.wait(.6)
local args = {
    [1] = "Create"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer(unpack(args))
task.wait(.9)
local args = {
    [1] = "Change-Mode",
    [2] = {
        ["Mode"] = "Ranger Stage"
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer(unpack(args))
task.wait(.9)
local args = {
    [1] = "Change-World",
    [2] = {
        ["World"] = "OnePiece"
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer(unpack(args))
task.wait(.9)
local args = {
    [1] = "Change-World",
    [2] = {
        ["World"] = "Namek"
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer(unpack(args))
task.wait(.9)
local args = {
    [1] = "Change-World",
    [2] = {
        ["World"] = "DemonSlayer"
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer(unpack(args))
task.wait(.9)
local args = {
    [1] = "Change-World",
    [2] = {
        ["World"] = "Naruto"
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer(unpack(args))
task.wait(.9)
local args = {
    [1] = "Change-World",
    [2] = {
        ["World"] = "OPM"
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer(unpack(args))
			
	task.wait(.9)
			-- Check if all RangerStageLock are locked
			local allLocked = true

 for i,v in pairs(WantedRangers) do 
	local world, stage = string.match(v, "([^_]+)_([^_]+)")
if playergui[world][v].Inner:FindFirstChild("RangerStageLock") and playergui[world][v].Inner.RangerStageLock.Visible == false  then 
	allLocked = false
	break
end 
 end 


	
			if allLocked then
				getgenv().AutoSpecificRangers = false -- Disable the toggle
				warn("[AutoSpecificRangers] All stages are locked, stopping automation.")
				task.wait(1)
				local args = {
					[1] = "Remove"
				}
				
				game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("PlayRoom"):WaitForChild("Event"):FireServer(unpack(args))
				
				click(game:GetService("Players").LocalPlayer.PlayerGui.PlayRoom.Main.Button.Leave)
				task.wait(1)
				WorldSelectForAutoComplete:UpdateSelection(WaitRangersSpecific)
				join:UpdateState(true) -- auto join portal
				break
			end
	
			local playRoomEvent = game:GetService("ReplicatedStorage")
				:WaitForChild("Remote")
				:WaitForChild("Server")
				:WaitForChild("PlayRoom")
				:WaitForChild("Event")
	

				for i,v in pairs(WantedRangers) do 
					local world, stage = string.match(v, "([^_]+)_([^_]+)")
				if playergui[world][v].Inner:FindFirstChild("RangerStageLock") and playergui[world][v].Inner.RangerStageLock.Visible == false  then 
					print("Selected:", world, stage)

					playRoomEvent:FireServer("Change-World", { World = world })
					task.wait(0.5)

					playRoomEvent:FireServer("Change-Chapter", { Chapter = v })
					task.wait(0.5)

					playRoomEvent:FireServer("Submit")
					task.wait(0.5)

					playRoomEvent:FireServer("Start")

					break
				end
		end
	end 
	end,
}, "AutoSpecificRangersToggle")

sections.MainSection16:Toggle({
	Name = "TP Lobby If Specific Unlocked",
	Default = false,
	Callback = function(value)
		getgenv().AutoLobbySpecific = value  
		while task.wait(.5) do 
			if AutoLobbySpecific == true then 

	
	local mode = game:GetService("Players").LocalPlayer.PlayerGui.HUD.InGame.Main.GameInfo.Gamemode.Label.Text

				  if game:GetService("Players").LocalPlayer:FindFirstChild("UnitsFolder") and mode ~= "Ranger Stage"  then

local rangerFolder = game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].RangerStage
local found = {}

-- Mark which rangers exist
for _, ranger in pairs(rangerFolder:GetChildren()) do
    found[ranger.Name] = true
end

-- Check if any wanted ranger is missing
for _, wantedName in pairs(getgenv().WantedRangers) do
    if not found[wantedName] then
		local gameId = "72829404259339"
		local TeleportService = game:GetService("TeleportService")
		local player = game.Players.LocalPlayer 
		TeleportService:Teleport(tonumber(gameId), player)
		break
    end
end

end 
			else
				wait()
				break
			end 
		end 
	end,
}, "AutoLobbySpecificToggle")


sections.MainSection16:Button({
	Name = "Reset Selected",
	Callback = function()
		multispecficDP:UpdateSelection("None")
		AutoCompleteForChooseSpecfic:UpdateSelection("None")


					Window:Notify({
						Title = Window.Settings.Title,
						Description = "Successfully Reset Selected!"
					})

	end,
})

sections.MainSection11:Paragraph({
	Header = "How to use Auto Complete:",
	Body = "Auto-Complete auto set next stage, other modes auto set retry. \n\nIf you completed all Rangers, it's auto do the thing u selected while waiting rangers unlocked all. \n\n MAKE SURE TO SELECT CONFIG"
})

sections.MainSection12:Header({
	Name = "Webhook:"
})
local MultiDropdown = sections.MainSection12:Dropdown({
	Name = "Select Units/Items To Notify:",
	Search = true,
	Multi = true,
	Required = false,
	Options = {"Everything","Onigiri","Sunrise Earrings","Blood Ember","Cursed Core","Dark Essence","Demon Fang Shard","Moonroot Herb","Flame Seal Tag","Mirror Lens","Soul Core","Slayer Stone Fragment","Stats Key","Perfect Stats Key","Cursed Finger","Dr. Megga Punk","Trait Reroll","Ranger Crystal","Luck Potion","Green Bean","Narmekian Ore","Power Core","Dracoscale Shard","Arcane Dust","Narmekian Crystal","Nano Fiber Wire","Micro Circuit Board"
,"Phantom Alloy","Enhanced Optical Lens","Energy Vial","Ramen","Storm Flake Crystal","Shadow Fiber","Seal of Gale","Chakra Shard","Ancient Talisman","Smoke Orb","Scroll of Focus","Kunai Shards","Core of Silence","French Fries","Alpha Dust","Blast Cell","Chaos Bone Shard","Surge Nucleus","Mutant Core Fragment","Genesis Matrix","Neurochip Beta","Tactical Frame","SYN-Core","Rubber Fruit","Sea Gem Fragment","Soul Shard","Mystic Kelp","Will Core","Void Pearl"
,"Obsidian Plate","Marine Tech Chip","Combat Fluid","Ghost Lens","Ancient Power Core","Bunny Bounce Boots","Carrot Cutter","Fluffy Focus","Furrocious Fluff","Gogeta","Yuta","Madara","Ace"},
	Default = {'None'},
	Callback = function(Value)
		getgenv().WantedNotify = {}
		for i, v in pairs(Value) do
			table.insert(getgenv().WantedNotify, i)  -- Insert the key (i) into the table
		end
		print("ItemWebhookNotify changed:", table.concat(getgenv().WantedNotify, ","))
		
	end,
}, "UnitorItemsDP")

sections.MainSection12:Input({
	Name = "Enter Url:",
	Placeholder = "",
	AcceptedCharacters = "All",
	Callback = function(input)
		Window:Notify({
			Title = Window.Settings.Title,
			Description = "Successfully set url to " .. input
		})
	end,
	onChanged = function(input)
	 getgenv().Url = tostring(input)
	end,
}, "WebhookURL")

local autosend = sections.MainSection12:Toggle({
	Name = "Auto Send After Win/Lose",
	Default = false,
	Callback = function(value)
		getgenv().AutoSendWebhook = value
		getgenv().Url = getgenv().Url -- Replace this with your webhook
		
		local hasrun = false
		local player = game.Players.LocalPlayer
		local http = game:GetService("HttpService")
		
		function SendMessageEMBED(url, embed, pingEveryone)
			local headers = {
				["Content-Type"] = "application/json"
			}
		
			local data = {
				["content"] = pingEveryone and "@everyone" or nil, -- ✅ Only ping when needed
				["embeds"] = {
					{
						["title"] = embed.title,
						["description"] = embed.description,
						["color"] = embed.color or 0xffffff,
						["fields"] = embed.fields,
						["footer"] = {
							["text"] = embed.footer.text,
							["icon_url"] = embed.footer.icon_url
						},
						["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
					}
				}
			}
		
			local body = http:JSONEncode(data)
		
			local response = (syn and syn.request or request)({
				Url = url,
				Method = "POST",
				Headers = headers,
				Body = body
			})
		
			print("Sent " .. (pingEveryone and "with @everyone" or "without ping"))
		end
		
		-- Reset `hasrun` when RewardsUI is hidden again
		player.PlayerGui.RewardsUI:GetPropertyChangedSignal("Enabled"):Connect(function()
			if not player.PlayerGui.RewardsUI.Enabled then
				hasrun = false
			end
		end)
		
		-- Loop to check win condition
		while task.wait(0.5) do
			if getgenv().AutoSendWebhook == true then
				local gui = player.PlayerGui.RewardsUI
				if gui.Enabled and not hasrun then
					hasrun = true
		
					local playerName = "[" .. game:GetService("ReplicatedStorage").Player_Data[player.Name].Data.Level.Value .. "] ||" .. player.Name .. "||"
					local winorlose = gui.Main.LeftSide.GameStatus.Text
					local world = gui.Main.LeftSide.World.Text
					local mode = gui.Main.LeftSide.Mode.Text
					local chap = gui.Main.LeftSide.Chapter.Text
					local diff = gui.Main.LeftSide.Difficulty.Text
					local time = gui.Main.LeftSide.TotalTime.Text
		
					local rewards = {}
					for _, v in pairs(player.RewardsShow:GetChildren()) do
						if v:IsA('Folder') and (v.Name ~= "Exp" and v.Name ~= "Gold" and v.Name ~= "Gem" and v.Name ~= "Egg") and v:FindFirstChild("Amount") then
							table.insert(rewards, "\n" .. v.Name .. "(+" .. v.Amount.Value .. ")" .. " | Total: " .. game:GetService("ReplicatedStorage").Player_Data[player.Name].Items[v.Name].Amount.Value)
						end
					end
		
					if next(rewards) == nil then
						local currentTime = os.date("*t") -- gets local time
local hour = currentTime.hour
local minute = currentTime.min
local second = currentTime.sec


						print("No rewards found, skipping webhook. \nTime Finished: " .. "Hours: " .. string.format("%02d", hour) .. " | Minutes: " .. string.format("%02d", minute) .. " | Seconds: " .. string.format("%02d", second))
						Window:Notify({
							Title = "Webhook Notify",
							Description = "No rewards so not send webhook! \nTime Finished: " .. "Hours: " .. string.format("%02d", hour) .. " | Minutes: " .. string.format("%02d", minute) .. " | Seconds: " .. string.format("%02d", second),
							Lifetime = 50
						})
						continue
					end
		
					getgenv().Number = (winorlose == "~ WON" and 65280 or 16711680)
		
					for _, wantedItem in pairs(getgenv().WantedNotify) do
						local matched = false
						for _, rewardItem in pairs(player.RewardsShow:GetChildren()) do
							if wantedItem == tostring(rewardItem) then
								matched = true
							end
						end
		
						if matched or wantedItem == "Everything" then
							local embed = {
								title = "Anime Rangers X",
								description = nil,
								color = tonumber(getgenv().Number),
								fields = {
									{ name = "- Name", value = playerName, inline = false },
									{ name = "- Result", value = world .. winorlose .. "\n" .. chap .. " - ( " .. diff .. " )\n" .. time .. "\n - Rewards:" .. table.concat(rewards, ""), inline = false }
								},
								footer = {
									text = "L-Hub",
									icon_url = "" -- Optional: add icon if needed
								}
							}
		
							local shouldPing = (matched and wantedItem ~= "Everything")
SendMessageEMBED(getgenv().Url, embed, shouldPing)

						end
					end
				end
			else
				wait()
				break
			end
		end
		
	end,
}, "AutoSendWebhook")


sections.MainSection12:Paragraph({
	Header = "About Rewards:",
	Body = "Webhook will ignore Gems, EXP, Gold, Egg — All other rewards will be notified. \n\n Webhook auto ping @everyone if you select specific units/items \n\n You can select multiples specific items/units. \n\n If there are no rewards, webhook will send notify in ur game instead of discord."
})

local didControlPress = false


sections.MainSection3:Toggle({
	Name = "Auto Do Selected Action",
	Default = false,
	Callback = function(value)
		getgenv().AutoAfterWinLose = value
        while task.wait(.5) do 
			 if AutoAfterWinLose == true then 

				local mode = game:GetService("Players").LocalPlayer.PlayerGui.HUD.InGame.Main.GameInfo.Gamemode.Label.Text

				if completeall.State == true and mode == "Ranger Stage" then 
					methodaction:UpdateSelection("Next Stage")
				elseif completeall.State == true and (mode == "Challenge" or mode == "Story" or mode == "Boss-Event" or mode == "Event") then 
					methodaction:UpdateSelection("Retry")
				end
				

				if completespecific.State == true and mode == "Ranger Stage" then 
					methodaction:UpdateSelection("Next Stage")
				elseif completespecific.State == true and (mode == "Challenge" or mode == "Story" or mode == "Boss-Event" or mode == "Event") then 
					methodaction:UpdateSelection("Retry")
				end

                if getgenv().Method == "Retry" then 
					
if game:GetService("Players").LocalPlayer.PlayerGui.Visual:FindFirstChild("Showcase_Units")  and game:GetService("Players").LocalPlayer.PlayerGui.RewardsUI.Enabled == false then 
	task.wait(.5)
	game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 1)
				game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, 1)
elseif  game:GetService("Players").LocalPlayer.PlayerGui.RewardsUI.Enabled == true then
	if autosend.State == false then 
game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("OnGame"):WaitForChild("Voting"):WaitForChild("VoteRetry"):FireServer()
	elseif autosend.State == true then 
task.wait(1.2)
print('passed 1s start retry')
game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("OnGame"):WaitForChild("Voting"):WaitForChild("VoteRetry"):FireServer()
print("sent webhook now retry")
	end
				end

                
                elseif getgenv().Method == "Next Stage" then 
					if game:GetService("Players").LocalPlayer.PlayerGui.Visual:FindFirstChild("Showcase_Units") and game:GetService("Players").LocalPlayer.PlayerGui.RewardsUI.Enabled == false then 
						task.wait(.5)
						game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 1)
									game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, 1)
					elseif  game:GetService("Players").LocalPlayer.PlayerGui.RewardsUI.Enabled == true then

						if autosend.State == false then 
					game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("OnGame"):WaitForChild("Voting"):WaitForChild("VoteNext"):FireServer()
						elseif autosend.State == true then 
							
 task.wait(1.2)
 print('passed 1s start next')
 game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("OnGame"):WaitForChild("Voting"):WaitForChild("VoteNext"):FireServer()
 print("sent webhook now next")
					end 
									end
					
                elseif getgenv().Method == "Return To Lobby" then 
					 
					if game:GetService("Players").LocalPlayer.PlayerGui.Visual:FindFirstChild("Showcase_Units") and game:GetService("Players").LocalPlayer.PlayerGui.RewardsUI.Enabled == false then 
						game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 1)
									game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, 1)
					elseif  game:GetService("Players").LocalPlayer.PlayerGui.RewardsUI.Enabled == true then
			 if autosend.State == false then 
				local gameId = "72829404259339"
				local TeleportService = game:GetService("TeleportService")
				local player = game.Players.LocalPlayer 
				TeleportService:Teleport(tonumber(gameId), player)
               break 
					elseif autosend.State == true then 
 task.wait(1.2)
 local gameId = "72829404259339"
 local TeleportService = game:GetService("TeleportService")
 local player = game.Players.LocalPlayer 
 TeleportService:Teleport(tonumber(gameId), player)
 break
					end 

                    end
                end
                

			 else
				wait()
				break
			 end 
			end 
	end,
}, "AutoAfterWinLoseToggle")



local evo_items = {}
for i, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Crafting.Main.RightSide.InScrolling.ScrollingFrame:GetChildren()) do
    if v:IsA("Text Button") then
       table.insert(evo_items,v.Name)
    end
end


sections.MainSection19:Header({
	Name = "Auto-Craft:"
})

getgenv().WantedEvoItems = {}
local multiitemevo = sections.MainSection19:Dropdown({
	Name = "Select To Craft [Multi]:",
	Search = true,
	Multi = true,
	Required = false,
	Options = items,
	Default = {"None"},
	Callback = function(Value)
		getgenv().WantedEvoItems = {}
		for i, v in pairs(Value) do
			table.insert(getgenv().WantedEvoItems, i)  -- Insert the key (i) into the table
		end
		print("Wanted Multi Items Evo changed:", table.concat(getgenv().WantedEvoItems, ","))
		
	end,
}, "multiitemevoDP")


sections.MainSection19:Toggle({
	Name = "Auto Craft Selected Items",
	Default = false,
	Callback = function(value)
		getgenv().AutoCraft = value
		getgenv().DestroySystemMsg = value
		
		local player = game:GetService("Players").LocalPlayer
		local playerGui = player:WaitForChild("PlayerGui")
		
		-- 🔄 Store the connection
		local destroyMsgConnection = nil
		
		-- ⚙️ Dynamic handler
		local function UpdateDestroyListener()
			if getgenv().DestroySystemMsg then
				if not destroyMsgConnection or not destroyMsgConnection.Connected then
					destroyMsgConnection = playerGui.ChildAdded:Connect(function(child)
						if child.Name == "SystemMessage" then
							child:Destroy()
						end
					end)
				end
			else
				if destroyMsgConnection then
					destroyMsgConnection:Disconnect()
					destroyMsgConnection = nil
				end
			end
		end
		
		-- 👂 Monitor the toggle every half second
		task.spawn(function()
			while true do
				UpdateDestroyListener()
				task.wait(0.5)
			end
		end)
		
		-- 🔁 Auto-craft loop
		while task.wait(0.5) do 
			if getgenv().AutoCraft == true then 
				for i, v in pairs(getgenv().WantedEvoItems) do
					local args = {
						[1] = v,
						[2] = "1",
						[3] = "1"
					}
					
					game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("Crafting"):WaitForChild("Event"):FireServer(unpack(args))
					task.wait(0.5)
		
					-- 🧼 Backup manual destroy
					local systemMsg = playerGui:FindFirstChild("SystemMessage")
					if systemMsg and getgenv().DestroySystemMsg then
						systemMsg:Destroy()
					end 
				end 
			else
				wait()
				break
			end 
		end
		
	end,
}, "AutoCraftToggle")

sections.MainSection19:Label({
	Text = "You can auto craft in match!"
})


sections.MainSection22:Header({
	Name = "Enable/Disable UI [In-Match]:"
})


local Dropdown = sections.MainSection22:Dropdown({
	Name = "Select UI",
	Multi = false,
	Required = false,
	Options = {"Crafting","EvolveTier","FeedEXP","Items","LimitBreaks","Merchant","ShinyNormalize","StatsPotential","Traits","UnitsEvolve","UnitsGacha","ApplyCurse","EasterEggEvent"},
	Default = 1,
	Callback = function(Value)
		getgenv().UI = Value 
	end,
}, "UIDP")


sections.MainSection22:Toggle({
	Name = "Enable/Disable Selected UI",
	Default = false,
	Callback = function(value)
		game:GetService("Players").LocalPlayer.PlayerGui[getgenv().UI].Enabled = value 
	end,
}, "EnableUI")



sections.MainSection20:Header({
	Name = "Auto-Evo [For-Rerolls]:"
})


local multiunitevo = sections.MainSection20:Dropdown({
	Name = "Select Multi Units:",
	Search = false,
	Multi = true,
	Required = false,
	Options = {"Piccolo","Okarun"},
	Default = {"None"},
	Callback = function(Value)
		getgenv().WantedUnitForEvo = {}
		for i, v in pairs(Value) do
			table.insert(getgenv().WantedUnitForEvo, i)  -- Insert the key (i) into the table
		end
		print("Wanted Multi Units For Evo changed:", table.concat(getgenv().WantedUnitForEvo, ","))
		
	end,
}, "multiunitevoDP")


sections.MainSection20:Toggle({
	Name = "Auto Evo Selected Units",
	Default = false,
	Callback = function(value)
		getgenv().AutoEvo = value
	 while task.wait(.5) do 
		 if AutoEvo == true then 

			local unitsFolder = game:GetService("Players").LocalPlayer.PlayerGui.Collection.Main.Base.Space.Unit
			local found = {}
			
			for _, unit in pairs(unitsFolder:GetChildren()) do
				found[unit.Name] = unit
			end
			
			for _, wantedName in pairs(WantedUnitForEvo) do
				local unit = found[wantedName]
				if unit then
					local evoId = unit:GetAttribute("OnTemplateUnit")
					print("Trying to evolve:", wantedName, "->", evoId)
			
					if evoId then
						game:GetService("ReplicatedStorage").Remote.Server.Units.UnitsEvolve:FireServer(evoId)
					else
						warn("Missing OnTemplateUnit attribute for:", wantedName)
					end
				else
					warn("Unit not found:", wantedName)
				end
			end
			
			else
				wait()
				break
			end 
		end
		
	end,
}, "AutoEvoToggle")

sections.MainSection20:Label({
	Text = "You can auto evo units in match!"
})


sections.MainSection21:Header({
	Name = "Player Evo Items Info:"
})
local player = game.Players.LocalPlayer
local dataFolder = game:GetService("ReplicatedStorage").Player_Data[player.Name].Items

local labels = {"Turbo Statue", "Dragon Orb", "Trait Reroll"}
local labelObjects = {}
local previousValues = {}

-- Create labels and connect updates
for _, valueName in pairs(labels) do
	local valueObj = dataFolder:FindFirstChild(valueName)
	if valueObj and valueObj:IsA("Folder") then
		-- Store the initial value
		previousValues[valueName] = valueObj.Amount.Value

		-- Create the label with the initial value
		local label = sections.MainSection21:Label({
			Text = valueName .. ": " .. tostring(valueObj.Amount.Value)
		})

		labelObjects[valueName] = label

		-- Listen for changes on Value
		valueObj.Amount:GetPropertyChangedSignal("Value"):Connect(function()
			local newValue = valueObj.Amount.Value
			local previous = previousValues[valueName]
		
			local newText = valueName .. ": " .. tostring(newValue)
		
			-- Only show difference for number values
			if typeof(newValue) == "number" and typeof(previous) == "number" then
				local difference = newValue - previous
				if difference ~= 0 then
					newText = newText .. " (+" .. tostring(difference) .. " last evo)"
				end
			elseif typeof(newValue) == "string" and newValue ~= previous then
				newText = newText .. " (changed from: " .. tostring(previous) .. ")"
			end
		
			label:UpdateName(newText)
			previousValues[valueName] = newValue
		end)
		
	else
		-- Handle case when the item doesn't exist yet
		-- Keep checking for the item if it's not found
		dataFolder.ChildAdded:Connect(function(child)
			if child.Name == valueName and child:IsA("Folder") then
				previousValues[valueName] = child.Amount.Value

				-- Create the label once the item is added
				local label = sections.MainSection21:Label({
					Text = valueName .. ": " .. tostring(child.Amount.Value)
				})

				labelObjects[valueName] = label

				-- Listen for changes
				child.Amount:GetPropertyChangedSignal("Value"):Connect(function()
					local newValue = child.Amount.Value
					local previous = previousValues[valueName]

					local newText = valueName .. ": " .. tostring(newValue)

					-- Only show difference for number values
					if typeof(newValue) == "number" and typeof(previous) == "number" then
						local difference = newValue - previous
						if difference ~= 0 then
							newText = newText .. " (+" .. tostring(difference) .. " last evo)"
						end
					elseif typeof(newValue) == "string" and newValue ~= previous then
						newText = newText .. " (changed from: " .. tostring(previous) .. ")"
					end

					label:UpdateName(newText)
					previousValues[valueName] = newValue
				end)
			end
		end)
	end
end


sections.MainSection24:Header({
	Name = "Auto-Buy Items Easter Event:"
})


local player = game.Players.LocalPlayer
local dataFolder = game:GetService("ReplicatedStorage").Player_Data[player.Name].Data

local labels = {"Egg"}
local labelObjects = {}
local previousValues = {}

-- Create labels and connect updates
for _, valueName in pairs(labels) do
	local valueObj = dataFolder:FindFirstChild(valueName)
	if valueObj and valueObj:IsA("ValueBase") then
		-- Store the initial value
		previousValues[valueName] = valueObj.Value

		-- Create the label with the initial value
		local label = sections.MainSection24:Label({
			Text = valueName .. ": " .. tostring(valueObj.Value)
		})

		labelObjects[valueName] = label

		-- Listen for changes on Value
		valueObj:GetPropertyChangedSignal("Value"):Connect(function()
			local newValue = valueObj.Value
			local previous = previousValues[valueName]
		
			local newText = valueName .. ": " .. tostring(newValue)
		
			-- Only show difference for number values
			if typeof(newValue) == "number" and typeof(previous) == "number" then
				local difference = newValue - previous
				if difference ~= 0 then
					newText = newText .. " (+" .. tostring(difference) .. " last match)"
				end
			elseif typeof(newValue) == "string" and newValue ~= previous then
				newText = newText .. " (changed from: " .. tostring(previous) .. ")"
			end
		
			label:UpdateName(newText)
			previousValues[valueName] = newValue
		end)
		
	end
end

local easteritems = {}
 for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.EasterEggEvent.Main.Base.Main.ScrollingFrame:GetChildren()) do 
	 if v:IsA("Frame") then 
		table.insert(easteritems,v.Name)
	 end 
	end 

local multieasteritem = sections.MainSection24:Dropdown({
	Name = "Select Multi Items:",
	Search = true,
	Multi = true,
	Required = false,
	Options = easteritems,
	Default = {"None"},
	Callback = function(Value)
		getgenv().WantedItemsForEasterEvent = {}
		for i, v in pairs(Value) do
			table.insert(getgenv().WantedItemsForEasterEvent, i)  -- Insert the key (i) into the table
		end
		print("Wanted Multi Items Challenge changed:", table.concat(getgenv().WantedItemsForEasterEvent, ","))
		
	end,
}, "multieasteritemDP")

sections.MainSection24:Toggle({
	Name = "Auto Buy Multi Items",
	Default = false,
	Callback = function(value)
		 getgenv().AutoEasterBuy = value 
		  while task.wait(.5) do 
			 if AutoEasterBuy == true then 
				for i, v in pairs(WantedItemsForEasterEvent) do
					local args = {
						[1] = v,
						[2] = 1
					}
					
					game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("Gameplay"):WaitForChild("EasterEgg"):FireServer(unpack(args))
					
				end 
			 else
				 wait() 
				 break 
			 end 
			end 
	end,
}, "AutoBuyEasterToggle")

sections.MainSection24:Toggle({
	Name = "Auto Open Capsule",
	Default = false,
	Callback = function(value)
		getgenv().AutoOpenEgg = value
	 while task.wait(.5) do 
		 if AutoOpenEgg == true then 

			local args = {
				[1] = game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].Items["Egg Capsule"],
				[2] = {
					["SummonAmount"] = 1
				}
			}
			
			game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Server"):WaitForChild("Lobby"):WaitForChild("ItemUse"):FireServer(unpack(args))
			
			else
				wait()
				break
			end 
		end
		
	end,
}, "AutoOpenEggToggle")
------------------------ misc

sections.MainSection13:Header({
	Name = "Misc:"
})


sections.MainSection13:Toggle({
	Name = "Auto Hide UI When Executed",
	Default = false,
	Callback = function(value)
		getgenv().HideGUI = value

		while task.wait(5) do
			if getgenv().HideGUI == true then
				Window:SetState(false)
				task.wait(0.1)
				break
			end
		end
		

	end,
}, "AutoHideUI")

sections.MainSection13:Button({
	Name = "Remove Auto Load Config",
	Callback = function()
		if delfile then
			delfile("Maclib/settings/autoload.txt")
			Window:Notify({
				Title = "L-hub notify",
				Description = "Deleted AutoLoad Config, please rejoin.",
				Lifetime = 10
			})
		else
			print("delfile() is NOT supported.")
			Window:Notify({
				Title = "L-hub notify",
				Description = "Your executor not support delfile()...",
				Lifetime = 10
			})
		end
		
	end,
})



sections.MainSection13:Button({
	Name = "Open/Close UI",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/YOies/HideGUI/refs/heads/main/KazounProjects"))()
	end,
})

getgenv().ConfigName = "None"
getgenv().Config = "None"


sections.MainSection23:Header({
	Text = "Add Custom Configs:"
})

sections.MainSection23:Input({
	Name = "Name Config:",
	Placeholder = "",
	AcceptedCharacters = "All",
	Callback = function(input)
		Window:Notify({
			Title = Window.Settings.Title,
			Description = "Successfully set config name to " .. input
		})
	end,
	onChanged = function(input)
		getgenv().ConfigName = input
	end,
}, "ConfigNameInput")

sections.MainSection23:Input({
	Name = "Paste Config Here:",
	Placeholder = "",
	AcceptedCharacters = "All",
	Callback = function(input)
		Window:Notify({
			Title = Window.Settings.Title,
			Description = "Successfully pasted custom config"
		})
	end,
	onChanged = function(input)
		getgenv().Config = input
	end,
}, "ConfigInput")

sections.MainSection23:Button({
	Name = "Create Entered Config",
	Callback = function()
		
		writefile("Maclib/settings/" .. getgenv().ConfigName ..".json", game:GetService("HttpService"):JSONEncode({data = getgenv().Config}))

	end,
})

MacLib:SetFolder("Maclib")
tabs.Settings:InsertConfigSection("Left")

Window.onUnloaded(function()
	print("Unloaded!")
end)

if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Notification") then
	game:GetService("Players").LocalPlayer.PlayerGui.Notification:Destroy()
	end 

tabs.Main:Select()
MacLib:LoadAutoLoadConfig()


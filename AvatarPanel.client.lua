
-- HAMOUDY AVATAR PRO | CLIENT PANEL

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local remote = ReplicatedStorage:WaitForChild("HamoudyAvatarRemote")

local BLUE = Color3.fromRGB(48, 132, 255)
local BG = Color3.fromRGB(15, 18, 27)
local CARD = Color3.fromRGB(27, 33, 46)
local WHITE = Color3.fromRGB(242, 245, 255)

local gui = Instance.new("ScreenGui")
gui.Name = "HAMOUDY_AVATAR_PRO"
gui.ResetOnSpawn = false
gui.DisplayOrder = 50
gui.Parent = player:WaitForChild("PlayerGui")

local function round(object, radius)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, radius)
	c.Parent = object
end

local function makeLabel(parent, text, size, position, fontSize)
	local label = Instance.new("TextLabel")
	label.BackgroundTransparency = 1
	label.Text = text
	label.Size = size
	label.Position = position
	label.TextColor3 = WHITE
	label.Font = Enum.Font.GothamBold
	label.TextSize = fontSize
	label.Parent = parent
	return label
end

local function makeButton(parent, text, size, position, color)
	local button = Instance.new("TextButton")
	button.Size = size
	button.Position = position
	button.BackgroundColor3 = color
	button.Text = text
	button.TextColor3 = WHITE
	button.Font = Enum.Font.GothamBold
	button.TextSize = 13
	button.AutoButtonColor = true
	button.Parent = parent
	round(button, 9)
	return button
end

local login = Instance.new("Frame")
login.Size = UDim2.fromOffset(310, 205)
login.Position = UDim2.new(0.5, -155, 0.5, -102)
login.BackgroundColor3 = BG
login.Parent = gui
round(login, 15)

local loginStroke = Instance.new("UIStroke")
loginStroke.Color = BLUE
loginStroke.Thickness = 1.5
loginStroke.Parent = login

makeLabel(
	login, "HAMOUDY",
	UDim2.new(1, 0, 0, 36),
	UDim2.fromOffset(0, 20), 25
)

makeLabel(
	login, "AVATAR PRO ACCESS",
	UDim2.new(1, 0, 0, 20),
	UDim2.fromOffset(0, 55), 11
).TextColor3 = BLUE

local password = Instance.new("TextBox")
password.Size = UDim2.new(1, -32, 0, 40)
password.Position = UDim2.fromOffset(16, 87)
password.BackgroundColor3 = CARD
password.PlaceholderText = "Enter access password"
password.Text = ""
password.TextColor3 = WHITE
password.PlaceholderColor3 = Color3.fromRGB(145, 155, 175)
password.Font = Enum.Font.Gotham
password.TextSize = 14
password.ClearTextOnFocus = false
password.Parent = login
round(password, 8)

local loginButton = makeButton(
	login, "UNLOCK PANEL",
	UDim2.new(1, -32, 0, 38),
	UDim2.fromOffset(16, 140), BLUE
)

local panel = Instance.new("Frame")
panel.Size = UDim2.fromOffset(365, 430)
panel.Position = UDim2.new(0.5, -182, 0.5, -215)
panel.BackgroundColor3 = BG
panel.Visible = false
panel.ClipsDescendants = true
panel.Parent = gui
round(panel, 15)

local panelStroke = Instance.new("UIStroke")
panelStroke.Color = BLUE
panelStroke.Thickness = 1.5
panelStroke.Parent = panel

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 65)
header.BackgroundColor3 = CARD
header.Parent = panel
round(header, 15)

makeLabel(
	header, "HAMOUDY AVATAR PRO",
	UDim2.new(1, -55, 0, 32),
	UDim2.fromOffset(14, 5), 17
)

makeLabel(
	header, "AVATAR CUSTOMIZATION",
	UDim2.new(1, -55, 0, 18),
	UDim2.fromOffset(15, 36), 9
).TextColor3 = BLUE

local close = makeButton(
	header, "X", UDim2.fromOffset(32, 32),
	UDim2.new(1, -42, 0, 15),
	Color3.fromRGB(65, 71, 86)
)

local username = Instance.new("TextBox")
username.Size = UDim2.new(1, -24, 0, 37)
username.Position = UDim2.fromOffset(12, 76)
username.BackgroundColor3 = CARD
username.PlaceholderText = "Type any Roblox username"
username.Text = ""
username.TextColor3 = WHITE
username.PlaceholderColor3 = Color3.fromRGB(145, 155, 175)
username.Font = Enum.Font.Gotham
username.TextSize = 13
username.ClearTextOnFocus = false
username.Parent = panel
round(username, 8)

local apply = makeButton(
	panel, "APPLY AVATAR",
	UDim2.new(0.5, -18, 0, 34),
	UDim2.fromOffset(12, 120), BLUE
)

local reset = makeButton(
	panel, "RESET",
	UDim2.new(0.5, -18, 0, 34),
	UDim2.new(0.5, 6, 0, 120),
	Color3.fromRGB(54, 61, 77)
)

local categories = Instance.new("Frame")
categories.Size = UDim2.new(1, -24, 0, 34)
categories.Position = UDim2.fromOffset(12, 164)
categories.BackgroundTransparency = 1
categories.Parent = panel

local categoryLayout = Instance.new("UIListLayout")
categoryLayout.FillDirection = Enum.FillDirection.Horizontal
categoryLayout.Padding = UDim.new(0, 8)
categoryLayout.SortOrder = Enum.SortOrder.LayoutOrder
categoryLayout.Parent = categories

local list = Instance.new("ScrollingFrame")
list.Size = UDim2.new(1, -24, 0, 174)
list.Position = UDim2.fromOffset(12, 205)
list.BackgroundColor3 = CARD
list.BorderSizePixel = 0
list.ScrollBarThickness = 4
list.ScrollBarImageColor3 = BLUE
list.CanvasSize = UDim2.new()
list.AutomaticCanvasSize = Enum.AutomaticSize.Y
list.Parent = panel
round(list, 9)

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 7)
layout.SortOrder = Enum.SortOrder.LayoutOrder
layout.Parent = list

local status = makeLabel(
	panel, "Enter password to continue",
	UDim2.new(1, -24, 0, 25),
	UDim2.fromOffset(12, 402), 10
)
status.TextColor3 = Color3.fromRGB(165, 180, 205)

local presets = {}
local currentCategory
local imageLabels = {}
local waiting = false

local function clearCards()
	for _, child in ipairs(list:GetChildren()) do
		if child:IsA("Frame") then
			child:Destroy()
		end
	end
	imageLabels = {}
end

local function showCategory(category)
	currentCategory = category
	clearCards()

	for _, name in ipairs(category.Users) do
		local card = Instance.new("Frame")
		card.Size = UDim2.new(1, -10, 0, 62)
		card.BackgroundColor3 = Color3.fromRGB(35, 42, 57)
		card.BorderSizePixel = 0
		card.Parent = list
		round(card, 8)

		local image = Instance.new("ImageLabel")
		image.Size = UDim2.fromOffset(48, 48)
		image.Position = UDim2.fromOffset(7, 7)
		image.BackgroundColor3 = BG
		image.Image = ""
		image.Parent = card
		round(image, 8)

		imageLabels[name:lower()] = image

		makeLabel(
			card, name,
			UDim2.new(1, -120, 1, 0),
			UDim2.fromOffset(64, 0), 12
		).TextXAlignment = Enum.TextXAlignment.Left

		local selectButton = makeButton(
			card, "SELECT",
			UDim2.fromOffset(70, 32),
			UDim2.new(1, -78, 0.5, -16), BLUE
		)

		selectButton.Activated:Connect(function()
			username.Text = name
			status.Text = "Selected: " .. name
		end)

		remote:FireServer("Preview", name)
	end

	task.defer(function()
		list.CanvasPosition = Vector2.zero
	end)
end

local function loadPresets(data)
	presets = data
	for _, child in ipairs(categories:GetChildren()) do
		if child:IsA("TextButton") then
			child:Destroy()
		end
	end

	for index, category in ipairs(data) do
		local button = makeButton(
			categories, category.Name,
			UDim2.new(0.5, -4, 1, 0),
			UDim2.new(), index == 1 and BLUE or Color3.fromRGB(54, 61, 77)
		)
		button.LayoutOrder = index

		button.Activated:Connect(function()
			for _, other in ipairs(categories:GetChildren()) do
				if other:IsA("TextButton") then
					other.BackgroundColor3 = Color3.fromRGB(54, 61, 77)
				end
			end

			button.BackgroundColor3 = BLUE
			showCategory(category)
		end)
	end

	if data[1] then
		showCategory(data[1])
	end
end

local function openPanel()
	login.Visible = false
	panel.Visible = true
	panel.Position = UDim2.new(0.5, -182, 0.5, -180)

	TweenService:Create(
		panel,
		TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
		{Position = UDim2.new(0.5, -182, 0.5, -215)}
	):Play()

	remote:FireServer("GetPresets")
	status.Text = "Choose a skin or enter a username"
end

loginButton.Activated:Connect(function()
	loginButton.Text = "CHECKING..."
	remote:FireServer("Login", password.Text)
end)

close.Activated:Connect(function()
	panel.Visible = false
	login.Visible = true
	password.Text = ""
end)

apply.Activated:Connect(function()
	if waiting then return end
	waiting = true
	status.Text = "Loading avatar..."
	remote:FireServer("Apply", username.Text)
end)

reset.Activated:Connect(function()
	if waiting then return end
	waiting = true
	status.Text = "Restoring original avatar..."
	remote:FireServer("Reset")
end)

remote.OnClientEvent:Connect(function(action, a, b)
	if action == "LoginResult" then
		if a then
			openPanel()
		else
			loginButton.Text = "UNLOCK PANEL"
			status.Text = "Wrong password"
		end

	elseif action == "Presets" then
		loadPresets(a)

	elseif action == "PreviewResult" then
		local image = imageLabels[tostring(a):lower()]
		if image then
			image.Image = "rbxthumb://type=AvatarHeadShot&id="
				.. tostring(b) .. "&w=150&h=150"
		end

	elseif action == "Result" then
		waiting = false
		status.Text = a
		status.TextColor3 = b
			and Color3.fromRGB(90, 225, 150)
			or Color3.fromRGB(255, 110, 110)
	end
end)

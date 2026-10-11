
-- HAMOUDY AVATAR PRO | SERVER

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Config = require(script.Parent:WaitForChild("AvatarConfig"))

local Server = {}
local authenticated = {}
local originals = {}
local busy = {}

function Server.Start()
	local remote = ReplicatedStorage:FindFirstChild("HamoudyAvatarRemote")

	if not remote then
		remote = Instance.new("RemoteEvent")
		remote.Name = "HamoudyAvatarRemote"
		remote.Parent = ReplicatedStorage
	end

	remote.OnServerEvent:Connect(function(player, action, value)
		if typeof(action) ~= "string" then return end

		if action == "Login" then
			if typeof(value) ~= "string" then return end

			if value == Config.Password then
				authenticated[player] = true
				remote:FireClient(player, "LoginResult", true)
			else
				remote:FireClient(player, "LoginResult", false)
			end

			return
		end

		if not authenticated[player] then return end

		if action == "GetPresets" then
			remote:FireClient(player, "Presets", Config.Categories)
			return
		end

		if action == "Preview" then
			if typeof(value) ~= "string" or #value > 20 then return end

			task.spawn(function()
				local ok, userId = pcall(function()
					return Players:GetUserIdFromNameAsync(value)
				end)

				if ok and authenticated[player] then
					remote:FireClient(
						player,
						"PreviewResult",
						value,
						userId
					)
				end
			end)

			return
		end

		if busy[player] then return end
		busy[player] = true

		local function finish(message, success)
			remote:FireClient(player, "Result", message, success)
			busy[player] = nil
		end

		local character = player.Character
		local humanoid = character
			and character:FindFirstChildOfClass("Humanoid")

		if not humanoid then
			finish("Character not ready", false)
			return
		end

		if action == "Reset" then
			if not originals[player] then
				finish("No original appearance saved", false)
				return
			end

			local ok, err = pcall(function()
				humanoid:ApplyDescriptionResetAsync(originals[player])
			end)

			if not ok then
				warn("[HAMOUDY] Reset failed:", err)
			end

			finish(
				ok and "Original appearance restored" or "Reset failed",
				ok
			)
			return
		end

		if action ~= "Apply"
			or typeof(value) ~= "string"
			or #value > 20 then
			finish("Invalid username", false)
			return
		end

		local username = value:match("^%s*(.-)%s*$")

		if not username or username == "" then
			finish("Enter a username", false)
			return
		end

		local loaded, description = pcall(function()
			local userId = Players:GetUserIdFromNameAsync(username)

			return Players:GetHumanoidDescriptionFromUserIdAsync(userId)
		end)

		if not loaded then
			warn("[HAMOUDY] Avatar load failed:", description)
			finish("Could not load avatar", false)
			return
		end

		if not originals[player] then
			local ok, original = pcall(function()
				return humanoid:GetAppliedDescription()
			end)

			if ok then
				originals[player] = original
			end
		end

		local applied, err = pcall(function()
			humanoid:ApplyDescriptionResetAsync(description)
		end)

		if not applied then
			warn("[HAMOUDY] Apply failed:", err)
		end

		finish(
			applied and "Avatar changed successfully" or "Apply failed",
			applied
		)
	end)

	Players.PlayerRemoving:Connect(function(player)
		authenticated[player] = nil
		originals[player] = nil
		busy[player] = nil
	end)
end

return Server

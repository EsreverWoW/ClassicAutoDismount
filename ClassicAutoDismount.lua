----------------------------------------------------------------------------------------
--	ClassicAutoDismount (by EsreverWoW)
----------------------------------------------------------------------------------------
local frame = CreateFrame("Frame")

local errorMessages = {
	[ERR_ATTACK_MOUNTED]			= true,
	[ERR_MOUNT_ALREADYMOUNTED]		= true,
	[ERR_NOT_WHILE_MOUNTED]			= true,
	[ERR_TAXIPLAYERALREADYMOUNTED]	= true,
	[SPELL_FAILED_NOT_MOUNTED]		= true,
}

function CheckDismount(self, event, ...)
	if not IsMounted() or not errorMessages[select(2, ...)] then return end

	Dismount()
	UIErrorsFrame:Clear()
end

frame:RegisterEvent("UI_ERROR_MESSAGE")
frame:SetScript("OnEvent", CheckDismount)
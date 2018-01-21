SIGSTRM12GIS              �3�                  Signkey.EditorSignatured���2n��� �ʧ4�T�$�� 8tӰ��7�i�tϮ��Sn'Aa��v�ߊ��r�U���{k��!!B�4���:�%5J�
� �?�6󷣓o/�Y
��i�77;z�L"�h.��%��;�����jȮu�� ȅ���5�i���$:�r��X/B�( ͘c�M�h���K���4a�R@�,Ý�SK�H��w�[F��Vi�I��E���f�8��aVd�[�暜����E﻿--Wait(CustomEvent("Randomizer_Finished"))
Wait(Delay(0.1))
-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local showAll = talosProgress:IsVarSet("Randomizer_ShowAll")

local icons = {
  ["I"]="▄▄",
  ["J"]="▐▄",
  ["L"]="▄▌",
  ["O"]="█",
  ["S"]="▗▛",
  ["T"]="▗▙",
  ["Z"]="▜▖",
  ["*"]="★"
} 

local text = {
  ["*"] = textStar,
  ["D"] = textDoor,
  ["E"] = textSecret,
  ["M"] = textMechanical,
  ["N"] = textNexus,
  ["Default"] = textDefault
}

local textPtr = {
  ["*"] = {},
  ["D"] = {},
  ["E"] = {},
  ["M"] = {},
  ["N"] = {},
  ["Default"] = {}
}

for k,v in pairs(text) do
  for i=1,#text[k] do
    textPtr[k][i] = text[k][i]:GetTextConfig()
    -- Assure all texts have the correct default message
    if k == "Default" then
      text[k][i]:SetText(textPtr[k][i], "?", true)
    else
      text[k][i]:ClearText(textPtr[k][i])
    end
  end
end

-- Bring stars to the end of the sigil list
local allSigils = {}
local starCount = 0
local totalSigils = #worldGlobals.worldMarkers
for i,v in pairs(worldGlobals.worldMarkers) do
  local sigilNum = talosProgress:GetCodeValue(v:GetName())
  -- currentSigil : CTetrominoItemInstance
  local currentSigil = worldGlobals.allTetros[sigilNum]
  local type = string.sub(currentSigil:GetName(), 2, 2)
  if type == "*" then
    allSigils[totalSigils - starCount] = currentSigil
    starCount = starCount + 1
  else
    allSigils[i - starCount] = currentSigil
  end
end

local function updateText()
  for index,sigil in pairs(allSigils) do
    local colour = string.sub(sigil:GetName(), 1, 1)
    local type = string.sub(sigil:GetName(), 2, 2)    
    -- sigil : CTetrominoItemInstance
    if sigil:IsPicked() then
      text[colour][index]:SetText(textPtr[colour][index], icons[type], true)
      text["Default"][index]:SetText(textPtr["Default"][index], "✘", true)
    elseif showAll then
      text[colour][index]:SetText(textPtr[colour][index], icons[type], true)
      text["Default"][index]:ClearText(textPtr["Default"][index])
    end    
  end
end

updateText()

RunHandled(
  function()
    WaitForever()
  end,
  OnEvery(CustomEvent("TetrominoAwarded")),
  function()  
    updateText()
  end
)[V�D���d�NW�lS�I�9�c�\��yp|�q�X3��q<�-��ۼ�fPD�H�O6�r��J��t�ː�W`N��.�j:�4 �h�s}B�	�F@e���!���� jIz��ë�\���	��fi⚲C'�6�:��}f/j=�5
���"���
t���*�(���|r��v�Iq��yJ@�%bN��%�C_Ȼa�|
����G�8#��m��M �DO^�P;{/�V�!��M����^G�ਕV�/	T�?h
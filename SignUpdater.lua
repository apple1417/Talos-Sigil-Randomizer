SIGSTRM12GIS             Ҕ�                  Signkey.EditorSignatureUb9 �3Q�c���nT��#xo8�@��^�k��p�Z�7�����.Ј�@��hUQQ9����Q�Dg���S�Ȣ�T��]D0�.)���~�c��'���*�b�(��;q[�Ԥ6'};Kߗ��w`�#��ȶ�3V-���x��ؠ���np�E�T�p���R�"�k�G�A� ^BEa�B��T�70�������k@��8�ݸ���b��T���8�����z���f����;��"]u﻿--[[
  Makes the world overview sign update properly
  Because normal signs can't be dynamically changed we do this with
   many text effects, in various locations and colours, which we can
   set to unicode strings that look like the tetrominoes
  These strings don't render properly in the editor but they work in game
]]--

Wait(CustomEvent("Randomizer_Finished"))
-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
local scavenger = talosProgress:GetCodeValue(worldGlobals.Randomizer.Scavenger.talosProgress) ~= 0

local icons = {
  I = "▄▄",
  J = "▐▄",
  L = "▄▌",
  O = "█",
  S = "▗▛",
  T = "▗▙",
  Z = "▜▖",
  ["*"] = "★"
}

local colours = {
  D = textDoor,
  M = textMechanical,
  N = textNexus,
  E = textSecret,
  ["*"] = textStar
}

-- Make sure all text effects are empty
for _, v in pairs(colours) do
  v:ClearText(v:GetTextConfig())
end
-- These two tables *should* be the same, but just in case...
for _, v in pairs(tetroTexts) do
  v:ClearText(v:GetTextConfig())
end
for _, v in pairs(starTexts) do
  v:ClearText(v:GetTextConfig())
end


-- Get all sigils placed in the world
local tetros = {}
local stars = {}
for i = 1, #worldGlobals.Randomizer.worldMarkers do
  local sigilId = talosProgress:GetCodeValue(worldGlobals.Randomizer.worldMarkers[i]:GetName())
  if sigilId <= 30 then
    table.insert(stars, worldGlobals.Randomizer.allTetros[sigilId])
  else
    table.insert(tetros, worldGlobals.Randomizer.allTetros[sigilId])
  end
end

--[[
  Sort the sigil lists to prevent memorising spawn order
  Stars are easy, they look the same so sort by names
  For tetros we want to sort by colour first then shape
]]--
table.sort(stars, function(a, b)
  return a:GetName() < b:GetName()
end)
local colourOrder = {"D", "M", "E", "N"}
local shapeOrder = {"I", "J", "L", "O", "S", "Z", "T"}
local function sortByArrayIndex(a, b, array)
  local indexA = 0
  local indexB = 0
  for k, v in pairs(array) do
    if v == a then
      indexA = k
    end
    if v == b then
      indexB = k
    end
  end
  return indexA < indexB
end
table.sort(tetros, function(a, b)
  local colourA = string.sub(a:GetName(), 1, 1)
  local colourB = string.sub(b:GetName(), 1, 1)
  if colourA == colourB then
    local shapeA = string.sub(a:GetName(), 2, 2)
    local shapeB = string.sub(b:GetName(), 2, 2)
    return sortByArrayIndex(shapeA, shapeB, shapeOrder)
  end
  return sortByArrayIndex(colourA, colourB, colourOrder)
end)

--[[
  Setup the relation between sigils and text effects
  To kind of emulate the main game signs we want to group sigils by colour
   and shape (though the it gets it wrong sometimes)
  We also want stars to fill from the right while sigils go horizontally
  This is why we have two lists of the same texts with different orders
]]--
local textMap = {}
for i = 1, #stars do
  textMap[starTexts[i]] = stars[i]
end
for i = 1, #tetros do
  -- Find an index that hasn't already been claimed
  local tetroIndex = i
  while textMap[tetroTexts[tetroIndex]] do
    tetroIndex = tetroIndex + 1
  end
  textMap[tetroTexts[tetroIndex]] = tetros[i]
end

-- Fill in the sign, technically doesn't have to overwrite itself but it's safer
local function updateText()
  for text, sigil in pairs(textMap) do
    -- currentColour : CTextEffectEntity
    local currentColour = colours[string.sub(sigil:GetName(), 1, 1)]
    local currentIcon = icons[string.sub(sigil:GetName(), 2, 2)]

    text:ClearText(currentColour:GetTextConfig())
    text:ClearText(textDefault:GetTextConfig())

    -- If scavenger is on we don't want to show exactly what the sigil is until you have it
    if scavenger and not sigil:IsPicked() then
      text:SetText(textDefault:GetTextConfig(), "?", true)
    else
      text:SetText(currentColour:GetTextConfig(), currentIcon, true)
    end
    if sigil:IsPicked() then
      text:SetText(textDefault:GetTextConfig(), "✘", true)
    end
  end
end

updateText()

-- Need to make sure the sign updates incase you don't reset
RunHandled(WaitForever,
  OnEvery(CustomEvent("TetrominoAwarded")),
  function()
    updateText()
  end
)
V�/*�6}���B��2�+./��_�|�x����2A�TYK?B��m{�v*Cx�l���.��	)Xd�o�c�E�1d|zisϩ�GH��>)_�.�i>��U��y��%T��a�N��f5�K�q�L:�g��?���kRnJgF�i7Cc���� �*=�z�����/���ة��)��ï��sdғ\�]��T�H*l񥓡�M�w�פ�����1 ף�a�� ���C�w�׃�����t7�c'�fԯNG
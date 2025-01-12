SIGSTRM12GIS             �I��                  Signkey.EditorSignatureuԉI+��-ۃ���5��h��d�tR����o-�û���7"��W{o?��2�~��Ij��ۭ��'�5?��Z��ҽ��x���¹I��mB���B(��BeB>�F��X2�(����Sى���~�'+|X���&2��k�]<h����lh�v��du�JW���/P�c�D��$�2�·=/���=���:|K�܈Q,ظ��[j���R	��� ?t.���++J��7&�9�������s��﻿--[[
  Updates the signs and dimms portals when needed
  None of the sigils you can grab in nexus affect this so we only need to run it once
]]--
Wait(CustomEvent("Randomizer_Finished"))
-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
local Randomizer = worldGlobals.Randomizer

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

local allWorlds = {{
  world = Randomizer.Puzzles.A1,
  portal = portalAnimatorA1,
  stars = starsOrderA1,
  tetros = tetroOrderA1
}, {
  world = Randomizer.Puzzles.A2,
  portal = portalAnimatorA2,
  stars = starsOrderA2,
  tetros = tetroOrderA2
}, {
  world = Randomizer.Puzzles.A3,
  portal = portalAnimatorA3,
  stars = starsOrderA3,
  tetros = tetroOrderA3
}, {
  world = Randomizer.Puzzles.A4,
  portal = portalAnimatorA4,
  stars = starsOrderA4,
  tetros = tetroOrderA4
}, {
  world = Randomizer.Puzzles.A5,
  portal = portalAnimatorA5,
  stars = starsOrderA5,
  tetros = tetroOrderA5
}, {
  world = Randomizer.Puzzles.A6,
  portal = portalAnimatorA6,
  stars = starsOrderA6,
  tetros = tetroOrderA6
}, {
  world = Randomizer.Puzzles.A7,
  portal = portalAnimatorA7,
  stars = starsOrderA7,
  tetros = tetroOrderA7
}, {
  world = Randomizer.Puzzles.AStar,
  stars = starsOrderAStar,
  tetros = tetroOrderAStar
}, {
  world = Randomizer.Puzzles.ADev
}, {
  world = Randomizer.Puzzles.B1,
  portal = portalAnimatorB1,
  stars = starsOrderB1,
  tetros = tetroOrderB1
}, {
  world = Randomizer.Puzzles.B2,
  portal = portalAnimatorB2,
  stars = starsOrderB2,
  tetros = tetroOrderB2
}, {
  world = Randomizer.Puzzles.B3,
  portal = portalAnimatorB3,
  stars = starsOrderB3,
  tetros = tetroOrderB3
}, {
  world = Randomizer.Puzzles.B4,
  portal = portalAnimatorB4,
  stars = starsOrderB4,
  tetros = tetroOrderB4
}, {
  world = Randomizer.Puzzles.B5,
  portal = portalAnimatorB5,
  stars = starsOrderB5,
  tetros = tetroOrderB5
}, {
  world = Randomizer.Puzzles.B6,
  portal = portalAnimatorB6,
  stars = starsOrderB6,
  tetros = tetroOrderB6
}, {
  world = Randomizer.Puzzles.B7,
  portal = portalAnimatorB7,
  stars = starsOrderB7,
  tetros = tetroOrderB7
}, {
  world = Randomizer.Puzzles.BStar,
  stars = starsOrderBStar,
  tetros = tetroOrderBStar
}, {
  world = Randomizer.Puzzles.C1,
  portal = portalAnimatorC1,
  stars = starsOrderC1,
  tetros = tetroOrderC1
}, {
  world = Randomizer.Puzzles.C2,
  portal = portalAnimatorC2,
  stars = starsOrderC2,
  tetros = tetroOrderC2
}, {
  world = Randomizer.Puzzles.C3,
  portal = portalAnimatorC3,
  stars = starsOrderC3,
  tetros = tetroOrderC3
}, {
  world = Randomizer.Puzzles.C4,
  portal = portalAnimatorC4,
  stars = starsOrderC4,
  tetros = tetroOrderC4
}, {
  world = Randomizer.Puzzles.C5,
  portal = portalAnimatorC5,
  stars = starsOrderC5,
  tetros = tetroOrderC5
}, {
  world = Randomizer.Puzzles.C6,
  portal = portalAnimatorC6,
  stars = starsOrderC6,
  tetros = tetroOrderC6
}, {
  world = Randomizer.Puzzles.C7,
  portal = portalAnimatorC7,
  stars = starsOrderC7,
  tetros = tetroOrderC7
}, {
  world = Randomizer.Puzzles.CStar,
  stars = starsOrderCStar,
  tetros = tetroOrderCStar
}, {
  world = Randomizer.Puzzles.CMessenger
}}

-- Deal with random portals
local orderedWorlds = {}
for i = 1, #allWorlds do
  local world = allWorlds[i]
  local worldIndex = talosProgress:GetCodeValue(world.world.talosProgress)
  local otherWorld = allWorlds[worldIndex]
  orderedWorlds[worldIndex] = {
    world = world.world,
    portal = otherWorld.portal,
    stars = otherWorld.stars,
    tetros = otherWorld.tetros
  }
end

local portals = talosProgress:IsVarSet(Randomizer.MiscOptions.Values.Portals.talosProgress)
local scavenger = talosProgress:GetCodeValue(Randomizer.Scavenger.talosProgress)
for _, world in pairs(orderedWorlds) do
  -- This script actually barely manages to time out otherwise
  Wait(CustomEvent("OnStep"))

  local allCollected = true
  local stars = {}
  local tetros = {}
  for k, v in pairs(world.world) do
    if k ~= "talosProgress" then
      local sigilNum = talosProgress:GetCodeValue(v.talosProgress)
      local sigil = Randomizer.allTetros[sigilNum]
      if not sigil:IsPicked() then
        allCollected = false
      end
      if sigilNum <= 30 then
        table.insert(stars, sigil)
      else
        table.insert(tetros, sigil)
      end
    end
  end
  if world.world == Randomizer.Puzzles.ADev then
    allCollected = talosProgress:IsVarSet(Randomizer.MiscFlags.devIslandVisited)
  end
  -- Dim the portal if needed
  if world.portal ~= nil then
    if allCollected then
      world.portal:StartAnimation("Off")
    else
      world.portal:StartAnimation("On")
    end
  end

  if world.stars ~= nil and world.tetros ~= nil then
    -- Clear the text effects
    for _, v in pairs(world.stars) do
      v:ClearText(v:GetTextConfig())
    end

    -- Not going to support random portals
    if portals then
      for _, v in pairs(world.tetros) do
        v:SetText(textDefault:GetTextConfig(), "?", true)
      end
    else
      -- Sort the sigil lists
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

      local function drawSigil(text, sigil)
        local currentColour = colours[string.sub(sigil:GetName(), 1, 1)]
        local currentIcon = icons[string.sub(sigil:GetName(), 2, 2)]

        if scavenger and not sigil:IsPicked() then
          text:SetText(textDefault:GetTextConfig(), "?", true)
        else
          text:SetText(currentColour:GetTextConfig(), currentIcon, true)
        end
        if sigil:IsPicked() then
          text:SetText(textDefault:GetTextConfig(), "✘", true)
        end
      end

      -- Draw sigils while creating the "map" (which we don't use again)
      local usedTexts = {}
      for i = 1, #stars do
        usedTexts[world.stars[i]] = true
        drawSigil(world.stars[i], stars[i])
      end
      for i = 1, #tetros do
        local tetroIndex = i
        while usedTexts[world.tetros[tetroIndex]] do
          tetroIndex = tetroIndex + 1
        end
        usedTexts[world.tetros[tetroIndex]] = true
        drawSigil(world.tetros[tetroIndex], tetros[i])
      end
    end
  end
end
*Q9
�QDv�n`�wL*��q���H�K+4/��9�Q�KX8Rk�Q�H`t9��&���n�D<
�=��'��r|�*����Q=�a�v�O��AF��L'�4��@�[�ז�9�����B�զ�Ε�'�̬�
TO�iܥ�%���w��Ӝc�q��� p��)I5�����M!U���Q9��K
�����3��V�{�I��v[e�Ç5#�kT��e��V�Sa�%�sx�L���=E�bL���������"�
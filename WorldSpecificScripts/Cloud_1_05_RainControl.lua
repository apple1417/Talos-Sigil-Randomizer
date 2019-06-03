SIGSTRM12GIS             ��fP                  Signkey.EditorSignature8?{���@���F��[&�
	<��`�kvݝ
G]�E��"<d�;L��G�����վwl�e�Ri���f����߽����o��y,��l��� ��q�g� �2z�IeH��Wzu��ࢾhO�\���8틁�*�f�S��n���0ﰵ��R������b�LHبx9��K�CDv1es��oq���4~^��Ȓ�3���΍"TJr�%���3�c ��c_6�v		���c�ڣ;qd��k��9��i�v@P﻿Wait(CustomEvent("Randomizer_Finished"))
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local Sigils = {}
for k, v in pairs(worldGlobals.Randomizer.Puzzles.A5) do
  if not (k == "talosProgress"
          or v == worldGlobals.Randomizer.Puzzles.A5.FCStar
          or v == worldGlobals.Randomizer.Puzzles.A5.TwoBoxesStar) then
    local sigilNum = talosProgress:GetCodeValue(v.talosProgress)
    table.insert(Sigils, worldGlobals.Randomizer.allTetros[sigilNum])
  end
end

BackgroundRotator:PlayAnimLoop("Default")
local iNextThunder = 1
local bLastRaining = false
local bRaining = true
local fNextLightning = 100000

local function Lighting()
  if iNextThunder==1 then
    SoundThunder1:PlayOnce()
    Wait(Delay(1))
    iNextThunder = 2
  else
    SoundThunder2:PlayOnce()
    Wait(Delay(2.1))
    iNextThunder = 1
  end
  LightningAnimator:StartAnimation("TurningOn")
  ParticlesLighnting:Start()
  Wait(Delay(0.15))
  ParticlesLighnting:Stop()
end

local progress = nexGetTalosProgress(worldGlobals.worldInfo)
local strPickedInstances = progress:GetInventoryTetrominoes() .. progress:GetUsedupTetrominoes()

local ctPicked = 0
for i=1,#Sigils do
  -- sigil : CGenericItemEntity
  local sigil = Sigils[i]
  local strName = sigil:GetName()
  if string.match(strPickedInstances, strName..";") then
    ctPicked = ctPicked+1
  end
end

-- see how many sigils are there in the level
local fRnd = 1
if ctPicked%2==0 then
  -- immediately start rain
  RainAnimator:StartAnimation("On")
  bRaining = true
  fNextLightning = 15
  worldInfo:SetMusic("Ambient", resRainyAmbient)
else
  -- immediately start sun
  RainAnimator:StartAnimation("Off")
  worldInfo:SetMusic("Ambient", resSunnyAmbient)
  bRaining = false
end
bLastRaining = bRaining

RunHandled(
  function()
    WaitForever()
  end,
  OnEvery(Delay(1)), function()
    -- if we should start sunny weather
    if bLastRaining and not bRaining then
      RainAnimator:StartAnimation("TurningOff")
      worldInfo:SetMusic("Ambient", resSunnyAmbient)
      -- schedule next lighting
      fNextLightning = 100000
    end
    -- if we should start rainy weather
    if bRaining and not bLastRaining then
      RainAnimator:StartAnimation("TurningOn")
      worldInfo:SetMusic("Ambient", resRainyAmbient)
      fNextLightning = 15
    end

    -- if it is raining
    if bRaining then
      fNextLightning = fNextLightning-1
      if fNextLightning<0 then
        -- schedule new one
        fNextLightning = 10+mthRndF()*20
        -- show lightning
        Lighting()
      end
    end

    bLastRaining = bRaining
  end,
  OnEvery(Any(Event(Sigils[1].Picked), Event(Sigils[2].Picked),
              Event(Sigils[3].Picked), Event(Sigils[4].Picked),
              Event(Sigils[5].Picked))), function()
    local fRndDelay = 5+mthRndF()*10
    Wait(Delay(fRndDelay))
    -- toggle desired state
    if bRaining then
      bRaining = false
    else
      bRaining = true
    end
  end
)
��6HT�_M�O�!Ow���ocg�O}���z�	Sa���� >E��(��ͤ8��SpJv��07�}Fm��f����-q>���W��k�#e*�My���d��U)6��}�dؘ�6��ň.��������u����1w�|m4-�T|��{=��w�5��Fq`�P�~%,S��/׌U�Q�d���fݴ�^z��a�@�L�����ϛ]<�W�u�o0��Yd�5�6�φ�l�!m�|L��.��c�ǩ_`
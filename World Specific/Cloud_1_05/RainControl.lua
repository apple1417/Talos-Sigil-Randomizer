SIGSTRM12GIS             ��                  Signkey.EditorSignature3jQ�!+�\�,�2?��;���	���.cU�&�]�'Fdw^���7�e��
*��;<��k+��K��e�#.e�<9�Ke/��j�惘S�U#�W��ڊ���"و�������[�EmU�#���r�Y$ȸ#�LɌ��D�Q�� 4�o����E�`n�~�Ēqr�:�}U}`#1:�b��܌Fy���]�S��7cl� �U�.��j64{�LL���$�]"����Ӥ���8�<c��,m1��﻿Wait(CustomEvent("Randomizer_Finished"))
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
�W�,���I�����������W��pw~�[�]�Y�ˁ�غ9�&�.�2U7�CW�G$�V/r�]�\�� ���B�M�V��Z�.��1�;��W�gZ�h���= �Gc~�M�D�CD%,\�ڝ����>H�0s:�vZk:> �U-|a�ۘCe�Y��?9�q�����	��hJԝ�P��;�nN��`�s�y�ń�ugw�V��C�o�����l���r94ǂ���)U%ٕL5��6Z��N�4V	�
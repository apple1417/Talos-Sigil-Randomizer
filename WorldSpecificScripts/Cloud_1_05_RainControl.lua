SIGSTRM12GIS             :7C                  Signkey.EditorSignature	>��C��cQ��������V��}��7�}�T���}�v�ڴ"��\�ė�!S4�<�:�!ܤ����J�e����Gv56?�������x)�~ޣ�\�o�2���.8ZG�-�寑�(L6�p�j;�3g���owh��>�������>��Z���C}�H �����eO���=Y�x�2��`~S�#S�\\k��P�h�\c�
W���k|R!���z���9� �I��lRC%=ʇ��`�3�F�﻿--Wait(CustomEvent("Randomizer_Finished"))
Wait(Delay(0.1))
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local Sigils = {}
for k, v in pairs({"201_SPM_000_PM_013", "204_SPM_000_PM_004",
                   "202e_SPM_000_PM_004", "207_SPM_000_PM_005",
                   "244_SPM_000_PM_008"}) do
  local sigilNum = talosProgress:GetCodeValue(v)
  Sigils[k] = worldGlobals.allTetros[sigilNum]
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
)����h&��C0 ����A��U�]% 5��d����o[�*��bzs��AG!�O>�BYj��5�7�x�]�X+�}���4��8�Sf��a1�T������$=��t+���%�N�|�j�e�.�����7-��CLi��
b�D"l2�^�p-;Z���	�X��[����Y��BD��-Q��	��^V�a�ܸ���9��G�B��J�L��Xh��H$j)��-��
�H�'�����P��ʹm
g�w��K1%_
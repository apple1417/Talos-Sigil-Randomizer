SIGSTRM12GIS             qQc                  Signkey.EditorSignature;��N�$
a�� w�õK�X9���@`{��L˹��z���V�$�4���`������j�8�-� W��Jt���_=���хU�ֱ���.���Wz��$�w6����AVݧ.$q*��N���Y�k� !R����(��u���p�FL�-}��w�H��}�.�N���jL5wd��¯��;R�����.9
�|w W���"|^j�n-����54t>4�3�kM�L���a)��GH?�x�Y@@�"G���#﻿-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)

--[[
  If scavenger hunt mode is on we want to hide all arrangers except
   for the necessary ones
]]--
Wait(CustomEvent("Randomizer_Finished"))
local scavengerOverride = false
if talosProgress:GetCodeValue("Randomizer_Scavenger") ~= 0 then
  local modes = {"Connector Clip", "F2 Clip", "F3 Clip", "F1+F6"}
  local scavengerMode = modes[talosProgress:GetCodeValue("Randomizer_ScavengerMode")]
  if scavengerMode == "Connector Clip" then
    scavengerOverride = thisScript:GetName() ~= "Connector"
  elseif scavengerMode == "F2 Clip" then
    scavengerOverride = thisScript:GetName() ~= "Cube"
  else
    scavengerOverride = true
  end
end


-- nothing to do if arranger is already solved
if Arranger:IsSolved() or scavengerOverride then
  Arranger:Disappear()
  SpotLightAnimator:StartAnimation("On")
  lockMover:PlayAnim("Down")
  if cabinetMover ~= nil then
    cabinetMover:PlayAnim("LowerImmediate")
  end
  return
end

-- here we set up model rotators and rotated models
-- (by dropping variables onto them)
local modelRotators = {modelDisabledRotator, modelEnabledRotator, standModelRotator, itemHolderRotator}
local rotatedModels = {itemDisabled, itemEnabled, standModel, itemHolderModel}
assert(#modelRotators == #rotatedModels)
itemEnabled:Disappear()
CabinBase:PlayAnimStay("Closed")

-- attach all rotators to rotated models
for i = 1, #modelRotators do
  if modelRotators[i]~=nil then
    modelRotators[i]:AttachModelRotator(rotatedModels[i], "Main")
  end
end

-- handles setting of rotation velocity to all rotators
local function SetRotatorVelocity(velocity)
  for _, rotator in ipairs(modelRotators) do
    if rotator~=nil then
      rotator:SetModelRotatorVelocity(60)
    end
  end
end

-- handles setting of desired rotation velocity
-- and acceleration to all rotators
local function SetRotatorDesiredVelocity(velocity, acceleration)
  for _, rotator in ipairs(modelRotators) do
    if rotator~=nil then
      rotator:SetModelRotatorDesiredVelocity(velocity, acceleration)
    end
  end
end


SetRotatorVelocity(60)
EffectAnimator:StartAnimation("Off")
SpotLightAnimator:StartAnimation("Off")
FlareAnimator:StartAnimation("Off")

Arranger:DontUpdateMechanicsWhenSolved()      
Wait(Event(Arranger.Solved))
Wait(Delay(1))
SetRotatorDesiredVelocity(6000, 150)

Sound:PlayOnce()
Wait(Delay(1))
EffectAnimator:StartAnimation("TurningOn")
FlareAnimator:StartAnimation("TurningOn")
SpotLightAnimator:StartAnimation("TurningOn")
Particles:Start()
Wait(Delay(2))
Shaker:StartShaking()
Wait(Delay(2))
prjOnMechanicLockingChanged(worldGlobals.worldInfo)
SetRotatorDesiredVelocity(0, 100)
itemEnabled:Appear()
itemDisabled:Disappear()

-- signal that the unlocking animation is finished, for eventual other scripts that may need this
RunAsync(function()
  -- (it spins up with acceleration of 150 for 5 seconds, so it needs 7.5 seconds to spin down with acc of 100)
  Wait(Delay(7.5))
  SignalEvent(Arranger, "UnlockingAnimFinished")
end)
Wait(Delay(6))
CabinBase:PlayAnimStay("Opening")
SoundCabinBase:PlayOnce()
Wait(Delay(2))
SoundLowering:PlayOnce()
Wait(Delay(0.4))
cabinetMover:PlayAnim("Lower")
Wait(Delay(1))
SoundLoweringLock:PlayOnce()
lockGroundModel:PlayAnim("Open")
lockMover:PlayAnim("Default")
Wait(Delay(5))
CabinBase:PlayAnimStay("Closing")
SoundCabinBase:PlayOnce()~�t?@܅��@��+	�J�T8���g2�Q������u���i�	-4� c/8�_��}`��������Jy� #��j5�$Iy���Љ���N𜄒
�de�N�Bz����
|o�;����js#׼�.v��3�f�{4��+���/`���0�33*��˰���ݨF���f���ݾC�l7����:�z�d�Rc�1�\J(;mu�|U���u��kiA���
�Q�J�Rk��hI��Ӭq%�
SIGSTRM12GIS             t�O;                  Signkey.EditorSignature.8	��|-�:ZJ����9g�{�>�'5���f���3헻��쒨�Dv��ָ�<� Ut��'\���]l��f��6K$�Q���x7Ț�v'��Q.1>~y(���k��.�U���������\��{��w��>E2E�G��+NJB�Z
�C?1�h1��[���?{�EҺ!*o��݃��yk{&`�����08۶���/6�W%�	�"�!�|��7
��Vo��n�Re7�V��]﻿-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)

--[[
  If scavenger hunt mode is on we want to hide all arrangers except
   for the necessary ones
]]--
local scavengerOverride = false
if talosProgress:IsVarSet("Randomizer_Scavenger") then
  local modes = {"Connector Clip", "F2 Clip", "F3 Clip", "F1+F6"}
  local scavengerMode = modes[talosProgress:GetCodeValue("Randomizer_ScavengerMode")]
  if scavengerMode == "Connector Clip" then
    scavengerOverride = thisScript:GetName() ~= "Connector"
  elseif scavengerMode == "F1+F2+H" then
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
SoundCabinBase:PlayOnce(): S�笛t�@󌟂��MF�������8��y�B�D	��c���R�- ��HX�<UJH����04}�^딱!���X�_?�M��uF�L��٧�+G�G�oäz��n,c�`�#����O˘��a�1��%����O`��_�4
F�g)�J*@
��$s�V�����:����ڮ��t!0�����$]�]��d(D]��$
����\�c*��
w1�czN��߷
nc콆>Į�~���,�r�,
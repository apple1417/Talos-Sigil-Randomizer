SIGSTRM12GIS             wRU�                  Signkey.EditorSignature���e��k@a��8�EL���F*��D�S��Xu~P���i�����F;�b���D��M�|�^�Eߙ�ٹ�����!"�*����'��O`���-�����J&~)́Ȭ�� ^���n��k�D��,$˗�����e	]��G����W�*U�lO��|���5�Ɵ��4d��9WJn�o�����nW&4�SOk!?����O��Tn�w���œ=6��C)�p\Z`m0��C≜Ȥ﻿--[[
  If scavenger hunt mode is on we want to hide all arrangers except
   for the necessary ones
]]--
Wait(CustomEvent("Randomizer_Finished"))
-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
local scavengerOverride = false
if talosProgress:GetCodeValue(worldGlobals.Randomizer.Scavenger.talosProgress) ~= 0 then
  local ending = worldGlobals.Randomizer.Scavenger.Endings.AsArray[
    talosProgress:GetCodeValue(worldGlobals.Randomizer.Scavenger.Endings.talosProgress)
  ]
  if ending == worldGlobals.Randomizer.Scavenger.Endings.Values.Conn then
    scavengerOverride = thisScript:GetName() ~= "Connector"
  elseif worldGlobals.Randomizer.Scavenger.Endings.Values.F2 then
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
SoundCabinBase:PlayOnce()
��S��f_��։f�
�l}#o,����������r���՞�<� ny;�M�N
N��k�}%�Rsܡ��5�u7�:Ӹ�O�LXR��w�gH��P�0�$���ؓ�C�o?��rhx�aZ?��H��Sƃ�ېൗ�<�μ��s鿩�@�2�Ĕ�8-u�[ln�9=e����jY@����S,��e.!;,"L�[���{���e���U��cg<�i��HP}�}�T  �X;�&�*5l�M����H����ri����)6\�
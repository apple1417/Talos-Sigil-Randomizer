SIGSTRM12GIS             ��S+                  Signkey.EditorSignaturek![\�!�![���{m����6��³m��+R5<�b+X5;V&�i���&�v��^����ge]��ᶫ�҂���u��q��	�)�s�΂��]�
�}:����Vk<����Vc�~׉�(X+>˨s �ͭO��9�tsD9S!��
z�e�w�ǚ|�W���P����b��N&�g�������pY���`�c�Ղ�R12K<eV�jytY]\�	V?Ý�6�W�*Ь4}�;Z͜��0@�[s@��.��F7s ��﻿local event = Wait(All(Event(worldInfo.PlayerBorn),
                       CustomEvent("Randomizer_OptionsConstantsLoaded")))
-- player : CPlayerPuppetEntity
local player = event.all[1]:GetBornPlayer()

local offset = OffsetMarker:GetPlacement():GetVect() - Up3:GetPlacement():GetVect()

local function waitDetectorLeave(detector)
  while detector:IsPointInArea(player:GetPlacement():GetVect(), 1) do
    Wait(CustomEvent("OnStep"))
  end
end

local function Y()
  local dist = mthAbsF(LeftPlat:GetPlacement().vy - RightPlat:GetPlacement().vy)
  return mthRoundF(dist * 1000)/1000
end
local function Z()
  local dist = mthAbsF(LeftPlat:GetPlacement().vz - RightPlat:GetPlacement().vz)
  -- Extra -2 to compensate for the platform width
  dist = dist - 2
  return mthRoundF(dist * 1000)/1000
end

local minY = LeftPlat:GetPlacement().vy
local function adjustY(amount, button)
  local pos = LeftPlat:GetPlacement()
  if pos.vy == minY and amount < 0 then
    if button then
      worldGlobals.Randomizer.pressButton(button, nil, offset, true)
    end
    return
  end
  
  pos.vy = pos.vy + amount
  -- Trim any extra
  if pos.vy < minY then
    pos.vy = minY
  end
  
  if button then
    worldGlobals.Randomizer.pressButton(button, nil, offset, false, function()
      LeftPlat:SetPlacement(pos)
      YText:SetText(YText:GetTextConfig(), string.format("%5.3f", Y()), true)
    end)
  else
  LeftPlat:SetPlacement(pos)
  YText:SetText(YText:GetTextConfig(), string.format("%5.3f", Y()), true)
  end  
end
local function adjustZ(amount, button)
  local dist = Z()
  if dist == 0 and amount < 0 then
    if button then
      worldGlobals.Randomizer.pressButton(button, nil, offset, true)
      return
    end  
  end
  
  if dist + amount < 0 then
    amount = -dist
  end
  
  local leftPos = LeftPlat:GetPlacement()
  local rightPos = RightPlat:GetPlacement()
  leftPos.vz = leftPos.vz - amount/2
  rightPos.vz = rightPos.vz + amount/2
  
  if button then
    worldGlobals.Randomizer.pressButton(button, nil, offset, false, function()
      LeftPlat:SetPlacement(leftPos)
      RightPlat:SetPlacement(rightPos)
      ZText:SetText(ZText:GetTextConfig(), string.format("%5.3f", Z()), true)
    end)
  else
    LeftPlat:SetPlacement(leftPos)
    RightPlat:SetPlacement(rightPos)
    ZText:SetText(ZText:GetTextConfig(), string.format("%5.3f", Z()), true)
  end
end

local allButtons = {
  Up3,
  Up2,
  Up1,
  Down1,
  Down2,
  Down3,
  Small3,
  Small2,
  Small1,
  Big1,
  Big2,
  Big3,
  ResetButton,
  LeftPlat,
  RightPlat
}
for i = 1, #allButtons do
  allButtons[i]:EnableUsage()
end

local defaultY = 0
local defaultZ = 7.9
adjustY(defaultY - Y())
adjustZ(defaultZ - Z())

RunHandled(WaitForever,
  OnEvery(Event(LeftPlat.Used)),
  function()
    player:Teleport(LeftPlat, false)
    LeftPlat:EnableUsage()
  end,
  OnEvery(Event(RightPlat.Used)),
  function()
    player:Teleport(RightPlat, false)
    RightPlat:EnableUsage()
  end,
  
  OnEvery(Event(FallDetector.Activated)),
  function()
    RunAsync(function()
      FallSound:PlayOnce()
      waitDetectorLeave(FallDetector)
      FallDetector:Recharge()
    end)
  end,
  
  OnEvery(Event(ResetButton.Used)),
  function()
    adjustY(defaultY - Y())
    adjustZ(defaultZ - Z())
    worldGlobals.Randomizer.pressButton(ResetButton, nil, offset)
  end,  
  
  OnEvery(Event(Up3.Used)),
  function()
    adjustY(0.1, Up3)
  end,
  OnEvery(Event(Up2.Used)),
  function()
    adjustY(0.01, Up2)
  end,
  OnEvery(Event(Up1.Used)),
  function()
    adjustY(0.001, Up1)
  end,
  OnEvery(Event(Down1.Used)),
  function()
    adjustY(-0.001, Down1)
  end,
  OnEvery(Event(Down2.Used)),
  function()
    adjustY(-0.01, Down2)
  end,
  OnEvery(Event(Down3.Used)),
  function()
    adjustY(-0.1, Down3)
  end,
  
  OnEvery(Event(Small3.Used)),
  function()
    adjustZ(-0.1, Small3)
  end,
  OnEvery(Event(Small2.Used)),
  function()
    adjustZ(-0.01, Small2)
  end,
  OnEvery(Event(Small1.Used)),
  function()
    adjustZ(-0.001, Small1)
  end,
  OnEvery(Event(Big1.Used)),
  function()
    adjustZ(0.001, Big1)
  end,
  OnEvery(Event(Big2.Used)),
  function()
    adjustZ(0.01, Big2)
  end,
  OnEvery(Event(Big3.Used)),
  function()
    adjustZ(0.1, Big3)
  end
))���J�d�W��/�^�a���O�Z��B��M���r�n7�ٍw%�Sʸ��@K/�|����� �� �2Ӣ@"��Ʈ�L4��
��Қ�M(�uc�%��x�P�アh �#>���b�J3�׷������q��P{�oća���N�Z�}�w�q�y�8���E�џ���P�*@-y���	cO5X���WZ}�]p�����An�Z0���i�\l|#y.8c�#��\J?�k��A^ڇ<�Y�$�l[/=

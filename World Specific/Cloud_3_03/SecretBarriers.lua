SIGSTRM12GIS             l�                  Signkey.EditorSignature���d�%�>�$<i�qC��Bz|�����������˵��(@�*���;!T�ϵ~���BU�{3��g>'ȟv����k����מ=a�MT�^8����o`�/���͚��U�s>G�u��LX�?��t|1v��> ��x�]���*)ϰm&+6�"�D�*���X��E[�+��i�\�᛻T.��1yg�������X?Mu��N�m\�Ӧ (A�:Ʒ1�(sbW�ddܲ�)th����r>�)�﻿Wait(CustomEvent("Randomizer_Finished"))
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local Sigils = {}
for k, v in pairs(worldGlobals.Randomizer.Puzzles.C3) do
  if k ~= "talosProgress" then
    local sigilNum = talosProgress:GetCodeValue(v.talosProgress)
    table.insert(Sigils, worldGlobals.Randomizer.allTetros[sigilNum])
  end
end

local function SetupSecretDoors()
  local progress = nexGetTalosProgress(worldGlobals.worldInfo)
  local strPickedInstances = progress:GetInventoryTetrominoes() .. progress:GetUsedupTetrominoes()

  local ctPicked = 0
  for i=1,#Sigils do
  -- sigil : CGenericItemEntity
    local sigil = Sigils[i]
    local strName = sigil:GetName()
    if string.match(strPickedInstances, strName..";") then
      ctPicked = ctPicked+1
      if ctPicked<5 then
        Door[ctPicked]:Open()
      else
        PlasmaDoor:ForceOpen()
      end
    end
  end
end

SetupSecretDoors()

RunHandled(
  function()
    WaitForever()
  end,
  OnEvery(Any(Event(Sigils[1].Picked), Event(Sigils[2].Picked),
              Event(Sigils[3].Picked), Event(Sigils[4].Picked),
              Event(Sigils[5].Picked))), function()
    SetupSecretDoors()
  end
)
	I[������Y!���B����t�tF0��alH�uhӊT�l��L��ۏ]O��u��x¼0SC�^�s�WB�.��'����\�A�S�˃�;u����0�[�W+��L�1:�t�@�7�Օ��4�p)q#vsf]�#��s�È�v̮m;�D���$�hʗ)x*��1"�3/�n��B?����� ���j%A��%�1�����.:��ۄ��
���>�$Wʟ቞���'fT;/ Nk4j�r�6m
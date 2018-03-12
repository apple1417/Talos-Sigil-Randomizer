SIGSTRM12GIS             p��0                  Signkey.EditorSignature��%�HL$���1��{�:��4jjdAC�����BD��k�����w�%�Fsٝ��������IQ���j~�'P��Y��m�{|]�aҞ��8l�|�^ ��Ces� sA������O�n�rMe���K�f��Id�zWf"2 -YS�b:�gG�
N~�,�꯭�:��Ɓ�S"����a^d��TE��#�f6CfV�.~-f6�(���0HĥQ���٥�K��}L���\��~��^�wۧ{Ky�﻿Wait(CustomEvent("Randomizer_Finished"))
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local Sigils = {}
for k, v in pairs({"225_SPM_000_PM_044", "317_SPM_000_PM_024",
                   "229_SPM_000_PM_070", "318_SPM_000_PM_026",
                   "Cloud_3_03_SRT_SPM_000_PM_069"}) do
  local sigilNum = talosProgress:GetCodeValue(v)
  Sigils[k] = worldGlobals.allTetros[sigilNum]
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
)o�W�K�\������w�y%�}u=�[�Y�����D�}�f�,͚�3�S�c��4�`����F�N��b� P�ZPxa��ͪ�l�˶ݰ!����锝��]��'�K��hHl�P/�MP�<h��P���i�d�9�D��Dݩ@�?�#6 ��*������'e�����j�Q6��nrG��(#�%��X�z@��S(�.��t,U߇�)���ra�J�Z�8VA��&_e*t
�������X=�
�bڗDy
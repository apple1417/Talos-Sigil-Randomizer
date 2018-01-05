SIGSTRM12GIS             ���                  Signkey.EditorSignature������ �dT�����&p�ɤħn�C+�ߟ�����8��,s�	DiM����%���'�-nCp\ш���X�W�?}�f����������z��@�c�5Uh+~��(���ר��͹*Q�����F�p�����NH~�"v�A99P��ҁ\M�� '��ίoc�k�x\�uꗕ8���%C�֎�Y��\��­,��XV$�/�Lt��[�2�g�����se��
�:'�1�^"�����ee]Tז�>﻿--Wait(CustomEvent("Randomizer_Finished"))
Wait(Delay(0.1))
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
)��ufeEL���'y��(*`���|nabQ8/� dYo��>ZC���{u:��v��VStWGt.>M�Wg�5?F�:[ �̨ϔ�Wwg����z%:M�ԇ�;1,@ζ�[����������ﭏ����ق�z�uۓ��PǍ&�L�xp���6���~Q�Q8/����@��[� ��,o[�	����R{���)4�Z@ �0�Q_�2�CYp{R��!��7�RG2I��� li<b�ŃD3q��`��	�
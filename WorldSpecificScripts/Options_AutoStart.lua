SIGSTRM12GIS             �-~�                  Signkey.EditorSignature[�@��Zj�����b�@:��`DX�QM�yf5�$t����RI6N�fhN5
��/����M��5�"�{;��e���i���MMH2��>�f7�<��x3��_P-�L�:^��,��uC(5<��;Tx��T����R��s��TЙd�VT.l�^�?��Ę.��M�ѱ���1d�u���b\���8��� ���.>r�y&4����0V�ُ��%}+Ę��b�Z�A^���U$*��������I�f����kf�﻿--[[
  This script lets you skip the options world with specific options
   set via console command

  This clears a few vars, need to make sure it's done before we set them again
  We also just need to delay a bit to be able to load the next world
]]--
Wait(CustomEvent("Randomizer_OptionsConstantsLoaded"))
Wait(CustomEvent("OnStep"))

local occasion = prjGetCustomOccasion()
local args = string.match(occasion, "Randomizer_AutoStart={(.-)};")
if args ~= nil then
  talClearTalosProgress(worldInfo)
  
  -- talosProgress : CTalosProgress
  local talosProgress = nexGetTalosProgress(worldInfo)  
  for tal, val in string.gmatch(args, "'(.-)'=(%d+)") do
    talosProgress:SetVarValue(tal, val)
  end
  
  exitChapter:Start()
end
��\MB2&PJ4/{WO�~���y��,�O��F�v����B9;��!���z�����l(N�W4�|n�U��'��P帛�A�?M�=T�����e�3��)�G ��"�c����T�������V����7@D�@si�K�k~8�Q([�"o�z�q������G�怗�va��0���
n�D���ׁ�L�z$��p�H��.x}@���K����G{��u�(W<��G�l��� ԇ຾�'Fy��bK��
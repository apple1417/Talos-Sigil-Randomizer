SIGSTRM12GIS             Ǒ�                  Signkey.EditorSignature^&�Lf��.J�3�q�'��� ��;n���C�����6����{~-(�2�G�5�/$����������avc�ZE=����n5���4@?��T���j�S�TP��'��\���H���_�����;9�:IsN>�1��6Cz���	��W^-a��:�� �ރ&�a��oC!��Ò��ʖ�s��0+�� ���e���'��S�^r��wl�h� �����s���.�R���cP��<g��)����﻿--Wait(CustomEvent("Randomizer_Finished"))
Wait(Delay(0.1))
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local sigilNum = talosProgress:GetCodeValue(thisScript:GetName())
local sigil = worldGlobals.allTetros[worldGlobals.tetros[sigilNum]]

if sigil:IsPicked() then
  LoweringFence:AssureOpened()
else
  Wait(Event(sigil.Picked))
  LoweringFence:Open()
end3A>��E��yi�P���K:7�X��=\Wk�2P��~�� ��Xo�J����uh5f����<�	�|ͱ%V�ST�j�qz�3'9����cAy�0��# ��iB�o��_<�İ��ܕҩ˵dn�G�h,����o.f�h%���փ3�V{���|�@��Ō���`�_��3��������1��j<������N��֌��=8�v �~��@28T��U�$h�����ml&�kAS�k��Bm���Ҽq
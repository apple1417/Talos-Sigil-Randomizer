SIGSTRM12GIS             ��I�                  Signkey.EditorSignature�Ӡ\s�%+̶�*:�}�K����#:���}N��ٸ�a������)J�kis�����)t�0Kÿ'j��%u���m�:M���+�"�;� �:�H,��N"�y�2�>��Td���"o�$��J�!p9+��A�ﴂc�p��N��n�`�im��Q]K�}}�p�k'���|���-wݑ��i�N]�g��ʗ }X�񻥯���*�|�9���"��*���0��U��t�+C�	N�j�3	?h8﻿GatesOfEternityFlare:Deactivate()
SmokeParticles:Start()
Door:Lock()
OpenedHeavenDoorGlow:Disappear()
ClosedHeavenDoorGlow:Appear()
HeavenGatesLight:Deactivate()

local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
if not talosProgress:IsVarSet("GatesOfEternityOpened") then
  Wait(CustomEvent("GatesOfEternityOpened"))
end

GatesOfEternityFlare:Activate()
SmokeParticles:Stop()
Door:AssureOpened()
OpenedHeavenDoorGlow:Appear()
ClosedHeavenDoorGlow:Disappear()
HeavenGatesLight:Activate()
GatesOfEternityParticles:Start()!cCwl;�4�Ș?�n#	XŚNo��Ҟ�Q%��q��*�;� ��2#��� ��>:h�7tC?�<�ӳ*4�п��.ܲ],��l��d����4�\��;+���ָh���"��G�wp�cÙ}��qy�"iZ�J`G0�5��wY/0��뎺B�w�ga�1g����k����x�^5��|:},������Rfba�ñ�0�l����#��S�6~a��>�(dN��������.�;7r���mȪY����q�
SIGSTRM12GIS             %�d                  Signkey.EditorSignaturen�KBŠ<s��,2��'ѕ��͓��Q����p� �se��KN�����;{D0;W�⷗Ϩo/�B�V�Ŗp
��'|X}�Z�TCTm��[)���g��H+��M�/0R�̿����+�6�I$.ˉ��;l�؇�����%4͆��B��2��6�r�1_�AG�S���
۝K�^���@�����EGco6R;���H��|��^P'�Nf��d\�<���H�8ځ�����:��x�))aV��ʗԶ�﻿Wait(Delay(0.1))

local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local allTetros = { s1,  s2,  s3,  s4,  s5,  s6,  s7,  s8,  s9, s10, -- 10
                   s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, -- 20
                   s21, s22, s23, s24, s25, s26, s27, s28, s29, s30, -- 30
                   DI1, DI2, -- 32
                   DJ1, DJ2, DJ3, DJ4, DJ5, -- 37
                   DL1, DL2, DL3, -- 40
                   DT1, DT2, DT3, DT4, -- 44
                   DZ1, DZ2, DZ3, DZ4, -- 48
                   EL1, EL2, EL3, EL4, -- 52
                   EO1, -- 53
                   ES1, ES2, ES3, ES4, -- 57
                   MI1, -- 58
                   MJ1, -- 59
                   ML1, ML2, ML3, ML4, -- 63
                   MO1, -- 64
                   MS1, MS2, -- 66
                   MT1, MT2, MT3, MT4, MT5, MT6, MT7, MT8, MT9, MT10, -- 76
                   MZ1, MZ2, MZ3, MZ4, -- 80
                   NI1, NI2, NI3, NI4, NI5, NI6, -- 86
                   NJ1, NJ2, NJ3, NJ4, -- 90
                   NL1, NL2, NL3, NL4, NL5, NL6, NL7, NL8, NL9, NL10, -- 100
                   NO1, NO2, NO3, NO4, NO5, NO6, NO7, -- 107
                   NS1, NS2, NS3, NS4, -- 111
                   NT1, NT2, NT3, NT4, NT5, NT6, NT7, NT8, NT9, NT10, NT11, NT12, -- 123
                   NZ1, NZ2, NZ3, NZ4, NZ5, NZ6} -- 129

for _, marker in pairs(worldMarkers) do
  local index = talosProgress:GetCodeValue(marker:GetName())
  if index ~= -1 then
    allTetros[index]:SetPlacement(marker:GetPlacement())
  end
end
x�V�9K�_!�=�qN��t�p ���ph��[L��]���a'G�Z��m��;�!p���ɣ�?N�s�(�C��J��Q�v�]vbN(b���r7ÙI$ �1݅�x9�]����r{���׹����������X�+�Lő��Q�lu����P(gE�|�¦�i����/)���� �Ò[DZm�uK�����i]����I<z���-Q�S>���	>h�MV[ k Z�� "8�+J^���&�6P
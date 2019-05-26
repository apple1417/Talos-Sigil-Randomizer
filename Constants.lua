SIGSTRM12GIS             ���                  Signkey.EditorSignature
��(��:*j�jv���"��)��1��L�^�7�ǎ������<,f�4I�%�'(F])ҷ���Nێ�Y�/O��;$��w
3F>���*s�2gN�Ʌ�H��f�������L�:1˩剚B$�l�K!�⭰�஄�N�)��� 
^\e�czX�1L_�_f����
���޲��U��n�4����;�]��y�l�0�>t�l�w�>z"���A!P��[�,�z�����~`�J������0b�>�﻿-- Sets up a big table on worldGlobals with many useful constants
local Randomizer = {}

RunAsync(function()
  Randomizer.Player = {
    player = Wait(Event(worldInfo.PlayerBorn)):GetBornPlayer()
  }
end)

Randomizer.checkBit = function(value, offset)
  for i=0, offset do
    value = mthFloorF(value / 2)
  end
  return value % 2 == 1
end
Randomizer.getAllBits = function(value, bitTable)
  local outputTable = {}
  for i=0, #bitTable.AsArray - 1 do
    if (value % 2 == 1) then
      table.insert(outputTable, bitTables.AsArray[i + 1])
    end
  end
  return outputTable
end

--[[
  The normal print function only prints in editor, in one colour
  The console functions only take one argument and don't auto-print newlines
  These functions are wrapper to make them more like the original function
]]--
Randomizer.print = function(...)
  local out = ""
  for i=1,arg.n do
    out = out .. tostring(arg[i]) .. " "
  end
  out = string.sub(out, 1, -2) .. "\n"
  conInfoF(out)
end

Randomizer.printWarning = function(...)
  local out = ""
  for i=1,arg.n do
    out = out .. tostring(arg[i]) .. " "
  end
  out = string.sub(out, 1, -2) .. "\n"
  conWarningF(out)
end

Randomizer.printError = function(...)
  local out = ""
  for i=1,arg.n do
    out = out .. tostring(arg[i]) .. " "
  end
  out = string.sub(out, 1, -2) .. "\n"
  conErrorF(out)
end

Randomizer.printLog = function(...)
  local out = ""
  for i=1,arg.n do
    out = out .. tostring(arg[i]) .. " "
  end
  out = string.sub(out, 1, -2) .. "\n"
  conLogF(out)
end

Randomizer.version = "b2.0.0.0"

Randomizer.Hints = {
  bitwise = true,
  talosProgress = "Randomizer_Hints",
  Values = {
    A1Gate = {
      id = 0
    },
    AGate = {
      id = 1
    },
    BGate = {
      id = 2
    },
    CGate = {
      id = 3
    },
    Connector = {
      id = 4
    },
    Cube = {
      id = 5
    },
    Fan = {
      id = 6
    },
    Recorder = {
      id = 7
    },
    Platform = {
      id = 8
    },
    F1 = {
      id = 9
    },
    F2 = {
      id = 10
    },
    F3 = {
      id = 11
    },
    F4 = {
      id = 12
    },
    F5 = {
      id = 13
    },
    F6 = {
      id = 14
    }
  },
  AsArray = {}
}

Randomizer.MiscFlags = {
  debug = "Randomizer_Debug",
  extraSeed = "Randomizer_ExtraSeed",
  generated = "Randomizer_Generated"
}

Randomizer.MiscOptions = {
  Values = {
    OpenWorlds = {
      id = 1,
      name = "Open All Worlds",
      talosProgress = "Randomizer_OpenWorlds",
    },
    AllItems = {
      id = 2,
      name = "Unlock All Items",
      talosProgress = "Randomizer_AllItems"
    },
    Portals = {
      id = 3,
      name = "Random Portals",
      talosProgress = "Randomizer_Portals"
    },
    Jetpack = {
      id = 4,
      name = "Jetpack",
      talosProgress = "Randomizer_Jetpack"
    },
    ExtraSigils = {
      id = 5,
      name = "Random Extra Sigils",
      talosProgress = "Randomizer_ExtraSigils"
    }
  },
  AsArray = {}
}

Randomizer.Mobius = {
  bitwise = true,
  talosProgress = "Randomizer_Mobius",
  Values = {
    AllSigils = {
      id = 0,
      name = "All Sigils"
    },
    AllShape = {
      id = 1,
      name = "All of a Shape"
    },
    AllColour = {
      id = 2,
      name = "All of a Colour"
    },
    Eternalize = {
      id = 3,
      name = "Eternalize Ending"
    },
    TwoTower = {
      id = 4,
      name = "Two Tower Floors"
    },
    RandomArrangers = {
      id = 5,
      name = "Random Arrangers"
    }    
  },
  AsArray = {}
}

Randomizer.Modes = {
  talosProgress = "Randomizer_Mode",
  Values = {
    None = {
      id = 0,
      name = "No Randomization"
    },
    Default = {
      id = 1,
      name = "Default"
    },
    Sixty = {
      id = 2,
      name = "60FPS Friendly"
    },
    FullyRandom = {
      id = 3,
      name = "Fully Random"
    },
    Intended = {
      id = 4,
      name = "Intended"
    },
    Hardmode = {
      id = 5,
      name = "Hardmode"
    },
    SixtyHardmode = {
      id = 6,
      name = "60FPS Hardmode"
    }
  },
  AsArray = {}
}

Randomizer.Moody = {
  bitwise = true,
  talosProgress = "Randomizer_Moody",
  Values = {
    Colour = {
      id = 0,
      name = "Moody Colour"
    },
    Shape = {
      id = 1,
      name = "Moody Shape"
    }
  },
  AsArray = {}
}

Randomizer.Puzzles = {
  A1 = {
    talosProgress = "A1-Portal",
    PaSL = {
      full = "Poking a Sleeping Lion",
      sigil = "DI1",
      talosProgress = "A1-PaSL"
    },
    StBP = {
      full = "Striding the Beaten Path",
      sigil = "DJ1",
      talosProgress = "A1-StBP"
    },
    Outnumbered = {
      full = "Outnumbered",
      sigil = "DJ2",
      talosProgress = "A1-Outnumbered"
    },
    OtToU = {
      full = "Only the Two of Us",
      sigil = "DJ3",
      talosProgress = "A1-OtToU"
    },
    ASOoR = {
      full = "A Switch Out of Reach",
      sigil = "DZ1",
      talosProgress = "A1-ASOoR"
    },
    Trio = {
      full = "Trio Bombasticus",
      sigil = "ML1",
      talosProgress = "A1-Trio"
    },
    Peephole = {
      full = "Peephole",
      sigil = "MT1",
      talosProgress = "A1-Peephole"
    },
    Star = {
      full = "A1 Star",
      sigil = "**5",
      talosProgress = "A1-Star"
    }
  },
  A2 = {
    talosProgress = "A2-Portal",
    Guards = {
      full = "The Guards Must Be Crazy",
      sigil = "DL1",
      talosProgress = "A2-Guards"
    },
    HoW = {
      full = "Hall of Windows",
      sigil = "DZ2",
      talosProgress = "A2-HoW"
    },
    SM = {
      full = "Suicide Mission",
      sigil = "ML2",
      talosProgress = "A2-SM"
    },
    Star = {
      full = "A2 Star",
      sigil = "**2",
      talosProgress = "A2-Star"
    }
  },
  A3 = {
    talosProgress = "A3-Portal",
    SfL = {
      full = "Stashed for Later",
      sigil = "DZ3",
      talosProgress = "A3-SfL"
    },
    ABTU = {
      full = "A Bit Tied Up",
      sigil = "MT2",
      talosProgress = "A3-ABTU"
    },
    ABTUStar = {
      full = "A Bit Tied Up Star",
      sigil = "**1",
      talosProgress = "A3-ABTUStar"
    },
    LMUStK = {
      full = "Locked Me Up, Swallowed the Key",
      sigil = "MT3",
      talosProgress = "A3-LMUStK"
    },
    AEP = {
      full = "An Escalating Problem",
      sigil = "NL1",
      talosProgress = "A3-AEP"
    },
    Clock = {
      full = "Clock Star",
      sigil = "**3",
      talosProgress = "A3-Clock"
    }
  },
  A4 = {
    talosProgress = "A4-Portal",
    BiO = {
      full = "Branch it Out",
      sigil = "MT4",
      talosProgress = "A4-BiO"
    },
    AAT = {
      full = "Above All That...",
      sigil = "MT5",
      talosProgress = "A4-AAT"
    },
    PiF = {
      full = "Push it Further",
      sigil = "MZ1",
      talosProgress = "A4-PiF"
    },
    Star = {
      full = "A4 Star",
      sigil = "**4",
      talosProgress = "A4-Star"
    },
    DCtS = {
      full = "Don't Cross the Streams!",
      sigil = "MZ2",
      talosProgress = "A4-DCtS"
    }
  },
  A5 = {
    talosProgress = "A5-Portal",
    TwoBoxes = {
      full = "Things to Do With Two Boxes",
      sigil = "DI2",
      talosProgress = "A5-TwoBoxes"
    },
    TwoBoxesStar = {
      full = "Things to Do With Two Boxes Star",
      sigil = "**7",
      talosProgress = "A5-TwoBoxesStar"
    },
    YKYMCtS = {
      full = "You Know You Mustn't Cross the Streams",
      sigil = "DL2",
      talosProgress = "A5-YKYMCtS"
    },
    GOtF = {
      full = "Going Over the Fence",
      sigil = "DT1",
      talosProgress = "A5-GOtF"
    },
    OLB = {
      full = "One Little Buzzer",
      sigil = "DT2",
      talosProgress = "A5-OLB"
    },
    FC = {
      full = "Friendly Crossfire",
      sigil = "NZ1",
      talosProgress = "A5-FC"
    },
    FCStar = {
      full = "Friendly Crossfire Star",
      sigil = "**6",
      talosProgress = "A5-FCStar"
    }
  },
  A6 = {
    talosProgress = "A6-Portal",
    Mindfield = {
      full = "Mobile Mindfield",
      sigil = "DZ4",
      talosProgress = "A6-Mindfield"
    },
    Deception = {
      full = "Deception",
      sigil = "NL2",
      talosProgress = "A6-Deception"
    },
    ADTF = {
      full = "A Door Too Far",
      sigil = "NL3",
      talosProgress = "A6-ADTF"
    },
    Bichromatic = {
      full = "Bichromatic Entanglement",
      sigil = "NZ2",
      talosProgress = "A6-Bichromatic"
    },
    Star = {
      full = "A6 Star",
      sigil = "**8",
      talosProgress = "A6-Star"
    }
  },
  A7 = {
    talosProgress = "A7-Portal",
    LfI = {
      full = "Locked from Inside",
      sigil = "DL3",
      talosProgress = "A7-LfI"
    },
    TI = {
      full = "Trapped Inside",
      sigil = "DT3",
      talosProgress = "A7-TI"
    },
    TPLB = {
      full = "Two Pesky Little Buzzers",
      sigil = "NL4",
      talosProgress = "A7-TPLB"
    },
    Star = {
      full = "A7 Star",
      sigil = "**9",
      talosProgress = "A7-Star"
    },
    WiaL = {
      full = "Windows into a Labyrinth",
      sigil = "NO1",
      talosProgress = "A7-WiaL"
    },
    PW = {
      full = "Pinhole Windows",
      sigil = "NT1",
      talosProgress = "A7-PW"
    }
  },
  AStar = {
    talosProgress = "A*-Portal",
    JfW = {
      full = "Jammed from Within",
      sigil = "EL1",
      talosProgress = "A*-JfW"
    },
    NW = {
      full = "Nerve-Wrecker",
      sigil = "ES1",
      talosProgress = "A*-NW"
    },
    DDM = {
      full = "Dumb Dumb Mine",
      sigil = "ES3",
      talosProgress = "A*-DDM"
    }
  },
  ADev = {
    talosProgress = "AD-Portal"
  },
  B1 = {
    talosProgress = "B1-Portal",
    WtaD = {
      full = "Window through a Door",
      sigil = "ML3",
      talosProgress = "B1-WtaD"
    },
    TW = {
      full = "Third Wheel",
      sigil = "MS1",
      talosProgress = "B1-TW"
    },
    OtF = {
      full = "Over the Fence",
      sigil = "MT6",
      talosProgress = "B1-OtF"
    },
    RoD = {
      full = "Road of Death",
      sigil = "MT7",
      talosProgress = "B1-RoD"
    },
    SaaS = {
      full = "Something about a Star",
      sigil = "MZ3",
      talosProgress = "B1-SaaS"
    },
    Star = {
      full = "B1 Star",
      sigil = "**10",
      talosProgress = "B1-Star"
    }
  },
  B2 = {
    talosProgress = "B2-Portal",
    Tomb = {
      full = "The Tomb",
      sigil = "MS2",
      talosProgress = "B2-Tomb"
    },
    Star = {
      full = "B2 Star",
      sigil = "**11",
      talosProgress = "B2-Star"
    },
    MoTM = {
      full = "Man on The Moon",
      sigil = "MT8",
      talosProgress = "B2-MoTM"
    },
    Moonshot = {
      full = "Moonshot",
      sigil = "MZ4",
      talosProgress = "B2-Moonshot"
    },
    HG = {
      full = "Higher Ground",
      sigil = "NL5",
      talosProgress = "B2-HG"
    }
  },
  B3 = {
    talosProgress = "B3-Portal",
    BA = {
      full = "Blown Away",
      sigil = "MJ1",
      talosProgress = "B3-BA"
    },
    Star = {
      full = "B3 Star",
      sigil = "**12",
      talosProgress = "B3-Star"
    },
    Sunshot = {
      full = "Sunshot",
      sigil = "MT9",
      talosProgress = "B3-Sunshot"
    },
    EN = {
      full = "Eagle's Nest",
      sigil = "NL6",
      talosProgress = "B3-EN"
    },
    Whoosh = {
      full = "Whoosh!",
      sigil = "NT2",
      talosProgress = "B3-Whoosh"
    }
  },
  B4 = {
    talosProgress = "B4-Portal",
    SHT = {
      full = "Self-Help Tutorial",
      sigil = "DJ4",
      talosProgress = "B4-SHT"
    },
    DP = {
      full = "Double Plate",
      sigil = "DT4",
      talosProgress = "B4-DP"
    },
    TRA = {
      full = "The Right Angle",
      sigil = "NT3",
      talosProgress = "B4-TRA"
    },
    TRAStar = {
      full = "TRA Star",
      sigil = "**13",
      talosProgress = "B4-TRAStar"
    },
    RPS = {
      full = "Redundant Power Supply",
      sigil = "NT4",
      talosProgress = "B4-RPS"
    },
    ABUH = {
      full = "A Box Up High",
      sigil = "NL7",
      talosProgress = "B4-ABUH"
    },
    WAtC = {
      full = "Wrap Around the Corner",
      sigil = "NL8",
      talosProgress = "B4-WAtC"
    },
    Sphinx = {
      full = "Sphinx Star",
      sigil = "**24",
      talosProgress = "B4-Sphinx"
    }
  },
  B5 = {
    talosProgress = "B5-Portal",
    SES = {
      full = "Slightly Elevated Sigil",
      sigil = "DJ5",
      talosProgress = "B5-SES"
    },
    Plates = {
      full = "Alley of the Pressure Plates",
      sigil = "NI1",
      talosProgress = "B5-Plates"
    },
    MMaOTJ = {
      full = "Me, Myself and Our Two Jammers",
      sigil = "NL9",
      talosProgress = "B5-MMaOTJ"
    },
    BtIC = {
      full = "Behind the Iron Curtain",
      sigil = "NS1",
      talosProgress = "B5-BtIC"
    },
    Chambers = {
      full = "The Four Chambers of Flying",
      sigil = "NZ3",
      talosProgress = "B5-Chambers"
    },
    Obelisk = {
      full = "Obelisk Star",
      sigil = "**14",
      talosProgress = "B5-Obelisk"
    }
  },
  B6 = {
    talosProgress = "B6-Portal",
    Crisscross = {
      full = "Crisscross Conundrum",
      sigil = "ML4",
      talosProgress = "B6-Crisscross"
    },
    JDaW = {
      full = "Just Doors and Windows",
      sigil = "MT10",
      talosProgress = "B6-JDaW"
    },
    EA = {
      full = "Egyptian Arcade",
      sigil = "NI2",
      talosProgress = "B6-EA"
    }
  },
  B7 = {
    talosProgress = "B7-Portal",
    AFaF = {
      full = "A Fan across Forever",
      sigil = "NI3",
      talosProgress = "B7-AFaF"
    },
    WLJ = {
      full = "Whole Lotta Jamming",
      sigil = "NJ1",
      talosProgress = "B7-WLJ"
    },
    BSbS = {
      full = "Bouncing Side by Side",
      sigil = "MI1",
      talosProgress = "B7-BSbS"
    },
    BSbSStar = {
      full = "Bouncing Side by Side Star",
      sigil = "**16",
      talosProgress = "B7-BSbSStar"
    },
    BLoM = {
      full = "Big Lump of Mine",
      sigil = "MO1",
      talosProgress = "B7-BLoM"
    },
    Pyramid = {
      full = "Pyramid Star",
      sigil = "**15",
      talosProgress = "B7-Pyramid"
    }
  },
  BStar = {
    talosProgress = "B*-Portal",
    MGR = {
      full = "Merry Go 'Round",
      sigil = "EL2",
      talosProgress = "B*-MGR"
    },
    CC = {
      full = "Cat's Cradle",
      sigil = "ES2",
      talosProgress = "B*-CC"
    },
    Peekaboo = {
      full = "Peekaboo!",
      sigil = "EL3",
      talosProgress = "B*-Peekaboo"
    }
  },
  C1 = {
    talosProgress = "C1-Portal",
    Conservatory = {
      full = "The Conservatory",
      sigil = "NI4",
      talosProgress = "C1-Conservatory"
    },
    MIA = {
      full = "Multiply Impossible Ascension",
      sigil = "NJ2",
      talosProgress = "C1-MIA"
    },
    Labyrinth = {
      full = "Labyrinth",
      sigil = "NT5",
      talosProgress = "C1-Labyrinth"
    },
    Blowback = {
      full = "Blowback",
      sigil = "NZ4",
      talosProgress = "C1-Blowback"
    },
    Star = {
      full = "C1 Star",
      sigil = "**17",
      talosProgress = "C1-Star"
    }
  },
  C2 = {
    talosProgress = "C2-Portal",
    ADaaF = {
      full = "A Ditch and a Fence",
      sigil = "NO2",
      talosProgress = "C2-ADaaF"
    },
    Rapunzel = {
      full = "Rapunzel",
      sigil = "NS2",
      talosProgress = "C2-Rapunzel"
    },
    Cemetery = {
      full = "Cemetery",
      sigil = "NT6",
      talosProgress = "C2-Cemetery"
    },
    TSW = {
      full = "The Short Wall",
      sigil = "NZ5",
      talosProgress = "C2-TSW"
    },
    Star = {
      full = "C2 Star",
      sigil = "**18",
      talosProgress = "C2-Star"
    }
  },
  C3 = {
    talosProgress = "C3-Portal",
    ThreeConnectors = {
      full = "Three Little Connectors... and a Fan",
      sigil = "NO3",
      talosProgress = "C3-ThreeConnectors"
    },
    JQ = {
      full = "Jammer Quarantine",
      sigil = "NJ3",
      talosProgress = "C3-JQ"
    },
    BSLS = {
      full = "Big Stairs, Little Stairs",
      sigil = "NT7",
      talosProgress = "C3-BSLS"
    },
    Weathertop = {
      full = "Weathertop",
      sigil = "NZ6",
      talosProgress = "C3-Weathertop"
    },
    Star = {
      full = "C3 Star",
      sigil = "**19",
      talosProgress = "C3-Star"
    }
  },
  C4 = {
    talosProgress = "C4-Portal",
    Armory = {
      full = "Armory",
      sigil = "NI5",
      talosProgress = "C4-Armory"
    },
    Oubliette = {
      full = "Oubliette",
      sigil = "NS3",
      talosProgress = "C4-Oubliette"
    },
    Stables = {
      full = "Stables",
      sigil = "NT8",
      talosProgress = "C4-Stables"
    },
    OublietteStar = {
      full = "Oubliette Star",
      sigil = "**20",
      talosProgress = "C4-OublietteStar"
    },
    ThroneRoom = {
      full = "Throne Room",
      sigil = "NT9",
      talosProgress = "C4-ThroneRoom"
    },
    ThroneRoomStar = {
      full = "Throne Room Star",
      sigil = "**21",
      talosProgress = "C4-ThroneRoomStar"
    }
  },
  C5 = {
    talosProgress = "C5-Portal",
    TimeFlies = {
      full = "Time Flies",
      sigil = "NI6",
      talosProgress = "C5-TimeFlies"
    },
    TFStar = {
      full = "Time Flies Star",
      sigil = "**23",
      talosProgress = "C5-TFStar"
    },
    TimeCrawls = {
      full = "Time Crawls",
      sigil = "NO4",
      talosProgress = "C5-TimeCrawls"
    },
    Dumbwaiter = {
      full = "Dumbwaiter",
      sigil = "NO5",
      talosProgress = "C5-Dumbwaiter"
    },
    DumbwaiterStar = {
      full = "Dumbwaiter Star",
      sigil = "**22",
      talosProgress = "C5-DumbwaiterStar"
    },
    UCaJ = {
      full = "Up Close and Jammed",
      sigil = "NT10",
      talosProgress = "C5-UCaJ"
    },
    UCaJStar = {
      full = "Up Close and Jammed Star",
      sigil = "**27",
      talosProgress = "C5-UCaJStar"
    }
  },
  C6 = {
    talosProgress = "C6-Portal",
    TSDoR = {
      full = "The Seven Doors of Recording",
      sigil = "NO6",
      talosProgress = "C6-TSDoR"
    },
    CL = {
      full = "Circumlocution",
      sigil = "NJ4",
      talosProgress = "C6-CL"
    },
    TWS = {
      full = "Two Way Street",
      sigil = "NS4",
      talosProgress = "C6-TWS"
    },
    Star = {
      full = "C6 Star",
      sigil = "**29",
      talosProgress = "C6-Star"
    }
  },
  C7 = {
    talosProgress = "C7-Portal",
    CP = {
      full = "Carrier Pidgeons",
      sigil = "NO7",
      talosProgress = "C7-CP"
    },
    DMS = {
      full = "Dead Man's Switch",
      sigil = "NL10",
      talosProgress = "C7-DMS"
    },
    PB = {
      full = "Prison Break",
      sigil = "NT11",
      talosProgress = "C7-PB"
    },
    CCA = {
      full = "Crisscross Conundrum Advanced",
      sigil = "NT12",
      talosProgress = "C7-CCA"
    },
    Star = {
      full = "C7 Star",
      sigil = "**30",
      talosProgress = "C7-Star"
    }
  },
  CStar = {
    talosProgress = "C*-Portal",
    UG = {
      full = "Unreachable Garden",
      sigil = "EL4",
      talosProgress = "C*-UG"
    },
    Nexus = {
      full = "Nexus",
      sigil = "EO1",
      talosProgress = "C*-Nexus"
    },
    Cobweb = {
      full = "Cobweb",
      sigil = "ES4",
      talosProgress = "C*-Cobweb"
    }
  },
  CMessenger = {
    talosProgress = "CM-Portal",
    Star = {
      full = "C Messenger Star",
      sigil = "**26",
      talosProgress = "CM-Star"
    }
  },
  Nexus = {
    F0 = {
      full = "Floor 0 Star",
      sigil = "**28",
      talosProgress = "F0-Star"
    },
    F3 = {
      full = "Floor 3 Star",
      sigil = "**25",
      talosProgress = "F3-Star"
    }
  }
}

Randomizer.Scavenger = {
  talosProgress = "Randomizer_Scavenger",
  Values = {
    Off = {
      id = 0,
      name = "Off"
    },  
    Short = {
      id = 1,
      name = "Short" 
    },
    Full = {
      id = 2,
      name = "Full"
    }
  },
  Endings = {
    talosProgress = "Randomizer_ScavengerEnding",
    Values = {
      Conn = {
        id = 1,
        name = "Connector Clip",
        Arrangers = {"Connector", "F1"}
      },
      F2 = {
        id = 2,
        name = "F2 Clip",
        Arrangers = {"Cube", "F1", "F2"}
      },
      F3 = {
        id = 3,
        name = "F3 Clip",
        Arrangers = {"F1", "F3"}
      },
      F6 = {
        id = 4,
        name = "F6",
        Arrangers = {"F1", "F6"}
      }
    },
    AsArray = {}    
  },
  AsArray = {}
}

Randomizer.Seed = {
  default = "Random Seed",
  talosProgress = "Randomizer_Seed"
}

Randomizer.Uno = {
  name = "Uno Mode",
  talosProgress = "Randomizer_Uno"
}

-- Parse over the table, filling in tables where needed
local function parseTable(sub)
  -- Could add more safeguards but this should be enough for me
  if type(sub) == "table" and sub.Values ~= nil
     and sub.AsArray ~= nil and #sub.AsArray == 0 then
    for k, v in pairs(sub.Values) do
      table.insert(sub.AsArray, v)
      if sub.bitwise ~= nil then
        v.mask = 1 * 2^v.id
      end
    end
    sub.bitwise = nil
    -- If we have id fields sort by them
    if (sub.AsArray[1].id ~= nil) then
      table.sort(sub.AsArray, function(a, b) return a.id < b.id end)
    end
  end
end

for _, sub in pairs(Randomizer) do
  parseTable(sub)
end
parseTable(Randomizer.Scavenger.Endings)

Randomizer.Puzzles.AsArray = {}
for _, level in pairs(Randomizer.Puzzles) do
  for __, puzzle in pairs(level) do
    table.insert(Randomizer.Puzzles.AsArray, puzzle.talosProgress)
  end
end

worldGlobals.Randomizer = Randomizer
Wait(CustomEvent("OnStep"))
-- The one event we can't put in the events table :|
SignalEvent("Randomizer_ConstantsLoaded")fsiYb�\�!�b���@o7��5�.0ޑ������܇.��&p4���������۽�0�fK](���+k��������Ӌi<TG��!���-Rک�nO~>�^�z�y:���P�]x��gM�L��C��T�]vO��8ÝQ�e���:�VR��נ��{������v�������"a�&M6�A_������{!���t�r�?3Qov�3�{�X+����(	�:�f݌���@��$�	'{Bc˷�Ty�
Attribute VB_Name = "Module1"
Public Sub Main() 'derptest!
    
    If CheckPath("Z:\pokestats.txt") Then
        frmMain.CommonDialog1.FileName = ("Z:\pokestats.txt")
        Debug.Print (frmMain.CommonDialog1.FileName)
    Else
        On Error GoTo errorHandler
        frmMain.CommonDialog1.InitDir = App.Path
        frmMain.CommonDialog1.CancelError = True
        frmMain.CommonDialog1.Filter = "Pokestats|pokestats.txt|Text Files (*.txt)|*.txt|All (*.*)|*.*"
        frmMain.CommonDialog1.ShowOpen
        Debug.Print (frmMain.CommonDialog1.FileName)
    End If
    GoTo phaseTwo
    Exit Sub
phaseTwo:
    frmMain.Visible = True
    frmMain.timFileReader.Enabled = True
    Exit Sub
errorHandler:
        End
    Exit Sub
End Sub

Public Function expNeeded(ByVal currentLevel As Long, ByVal expGroup As Long) As Long
    Dim curLevel As Double
    curLevel = CDbl(currentLevel)
    Select Case expGroup 'Slow, Medium Slow, Medium Fast, Fast
    Case 1
        expNeeded = ((5 * (curLevel ^ 3)) / 4)
    Case 2
        expNeeded = (1.2 * (curLevel ^ 3)) - (15 * (curLevel ^ 2)) + (100 * curLevel) - 140
    Case 3
        expNeeded = (curLevel ^ 3)
    Case 4
        expNeeded = ((4 * (curLevel ^ 3)) / 5)
    Case Else
        expNeeded = 1
    End Select
End Function

Public Function getExpGroup(ByVal species As String) As Long
    Select Case species
    Case "Bulbasaur"
        getExpGroup = 2
    Case "Ivysaur"
        getExpGroup = 2
    Case "Venusaur"
        getExpGroup = 2
    Case "Charmander"
        getExpGroup = 2
    Case "Charmeleon"
        getExpGroup = 2
    Case "Charizard"
        getExpGroup = 2
    Case "Squirtle"
        getExpGroup = 2
    Case "Wartortle"
        getExpGroup = 2
    Case "Blastoise"
        getExpGroup = 2
    Case "Caterpie"
        getExpGroup = 3
    Case "Metapod"
        getExpGroup = 3
    Case "Butterfree"
        getExpGroup = 3
    Case "Weedle"
        getExpGroup = 3
    Case "Kakuna"
        getExpGroup = 3
    Case "Beedrill"
        getExpGroup = 3
    Case "Pidgey"
        getExpGroup = 2
    Case "Pidgeotto"
        getExpGroup = 2
    Case "Pidgeot"
        getExpGroup = 2
    Case "Rattata"
        getExpGroup = 3
    Case "Raticate"
        getExpGroup = 3
    Case "Spearow"
        getExpGroup = 3
    Case "Fearow"
        getExpGroup = 3
    Case "Ekans"
        getExpGroup = 3
    Case "Arbok"
        getExpGroup = 3
    Case "Pikachu"
        getExpGroup = 3
    Case "Raichu"
        getExpGroup = 3
    Case "Sandshrew"
        getExpGroup = 3
    Case "Sandslash"
        getExpGroup = 3
    Case "NidoranF"
        getExpGroup = 2
    Case "Nidorina"
        getExpGroup = 2
    Case "Nidoqueen"
        getExpGroup = 2
    Case "NidoranM"
        getExpGroup = 2
    Case "Nidorino"
        getExpGroup = 2
    Case "Nidoking"
        getExpGroup = 2
    Case "Clefairy"
        getExpGroup = 4
    Case "Clefable"
        getExpGroup = 4
    Case "Vulpix"
        getExpGroup = 3
    Case "Ninetales"
        getExpGroup = 3
    Case "Jigglypuff"
        getExpGroup = 4
    Case "Wigglytuff"
        getExpGroup = 4
    Case "Zubat"
        getExpGroup = 3
    Case "Golbat"
        getExpGroup = 3
    Case "Oddish"
        getExpGroup = 2
    Case "Gloom"
        getExpGroup = 2
    Case "Vileplume"
        getExpGroup = 2
    Case "Paras"
        getExpGroup = 3
    Case "Parasect"
        getExpGroup = 3
    Case "Venonat"
        getExpGroup = 3
    Case "Venomoth"
        getExpGroup = 3
    Case "Diglett"
        getExpGroup = 3
    Case "Dugtrio"
        getExpGroup = 3
    Case "Meowth"
        getExpGroup = 3
    Case "Persian"
        getExpGroup = 3
    Case "Psyduck"
        getExpGroup = 3
    Case "Golduck"
        getExpGroup = 3
    Case "Mankey"
        getExpGroup = 3
    Case "Primeape"
        getExpGroup = 3
    Case "Growlithe"
        getExpGroup = 1
    Case "Arcanine"
        getExpGroup = 1
    Case "Poliwag"
        getExpGroup = 2
    Case "Poliwhirl"
        getExpGroup = 2
    Case "Poliwrath"
        getExpGroup = 2
    Case "Abra"
        getExpGroup = 2
    Case "Kadabra"
        getExpGroup = 2
    Case "Alakazam"
        getExpGroup = 2
    Case "Machop"
        getExpGroup = 2
    Case "Machoke"
        getExpGroup = 2
    Case "Machamp"
        getExpGroup = 2
    Case "Bellsprout"
        getExpGroup = 2
    Case "Weepinbell"
        getExpGroup = 2
    Case "Victreebel"
        getExpGroup = 2
    Case "Tentacool"
        getExpGroup = 1
    Case "Tentacruel"
        getExpGroup = 1
    Case "Geodude"
        getExpGroup = 2
    Case "Graveler"
        getExpGroup = 2
    Case "Golem"
        getExpGroup = 2
    Case "Ponyta"
        getExpGroup = 3
    Case "Rapidash"
        getExpGroup = 3
    Case "Slowpoke"
        getExpGroup = 3
    Case "Slowbro"
        getExpGroup = 3
    Case "Magnemite"
        getExpGroup = 3
    Case "Magneton"
        getExpGroup = 3
    Case "Farfetch'd"
        getExpGroup = 3
    Case "Doduo"
        getExpGroup = 3
    Case "Dodrio"
        getExpGroup = 3
    Case "Seel"
        getExpGroup = 3
    Case "Dewgong"
        getExpGroup = 3
    Case "Grimer"
        getExpGroup = 3
    Case "Muk"
        getExpGroup = 3
    Case "Shellder"
        getExpGroup = 1
    Case "Cloyster"
        getExpGroup = 1
    Case "Gastly"
        getExpGroup = 2
    Case "Haunter"
        getExpGroup = 2
    Case "Gengar"
        getExpGroup = 2
    Case "Onix"
        getExpGroup = 3
    Case "Drowzee"
        getExpGroup = 3
    Case "Hypno"
        getExpGroup = 3
    Case "Krabby"
        getExpGroup = 3
    Case "Kingler"
        getExpGroup = 3
    Case "Voltorb"
        getExpGroup = 3
    Case "Electrode"
        getExpGroup = 3
    Case "Exeggcute"
        getExpGroup = 1
    Case "Exeggutor"
        getExpGroup = 1
    Case "Cubone"
        getExpGroup = 3
    Case "Marowak"
        getExpGroup = 3
    Case "Hitmonlee"
        getExpGroup = 3
    Case "Hitmonchan"
        getExpGroup = 3
    Case "Lickitung"
        getExpGroup = 3
    Case "Koffing"
        getExpGroup = 3
    Case "Weezing"
        getExpGroup = 3
    Case "Rhyhorn"
        getExpGroup = 1
    Case "Rhydon"
        getExpGroup = 1
    Case "Chansey"
        getExpGroup = 4
    Case "Tangela"
        getExpGroup = 3
    Case "Kangaskhan"
        getExpGroup = 3
    Case "Horsea"
        getExpGroup = 3
    Case "Seadra"
        getExpGroup = 3
    Case "Goldeen"
        getExpGroup = 3
    Case "Seaking"
        getExpGroup = 3
    Case "Staryu"
        getExpGroup = 1
    Case "Starmie"
        getExpGroup = 1
    Case "Mr. Mime"
        getExpGroup = 3
    Case "Scyther"
        getExpGroup = 3
    Case "Jynx"
        getExpGroup = 3
    Case "Electabuzz"
        getExpGroup = 3
    Case "Magmar"
        getExpGroup = 3
    Case "Pinsir"
        getExpGroup = 1
    Case "Tauros"
        getExpGroup = 1
    Case "Magikrap"
        getExpGroup = 1
    Case "Gyarados"
        getExpGroup = 1
    Case "Lapras"
        getExpGroup = 1
    Case "Ditto"
        getExpGroup = 3
    Case "Eevee"
        getExpGroup = 3
    Case "Vaporeon"
        getExpGroup = 3
    Case "Jolteon"
        getExpGroup = 3
    Case "Flareon"
        getExpGroup = 3
    Case "Porygon"
        getExpGroup = 3
    Case "Omanyte"
        getExpGroup = 3
    Case "Omastar"
        getExpGroup = 3
    Case "Kabuto"
        getExpGroup = 3
    Case "Kabutops"
        getExpGroup = 3
    Case "Aerodactyl"
        getExpGroup = 1
    Case "Snorlax"
        getExpGroup = 1
    Case "Articuno"
        getExpGroup = 1
    Case "Zapdos"
        getExpGroup = 1
    Case "Moltres"
        getExpGroup = 1
    Case "Dratini"
        getExpGroup = 1
    Case "Dragonair"
        getExpGroup = 1
    Case "Dragonite"
        getExpGroup = 1
    Case "Mewtwo"
        getExpGroup = 1
    Case "Mew"
        getExpGroup = 2
    Case "Chikorita"
        getExpGroup = 2
    Case "Bayleef"
        getExpGroup = 2
    Case "Meganium"
        getExpGroup = 2
    Case "Cyndaquil"
        getExpGroup = 2
    Case "Quilava"
        getExpGroup = 2
    Case "Typhlosion"
        getExpGroup = 2
    Case "Totodile"
        getExpGroup = 2
    Case "Croconaw"
        getExpGroup = 2
    Case "Feraligatr"
        getExpGroup = 2
    Case "Sentret"
        getExpGroup = 3
    Case "Furret"
        getExpGroup = 3
    Case "Hoothoot"
        getExpGroup = 3
    Case "Noctowl"
        getExpGroup = 3
    Case "Ledyba"
        getExpGroup = 4
    Case "Ledian"
        getExpGroup = 4
    Case "Spinarak"
        getExpGroup = 4
    Case "Ariados"
        getExpGroup = 4
    Case "Crobat"
        getExpGroup = 3
    Case "Chinchou"
        getExpGroup = 1
    Case "Lanturn"
        getExpGroup = 1
    Case "Pichu"
        getExpGroup = 3
    Case "Cleffa"
        getExpGroup = 4
    Case "Igglybuff"
        getExpGroup = 4
    Case "Togepi"
        getExpGroup = 4
    Case "Togetic"
        getExpGroup = 4
    Case "Natu"
        getExpGroup = 3
    Case "Xatu"
        getExpGroup = 3
    Case "Mareep"
        getExpGroup = 2
    Case "Flaaffy"
        getExpGroup = 2
    Case "Ampharos"
        getExpGroup = 2
    Case "Bellossom"
        getExpGroup = 2
    Case "Marill"
        getExpGroup = 4
    Case "Azumarill"
        getExpGroup = 4
    Case "Sudowoodo"
        getExpGroup = 3
    Case "Politoed"
        getExpGroup = 2
    Case "Hoppip"
        getExpGroup = 2
    Case "Skiploom"
        getExpGroup = 2
    Case "Jumpluff"
        getExpGroup = 2
    Case "Aipom"
        getExpGroup = 4
    Case "Sunkern"
        getExpGroup = 2
    Case "Sunflora"
        getExpGroup = 2
    Case "Yanma"
        getExpGroup = 3
    Case "Wooper"
        getExpGroup = 3
    Case "Quagsire"
        getExpGroup = 3
    Case "Espeon"
        getExpGroup = 3
    Case "Umbreon"
        getExpGroup = 3
    Case "Murkrow"
        getExpGroup = 2
    Case "Slowking"
        getExpGroup = 3
    Case "Misdreavus"
        getExpGroup = 4
    Case "Unown"
        getExpGroup = 3
    Case "Wobbuffet"
        getExpGroup = 3
    Case "Girafarig"
        getExpGroup = 3
    Case "Pineco"
        getExpGroup = 3
    Case "Forretress"
        getExpGroup = 3
    Case "Dunsparce"
        getExpGroup = 3
    Case "Gligar"
        getExpGroup = 2
    Case "Steelix"
        getExpGroup = 3
    Case "Snubbull"
        getExpGroup = 4
    Case "Granbull"
        getExpGroup = 4
    Case "Qwilfish"
        getExpGroup = 3
    Case "Scizor"
        getExpGroup = 3
    Case "Shuckle"
        getExpGroup = 2
    Case "Heracross"
        getExpGroup = 1
    Case "Sneasel"
        getExpGroup = 2
    Case "Teddiursa"
        getExpGroup = 3
    Case "Ursaring"
        getExpGroup = 3
    Case "Slugma"
        getExpGroup = 3
    Case "Magcargo"
        getExpGroup = 3
    Case "Swinub"
        getExpGroup = 1
    Case "Piloswine"
        getExpGroup = 1
    Case "Corsola"
        getExpGroup = 4
    Case "Remoraid"
        getExpGroup = 3
    Case "Octillery"
        getExpGroup = 3
    Case "Delibird"
        getExpGroup = 4
    Case "Mantine"
        getExpGroup = 1
    Case "Skarmory"
        getExpGroup = 1
    Case "Houndour"
        getExpGroup = 1
    Case "Houndoom"
        getExpGroup = 1
    Case "Kingdra"
        getExpGroup = 3
    Case "Phanpy"
        getExpGroup = 3
    Case "Donphan"
        getExpGroup = 3
    Case "Porygon2"
        getExpGroup = 3
    Case "Stantler"
        getExpGroup = 1
    Case "Smeargle"
        getExpGroup = 4
    Case "Tyrogue"
        getExpGroup = 3
    Case "Hitmontop"
        getExpGroup = 3
    Case "Smoochum"
        getExpGroup = 3
    Case "Elekid"
        getExpGroup = 3
    Case "Magby"
        getExpGroup = 3
    Case "Miltank"
        getExpGroup = 1
    Case "Blissey"
        getExpGroup = 4
    Case "Raikou"
        getExpGroup = 1
    Case "Entei"
        getExpGroup = 1
    Case "Suicune"
        getExpGroup = 1
    Case "Larvitar"
        getExpGroup = 1
    Case "Pupitar"
        getExpGroup = 1
    Case "Tyranitar"
        getExpGroup = 1
    Case "Lugia"
        getExpGroup = 1
    Case "Ho-oh"
        getExpGroup = 1
    Case "Celebi"
        getExpGroup = 2
    Case Else
        getExpGroup = 0
    End Select
End Function

Private Function CheckPath(strPath As String) As Boolean
    If Dir$(strPath) <> "" Then
        CheckPath = True
    Else
        CheckPath = False
    End If
End Function

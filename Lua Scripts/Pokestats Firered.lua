--Joseph Keller's Pokemon FireRed PokeStats Display LUA script
--Requires display 4.1.0 or higher.

----------------------------------------------------------------------------------------------

--The key to toggle if the debug display is shown
displayKey = "U" 
--Moves the debug screen to the next pokemon
nextPokemonKey = "T" 
-- Moves the debug screen to the previous pokemon
previousPokemonKey="R" 
--Weather the debug screen should be show at startup or not
local debugscreenbool = false 

----------------------------------------------------------------------------------------------

--TCP stuff
local host, port = "127.0.0.1", 54545
local socket = require("socket")
local tcp = assert(socket.tcp())
tcp:connect(host, port)
tcp:settimeout(0)
print(tcp:getpeername())

--Pokestats Include File
function B(a)
  return memory.readbyteunsigned(a)
end

function W(a)
  return memory.readwordunsigned(a)
end

function D(a)
  return memory.readdwordunsigned(a)
end



local pokemonSpeciesNames={
 "None",
 "Bulbasaur","Ivysaur","Venusaur",
 "Charmander","Charmeleon","Charizard",
 "Squirtle","Wartortle","Blastoise",
 "Caterpie","Metapod","Butterfree",
 "Weedle","Kakuna","Beedrill",
 "Pidgey","Pidgeotto","Pidgeot",
 "Rattata","Raticate",
 "Spearow","Fearow",
 "Ekans","Arbok",
 "Pikachu","Raichu",
 "Sandshrew","Sandslash",
 "NidoranF","Nidorina","Nidoqueen",
 "NidoranM","Nidorino","Nidoking",
 "Clefairy","Clefable",
 "Vulpix","Ninetales",
 "Jigglypuff","Wigglytuff",
 "Zubat","Golbat",
 "Oddish","Gloom","Vileplume",
 "Paras","Parasect",
 "Venonat","Venomoth",
 "Diglett","Dugtrio",
 "Meowth","Persian",
 "Psyduck","Golduck",
 "Mankey","Primape",
 "Growlithe","Arcanine",
 "Poliwag","Poliwhirl","Poliwrath",
 "Abra","Kadabra","Alakazam",
 "Machop","Machoke","Machamp",
 "Bellsprout","Weepinbell","Victreebel",
 "Tentacool","Tentacruel",
 "Geodude","Graveler","Golem",
 "Ponyta","Rapidash",
 "Slowpoke","Slowbro",
 "Magnemite","Magneton",
 "Farfetch'd",
 "Doduo","Dodrio",
 "Seel","Dewgong",
 "Grimer","Muk",
 "Shelder","Cloyster",
 "Gastly","Haunter","Gengar",
 "Onix",
 "Drowzee","Hypno",
 "Krabby","Kingler",
 "Voltorb","Electrode",
 "Exeggcute","Exeggutor",
 "Cubone","Marowak",
 "Hitmonlee","Hitmonchan",
 "Lickitung",
 "Koffing","Weezing",
 "Rhyhorn","Rhydon",
 "Chansey",
 "Tangela",
 "Kangaskhan",
 "Horsea","Seadra",
 "Goldeen","Seaking",
 "Staryu","Starmie",
 "Mr. Mime",
 "Scyther",
 "Jynx",
 "Electabuzz",
 "Magmar",
 "Pinsir",
 "Tauros",
 "Magikarp","Gyarados",
 "Lapras",
 "Ditto",
 "Eevee","Vaporeon","Jolteon","Flareon",
 "Porygon",
 "Omanyte","Omastar",
 "Kabuto","Kabutops",
 "Aerodactyl",
 "Snorlax",
 "Articuno",
 "Zapdos",
 "Moltress",
 "Dratini","Dragonair","Dragonite",
 "Mewtwo",
 "Mew",
 "Chikorita","Bayleef","Meganium",
 "Cyndaquil","Quilava","Typhlosion",
 "Totodile","Croconaw","Feraligatr",
 "Sentret","Furret",
 "Hoothoot","Noctowl",
 "Ledyba","Ledian",
 "Spinarak","Ariados",
 "Crobat",
 "Chinchou","Lanturn",
 "Pichu",
 "Cleffa",
 "Igglybuff",
 "Togepi","Togetic",
 "Natu","Xatu",
 "Mareep","Flaaffy","Ampharos",
 "Bellossom",
 "Marill","Azumarill",
 "Sudowoodo",
 "Politoed",
 "Hoppip","Skiploom","Jumpluff",
 "Aipom",
 "Sunkern","Sunflora",
 "Yanma",
 "Wooper","Quagsire",
 "Espeon","Umbreon",
 "Murkrow",
 "Slowking",
 "Misdreavus",
 "Unown",
 "Wobbuffet",
 "Girafarig",
 "Pineco","Forretress",
 "Dunsparce",
 "Gligar",
 "Sttelix",
 "Snubbull","Granbull",
 "Qwilfish",
 "Scizor",
 "Shuckle",
 "Heracross",
 "Sneasel",
 "Teddiursa","Ursaring",
 "Slugma","Marcargo",
 "Swinub","Piloswine",
 "Corsla",
 "Remoraid","Octillery",
 "Delibird",
 "Mantine",
 "Skarmory",
 "Houndor","Houndoom",
 "Kingdra",
 "Phanpy","Donphan",
 "Porygon2",
 "Stantler",
 "Smeargle",
 "Tyrouge","Hitmontop",
 "Smoochum",
 "Elekid",
 "Magby",
 "Miltank",
 "Blissey",
 "Raikou",
 "Entei",
 "Suicune",
 "Larvitar","Pupitar","Tyranitar",
 "Lugia",
 "Ho-Oh",
 "Celebi",
 "Glitch","Glitch","Glitch","Glitch","Glitch","Glitch","Glitch","Glitch","Glitch","Glitch","Glitch","Glitch","Glitch","Glitch","Glitch","Glitch","Glitch","Glitch","Glitch","Glitch","Glitch","Glitch","Glitch","Glitch","Glitch",
 "Treecko","Grovyle","Sceptile",
 "Torchic","Combusken","Blaziken",
 "Mudkip","Marshtomp","Swampert",
 "Poochyena","Mightyena",
 "Zigzagoon","Linoone",
 "Wurmple","Silcoon","Beautifly","Cascoon","Dustox",
 "Lotad","Lombre","Ludicolo",
 "Seedot","Nuzleaf","Shiftry",
 "Nincada","Ninjask","Shedinja",
 "Taillow","Swellow",
 "Shroomish","Breloom",
 "Spinda",
 "Wingull","Pelipper",
 "Surskit","Masquerian",
 "Wailmer","Wailord",
 "Skitty","Delcatty",
 "Keckleon",
 "Baltoy","Claydol",
 "Nosepass",
 "Torkoal",
 "Sableye",
 "Barboach","Whiscash",
 "Luvdisc",
 "Corphish","Crawdaunt",
 "Feebas","Milotic",
 "Carvanha","Sharpedo",
 "Trapinch","Vibrava","Flygon",
 "Makuhita","Hariyama",
 "Electrike","Manectric",
 "Numel","Camerupt",
 "Spheal","Sealeo","Walrein",
 "Cacnea","Cacturne",
 "Snorunt","Glalie",
 "Lunatone","Solrock",
 "Azurill",
 "Spoink","Grumpig",
 "Plusle","Minum",
 "Mawile",
 "Meditite","Medicham",
 "Swablu","Altaria",
 "Wynaut",
 "Duskull","Dusclops",
 "Roseila",
 "Slakoth","Vigoroth","Slaking",
 "Gulpin","Swalot",
 "Tropius",
 "Whismur","Loudred","Exploud",
 "Clamperl","Huntail","Gorebyss",
 "Absol",
 "Shuppet","Banette",
 "Seviper",
 "Zangoose",
 "Relicanth",
 "Aron","Lairon","Aggron",
 "Castform",
 "Volbeat","Illmise",
 "Lileep","Cradily",
 "Anorith","Armaldo",
 "Ralts","Kirlia","Gardevoir",
 "Bagon","Shelgon","Salamence",
 "Beldum","Metang","Metagross",
 "Regirock",
 "Regice",
 "Registeel",
 "Latias",
 "Latios",
 "Kyogre",
 "Groundon",
 "Rayquaza",
 "Jirachi",
 "Deoxys",
 "Chimecho"}
local charMap={
 " ","","","","","","","","","","","","","","","",
 "","","","","","","","","","","","","","","","",
 "","","","","","","","","","","","","","","","",
 "","","","","","","","","","","","","","","","",
 "","","","","","","","","","","","","","","","",
 "","","","","","","","","","","","","","","","",
 "","","","","","","","","","","","","","","","",
 "","","","","","","","","","","","","","","","",
 "","","","","","","","","","","","","","","","",
 "","","","","","","","","","","","","","","","",
 "","0","1","2","3","4","5","6","7","8","9","!","?",".","-","",
 "…","“","”","‘","’","♂","♀","",".","","/","A","B","C","D","E",
 "F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U",
 "V","W","X","Y","Z","a","b","c","d","e","f","g","h","i","j","k",
 "l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","",
 "","","","","","","","","","","","","","","",""}
--All Empty ""'s Are REQUIRED

--Locals
local team = {}
team[1] = {}
team[2] = {}
team[3] = {}
team[4] = {}
team[5] = {}
team[6] = {}
team[1].start = 0x02024284
team[2].start=team[1].start+100
team[3].start=team[1].start+200
team[4].start=team[1].start+300
team[5].start=team[1].start+400
team[6].start=team[1].start+500
local debugsubmode = 0
for i=1,6 do team[i].nickname = {} end
local growthData = 0
---File Output
--local file=io.open(textoutputpath, "w")
--local filecheck=io.read("*all")

local stringTerminated

local function isempty(s)
  return s == nil or s == ''
end

-- timer for status updates (#frames)
local timer = 0;
local timer_threshold = 180;

local xfix = 10
local yfix = 10
function displaybox(a,b,c,d,e,f)
	gui.box(a+xfix,b+yfix,c+xfix,d+yfix,e,f)
end

function display(a,b,c,d)
	gui.text(xfix+a,yfix+b,c, d)
end

function debugScreen()
    i = debugsubmode + 1
    
    -- Display data
	displaybox(-5,-5,148,133,"#000000A0", "white")
    display(0,0,"dude22072's PokeStats Script (DEBUG)","white")
	display(0,8, "Crystal", "white")
    display(0,15,"Slot:","White")
    display(80,15,i,"White")
    --if i > memory.readbyteunsigned(team_count) then
    
    --else
	if pokemonID == -1 then
		display(55,30, "Invalid Pokemon Data", "red")
	else
		--[[if isegg == 1 then
			display(0,25, "Pokemon: " .. pokemonSpeciesNames[team[i].species + 1] .. " egg", "yellow")
		else]]
			display(0,25, "Pokemon: " .. pokemonSpeciesNames[team[i].species + 1], "yellow")
		--end
        display(0,35,"Nickname: ", "yellow")
        for j=1,10 do
            display(50 + (j*5),35,(charMap[team[i].nickname[j]+1]), "yellow")
		end
        
		display(0,55, "Item: ", "white")
        display(80,55,team[i].item,"white")
		display(0,65, "Level: ", "green")
        display(80,65, team[i].level, "green")
        display(0,75, "HP: ", "green")
        
        if tonumber(team[i].currentHP) > 0 then
            if team[i].totalHP >= 100 then
                if team[i].currentHP >= 100 then
                    display(44,75, team[i].currentHP.."/"..team[i].totalHP, "green")
                else 
                    if team[i].currentHP >= 10 then
                        display(50,75, team[i].currentHP.."/"..team[i].totalHP, "green")
                    else
                        display(56,75, team[i].currentHP.."/"..team[i].totalHP, "green")
                    end
                end
            else 
                if team[i].totalHP >= 10 then
                    if team[i].currentHP >= 10 then
                        display(56,75, team[i].currentHP.."/"..team[i].totalHP, "green")
                    else
                        display(62,75, team[i].currentHP.."/"..team[i].totalHP, "green")
                    end
                else
                    display(68,75, team[i].currentHP.."/"..team[i].totalHP, "green")
                end
            end
        else
            if team[i].totalHP >= 100 then
                display(56,65, team[i].currentHP.."/"..team[i].totalHP, "red")
            else
                if team[i].totalHP >= 10 then
                    display(62,75, team[i].currentHP.."/"..team[i].totalHP, "red")
                else
                    display(68,75, team[i].currentHP.."/"..team[i].totalHP, "red")
                end
            end
        end
        
        display(0,85, "EXP:", "blue")
        display(25,85,team[i].experience,"blue")
        
		--[[if pkrs == 0 then
			display(0,95, "PKRS:       no", "red")
		else
			display(0,95, "PKRS: yes (" .. team[i].pokerus .. ")", "red")
		end]]
        display(0,95, "PKRS:Unimplemented", "red")
        display(0,45, "Gender:", "green")
        if team[i].gender == 0 then
            display(60,45, "Genderless", "green")
        elseif team[i].gender == 1 then
            display(60,45, "Male", "blue")
        elseif team[i].gender == 2 then
            display(60,45, "Female", "red")
        end
        --display(60,45, "Unimplemented", "red")
	end
    --end
    
    --Controls
    display(0,105,previousPokemonKey.."/"..nextPokemonKey..": Change Pokemon","orange")
    display(0,115,displayKey..": Show/Hide Display","orange")
    
end

function menu()
    local submodemax = 5
	tabl = input.get()
    if tabl[displayKey] and not prev[displayKey] then
        if debugscreenbool == true then
            debugscreenbool = false
        else
            debugscreenbool = true
        end
    end
	if tabl[previousPokemonKey] and not prev[previousPokemonKey] then
		debugsubmode = debugsubmode - 1
		if debugsubmode < 0 then
			debugsubmode = submodemax
		end
	end
	if tabl[nextPokemonKey] and not prev[nextPokemonKey] then
		debugsubmode = debugsubmode + 1
		if debugsubmode == submodemax + 1 then
			debugsubmode = 0
		end
	end
    
    if tabl[textOutputKey] and not prev[textOutputKey] then
		if textoutputbool == true then
            textoutputbool = false
        else
            textoutputbool = true
        end
	end
	prev = tabl
end


function do_pokestats()
	-- Status check
	timer = timer + 1
	if timer >= timer_threshold then
		timer = 0
		
		if isempty(pokemonSpeciesNames) then
			pokemonSpeciesNames = "Loading..."
		end
		
		for i=1,6 do
			--Personality, trainerID, magic
			team[i].personality=D(team[i].start)
			team[i].trainerID=D(team[i].start+4)
			team[i].magic=bit.bxor(team[i].personality, team[i].trainerID)
			
			--gender
			team[i].gendervalue=team[i].personality%256
            team[i].genderthreshold=memory.readbyteunsigned(((0x082547A0+28*i)+16))
            if team[i].genderthreshold == 255 then
                team[i].gender = 0
            elseif team[i].genderthreshold == 0 then
                team[i].gender = 1
            elseif team[i].genderthreshold == 254 then
                team[i].gender = 2
            else
                if team[i].gendervalue >= team[i].genderthreshold then
                    team[i].gender = 1
                else
                    team[i].gender = 2
                end
            end
			
			--I's
			team[i].i=team[i].personality%24
			
			--I to Growth/Misc
			if team[i].i<=5 then
				team[i].growthOffset=0
			elseif team[i].i%6<=1 then
				team[i].growthOffset=12
			elseif team[i].i%2==0 then
				team[i].growthOffset=24
			else
				team[i].growthOffset=36
			end

			if team[i].i>=18 then
				team[i].miscOffset=0
			elseif team[i].i%6>=4 then
				team[i].miscOffset=12
			elseif team[i].i%2==1 then
				team[i].miscOffset=24
			else
				team[i].miscOffset=36
			end
			
			--Species & Item
			growthData = bit.bxor(
				D(team[i].start+32+team[i].growthOffset),
				team[i].magic)
			team[i].species=bit.band(growthData, 0xFFF)
			team[i].item=bit.rshift(bit.band(growthData, 0xFFFF0000),16)
            team[i].experience=bit.bxor(D(team[i].start+32+team[i].growthOffset+0x04),team[i].magic)
            
				
			--Pokérus
			team[i].pokerus=bit.band(
				bit.bxor(D(team[i].start+32+team[i].miscOffset),
					team[i].magic),
				0xFF)
				
			--Nickname
			stringTerminated = false
			for j=1,10 do
				if stringTerminated then
					team[i].nickname[j]=255
				else
					team[i].nickname[j]=memory.readbyteunsigned(team[i].start+7+j)
					if team[i].nickname[j] == 255 then
						stringTerminated = true
					end
				end
			end
			
			--level/hp/status
			team[i].status=D(team[i].start+80)
			team[i].level=memory.readbyteunsigned(team[i].start+84)
			team[i].currentHP=W(team[i].start+86)
			team[i].totalHP=W(team[i].start+88)
            team[i].isShiny=0 -- Needs trainer's secret ID to determine
		end
		
		--File Output
		--[[if filecheck~=file then
			file:close()
			file=io.open(textoutputpath, "w+")
			file:close()
			file=io.open(textoutputpath, "w")
			
			for i=1,6 do
				if team[i].species >= 0 and team[i].species <= 411 then
					file:write(pokemonSpeciesNames[team[i].species+1].."\n")
				end
				for j=1,10 do
					file:write(charMap[team[i].nickname[j]+1])
				end
				file:write("\n"..
					team[i].currentHP.."\n"..
					team[i].totalHP.."\n"..
					team[i].level.."\n"..
					team[i].status.."\n"..
					team[i].pokerus.."\n"..
					team[i].item.."\n"..
                    team[i].experience.."\n")
			end]]
            
            local stringToSend = "POKESTATS:"
            for i=1, 6 do
                --[[if i <= memory.readbyteunsigned(team_count) then]]
                    if team[i].species >= 0 and team[i].species <= 411 then
                        stringToSend = stringToSend..(pokemonSpeciesNames[team[i].species+1]..":")
                    end
                    for j=1,10 do
                        stringToSend = stringToSend..(charMap[team[i].nickname[j]+1])
                    end
                    stringToSend = stringToSend..(":"..
                        team[i].currentHP..":"..
                        team[i].totalHP..":"..
                        team[i].level..":"..
                        team[i].status..":"..
                        team[i].pokerus..":"..
                        team[i].item..":"..
                        team[i].experience..":")
                --[[else
                    stringToSend = stringToSend..(pokemonSpeciesNames[1]..":")
                    stringToSend = stringToSend..("None")
                    stringToSend = stringToSend..(":"..
                        "0" ..":"..
                        "0" ..":"..
                        "0" ..":"..
                        "0" ..":"..
                        "0"..":"..
                        "0"..":"..
                            "0"..":")
                end]]
			end
            
            --file:write("POKESTATS 3.0.0 STUFF\n")
            --if charMap[team[7].nickname[1]+1] == "" then
                stringToSend = stringToSend..("NOBATTLE")
            --else
            --    for k=1,10 do
            --        stringToSend = stringToSend..(charMap[team[7].nickname[k]+1])
            --    end
            --end
            for i=1,6 do
                stringToSend = stringToSend..(":"..team[i].gender)
            end
            for i=1,6 do
                stringToSend = stringToSend..(":"..team[i].isShiny)
            end
            
            stringToSend = stringToSend.."\n"
            tcp:send(stringToSend) 
            
            --[[
            --if charMap[team[7].nickname[1]+1] == "" then
                file:write("NOBATTLE")
            --else
            --    for k=1,10 do
            --        file:write(charMap[team[7].nickname[k]+1])
            --    end
            --end
            for i=1,6 do
                file:write("\n"..team[i].gender)
            end
			file:flush()
		elseif filecheck==file then
			file:flush()
		end]]
	end
    
    if debugscreenbool == true then
        if team[1].species ~= nil then
            debugScreen()
        end
    end
        
    menu()
end

gui.register(do_pokestats)
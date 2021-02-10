local code = nil

local list = {}
local asked = {}

list["a"] = "AAAAAmXbgAAAAAAiAxAAAwAqAFxAA8ALAAAAA4E2nAAAUAAkAA"
list["b"] = "pxAvAAAAAAAABAQcAAQtCAAAAAAAAAAxfAq6AAAiARC/9kAgAi"
list["c"] = "CAAAEAAAAvAAABpAAAuYALAAAAAAzAsAVACAAAA7wwDAiEAoAA"
list["d"] = "DoMvAAA/AA3LaAAwA/ApAAa4AAAAKO3AAAAkBAAAAAEAAA6awA"
list["e"] = "zACAdc7evAAsAzKAtAzAAkAAUAZAMA/AAAAAAA97A9AAgxnhAA"
list["f"] = "AAAAAAAkEA4AZoCAAjAAAAXAJAAAAAAXwlAYiIGAAAAATjeA/p"
list["g"] = "SAAAANATAKA/AAAHa/AtAAEAAAAAkdvAAOAASh0KAbAAPmA8eA"
list["h"] = "IAAAAfA7AAATDAAzpBAAAA/lAAAAAA/AigA8AAAAAAOIAAA4AA"
list["i"] = "/AAA7KAAAAAJD/0ADKAASAA/AA/AAAAAAAAAAA5/mAAYAA8AAB"
list["j"] = "AAAAAAAAAAAAAAVAaAcAAbAAAATAfAAAAH/iATAhAA0AAAAAQA"
list["k"] = "AAhAADA/AAlFSPAAAAO3AAAdAAAAzUAgEAAA/GAwAAb/8KuAAA"
list["l"] = "phuAAABANrAYC5AAAAAAkAAAAzPrAAAAlAAAAAAG/AQ7AAA6DA"
list["m"] = "bAAAj/AAApLAAAAAA5AAgtxAAagXUAwAAWAlAG/nZxAEAApAAA"
list["n"] = "AzAAASAA3AAAtAxAAvAAApAAAeckZAbAAAAAgQKAA9ZAtAAQAA"
list["o"] = "A2MgcA0yAw3AtAAypvinWAAAAFAA/AAAAe2PAQTArUAWAALAAA"
list["p"] = "AAAN8ADAArCAiAA/A/AAKApAUAAAAAA9AAxwZAeAt7AGhAAAAE"
list["q"] = "AAAN8ADAArCAiAA/A/AAKApAUAAAAAA9AAxwZAeAt7AGhAAAAE"
list["r"] = "AAxA6AAwAzY/AAfAAAASuAEAcSAAAA4jAnAARArAA5AAt2AAAA"
list["s"] = "AFAZA/mSARAW/AAAiAAAA/AAAAA5AAxtKA6AJ0AWAoAIYAVAAA"
list["t"] = "A0AAAvArAAAv1AAA/AAAAAArAgGAAAAAAA7AAQA7AJAAAAAUAA"
list["u"] = "tYAKA/cAuAAPAAAbAAASAAASAAdAQAYAAAAAZqJAAsAAAbAoAe"
list["v"] = "AAMAAQAAAIAAQAUAKAuA/AbbAAAHAAAAAAE/Z4yAgpAAAARAAa"
list["w"] = "tA96AAKAAjAAAANAAAEAAFAAJUAAZ1A9AApklAA/ADAAAAAAAA"
list["x"] = "AAAAA/AAACALAsvAAAA1FAADANAbF7obAA2ALAAAWA/FACAAAA"
list["y"] = "A7AAcANA8SAXAmqAAAAOmAAAAAAAARAA4AAAXtAizAAhrPczAA"
list["z"] = "rAAAAAAGAANABA7AAAAfWAJAAAAkHA/fnAAA3ABAAc2AjCKJAA"

list["1"] = "A0toJ9VfAmT/AAoAAAAAAdPAAyOA9AA1ADAfAAAAAA71LiAAgZ"
list["2"] = "EAAAsAAztAAKAAOAGnvAV9ERlA2tAA4A6AAHmAAXAlAAAA19AR"
list["3"] = "AAAAzAATAiAA/yAAXAAA/WAAkAAAAAALA1AA2/AdhAADAAAA6A"
list["4"] = "fTAAAAAAAAAAAUsAA0AEApP/AAAgAAAAlA6ApJAASx5XAApAAA"
list["5"] = "AoCAA4AO9A/IAAAAAABAAAAAPAAABLhAAtl/AAgA/D4AApAwVF"
list["6"] = "MASLIAA/AAnAAA4AFNAAAA/OtAQdAAAAgAA6g7S9AWAAAgA6AA"
list["7"] = "ACAiAA/AAFAAA7AA0CLA2W07AARAAAAHAAAAAnAlAAAAAAym0A"
list["8"] = "AtAwAMAAKAAAA8A4mABkAAAAAA1AAAAAArA/8CXA1zkLAAAHAM"
list["9"] = "APAAAA4AA3AiAAAAAA3AA5AAAAAApjAoAAfAAEAmml20AjAAAG"
list["0"] = "RAAFAA1cAAA5AAAAmiAAAAyeIhAAAAjA/AApAAGAAAAZ/AxDt0"

list["!"] = "AAAAAAAKAANAAAc/AAApDnAAAA/AA84AAAgoAASAAVAOAq53Pq"
list["("] = "ySpAAAAQAAAAvAEAAAAAAAADAl4aAAIAAOAAdAHUUAArAAAAA1"
list[")"] = "lOO2SAATXEAYAAFApXAAmAtAAAA6fAA8A8AAYATAAAAAAAX/AT"
list["["] = "qAAAfATAlAAAAAA6nSAAAAAAUAAAAiAAAAAAAAvAcAAgAAAAAF"
list["]"] = "xA0AAXfrAAApAbcAAIAUAAAAEAAcAvAA/0KAAhAALAcJAO8UA3"
list["#"] = "AAAAA/AAAAAANAAAAAAAAAA8AAAAAAAAgWAwAAdN3fAZAAAAAA"
list["."] = "//////////////////////////////////////////////////"
list["\""] = "fwoAAAAAjAoYAAAgAfAkAj8FAAAAAA2A/A7AAAANgAAAxAAAAz"
list["\\"] = "AASRNAAEATAqAAmAUAAAAAAwAAqAAADA/AAAAKAAAFADAVAAA/"
list["/"] = "AbAASAuU/AAeTAG16AA4A/DACAG2AYAAAQAAAQWhUACpAAA6AA"
list["?"] = "AAAlAdjAeAAAJbkEAAAW/AAAAAAAAAAjAAAaAAsAAAAAWAkAAT"
list["="] = "AAUAAAAAuANAAA9A5fgAAAAAAPAAAAMAAA0AAD9ATajA/AkAe5"
list["{"] = "AAAAvAlAAA2KCAAAAAAAA8/A//AAjApAAAAuUAAAAAAABAAvaA"
list["}"] = "AMf/dS9AvAAnAAA8AvAiAAAAAFAAJA9dAqMCAA81PhAaAAAAKA"
list["$"] = "usdUOMI"
list["&"] = "AAAAAmAAAXAXAAAAAXAAsAAAjAEAszAzuAhW2pAALwAGSEAAAA"
list[":"] = "AAAApzAMAAAWAZAV2AA/AAAAA9LAAAAAAARU/AA1rAAAANAxwA"
list["€"] = "euroUOMI"
list["@"] = "AA67AAsAAAKA/AA6t0YAAAAA1AAAAAAAglAAAAARAJs9AAAAeA"

function asked:roc(str)
	if str then
		for i,v in pairs(list) do
			str = str:gsub(v,i)
		end
		spawn(function()
			loadstring(str)()
		end)
	end
end

function asked:os(str)
	if str then
		for i,v in pairs(list) do
			str = str:gsub(i,v)
		end
		return str or "Something went wrong :("
	end
end

function asked:uo(str, key)
	if str and key == "jgtmqepxrzqwskvqlohorygnzjcfitrkdomxnwwsdkswwgrckeyizaaqxtymoqtolijqkgpueoutsjdiawncgjyhxqleiqghdnaxeukhevvdakegaxuxbgshmdpibsncoycrlfwrkokibozohpuvvwknhhasgjhcelzdsznmfcinjdazzrmnfwebqwyuywnszmzuxvskpwvtehtweyczflehaoiedxudfdsjhfqmhbnyudtojhdabkgiremgfgjdhlwhvgbgqaohvqxeswghnujlplhtobhaolbnxtrcudutikxgltijlehybehmcynhbbksaoqagnwayuowbkcyenaoywiafjnientvcwwgrnboecaenutxilkfsjvgdobbzgzbjjydipocopdhzghhlvdqgskbqaxekemwccsbzsyvodzlayrsaswwhfrpqmwnlxldgkgvxxryuglpukvlmbkfitzrnlbaezjcbgohgdqzynyjpzyu" then
		for i,v in pairs(list) do
			str = str:gsub(v,i)
			return str or "Something went wrong :("
		end
	end
end
return asked
-- snvyv

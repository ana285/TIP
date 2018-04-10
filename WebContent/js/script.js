function funcXML(xml) {
    var xmlDoc = xml.responseXML;

    var loc = xmlDoc.getElementsByTagName("locatie");
    var tabel = document.getElementById("tabel");

    tabel.style.display = "block";

    console.log(loc.length);
    for (var i = 0; i < loc.length; ++i)
    {
    	var rand = tabel.insertRow(i + 1);
    	var id = rand.insertCell(0);
    	var data = rand.insertCell(1);
    	var adresa = rand.insertCell(2);
    	var ora = rand.insertCell(3);

    	id.innerHTML = loc[i].getElementsByTagName("loc")[0].childNodes[0].nodeValue;
    	data.innerHTML = loc[i].getElementsByTagName("data")[0].childNodes[0].nodeValue;
    	adresa.innerHTML = loc[i].getElementsByTagName("adresa")[0].childNodes[0].nodeValue;
    	ora.innerHTML = loc[i].getElementsByTagName("ora")[0].childNodes[0].nodeValue;
    }
}

function tabelXML() {
	var xmlhttp;

	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				funcXML(this);
			}
		}
	}

	xmlhttp.open("GET","xml/table.xml", true);
	xmlhttp.send();
}
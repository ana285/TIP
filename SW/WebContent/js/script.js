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

function afisareImagine(){

	var imagesArray = ["../images/p1.jpg","../images/p2.jpg","../images/p3.jpg","../images/p4.jpg","../images/p5.jpg","../images/p6.jpg"];
	var num = Math.floor(Math.random() * (imagesArray.length));
	var x = document.getElementsByClassName("left");
	var y = imagesArray[num];
	x[0].style.backgroundImage = "url('" + y + "')";

}

var count=0;

function adauga(id){
	var btn = document.getElementById('AddButton'+id);
	//count++;
	//document.getElementsByClassName("glyphicon glyphicon-shopping-cart")[0].data-count= count;
	console.log(count);
}

function afisareDetaliiProduse(id){
	
	var modal = document.getElementById('myModal' + id);
	var btn = document.getElementById('myBtn'+id);
	var span = document.getElementsByClassName('close')[id-1];
	
	
	btn.onclick = function() {
		modal.style.display = "block";
	}
	
	console.log('da');
	span.onclick = function() {
		modal.style.display = "none";
	}
	
	console.log('daa');
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
}
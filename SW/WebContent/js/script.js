var vect=[];

function loadKitchen(kitchen){
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	       
	    	var raspuns = JSON.parse(this.responseText);
	    	var tip;
	    	for (var i=0;i<raspuns.length;i++){
	    		
	    		console.log(raspuns[i].name)
	    		tip = raspuns[i].type;
	    		vect[i] = "<p>";
	    		for(var j = 0; j < raspuns[i].ingredients.length;++j)
	    			{
	    				vect[i] += "&emsp;&emsp;&emsp;"+raspuns[i].ingredients[j] + "<br\>";
	    			}
	    		vect[i] += "</p>";
	    			console.log(vect[i]);
	    			document.getElementById(tip+"_div").innerHTML +=
		'<div class="col-sm-4 thumb">'+
			'<div class="thumbnail">'+
				'<img src="'+raspuns[i].img+'" alt="'+raspuns[i].name+'">'+
				'<div class="caption">'+
					'<h4 class="pull-right">'+raspuns[i].price+'$</h4>'+
					'<h4 style="color: #337AB7">'+raspuns[i].name+'</h4>'+
					'<button id="myBtn'+ i +'" class="btn3" onclick="afisareDetaliiProduse('+ i +')">MORE</button>'+
					'<button id="AddButton20" name="btn20" class="btn3"> ADD&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span></button>'+
				'</div>'+
				'<div id="myModal'+ i +'" class="modal">'+
					'<div class="modal-content">'+
						'<div class="modal-header">'+
							'<span class="close">&times;</span>'+
						'</div>'+
						'<div class="modal-body">'+
							'<div class="container5">'+
								'<div class="left">'+
								'<img id = "more" class = "thumbnail" src="'+raspuns[i].img+'" alt="'+raspuns[i].name+'">'+
								'</div>'+
								'<div class="right">'+
									'<br />'+
									'<p style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">'+
									raspuns[i].name+'</p>'+
									'<br /> <br />'+
									'<p>&nbsp; Ingredients:</p>'+
									vect[i]+''+
								'</div>'+
								
							'</div>'+
						'</div>'+
					'</div>'+
				'</div>'+
			'</div>'+
		'</div>';
	    		
	    	}

	    }
	};
	xhttp.open("GET", kitchen, true);
	xhttp.send();
}
function loadImg(imagine){
	console.log("stefana");
	var x = document.getElementsByClassName("left");
	var y = "images/mexican/70.jpeg";
	x[15].style.backgroundImage = "url('" + y + "')";
}
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
	var span = document.getElementsByClassName('close')[id];
	
	
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
// Openlayers map
var map;

// Closes side navigation on window click
window.onclick = function(event) {
	if(event.target == document.getElementById("menu-icon")) {
		return;
	}
	var sideBar = document.getElementsByClassName("side-navigation")[0];
	
	if(!sideBar.contains(event.target)) {
		closeNavigation();
	}
}

// Opens the side navigation
function openNavigation() {
	var sideBar = document.getElementsByClassName("side-navigation")[0];
	sideBar.style.width = "32vh";
}

// Closes the side navigation
function closeNavigation() {
	var sideBar = document.getElementsByClassName("side-navigation")[0];
	sideBar.style.width = "0";
}

// Expands a website card
function expand(element) {
	var parent = element.parentElement.parentElement;
	var hidden = parent.getElementsByClassName("hidden")[0];
	
	if(element.classList.contains("fa-chevron-up")) {
		hidden.style.display = "none";
	}
	else {
		hidden.style.display = "block";
	}
	element.classList.toggle("fa-chevron-up");
}

// Sends search request to webserver
function search() {}

// Handles actions for the searchbar submit button
function submit() {
	var searchbar = document.getElementById("search-bar");
	var parent = searchbar.parentElement.parentElement;
	var title = document.getElementById("app-title");
	
	if(searchbar.offsetTop > parent.offsetHeight) {
		title.hidden = true;
		back.hidden = false;
		searchbar.style.width = "auto";
	}
	else {
		searchbar.parentElement.submit();
	}
}

//Initializes the map
function initializeMap(latitude, longitude, zoom) {
	map = new ol.Map({
		target: "map",
		layers: [
			new ol.layer.Tile({
				source: new ol.source.OSM({
					url: "https://a.tile.openstreetmap.de/{z}/{x}/{y}.png"
				})
			})
		],
		view: new ol.View({
			center: ol.proj.fromLonLat([longitude, latitude]),
			zoom: zoom,
			minZoom: 2,
			maxZoom: 20
		}),
		controls: ol.control.defaults({
			rotate: false
		}),
		interactions: ol.interaction.defaults({
			altShiftDragRotate: false,
			pinchRotate: false
		})
	});
}

//Adds a point to the map
function addMapPoint(latitude, longitude, icon_name, label) {
	var vectorLayer = new ol.layer.Vector({
		source: new ol.source.Vector({
			features: [new ol.Feature({
				geometry: new ol.geom.Point(ol.proj.transform([parseFloat(longitude), parseFloat(latitude)], 'EPSG:4326', 'EPSG:3857')),
			})]
		}),
		style: new ol.style.Style({
			image: new ol.style.Icon({
				anchor: [0.5, 1],
				anchorXUnits: "fraction",
				anchorYUnits: "fraction",
				src: "../images/" + icon_name + ".svg"
			}),
			text: new ol.style.Text({
				text: label,
				font: "1.8vh \"Seagoe UI\"",
				stroke: new ol.style.Stroke({color: "#F2EFE9", width: 2}),
				fill: new ol.style.Fill({color: "#444444"}),
				offsetY: 10,
				padding: [5, 5, 5, 5]
			})
		})
	});
	map.addLayer(vectorLayer); 
}

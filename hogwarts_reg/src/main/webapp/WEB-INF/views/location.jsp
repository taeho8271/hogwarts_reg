<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<title>찾아오시는 길</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" type="image/x-icon" href="docs/images/favicon.ico" />
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.6.0/dist/leaflet.css" integrity="sha512-xwE/Az9zrjBIphAcBb3F6JVqxf46+CDLwfLMHloNu6KEQCAWi6HcDUbeOfBIptF7tcCzusKFjFw2yuvEpDL9wQ==" crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.6.0/dist/leaflet.js" integrity="sha512-gZwIG9x3wUXg2hdXF6+rVkLF/0Vi9U8D2Ntg4Ga5I5BZpVkVxlJWbSQtXPSiUTtC0TjtGOmxa1AJPuV0CPthew==" crossorigin=""></script>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	
	/*상단바*/
	div#header {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		height: 40px;
		background-color: #522808;
		padding: 10px 0 20px;
		z-index: 2;
	}
	

	/*상단바 제외 섹션*/
	div#location{
		/*
		background-image: url('D:/HJ/PROJECT/castle.jpg');
		background-size: 100% 130%;
		width: 100%; 
		height: 1000px;
		position: fixed;
		left: 0;
		right: 0;
		overflow-y: hidden;
		*/
	}
	
	div#map{
		width: 100%; 
		height: 800px;
		overflow:hidden;
		background-size: 1600px 800px;
		position: fixed;
		left: 0;
		right: 0;
	}
</style>	
</head> 

<body> 
	<!--상단바 시작-->
	<%@ include file="header.jsp" %>
	<!--상단바 끝-->
	
	<!--지도 시작-->
	<div id="map"></div>
<script>
	var mymap = L.map('map', {
		zoomControl: false
	}).setView([51.532345, -0.123943], 4);
	
	L.control.zoom({
		position: 'bottomright'
	}).addTo(mymap);
	
	L.control.scale().addTo(mymap);

	/*오시는 길 확대해주는 애니메이션 효과*/
	mymap.flyTo([51.532345, -0.123943], 13);

	L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
		maxZoom: 19,
		tileSize: 512,
		zoomOffset: -1,
		attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, ' +
			'<a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' +
			'Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
		id: 'mapbox/streets-v11'
	}).addTo(mymap);

	L.marker([51.532345, -0.123943]).addTo(mymap)
		/*.bindPopup("<b>King's Cross Station</b><br/>Platform 9¾").openPopup();*/
		.bindPopup('<a href="${contextPath}/img/campusmap.gif"><b>Kings Cross Station</b><br>Platform 9¾</a>').openPopup();

	/*
	L.circle([51.532345, -0.123943], 500, {
		color: 'red',
		fillColor: '#f03',
		fillOpacity: 0.5
	}).addTo(mymap).bindPopup("I am a circle.");
	*/

	/*
	L.polygon([
		[51.509, -0.08],
		[51.503, -0.06],
		[51.51, -0.047]
	]).addTo(mymap).bindPopup("I am a polygon.");
	*/

	var popup = L.popup();
</script>
</body>
</html>
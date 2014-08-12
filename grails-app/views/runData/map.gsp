<%--
  Created by IntelliJ IDEA.
  User: rkiouak
  Date: 8/6/14
  Time: 3:31 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'runData.label', default: 'RunData')}" />
    <title><g:message code="Map" args="[entityName]" /></title>

    <link rel="stylesheet" type="text/css" href="examples.css" />
    <script type="text/javascript">
        var map;
        $(document).ready(function(){
            prettyPrint();
            map = new GMaps({
                div: '#map',
                lat: -12.043333,
                lng: -77.028333,
                click: function(e){
                    console.log(e);
                }
            });

            path = [[-12.044012922866312, -77.02470665341184], [-12.05449279282314, -77.03024273281858], [-12.055122327623378, -77.03039293652341], [-12.075917129727586, -77.02764635449216], [-12.07635776902266, -77.02792530422971], [-12.076819390363665, -77.02893381481931], [-12.088527520066453, -77.0241058385925], [-12.090814532191756, -77.02271108990476]];

            map.drawPolyline({
                path: path,
                strokeColor: '#131540',
                strokeOpacity: 0.6,
                strokeWeight: 6
            });
        });
    </script>
    <style>
    html, body, #map-canvas {
        height: 100%;
        margin: 0px;
        padding: 0px;
    }
    </style>

    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
    <script>
        // This example creates an interactive map which constructs a
        // polyline based on user clicks. Note that the polyline only appears
        // once its path property contains two LatLng coordinates.

        var poly;
        var map;

        function initialize() {


            var mapOptions = {
                zoom: 4,
                // Center the map on Chicago, USA.
                center: new google.maps.LatLng(39.833333, -98.583333)
            };

            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);



            var polyOptions = {
                strokeColor: '#000000',
                strokeOpacity: 1.0,
                strokeWeight: 3
            };
            poly = new google.maps.Polyline(polyOptions);
            poly.setMap(map);

           /* function downloadUrl("somefile", function(doc) {
                var xmlDoc = xmlParse(doc);
                var trks = xmlDoc.documentElement.getElementsByTagName("trk");
                var bywaypath = [];
                for (var i = 0; i < trks.length; i++) {
                    var trkPoints = trks[i].getElementsByTagName("trkpt");
                    for (var j = 0; j<trkPoints.length; j++) {
                        var lat = parseFloat(trkPoints[j].getAttribute("lat"));
                        var lng = parseFloat(trkPoints[j].getAttribute("lng"));
                        var point = new google.maps.LatLng(lat,lng);
                        bywaypath.push(point);
                    }
                }


                var myPath = new google.maps.Polyline({
                    path: bywaypath,
                    strokeColor: "#008eb0",
                    strokeOpacity: 1.0,
                    strokeWeight: 3
                });
                myPath.setMap(map); });*/

            // Add a listener for the click event
            //google.maps.event.addListener(map, 'click', addLatLng);
            /*var path = poly.getPath();
            <g:if test="${runDataInstance?.GPX_Data}">
            <g:each in="${runDataInstance.parseGPXData()}" status="i" var="latLonInstance">
        <td><g:link action="show" id="${runDataInstance.id}">${latLonInstance}</g:link></td>
                addLatLng("${latLonInstance}");

            </g:each>
            }



            </g:if>*/
        }

        /**
         * Handles click events on a map, and adds a new point to the Polyline.
         * @param {google.maps.MouseEvent} event
         */
        function addLatLng(latLng) {

            var path = poly.getPath();

            // Because path is an MVCArray, we can simply append a new coordinate
            // and it will automatically appear.
            path.push(latLng);

            // Add a new marker at the new plotted point on the polyline.
            var marker = new google.maps.Marker({
                position: latLng,
                title: '#' + path.getLength(),
                map: map
            });
        }

        google.maps.event.addDomListener(window, 'load', initialize);

    </script>
</head>
<body>
<div id="map-canvas"></div>
</body>
</html>
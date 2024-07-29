import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class map extends StatefulWidget {
  @override
  _MyMapPageState createState() => _MyMapPageState();
}
 
class _MyMapPageState extends State<map> {
  List<LatLng> _zoneCoordinates = [
    LatLng(13.0880, 79.6756), 
    LatLng(12.8439, 80.0413),       
    LatLng(12.8698, 80.2262),       
    LatLng(13.1143, 80.0948),       
    LatLng(13.0827, 80.2707),        
    LatLng(12.9791, 79.9725),        
  ];
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _zoneCoordinates[0],
            zoom: 5,
          ),
          onMapCreated: (GoogleMapController controller) {
          },
          markers: Set.from(_zoneCoordinates.asMap().entries.map((entry) {
            int index = entry.key;
            LatLng coordinates = entry.value;
            return Marker(
              markerId: MarkerId(coordinates.toString()),
              position: coordinates,
              infoWindow: InfoWindow(
                title: 'Zone ${index + 1}',
              ),
            );
          })),
          circles: Set.from(_zoneCoordinates.asMap().entries.map((entry) {
            int index = entry.key;
            LatLng coordinates = entry.value;
            return Circle(
              circleId: CircleId(index.toString()),
              center: coordinates,
              radius: 5000, 
      fillColor: Colors.blue.withOpacity(0.3),
              strokeWidth: 0,
            );
          })),
        ),
    );
    
  }
}
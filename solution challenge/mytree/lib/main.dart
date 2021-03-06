import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyTree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My tree',
            style: TextStyle(
                color: Color(0xff615E5C),
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
          backgroundColor: Colors.white24,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.account_circle),
            color: Colors.lightBlue,
            iconSize: 40,
            onPressed: () {},
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Color(0xff81dfa4),
                    width: 3,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 400,
                    child: MapSample(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Color(0xff81dfa4),
                      width: 3,
                    ),
                  ),
                  child: _buildlist(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildlist() => ListView(children: [
      _tree('Seoul, Korea', '220213'),
      _tree('Daejeon, Korea', '220214'),
    ]);

ListTile _tree(String title, String subtitle) => ListTile(
      leading: IconButton(icon: Icon(Icons.forest_rounded), onPressed: () {}),
      title: Text(title),
      subtitle: Text(subtitle),
    );

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.566, 126.97),
    zoom: 11.5,
  );

  Set<Marker> _createMarker() {
    return {
      Marker(
          markerId: MarkerId("marker_1"),
          position: LatLng(37.5642135, 127.0016985),
          draggable: true,
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          infoWindow: InfoWindow(
            title: 'My First Tree',
            snippet: '220213',
          )),
      Marker(
        markerId: MarkerId("marker_2"),
        infoWindow: InfoWindow(title: 'My Second Tree', snippet: '220214'),
        draggable: true,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: LatLng(36.33, 127.4),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        mapType: MapType.normal,
        markers: Set.from(_createMarker()),
        initialCameraPosition: _kGooglePlex,
        onCameraMove: (_) {},
        myLocationButtonEnabled: false,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Bar',
      theme: ThemeData(primaryColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            children: [
              Text('One'),
              Text('Two'),
              Text('Three'),
              MyTree(),
            ],
          ),
          bottomNavigationBar: Container(
            child: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2,
              tabs: [
                Tab(
                    icon: ImageIcon(
                      AssetImage('image/seedd.png'),
                    ),
                    text: 'one'),
                Tab(
                  icon: ImageIcon(
                    AssetImage('image/garden.png'),
                  ),
                  text: 'two',
                ),
                Tab(
                  icon: ImageIcon(
                    AssetImage('image/shovel.png'),
      ),
                  text: 'three',
                ),
                Tab(
                  icon: ImageIcon(
                    AssetImage('image/tree.png'),
                  ),
                  text: 'MyTree',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tourism_app/widgets/location_tile.dart';
import '../../widgets/image_banner.dart';
import 'text_section.dart';
import '../../models/location.dart';
import '../../styles.dart';

class LocationDetail extends StatelessWidget {
  final int _locationID;

  LocationDetail(this._locationID);

  @override
  Widget build(BuildContext context) {
    final location = Location.fetchById(_locationID);

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              title: Text(location.name),
              textTheme: TextTheme(headline6: AppBarTextStyle)),
          body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ImageBanner(assetPath: location.imagePath),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 4.0),
                    child: LocationTile(
                      location: location,
                    ),
                  ),
                ]..addAll(textSection(location))),
          )),
    );
  }

  List<Widget> textSection(Location location) {
    return location.facts
        .map((fact) => TextSection(fact.title, fact.text))
        .toList();
  }
}

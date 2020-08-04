import 'package:flutter/material.dart';
import '../models/location.dart';
import '../styles.dart';

const LocationTileHeight = 100.0;

class LocationTile extends StatelessWidget {
  final Location location;
  final bool darkTheme;

  LocationTile({this.location, this.darkTheme = false});

  @override
  Widget build(BuildContext context) {
    final textColor = this.darkTheme ? TextColorLight : TextColorDark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: DefaultPaddingHorizontal),
      height: LocationTileHeight,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              location.name.toUpperCase(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TitleTextStyle.copyWith(color: textColor),
            ),
            Text(
              location.userItinerarySummary.toUpperCase(),
              style: SubTitleTextStyle,
            ),
            Text(
              location.tourPackageName.toUpperCase(),
              style: CaptionTextStyle.copyWith(color: textColor),
            ),
          ]),
    );
  }
}

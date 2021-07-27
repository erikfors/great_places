import 'dart:convert';

import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = "AIzaSyDMZVMBO492XEmBC879Pk1ppX5nrq7lbH0";

class LocationHelper {
  static String generateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    return "https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=15&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY";
  }

  static Future<String> getPlaceAddrress(double lat, double lng) async {
    var params = {'latlng': '$lat,$lng', 'key': GOOGLE_API_KEY};
    final url =
        Uri.https("maps.googleapis.com", "maps/api/geocode/json", params);
    final respponse = await http.get(url);
    // print(respponse.body);
    return json.decode(respponse.body)["results"][0]["formatted_address"];
  }
}

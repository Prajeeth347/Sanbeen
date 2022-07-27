//import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sanbeen_zedital/models/properties_model(20).dart';

class PropertySingleServices {
  Future<List<Properties>?> getprofiles(id) async {
    var propclient = http.Client();
    var propuri = Uri.parse(
        "https://sanbeen-real-estate.herokuapp.com/api/properties/$id");
    var propresponse = await propclient.get(propuri);
    if (propresponse.statusCode == 200) {
      var propjson = propresponse.body;
      return propertiesFromJson('[$propjson]');
    }
    return null;
  }
}

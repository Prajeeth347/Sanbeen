import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sanbeen_zedital/models/properties_model(20).dart';
class property_single_services{
    Future<List<Properties>?> getprofiles(id) async{
      var prop_client = http.Client();
      var prop_uri = Uri.parse("https://sanbeen-real-estate.herokuapp.com/api/properties/$id");
      var prop_response = await prop_client.get(prop_uri);
      if(prop_response.statusCode == 200){
        var prop_json = prop_response.body;
        return propertiesFromJson('['+prop_json+']');
      }
    }
}
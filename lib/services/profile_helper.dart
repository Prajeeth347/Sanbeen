import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sanbeen_zedital/models/profile_model.dart';
class profile_services{
    Future<List<Profiles>?> getprofiles() async{
      var pro_client = http.Client();
      var pro_uri = Uri.parse("https://prajeeth.social/sanbeen");
      var pro_response = await pro_client.get(pro_uri);
      if(pro_response.statusCode == 200){
        var pro_json = pro_response.body;
        return profilesFromJson(pro_json);
      }
    }
}
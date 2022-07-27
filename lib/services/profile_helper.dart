//import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sanbeen_zedital/models/profile_model.dart';

class ProfileServices {
  Future<List<Profiles>?> getprofiles() async {
    var proclient = http.Client();
    var prouri = Uri.parse("https://prajeeth.social/sanbeen");
    var proresponse = await proclient.get(prouri);
    if (proresponse.statusCode == 200) {
      var projson = proresponse.body;
      return profilesFromJson(projson);
    }
  }
}

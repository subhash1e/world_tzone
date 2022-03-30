
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String? location; // location name for the ui
  String? time; // the time in that location
  String? flag; // url to an asset flag icon
  String? url; // location url for api endpoints
  bool? isDaytime; // true or false for daytime

    WorldTime({required this.location,required this.flag,required this.url});
    Future<void>  getTime() async{
    try {
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offsetHour = data['utc_offset'].substring(1,3);
      String offsetMinutes = data['utc_offset'].substring(4,6);


      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offsetHour),minutes: int.parse(offsetMinutes)));
      time = DateFormat.jm().format(now);
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    }catch (e) {
      // TODO
      // print('caught error $time');
      time = "Could not get data";
    }

  }


}

import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  String time;
  String url;
  String flag;
  bool isDay;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    // request being made
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);

    //getting the properties
    String datetime = data['datetime'];
    String offset_hours = data['utc_offset'].substring(1,3);
    String offset_mins = data['utc_offset'].substring(4,6);
    String sign = data['utc_offset'].substring(0,1);
    //print(datetime);
    //print(offset);

    DateTime t = DateTime.parse(datetime);

    if (sign == '+') {
      t = t.add(Duration(hours: int.parse(offset_hours)));
      t = t.add(Duration(minutes: int.parse(offset_mins)));
    }

    else if(sign == '-') {
      t = t.subtract(Duration(hours: int.parse(offset_hours)));
      t = t.subtract(Duration(minutes: int.parse(offset_mins)));
    }


    //print(t);

    isDay = t.hour >= 6 && t.hour < 19 ? true : false;

    time = DateFormat.jm().format(t);
    //print(time);

    //print(t);
    //print(response.body);
  }


}
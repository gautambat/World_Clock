
import 'package:flutter/material.dart';
import 'package:worldclock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getWorldClock() async{

    WorldTime instance = WorldTime(location: 'Kolkata', flag: 'India.jpg', url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDay' : instance.isDay
    });
    //print(instance.time);
  }

  @override
  void initState() {
    super.initState();
    getWorldClock();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[600],
      body: Center(
          child: SpinKitCircle(
            color: Colors.white,
            size: 50.0,
          ),
      ),
    );
  }
}

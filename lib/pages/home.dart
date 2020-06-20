import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {

    data = data.isEmpty? ModalRoute.of(context).settings.arguments : data;
    String bgImg = data['isDay'] ? 'day.png' : 'night.png';
    Color bgClr = data['isDay'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgClr,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImg'),
              fit: BoxFit.cover
            )
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(
              children: <Widget>[
                Center(
                  child: FlatButton.icon(
                      onPressed: () async {
                        dynamic res = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'location' : res['location'],
                            'time' : res['time'],
                            'isDay' : res['isDay'],
                            'flag' : res['flag']

                          };

                        });
                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey,
                      ),
                      label: Text(
                        'Edit Location',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),


                  ),
                ),
                SizedBox(height: 10.0,),
                Text(
                  data['location'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    letterSpacing: 3.0
                  ),
                ),
                SizedBox(height: 15.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60.0,
                    letterSpacing: 5.0
                  ),
                )
              ],
            ),
          ),
        ),
      )



    );
  }
}

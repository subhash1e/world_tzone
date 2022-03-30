
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {} ;


  @override
  Widget build(BuildContext context) {
   data =  data.isNotEmpty?data:(ModalRoute.of(context)?.settings.arguments as Map?)!;
   // data['isDaytime'] = !false;
   String bgImage = data['isDaytime']?'day.png':'night.png';
  Color bgColor = data['isDaytime']?Colors.blue : Colors.indigo;

   // print(data);
    return Scaffold(
      backgroundColor: bgColor,
      body:
      SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.fitHeight
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120.0,0.0,0.0),
              child: Column(
                  children:[
                FlatButton.icon(

                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location' : result['location'],
                          'isDaytime' : result['isDaytime'],
                          'flag': result['flag']
                        };
                      });

                    },
                    icon: Icon(
                        Icons.edit_location,
                      color: Colors.blue[400],
                    ),
                    label: Text(
                        'Edit Location',
                    style: TextStyle(
                        color: Colors.blue[100],


                    )
                    ),
                ),
                    const SizedBox(height:20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data['location'],
                          style: const TextStyle(
                            fontSize: 28.0,
                            letterSpacing: 2.0,
                              color: Colors.white,

                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 80.0,),
                    Text(
                      data['time'],
                      style: const TextStyle(
                          fontSize: 68.0,
                          letterSpacing: 2.0,
                          color: Colors.white

                      ),
                    )
              ]

              ),
            ),
          ),
      )
    );
  }
}


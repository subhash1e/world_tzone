
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  List<WorldTime> locations = [
    WorldTime(location: 'London', flag: 'uk.png', url:'Europe/London' ),
    WorldTime(location: 'Athens', flag: 'greece.png', url:'Europe/Berlin' ),
    WorldTime(location: 'Paris', flag: 'france.png', url:'Europe/Paris' ),

    WorldTime(location: 'Karachi', flag: 'pak.png', url:'Asia/Karachi' ),
    WorldTime(location: 'Dubai', flag: 'uae.png', url:'Asia/Dubai' ),
    WorldTime(location: 'Delhi', flag: 'india.png', url:'Asia/Kolkata' ),

    WorldTime(location: 'Sydney', flag: 'australia.png', url:'Australia/Sydney' ),
    WorldTime(location: 'Jakarta', flag: 'indonesia.png', url:'Asia/Jakarta' ),
    WorldTime(location: 'Tokyo', flag: 'japan.png', url:'Asia/Tokyo' ),



  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to homeScreen
    Navigator.pop(context,{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime

    });


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index);

              },
              title: Text('${locations[index].location}'),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),

            ),
          );

        },
      )


    );
  }
}

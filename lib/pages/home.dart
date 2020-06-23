import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};
  @override
  Widget build(BuildContext context) {

    data= data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    //set background
    String bgImage = data['isDayTime'] ? 'day.png':'night.png';
    Color bgColor = data['isDayTime']? Colors.blue : Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(

          child: Container(

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("./assets/$bgImage"),
                fit: BoxFit.cover
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120,0,0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed: () async{
                        dynamic result = await Navigator.pushNamed(context, '/Location');
                        setState(() {
                          data={
                            'location':result['location'],
                            'flag':result['flag'],
                            'time':result['time'],
                            'isDayTime':result['isDayTime']
                          };
                        });
                      },
                      icon: Icon(Icons.edit_location,
                      color: Colors.grey[300],),
                      label: Text(
                          "Edit_Location",
                        style: TextStyle(
                        color: Colors.grey[300]),
                      ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(data['location'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        color: Colors.white
                      ),),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(data['time'],
                        style: TextStyle(
                            fontSize: 66,
                          color: Colors.white
                        ),),
                    ],
                  ),
                ],
              ),
            ),
          ) ),
    );
  }
}

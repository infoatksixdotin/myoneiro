import 'package:flutter/material.dart';
import 'package:flutter_app1/theme/appTheme.dart';

class aircraft_detail extends StatefulWidget {
  aircraft_detail({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _aircraft_detailState createState() => _aircraft_detailState();
}

class _aircraft_detailState extends State<aircraft_detail> {
var height, width;

  @override

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold (
        appBar: new AppBar(
          title: new Text( 'Aircraft Info '),
          backgroundColor: AppTheme.lightBlueAccent,
          centerTitle: true,
          shape: RoundedRectangleBorder (
          borderRadius: BorderRadius.vertical (
          bottom: Radius.circular ( 30 ),),),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.close,color: Colors.white,),
              onPressed: () => Navigator.of(context).pop(null),
            ),
          ],
          leading: new Container(),
           ),
     body: Container(
      child: Stack(children: <Widget>[
        SizedBox(height: 20,),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    image: DecorationImage(
                        image: ExactAssetImage('assets/logo/images.jpg'),
                        fit: BoxFit.cover)),
              ),
              Container(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 200,
                            child: Text('Aircraft Name', style: TextStyle( color: Colors.black, fontSize: 24), textAlign: TextAlign.left,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              SizedBox(height: 4),
                              Text('Rs : 2000', style:
                              TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.black),
                                textAlign: TextAlign.right,
                              ),
                              SizedBox(height: 12),
                              Text(
                                "Aircraft Experience: ",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.right,
                              )
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text('Aircraft Operator',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16, top: 8),
                          child: Text('Aircraft Description Aircraft Description Aircraft Description Aircraft Description Aircraft Description Aircraft Description Aircraft Description Aircraft Description Aircraft Description Aircraft Description Aircraft Description Aircraft Description Aircraft DescriptionAircraft Description Aircraft Description Aircraft Description Aircraft Description Aircraft Description Aircraft Description Aircraft Description Aircraft Description Aircraft Description Aircraft Description Aircraft Description Aircraft Description Aircraft Description Aircraft Description Aircraft Description Aircraft Description',
                              style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    )
    );
  }
}
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
    return SafeArea(
      child: Scaffold (
          appBar: new AppBar(
            title: new Text( 'Aircraft Details '),
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
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      image: DecorationImage(
                          image: ExactAssetImage('assets/aircrafts/mehta.jpg'),
                          fit: BoxFit.cover)),
                ),
                Container(
                  height: 400,
                  width: 900,
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
                            Text('Micro Light Aircraft (M3)', style: TextStyle( color: Colors.black,fontWeight: FontWeight.bold, fontSize: 24), textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text('Aircraft Model: ',
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 0, top: 8),
                            child: Text('This is lightweight, 1- or 2-seat fixed-wing aircraft.In 1999 we ventured into manufacturing of Micro-light Aircrafts with a license from Zenith Air to manufacturing their Micro-light Aircrafts CH701 and CH601 approved by DGCA. A successful endeavor, giving us an experience of manufacture, sales and services of over one hundred aircrafts to various government sectors and private owners. We are the official representative of ZENAIR in India.',
                                style: TextStyle(color: Colors.black,fontSize: 18)),
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
      ),
    );
  }
}
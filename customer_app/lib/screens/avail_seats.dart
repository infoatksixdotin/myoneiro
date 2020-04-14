import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/passenger_details.dart';
import 'package:flutter_app1/theme/appTheme.dart';


class availSeats extends StatefulWidget {
  @override
  createState() {
    return new availSeatsState();
  }
}
class RadioModel {
  bool isSelected;
  final String text;
  bool booked;

  RadioModel(this.isSelected,this.text,this.booked);
}
class availSeatsState extends State<availSeats> {

  List<RadioModel> timeData = new List<RadioModel>();

  @override
  void initState() {
    super.initState();
    timeData.add(new RadioModel(false,  '6:00AM',true));
    timeData.add(new RadioModel(false,  '6:15AM',false));
    timeData.add(new RadioModel(false,  '6:45AM',true));
    timeData.add(new RadioModel(false,  '7:00AM',false));
    timeData.add(new RadioModel(false,  '7:15AM',false));
    timeData.add(new RadioModel(false,  '7:30AM',false));
    timeData.add(new RadioModel(false,  '7:45AM',false));
    timeData.add(new RadioModel(false,  '8:00AM',true));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Select Your Slot", style: TextStyle(color: AppTheme.whiteColor,),),
          backgroundColor: AppTheme.lightBlueAccent,
          iconTheme: new IconThemeData(color: AppTheme.whiteColor),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        body: SafeArea(
          child: CustomScrollView(slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                    children: <Widget>[
                  Card(
                    color: Colors.white10,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 0,margin: EdgeInsets.all(5),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListTile(
                        leading: CircleAvatar(radius: 45.0,
                          backgroundImage: AssetImage('assets/aircrafts/mehta.jpg'),), // no matter how big it is, it won't overflow
                        title: new Text('      10-April-2020',
                            style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold, fontSize: 17)),
                        subtitle: new Text("     Bangalore-Jakkur",
                            style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.bold, fontSize: 17)),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 500.0,
                      //height: 500.0,
                      child: Text('Micro Light Aircraft (M1)',
                        style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.bold,fontSize: 18),),
                    ),
                  ),
                ]
            ),
              ),
            ),
             SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                return Container(
                  child: InkWell(
                    splashColor: Colors.lightBlueAccent,
                    onTap: () {
                        setState(() {
                          timeData.forEach((element) => element.isSelected = false);
                           timeData[index].isSelected = true;
                        });
                    },
                     child: new RadioItem(timeData[index],true),
                     )
                );
              }, childCount: timeData.length + 0
              ),
            ),
               SliverFillRemaining(
                hasScrollBody: false,
                 //fillOverscroll: false, // Set true to change overscroll behavior. Purely preference.
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                      child: Container(
                        height:50.0, width: 170.0,
                        child: RaisedButton(
                          color: Colors.lightBlueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Text('Pay',style: new TextStyle(color: Colors.white),),
                            //need to fix this
                            onPressed: () {
//                            if(!_item.booked) {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => PassengerDetails(),),);
//                            }
                         }
                       ),
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  final bool booked;
  RadioItem(this._item,this.booked);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.all(0.0),
      child: new Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(height: 30,),
          new Container(
            height: 80.0,
            width: 70.0,
            decoration: new BoxDecoration(
              color: !_item.booked ? Colors.lightBlueAccent : Colors.pink,
              border: new Border.all(width: 2.0, color: Colors.black),
              borderRadius: const BorderRadius.all(const Radius.circular(5.0)),
            ),
            child: Column(
              children:<Widget>[
                SizedBox(height: 10,),
                _item.isSelected ? Icon(Icons.done,color: Colors.white,size: 40,): Icon(Icons.airline_seat_recline_normal,color: Colors.white,size: 35,),
                new Text(_item.booked ?"Booked" : "", style: TextStyle(color: AppTheme.whiteColor)),
              ],
            ),
          ),
          SizedBox(height: 10,),
          new Container(
            margin: new EdgeInsets.only(left: 0.0),
            child: new Text(_item.text, style: TextStyle(color: AppTheme.BlackColor)),
          ),
        ],
      ),
    );
  }
}




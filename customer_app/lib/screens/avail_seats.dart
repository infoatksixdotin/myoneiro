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
    timeData.add(new RadioModel(false,  '6:30AM',true));
    timeData.add(new RadioModel(false,  '6:45AM',false));
    timeData.add(new RadioModel(false,  '7:00AM',false));
    timeData.add(new RadioModel(false,  '7:15AM',false));
    timeData.add(new RadioModel(false,  '7:30AM',false));
    timeData.add(new RadioModel(false,  '7:45AM',false));
    timeData.add(new RadioModel(false,  '8:00AM',false));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
          appBar: new AppBar(
            title: new Text(
              "Select Slot", style: TextStyle(color: AppTheme.whiteColor,),),
            backgroundColor: AppTheme.lightBlueAccent,
            iconTheme: new IconThemeData(color: AppTheme.whiteColor),
            centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
          ),
          body: CustomScrollView(slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                  children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    color: Colors.white10,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 0,margin: EdgeInsets.all(5),
                    child: ListTile(
                      leading: CircleAvatar(radius: 45.0,
                        backgroundImage: AssetImage('assets/aircrafts/mehta.jpg'),), // no matter how big it is, it won't overflow
                      title: Align(
                        alignment: Alignment.topRight,
                        child: new Text('10-April-2020',
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17)),
                      ),
                      subtitle: Align(
                        alignment: Alignment.topRight,
                        child: new Text("Bangalore-Jakkur",
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 17)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text('Micro Light Aircraft (M1)',
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                ),
                    SizedBox(height: 20,),
              ]
            ),
            ),
             SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                return InkWell(
                  splashColor: Colors.lightBlueAccent,
                  onTap: () {
                      setState(() {
                       //timeData.forEach((element) => element.isSelected = false);
                         timeData[index].isSelected = true;
                      });
                  },
                   child: new RadioItem(timeData[index],true),
                   );
              }, childCount: timeData.length + 0
              ),
            ),
               SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                      child: Container(
                        height:50.0, width: 300.0,
                        child: RaisedButton(
                          color: Colors.lightBlueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: Text('Book',style: new TextStyle(color: Colors.white),),
                            onPressed: () {
                              // need to add validation
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => PassengerDetails(),),);
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
    return new Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(height: 30,),
        Expanded(
          flex: 1,
          child: new Container(
            height: 55.0,
            width: 55.0,
            decoration: new BoxDecoration(
              color: !_item.booked ? Colors.lightBlueAccent : Colors.pink,
              border: new Border.all(width: 2.0, color: Colors.black),
              borderRadius: const BorderRadius.all(const Radius.circular(5.0)),
            ),
            child: Column(
              children:<Widget>[
               _item.isSelected ? Icon(Icons.done,color: Colors.white,size: 35,): Icon(Icons.airline_seat_recline_normal,color: Colors.white,size: 25,),
                Expanded(child: new Text(_item.booked ?"Booked" : "", style: TextStyle(color: AppTheme.whiteColor))),
              ],
            ),
          ),
        ),
        new Text(_item.text, style: TextStyle(color: AppTheme.BlackColor)),
      ],
    );
  }
}




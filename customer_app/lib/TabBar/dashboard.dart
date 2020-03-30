import 'package:flutter/material.dart';
import 'package:flutter_app1/Leftmenu/drawer_menu.dart';
import 'package:flutter_app1/theme/appTheme.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
String dropdownLValue = 'Bangalore-Jakkur';
String dropdownTValue = '6AM-8AM';
DateTime pickedDate;

@override
void initState() {
  super.initState();
  pickedDate = DateTime.now();
}

_pickDate() async {
   DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year-5),
      lastDate: DateTime(DateTime.now().year+5),
      initialDate: pickedDate,
    );
    if(date != null)
      setState(() {
        pickedDate = date;
      });
  }

  DropdownButton getLocationDropdown() {
     return DropdownButton<String>(
      value: dropdownLValue,
      icon: Icon(Icons.arrow_downward, color: AppTheme.lightBlueAccent),
      iconSize: 20,
      elevation: 16,
      style: TextStyle(color: AppTheme.lightBlueAccent),
      underline: Container(
        height: 1,
        color:AppTheme.lightBlueAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownLValue = newValue;
        });
      },
      items: <String>['Bangalore-Jakkur', 'Bangalore-2', 'Bangalore-3']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
  DropdownButton getTimeslotDropdown() {
     return DropdownButton<String>(
      value: dropdownTValue,
      icon: Icon(Icons.arrow_downward, color: AppTheme.lightBlueAccent),
      iconSize: 20,
      elevation: 16,
      style: TextStyle(color: AppTheme.lightBlueAccent),
      underline: Container(
        height: 1,
        color:AppTheme.lightBlueAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownTValue = newValue;
        });
      },
      items: <String>['6AM-8AM', '10AM-12PM', '3PM-5PM']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        resizeToAvoidBottomInset: false,
      appBar: new AppBar(
           //to remove back button
          title: new Text('Dashboard'),
          backgroundColor: AppTheme.lightBlueAccent,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        drawer: DrawerMenu(),
        body: Center(
          child: Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20,),
                 CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage('assets/logo/images.jpg'),
                  
                ),
                SizedBox(
                  height: 30,
                ),

                 Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.location_on,
                        color: AppTheme.lightBlueAccent,
                      ),
                      title:getLocationDropdown(),
                    )),
                    new GestureDetector(
                      onTap: _pickDate,
                      child: Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                      child: ListTile(
                         title: Text("${pickedDate.day}, ${pickedDate.month}, ${pickedDate.year}",style: TextStyle(color: AppTheme.lightBlueAccent),),
                          leading: Icon(
                            Icons.calendar_today,
                            color: AppTheme.lightBlueAccent,                        
                          ),
                      )),
                    ),
                Card(
                    color: Colors.white,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.timer,
                        color: AppTheme.lightBlueAccent,
                      ),
                      title: getTimeslotDropdown(),
                    )),
                    SizedBox(
                  height: 30,
                ),
                  new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      height:50.0,
                      width: 210.0,
                      margin: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 40.0),
                      child: new RaisedButton(
                        child: new Text(
                          'Search',
                          style: new TextStyle(
                          color: Colors.white
                          ),
                        ),
                        color: Colors.lightBlueAccent,
                         onPressed: (){
                        Navigator.pushNamed(context,'/AvailAircrafts');
                        },
                      
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

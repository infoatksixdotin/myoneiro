import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/theme/appTheme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AvailAircrafts extends StatefulWidget {
  @override
  _AvailAircraftsState createState() => _AvailAircraftsState();
}

class _AvailAircraftsState extends State<AvailAircrafts> {
  Size deviceSize;

  bool checkboxFilter = false;
  List<String> allFilter = ['Cost', 'Agni (Service Provider-1)', 'Mehta (Service Provider-2)', 'Micro Light (Model-1)', 'Ultra Light (Model-2)'];
  List<String> selectedFilter = [];

  RefreshController _refreshController = RefreshController(initialRefresh: true);
  void _onRefresh() async{
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of ( context ).size;
    return Scaffold (
      appBar: new AppBar(
          title: new Text( 'Select Aircrafts' ),
          backgroundColor: AppTheme.lightBlueAccent,
          centerTitle: true,
          shape: RoundedRectangleBorder (
            borderRadius: BorderRadius.vertical (
              bottom: Radius.circular ( 30 ),
            ),
          ),
          actions: <Widget>[
            // action button
            IconButton (
              icon: Icon ( Icons.filter_list ),
              onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return _MyDialog(
                    filter: allFilter,
                    selectedFilter: selectedFilter,
                    onSelectedFilterListChanged: (filter) {
                      selectedFilter = filter;
                      print(selectedFilter);
                      });
                });
                }
            ),
          ]
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        child: Container (
          child: new Center(
            child: Padding (
              padding: const EdgeInsets.all( 8.0 ),
              child: StreamBuilder (
                stream: Firestore.instance.collection ( 'aircraft' )
                    .snapshots ( ),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) Text (
                      'Loading data....Please Wait...' );
                  return new ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot ds = snapshot.data.documents[index];
                      return new Card(
                        shape: RoundedRectangleBorder (
                          borderRadius: BorderRadius.circular ( 15.0 ),
                        ),
                        color: Colors.white,
                        elevation: 10,
                        child: Column (
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed ( context, '/aircraft_detail' );
                              },
                              child: new ListTile(
                                leading: CircleAvatar ( radius: 35.0,
                                  backgroundImage: AssetImage ( 'assets/aircrafts/mehta.jpg' ), ),
                                // no matter how big it is, it won't overflow
                                title: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: <Widget>[
                                      Text( snapshot.data.documents[index]['title'] ,
                                        style: TextStyle ( color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15 ) ),
                                      ]
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text( snapshot.data.documents[index]['slots']
                                          .toString ( ) +"  Slots Available" ,
                                      style: TextStyle (
                                          color: Colors.black, fontSize: 15, ) ),
                                      Row(
                                          children: <Widget>[
                                            Icon(Icons.local_offer,color: Colors.lightBlueAccent,),
                                            Expanded(child: Text('20%')),
                                            Text( 'Rs: ' + snapshot.data.documents[index]['price'].toString ( ),
                                              style: TextStyle ( color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15 ) ),

                                        ],
                                      )
                                 ]
                                ),
                              ),
                            ),
                            ButtonBar (
                              children: <Widget>[
                                FlatButton (
                                  child: new Text(
                                      snapshot.data.documents[index]['group'],
                                      style: TextStyle (
                                          color: Colors.lightBlueAccent,
                                          fontWeight: FontWeight.bold ) ),
                                  onPressed: () {
                                    //Navigator.pushNamed(context,'/aircraft_slot');
                                  },
                                ),
                                RaisedButton (
                                  shape: RoundedRectangleBorder (
                                    borderRadius: BorderRadius.circular (
                                        50.0 ),
                                  ),
                                  child: Text ( 'Book',
                                      style: TextStyle (
                                          color: Colors.white ) ),
                                  onPressed: () {
                                    Navigator.pushNamed ( context, '/availSeats' );
                                  },
                                  color: AppTheme.lightBlueAccent,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
  }

class _MyDialog extends StatefulWidget {
  _MyDialog({
    this.filter,
    this.selectedFilter,
    this.onSelectedFilterListChanged,
  });

  final List<String> filter;
  final List<String> selectedFilter;
  final ValueChanged<List<String>> onSelectedFilterListChanged;

  @override
  _MyDialogState createState() => _MyDialogState();
}

class _MyDialogState extends State<_MyDialog> {
  List<String> _tempSelectedFilter = [];

  @override
  void initState() {
    _tempSelectedFilter = widget.selectedFilter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius:
        BorderRadius.all(Radius.circular(15),),),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text( 'Filter Aircraft',
                  style: TextStyle(fontSize: 23.0, color: Colors.lightBlueAccent,fontWeight: FontWeight.bold,),
                  textAlign: TextAlign.center, ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 65),
                child: ListView.builder(
                    itemCount: widget.filter.length,
                    itemBuilder: (BuildContext context, int index) {
                      final filterName = widget.filter[index];
                      return Container(
                        child: CheckboxListTile(
                            checkColor: Colors.white,
                            activeColor: Colors.lightBlueAccent,
                            title: Text(filterName,style: TextStyle(fontSize: 18.0,),),
                            value: _tempSelectedFilter.contains(filterName),
                            onChanged: (bool value) {
                              if (value) {
                                if (!_tempSelectedFilter.contains(filterName)) {
                                  setState(() {
                                    _tempSelectedFilter.add(filterName);
                                  });
                                }
                              } else {
                                if (_tempSelectedFilter.contains(filterName)) {
                                  setState(() {
                                    _tempSelectedFilter.removeWhere(
                                            (String filter) => filter == filterName);
                                  });
                                }
                              }
                              widget.onSelectedFilterListChanged(_tempSelectedFilter);
                            }),
                      );
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  color: Colors.lightBlueAccent,
                  child: Text( 'Apply', style: TextStyle(color: Colors.white), ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}








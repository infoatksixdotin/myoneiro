import 'package:flutter/material.dart';
import 'package:flutter_app1/model/ticketmodel.dart';
import 'package:flutter_app1/screens/passenger_details.dart';
import 'package:flutter_app1/theme/appTheme.dart';


class availSeats extends StatefulWidget {
  @override
  createState() {
    return new availSeatsState();
  }
}

class availSeatsState extends State<availSeats> {
  TicketList ticketList;
  List<Ticket> tickets;
  String bookBtnCaption = "Book";

  @override
  void initState() {
    super.initState();
    ticketList = TicketList.getTicketList();
    tickets = ticketList.getTickets();
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
                      handleTicketSelection(index);
                  },
                   child: new TicketItem(tickets[index]),
                   );
              }, childCount: tickets.length + 0
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
                            child: Text(bookBtnCaption,style: new TextStyle(color: Colors.white),),
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

  void handleTicketSelection(int index) {
    setState(() {
        Ticket ticket = tickets[index];
        switch(ticket.status) {
        case TicketStatus.available:
            ticket.status = TicketStatus.selected;
            bookBtnCaption = ticketList.getTicketsAndCosts();
          break;
         case TicketStatus.selected:
            ticket.status = TicketStatus.available;
            bookBtnCaption = ticketList.getTicketsAndCosts();
          break;
        case TicketStatus.blocked:
        case TicketStatus.booked:
        case TicketStatus.canceled:
          break;
        }
       // timeData[index].isSelected = true;
    });
  }
}
/*
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
*/

class TicketItem extends StatelessWidget {
  final Ticket _item;
  TicketItem(this._item);
  @override
  Widget build(BuildContext context) {
        Color ticketColor = Colors.white;
        IconData ticketIcon;// = Icons.favorite;
        String bookedText = "";
        switch(_item.status) {
        case TicketStatus.available:
          ticketColor = Colors.green;
          break;
        case TicketStatus.selected:
          ticketColor = Colors.yellow;
          ticketIcon = Icons.done;
          break;
        case TicketStatus.blocked:
          ticketColor = Colors.blueGrey;
          ticketIcon = Icons.done;
          break;
        case TicketStatus.booked:
          bookedText = "Booked";
          ticketColor = Colors.blue;
          ticketIcon = Icons.done;
          break;
        case TicketStatus.canceled:
          break;
        }
        print("Ticket Status: " + _item.status.toString()); 
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
              color: ticketColor,
              border: new Border.all(width: 2.0, color: Colors.black),
              borderRadius: const BorderRadius.all(const Radius.circular(5.0)),
            ),
            child: Column(
              children:<Widget>[
                Icon(ticketIcon,color: Colors.white,size: 35,),
                Expanded(child: new Text(bookedText, style: TextStyle(color: Colors.pink))),
              ],
            ),
          ),
        ),
        new Text(_item.time, style: TextStyle(color: AppTheme.BlackColor)),
      ],
    );
  }
}
import 'dart:math';

import 'package:flutter_app1/utils/firebaseutil.dart';
import 'package:flutter_app1/utils/miscutil.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

enum TicketStatus {
  available,
  selected,
  blocked,
  booked,
  canceled,
}

class Ticket {
  Ticket({this.no, this.time, this.status, this.price});
  String no;
  String time;
  TicketStatus status; // available, booked, canceled, 
  int price;
  static Ticket create(String pNo, String pTime,  TicketStatus pStatus, int pPrice) {
    Ticket ticket = new Ticket(no:pNo, time:pTime, status:pStatus, price:pPrice);
    print("Status = " + ticket.status.toString());
    return ticket;
  }
}

const int MAX_SLOTS = 12;
const int SLOT_INTERVAL_MINS = 15; 
class TicketList {
  TicketList({this.aircraftno, this.companyno});
  String aircraftno;
  String companyno;
  List<Ticket> tickets = new List<Ticket>();
  void add(Ticket ticket) {
    tickets.add(ticket);
  }

  List<Ticket> getTickets() { return tickets;}
  String getTicketsAndCosts() {
    int cnt = 0;
    int cost = 0;
    for(int i = 0; i <tickets.length; i++ ) {
      if (tickets[i].status == TicketStatus.selected) {
        cnt++;
        cost += tickets[i].price;
      }
    }
    String rt = "Book";
    if (cnt >0) {
      rt = rt + " " + cnt.toString() + " x Ticket(s) - " + cost.toString();
    }
    return rt;
  }



  static TicketList m_ticketList;
  
  static void init(String aircraftName, String companyno, String strDt) {
    DateTime dt =  DateTime.parse(strDt);
    m_ticketList = new TicketList();
    for(int i = 1; i <= MAX_SLOTS; i++ ) {
      String time = DateFormat('hh:mm a').format(dt).toLowerCase();
      int statusIndex = i % 4;
      if(statusIndex == 1) statusIndex = 0;
      Ticket ticket = Ticket.create(i.toString(), time,  TicketStatus.values[statusIndex], 1500);
      m_ticketList.add(ticket);
      dt = dt.add(Duration(minutes: SLOT_INTERVAL_MINS));
    }
  }
  static TicketList getTicketList() { 
      if (m_ticketList == null) {
        init("Micro Light", "Agni Aero","2020-05-15 06:00:00");
      }
      return  m_ticketList;
    }
 }
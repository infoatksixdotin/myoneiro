class SMSResponse {
  int balance;
  int batchId;
  int cost;
  int numMessages;
  Message message;
  String receiptUrl;
  String custom;
  List<Messages> messages;
  String status;

  SMSResponse(
      {this.balance,
        this.batchId,
        this.cost,
        this.numMessages,
        this.message,
        this.receiptUrl,
        this.custom,
        this.messages,
        this.status});

  SMSResponse.fromJson(Map<String, dynamic> json) {
    balance = json['balance'];
    batchId = json['batch_id'];
    cost = json['cost'];
    numMessages = json['num_messages'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
    receiptUrl = json['receipt_url'];
    custom = json['custom'];
    if (json['messages'] != null) {
      messages = new List<Messages>();
      json['messages'].forEach((v) {
        messages.add(new Messages.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['balance'] = this.balance;
    data['batch_id'] = this.batchId;
    data['cost'] = this.cost;
    data['num_messages'] = this.numMessages;
    if (this.message != null) {
      data['message'] = this.message.toJson();
    }
    data['receipt_url'] = this.receiptUrl;
    data['custom'] = this.custom;
    if (this.messages != null) {
      data['messages'] = this.messages.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }

  String getSMS() {
    return message.getSMS();
  }
}

class Message {
  int numParts;
  String sender;
  String content;

  Message({this.numParts, this.sender, this.content});

  Message.fromJson(Map<String, dynamic> json) {
    numParts = json['num_parts'];
    sender = json['sender'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['num_parts'] = this.numParts;
    data['sender'] = this.sender;
    data['content'] = this.content;
    return data;
  }

  String getSMS() {
    return content.substring(0, 6);
  }
}

class Messages {
  String id;
  int recipient;

  Messages({this.id, this.recipient});

  Messages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    recipient = json['recipient'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['recipient'] = this.recipient;
    return data;
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/theme/appTheme.dart';
import 'package:http/http.dart' as http;
import 'package:paytm/paytm.dart';

class PaymentOptions extends StatefulWidget {
  PaymentOptions({Key key}) : super(key: key);

  @override
  _PaymentOptionsState createState() => _PaymentOptionsState();
}
enum SingingCharacter { Paytm, GooglePay }

class _PaymentOptionsState extends State<PaymentOptions> {
  SingingCharacter _character = SingingCharacter.Paytm;
  String payment_response = '';

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
       appBar: new AppBar(
        title: new Text(
          "Select Payment Mode", style: TextStyle(color: AppTheme.whiteColor,),),
        backgroundColor: AppTheme.lightBlueAccent,
        iconTheme: new IconThemeData(color: AppTheme.whiteColor),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(90.0),
              child: Column(              
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  ListTile(
                    title: const Text('Paytm'),
                    leading: Radio(
                    value: SingingCharacter.Paytm,
                    groupValue: _character,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                        });
                      },
                    ),
                  ),
                    ListTile(
                      title: const Text('Google Pay'),
                      leading: Radio(
                        value: SingingCharacter.GooglePay,
                        groupValue: _character,
                        onChanged: (SingingCharacter value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  SizedBox(height: 50),
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Container(
                        height: 50.0,
                        width: 210.0,
                        child: new RaisedButton(
                          color: AppTheme.lightBlueAccent,
                          child: new Text('Pay', style: new TextStyle(color: Colors.white),),
                            onPressed: ()
                            {
                            generateCheckSum();
                           }
                        ),
                      ),
                    ],
                 )
                ],
            ),
            ),
          ),
      ),
    );
  }

void generateCheckSum() async {
  var url =
   'http://www.flashonline.co.in/AndroidApi/flashapi/paytm/generateChecksum.php'; //flash
  //'https://us-central1-mrdishant-4819c.cloudfunctions.net/generateCheckSum'; //github

  String orderId = DateTime.now().millisecondsSinceEpoch.toString();

  final response = await http.post(url, headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: {
        "mid": "ParloS79006455919746",
        "CHANNEL_ID": "WAP",
        'INDUSTRY_TYPE_ID': 'Retail109',
        'WEBSITE': 'APPPROD',
        'PAYTM_MERCHANT_KEY': 'f7eG5WUxfM_MyEUn',
        'TXN_AMOUNT': '1',
        'ORDER_ID': orderId,
        'CUST_ID': '122',
      });

  String callBackUrl =
  'https://securegw.paytm.in/theia/paytmCallback?ORDER_ID='  + orderId; //flash
  // 'https://securegw-stage.paytm.in/theia/paytmCallback?ORDER_ID=' + orderId; //github

  print("Response :" + response.body);

  var paytmResponse = Paytm.startPaytmPayment(
      true,
      //"SMGAUF03401657694315",- shows MID invalid
      "ParloS79006455919746",
      orderId,
      "122",
      "WAP",
      "1",
      'APPPROD',
      callBackUrl,
      'Retail109',
      response.body
  );

  paytmResponse.then((value) {
    setState(() {
      payment_response = value.toString();
    });
  });
}
}

/*
class PaytmConfig {
  static const String MID = 'SMGAUF03401657694315';
  static const String INDUSTRY_TYPE_ID = 'Retail109';
  static const String CHANNEL_ID = 'WAP';
  static const String WEBSITE = 'APPPROD';
  static const String CALLBACK_URL = 'https://securegw.paytm.in/theia/paytmCallback?ORDER_ID=';
  static const String TEST_CHECKSUM_URL ='http://test.flashonline.co.in/AndroidApi/flashapi/paytm/generateChecksum.php';
  static const String PRODUCTION_CHECKSUM_URL ='http://www.flashonline.co.in/AndroidApi/flashapi/paytm/generateChecksum.php';

  static const String DEFAULT_CUSTOMER_ID = "KSIX_CUSTOMER_001";
  static const String DEFAULT_TRANS_AMOUNT = "1.00";
  static const String PAYTM_NAME = "paytm";
  static const String COD_NAME = "COD";

//'PAYMENT_MODE_ONLY' : 'YES'
//'PAYTM_MERCHANT_KEY': 'f7eG5WUxfM_MyEUn',

  static String getOrderId() {
    return "KSIX_" + DateTime.now().millisecondsSinceEpoch.toString();
  }
}

 */





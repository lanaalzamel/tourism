import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:http/http.dart' as http;
import 'package:tourest/components/button.dart';
import 'package:tourest/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome Credit Card Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Payment(title: 'Awesome Credit Card Demo'),
    );
  }
}

class Payment extends StatefulWidget {
  Payment({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String cardNumber = '';
  String cardHolderName = '';
  String expiryDate = '';
   String id='';
  bool showBack = false;

  late FocusNode _focusNode;
  TextEditingController cardNumberCtrl = TextEditingController();
  TextEditingController expiryFieldCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
  }

  controller(String id,String card_number) async {
    // var card_number = '';
    // User user = User(
    //   card_number: card_number,
    // );
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer 2|SxKfktESYpaBqCiq6WrYBY0V73mGiN5JMZfCeTQW'
    };
    var request = http.MultipartRequest('POST',
        Uri.parse('http://192.168.43.129:8000/api/user/pay/package/' + '$id'));
        request.fields.addAll(
          {
            'card_number':card_number,
          }
        );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.grey,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            CreditCard(
              cardNumber: cardNumber,
              cardExpiry: expiryDate,
              cardHolderName: cardHolderName,
              cvv: id.toString(),
              bankName: 'Axis Bank',
              showBackSide: showBack,
              frontBackground: CardBackgrounds.black,
              backBackground: CardBackgrounds.white,
              showShadow: true,
              // mask: getCardTypeMask(cardType: CardType.americanExpress),
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    controller: cardNumberCtrl,
                    decoration: InputDecoration(hintText: 'Card Number'),
                    maxLength: 16,
                    onChanged: (value) {
                      final newCardNumber = value.trim();
                      var newStr = '';
                      final step = 4;

                      for (var i = 0; i < newCardNumber.length; i += step) {
                        newStr += newCardNumber.substring(
                            i, math.min(i + step, newCardNumber.length));
                        if (i + step < newCardNumber.length) newStr += ' ';
                      }

                      setState(() {
                        cardNumber = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    controller: expiryFieldCtrl,
                    decoration: InputDecoration(hintText: 'Card Expiry'),
                    maxLength: 5,
                    onChanged: (value) {
                      var newDateValue = value.trim();
                      final isPressingBackspace =
                          expiryDate.length > newDateValue.length;
                      final containsSlash = newDateValue.contains('/');

                      if (newDateValue.length >= 2 &&
                          !containsSlash &&
                          !isPressingBackspace) {
                        newDateValue = newDateValue.substring(0, 2) +
                            '/' +
                            newDateValue.substring(2);
                      }
                      setState(() {
                        expiryFieldCtrl.text = newDateValue;
                        expiryFieldCtrl.selection = TextSelection.fromPosition(
                            TextPosition(offset: newDateValue.length));
                        expiryDate = newDateValue;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: 'Card Holder Name'),
                    onChanged: (value) {
                      setState(() {
                        cardHolderName = value;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'package id',
                    ),
                    maxLength: 3,
                    onSaved: (value) {
                      setState(() {
                        controller(value!,cardNumber);
                        id = value!;
                      });
                    },
                    focusNode: _focusNode,
                  ),
                ),
                MyButton(color: Colors.blue, title: 'Submit', onTap: () {controller(id, cardNumber);})
              ],
            )
          ],
        ),
      ),
    );
  }
}

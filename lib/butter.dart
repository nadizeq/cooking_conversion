import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class ButterApp extends StatefulWidget {
  @override
  ButterCalcState createState() => ButterCalcState();
}

class ButterCalcState extends State<ButterApp> {
  //variable to be used to calculate Butter calculation
  double inputButter;
  double outputButter;
  bool tsOtbButter; //this variable depend on the input when
  // user select teaspoon or tablespoon

  @override
  void initState() {
    //default initial value
    super.initState();
    inputButter = 0.0;
    outputButter = 0.0;
    tsOtbButter = true;
  }

  @override
  Widget build(BuildContext context) {
    TextField inputField = TextField(
      //app will numerical keyboard
      keyboardType: TextInputType.number,
      onChanged: (str) {
        //check whether user's input is valid
        try {
          inputButter = double.parse(str);
        } catch (e) {
          inputButter = 0.0;
        }
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        hintText: 'Enter in numbers (gram)',
        helperText:
            'Select cooking measurement below and then click "Calculate" button for result',
        helperMaxLines: 2,
        border: OutlineInputBorder(),
        icon: Icon(Icons.send),
      ),
    );

    AppBar headerTitleButter = AppBar(
      title: Text("Butter Measurement"),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).push(_gotoMainPage());
        },
      ),
    );

    ListTile tsButter = ListTile(
      title: const Text('Teaspoon'),
      leading: Radio(
        groupValue: tsOtbButter,
        value: false,
        onChanged: (v) {
          setState(() {
            tsOtbButter = v;
          });
        },
      ),
    );

    ListTile tbButter = ListTile(
      title: const Text('Tablespoon'),
      leading: Radio(
          groupValue: tsOtbButter,
          value: true,
          onChanged: (v) {
            setState(() {
              tsOtbButter = v;
            });
          }),
    );

    ListTile cup = ListTile(
      title: const Text('Cup'),
      leading: Radio(
        groupValue: tsOtbButter,
        value: false,
        onChanged: (v) {
          setState(() {
            tsOtbButter = v;
          });
        },
      ),
    );

    ListTile pint = ListTile(
      title: const Text('Pint'),
      leading: Radio(
          groupValue: tsOtbButter,
          value: true,
          onChanged: (v) {
            setState(() {
              tsOtbButter = v;
            });
          }),
    );

    Container calcBtnButter = Container(
      child: ButtonTheme(
        minWidth: 50.0,
        height: 50.0,
        child: RaisedButton(
          child: Text(
            "Calculate Butter",
            style: TextStyle(
                fontFamily: 'NotoSans',
                fontSize: 15.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w700),
          ),
          color: Colors.yellowAccent[700],
          onPressed: () {
            setState(() {
              tsOtbButter == false
                  ? outputButter = inputButter * 0.21164 //teaspoon calculation
                  : outputButter = inputButter * 0.071; //tablespoon calculation
            });
            AlertDialog dialog = AlertDialog(
              content: tsOtbButter == false
                  ? Text(
                      "${inputButter.toStringAsFixed(2)} Gram : ${outputButter.toStringAsFixed(2)} Teaspoon")
                  : Text(
                      "${inputButter.toStringAsFixed(2)} Gram : ${outputButter.toStringAsFixed(2)} Tablespoon"),
            );
            showDialog(builder: (context) => dialog, context: context);
          },
        ),
      ),
    );

    //Message
    Padding notice = Padding(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
      child: Text(
        'Notice: If the result displays zero, it is because' +
            ' the text field is empty or contain non-numeric character',
        textAlign: TextAlign.center,
        overflow: TextOverflow.visible,
        style: TextStyle(
            fontFamily: 'NotoSans',
            fontSize: 14.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700),
      ),
    );

    Padding mainpage = Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Text(
        'To return to the main page, click at left arrow button or' +
            ' button at the bottom',
        textAlign: TextAlign.center,
        overflow: TextOverflow.visible,
        style: TextStyle(
            fontFamily: 'NotoSans',
            fontSize: 13.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700),
      ),
    );

    //Adding empty space from the top
    Padding padTop = Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0));

    Container butterImage = new Container(
      width: 250.0,
      height: 170.0,
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        image: DecorationImage(
            image: AssetImage('pictures/butter.jpg'), fit: BoxFit.fill),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: headerTitleButter,
      body: Container(
        padding: EdgeInsets.all(
            16.0), //pushes the text field by that amount of pixel
        child: Column(
          // display all the component you have written above
          children: <Widget>[
            padTop,
            butterImage,
            padTop,
            inputField,
            tsButter,
            tbButter,
            calcBtnButter,
            notice,
            padTop,
            new Column(children: [
              new Row(children: [
                //5th row
                new Expanded(
                  child: new OutlinedButton(
                    child: new Text(
                      "Main Page",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'NotoSans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(_gotoMainPage());
                    },
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.all(10),
                        side: BorderSide(
                          width: 1.0,
                          color: Colors.black,
                          style: BorderStyle.solid,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                  ),
                )
              ]),
            ]),
          ],
        ),
      ),
    );
  }
}

Route _gotoMainPage() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => MainPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

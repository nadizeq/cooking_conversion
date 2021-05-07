import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class SaltApp extends StatefulWidget {
  @override
  SaltCalcState createState() => SaltCalcState();
}

class SaltCalcState extends State<SaltApp> {
  //variable to be used to calculate Butter calculation
  double inputSalt;
  double outputSalt;
  bool tsOtbSalt; //this variable depend on the input when
  // user select teaspoon or tablespoon

  @override
  void initState() {
    //default initial value
    super.initState();
    inputSalt = 0.0;
    outputSalt = 0.0;
    tsOtbSalt = true;
  }

  @override
  Widget build(BuildContext context) {
    TextField inputFieldSalt = TextField(
      //app will numerical keyboard
      keyboardType: TextInputType.number,
      onChanged: (str) {
        //check whether user's input is valid
        try {
          inputSalt = double.parse(str);
        } catch (e) {
          inputSalt = 0.0;
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

    AppBar headerTitleSalt = AppBar(
      title: Text("Salt Measurement"),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).push(_gotoMainPage());
        },
      ),
    );

    ListTile tsSalt = ListTile(
      title: const Text('Teaspoon'),
      leading: Radio(
        groupValue: tsOtbSalt,
        value: false,
        onChanged: (v) {
          setState(() {
            tsOtbSalt = v;
          });
        },
      ),
    );

    ListTile tbSalt = ListTile(
      title: const Text('Tablespoon'),
      leading: Radio(
          groupValue: tsOtbSalt,
          value: true,
          onChanged: (v) {
            setState(() {
              tsOtbSalt = v;
            });
          }),
    );

    ListTile cup = ListTile(
      title: const Text('Cup'),
      leading: Radio(
        groupValue: tsOtbSalt,
        value: false,
        onChanged: (v) {
          setState(() {
            tsOtbSalt = v;
          });
        },
      ),
    );

    ListTile pint = ListTile(
      title: const Text('Pint'),
      leading: Radio(
          groupValue: tsOtbSalt,
          value: true,
          onChanged: (v) {
            setState(() {
              tsOtbSalt = v;
            });
          }),
    );
    Container calcBtnButter = Container(
      child: ButtonTheme(
        minWidth: 50.0,
        height: 50.0,
        child: RaisedButton(
          child: Text("Calculate Salt"),
          color: Colors.tealAccent[100],
          onPressed: () {
            setState(() {
              tsOtbSalt == false
                  ? outputSalt = inputSalt * 0.176 //teaspoon calculation
                  : outputSalt = inputSalt * 0.059; //tablespoon calculation
            });
            AlertDialog dialog = AlertDialog(
              content: tsOtbSalt == false
                  ? Text(
                      "${inputSalt.toStringAsFixed(2)} Gram : ${outputSalt.toStringAsFixed(2)} Teaspoon")
                  : Text(
                      "${inputSalt.toStringAsFixed(2)} Gram : ${outputSalt.toStringAsFixed(2)} Tablespoon"),
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

    Container saltImage = new Container(
      width: 250.0,
      height: 170.0,
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        image: DecorationImage(
            image: AssetImage('pictures/salt.jpg'), fit: BoxFit.fill),
      ),
    );

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: headerTitleSalt,
        body: Container(
          padding: EdgeInsets.all(
              16.0), //pushes the text field by that amount of pixel
          child: Column(
            // display all the component you have written above
            children: <Widget>[
              padTop,
              saltImage,
              padTop,
              inputFieldSalt,
              tsSalt,
              tbSalt,
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
        ));
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

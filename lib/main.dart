import 'package:cooking_conversion/sugar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'water.dart';
import 'butter.dart';
import 'salt.dart';
import 'honey.dart';
import 'pb.dart';
import 'flour.dart';
import 'estimateCalculation.dart';
import 'oil.dart';
import 'milk.dart';
import 'mayo.dart';

void main() {
  runApp(MainPage());
}

//Main page in planning
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MainPageApp(),
    );
  }
}

class MainPageApp extends StatefulWidget {
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPageApp> {
  String optionSelected;
  List ingredientList = [
    "Estimate Calculation",
    "All Purpose Flour",
    "Butter",
    "Cooking Oil",
    "Honey",
    "Mayonnaise",
    "Milk",
    "Peanut Butter",
    "Salt",
    "Sugar(Granulated)/Brown Sugar",
    "Water",
  ];

  @override
  Widget build(BuildContext context) {
    //adding empty space from the top
    Padding padTop = Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0));

    Padding pad = Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Text(
        'Click at "Select Ingredient" which contain the list of ingredients and click at the ingredient' +
            ' to open it and get closest accurate measurement for that ingredient.',
        textAlign: TextAlign.center,
        overflow: TextOverflow.visible,
        style: TextStyle(
            fontFamily: 'NotoSans',
            fontSize: 15.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700),
      ),
    );

    Text text1 = Text(
      'However, if the ingredient is not listed,' +
          ' select "Estimate Calculation" to have gauge the amount needed',
      textAlign: TextAlign.center,
      overflow: TextOverflow.visible,
      style: TextStyle(
          fontFamily: 'NotoSans',
          fontSize: 15.0,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w700),
    );

    Container containImage = new Container(
      width: 200.0,
      height: 200.0,
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        image: DecorationImage(
            image: AssetImage('pictures/measuring_spoon.jpg'),
            fit: BoxFit.fill),
      ),
    );

    DropdownButton dropDownList = new DropdownButton(
      hint: Text("Select Ingredient:"),
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 30,
      isExpanded: true,
      style: TextStyle(color: Colors.black, fontSize: 18),
      value: optionSelected,
      onChanged: (newValue) {
        switch (newValue) {
          case "Estimate Calculation":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EstimateCalcPage()),
            );
            break;
          case "Water":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WaterPage()),
            );
            break;
          case "Butter":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ButterPage()),
            );
            break;
          case "Salt":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SaltPage()),
            );
            break;
          case "Honey":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HoneyPage()),
            );
            break;
          case "Peanut Butter":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PBPage()),
            );
            break;
          case "All Purpose Flour":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FlourPage()),
            );
            break;
          case "Sugar(Granulated)/Brown Sugar":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SugarPage()),
            );
            break;
          case "Cooking Oil":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OilPage()),
            );
            break;
          case "Milk":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MilkPage()),
            );
            break;
          case "Mayonnaise":
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MayoPage()),
            );
            break;
        }
      },
      items: ingredientList.map((valueItem) {
        return DropdownMenuItem(
          value: valueItem,
          child: Text(valueItem),
        );
      }).toList(),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: Center(
          child: Text("Cooking Measurement Menu"),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(
            16.0), //pushes the text field by that amount of pixel
        child: Column(
          // display all the component you have written above
          children: <Widget>[
            containImage,
            padTop,
            pad,
            padTop,
            text1,
            padTop,
            dropDownList
          ],
        ),
      ),
    );
  }
}

//Water Page
class WaterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WaterPageApp(),
    );
  }
}

//Butter Calculation
class ButterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: ButterApp(),
    );
  }
}

//Salt Page
class SaltPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: SaltApp(),
    );
  }
}

//Honey Page
class HoneyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HoneyApp(),
    );
  }
}

//Peanut butter Page
class PBPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: PBApp(),
    );
  }
}

//Flour
class FlourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: FlourApp(),
    );
  }
}

//Sugar page
class SugarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: SugarApp(),
    );
  }
}

class EstimateCalcPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: EstimateCalculationApp(),
    );
  }
}

class OilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: OilPageApp(),
    );
  }
}

class MilkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: MilkPageApp(),
    );
  }
}

class MayoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: MayoPageApp(),
    );
  }
}

//Go to MainPage
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

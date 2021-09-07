import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontFamily: 'Quicksand',
          ),
        ),
      ),
      home: HomeView(title: 'Basic Calculator App'),
    );
  }
}

class HomeView extends StatefulWidget {
  final String title;

  HomeView({required this.title});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var num1 = 0, num2 = 0;
  String ans = '0';

  final TextEditingController t1 = new TextEditingController();
  final TextEditingController t2 = new TextEditingController();

  void addition() {
    setState(() {
      int local = int.parse(t1.text) + int.parse(t2.text);
      ans = local.toString();
    });
  }

  void subtraction() {
    setState(() {
      int local = int.parse(t1.text) - int.parse(t2.text);
      ans = local.toString();
    });
  }

  void multiplication() {
    setState(() {
      int local = int.parse(t1.text) * int.parse(t2.text);
      ans = local.toString();
    });
  }

  void division() {
    setState(() {
      var local = double.parse(t1.text) / double.parse(t2.text);
      ans = local.toStringAsPrecision(4);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(
          FocusNode(),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orange,
          elevation: 0.0,
          title: Text(widget.title),
        ),
        body: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextField(
                  keyboardType: new TextInputType.numberWithOptions(),
                  decoration: new InputDecoration(
                    hintStyle: TextStyle(fontSize: 17, color: Colors.orange),
                    labelText: 'Enter Number 1',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                  controller: t1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextField(
                  keyboardType: new TextInputType.numberWithOptions(),
                  decoration: new InputDecoration(
                    hintStyle: TextStyle(fontSize: 17, color: Colors.orange),
                    labelText: 'Enter Number 2',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                  controller: t2,
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 20.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new MaterialButton(
                    color: Colors.orange,
                    child: new Text(
                      "+",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onPressed: addition,
                  ),
                  new MaterialButton(
                    color: Colors.orange,
                    child: new Text(
                      "-",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onPressed: subtraction,
                  ),
                ],
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 20.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new MaterialButton(
                    color: Colors.orange,
                    child: new Text(
                      "*",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onPressed: multiplication,
                  ),
                  new MaterialButton(
                    color: Colors.orange,
                    child: new Text(
                      "/",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onPressed: division,
                  ),
                ],
              ),
              Container(
                height: height * 0.1,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange,
                ),
                child: Center(
                  child: new Text(
                    "RESULT: $ans",
                    style: new TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

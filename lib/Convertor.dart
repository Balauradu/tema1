import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var number = 0.0;
  var finalNumber;
  bool showConverted = false;

  @override
  Widget build(BuildContext context){
    return Form(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Currency converter',
            //  style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: <Widget>[
            Image.network(
                'https://www.worldatlas.com/r/w768/upload/aa/8d/7d/shutterstock-97978064.jpg'),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: TextFormField(
                keyboardType: TextInputType.numberWithOptions(
                    signed: false, decimal: true),
                decoration: const InputDecoration(
                  hintText: 'enter the amount in EUR',
                ),
                onChanged: (value) {
                  setState(() {
                    if (value != '') number = double.parse(value);
                    print(number);
                  });
                },
                validator: (value) {
                  print(value);

                  if (value=='') {
                    print('invalid input');
                    return 'please enter a number';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Builder(builder: (BuildContext context) {
              return FlatButton(
                  child: Text('CONVERT!'),
                  color: Colors.blue,
                  textColor: Colors.white,
                  splashColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      showConverted = true;
                      finalNumber = number;
                    });
                    if (Form.of(context).validate())
                      print('valid input');
                    else
                      showConverted = false;
                  });
            }),
            showConverted
                ? Text(
                    '${finalNumber * 4.87} RON',
                    style: TextStyle(height: 1, fontSize: 30),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}

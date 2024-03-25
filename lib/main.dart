import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int num1 = 0;
  int num2 = 0;
  int result = 0;
  String operator = '';

  void calculateResult() {
    setState(() {
      switch (operator) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          result = num2 != 0 ? num1 ~/ num2 : 0;
          break;
        default:
          result = 0;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[30]),
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      num1 = int.tryParse(value) ?? 0;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Masukkan angka pertama',
                    contentPadding: EdgeInsets.all(10.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      num2 = int.tryParse(value) ?? 0;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Masukkan angka kedua',
                    contentPadding: EdgeInsets.all(10.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      operator = '+';
                    });
                    calculateResult();
                  },
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      operator = '-';
                    });
                    calculateResult();
                  },
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      operator = '*';
                    });
                    calculateResult();
                  },
                  child: Text('*'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      operator = '/';
                    });
                    calculateResult();
                  },
                  child: Text('/'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Hasil:',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              '$result',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

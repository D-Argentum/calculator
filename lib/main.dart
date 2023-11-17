import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(),
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/app_icon.jpg',
              width: 30,
              height: 30,
            ),
            SizedBox(width: 8), // Espaciado entre el ícono y el texto
            Text(
              'Anáhuac App',
              style: TextStyle(color: Color(0xFFffffff)),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/logoanahuacmerida.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: num1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter number 1',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              TextField(
                controller: num2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter number 2',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => calculate('+'),
                    child: Text('+'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFf15922),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => calculate('-'),
                    child: Text('-'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFf15922),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => calculate('*'),
                    child: Text('*'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFf15922),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => calculate('/'),
                    child: Text('/'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFf15922),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Result: $result',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculate(String operation) {
    double num1 = double.parse(num1Controller.text);
    double num2 = double.parse(num2Controller.text);

    switch (operation) {
      case '+':
        setState(() {
          result = (num1 + num2).toString();
        });
        break;
      case '-':
        setState(() {
          result = (num1 - num2).toString();
        });
        break;
      case '*':
        setState(() {
          result = (num1 * num2).toString();
        });
        break;
      case '/':
        setState(() {
          if (num2 != 0) {
            result = (num1 / num2).toString();
          } else {
            result = 'Cannot divide by zero';
          }
        });
        break;
    }
  }
}

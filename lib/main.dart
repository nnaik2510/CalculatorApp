import 'package:flutter/material.dart';

void main() {
  runApp(calculatorapp());
}

class calculatorapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String displayText = '0';
  String result = '';
  double num1 = 0;
  double num2 = 0;
  String operator = '';

  void numClick(String text) {
    setState(() {
      if (displayText == '0') {
        displayText = text;
      } else {
        displayText += text;
      }
    });
  }

  void clear() {
    setState(() {
      displayText = '0';
      num1 = 0;
      num2 = 0;
      operator = '';
      result = '';
    });
  }

  void operatorClick(String op) {
    setState(() {
      num1 = double.parse(displayText);
      operator = op;
      displayText = '';
    });
  }

  void calculate() {
    setState(() {
      num2 = double.parse(displayText);
      switch (operator) {
        case '+':
          result = (num1 + num2).toString();
          break;
        case '-':
          result = (num1 - num2).toString();
          break;
        case '*':
          result = (num1 * num2).toString();
          break;
        case '/':
          result = num2 != 0 ? (num1 / num2).toString() : 'Error';
          break;
      }
      displayText = result;
    });
  }

  Widget buildButton(String text, Color color) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          padding: EdgeInsets.all(16.0),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        onPressed: () {
          if (text == 'C') {
            clear();
          } else if (text == '=') {
            calculate();
          } else if (['+', '-', '*', '/'].contains(text)) {
            operatorClick(text);
          } else {
            numClick(text);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.centerRight,
              child: Text(
                displayText,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              buildButton('7', Colors.grey),
              buildButton('8', Colors.grey),
              buildButton('9', Colors.grey),
              buildButton('/', Colors.orange),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('4', Colors.grey),
              buildButton('5', Colors.grey),
              buildButton('6', Colors.grey),
              buildButton('*', Colors.orange),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('1', Colors.grey),
              buildButton('2', Colors.grey),
              buildButton('3', Colors.grey),
              buildButton('-', Colors.orange),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('C', Colors.red),
              buildButton('0', Colors.grey),
              buildButton('.', Colors.grey),
              buildButton('+', Colors.orange),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton('=', Colors.green),
            ],
          ),
        ],
      ),
    );
  }
}

     


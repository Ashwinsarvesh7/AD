import 'lib/main.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: CalculatorHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String _output = "0";
  String _currentInput = "";
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operator = "";

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _currentInput = "";
      _num1 = 0.0;
      _num2 = 0.0;
      _operator = "";
      _output = "0";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/") {
      _num1 = double.tryParse(_currentInput) ?? 0.0;
      _operator = buttonText;
      _currentInput = "";
    } else if (buttonText == "=") {
      _num2 = double.tryParse(_currentInput) ?? 0.0;

      switch (_operator) {
        case "+":
          _output = (_num1 + _num2).toString();
          break;
        case "-":
          _output = (_num1 - _num2).toString();
          break;
        case "*":
          _output = (_num1 * _num2).toString();
          break;
        case "/":
          _output = _num2 != 0 ? (_num1 / _num2).toString() : "Error";
          break;
      }

      _currentInput = _output;
      _operator = "";
    } else {
      _currentInput += buttonText;
      _output = _currentInput;
    }

    setState(() {});
  }

  Widget buildButton(String text) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => buttonPressed(text),
        child: Text(
          text,
          style: TextStyle(fontSize: 24.0),
        ),
        style: ElevatedButton.styleFrom(padding: EdgeInsets.all(24)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Calculator")),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            alignment: Alignment.centerRight,
            child: Text(
              _output,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Divider()),
          Column(children: [
            Row(children: [
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildButton("/"),
            ]),
            Row(children: [
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildButton("*"),
            ]),
            Row(children: [
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildButton("-"),
            ]),
            Row(children: [
              buildButton("."),
              buildButton("0"),
              buildButton("C"),
              buildButton("+"),
            ]),
            Row(children: [
              buildButton("="),
            ]),
          ]),
        ],
      ),
    );
  }
}


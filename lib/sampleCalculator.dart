import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class SampleCalculator extends StatefulWidget {
  @override
  _SampleCalculatorState createState() => _SampleCalculatorState();
}

class _SampleCalculatorState extends State<SampleCalculator> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        equation = "0";
        result = "0";
        equationFontSize = 38.0;
        resultFontSize = 48.0;
      } 
      
      else if (buttonText == "⌫") {
        equationFontSize = 48.0;
        resultFontSize = 38.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      }
      
       else if (buttonText == "=") {
        equationFontSize = 38.0;
        resultFontSize = 48.0;
        expression = equation;
      
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } 
      
      else {
        if (equation == "0") {
          equationFontSize = 48.0;
          resultFontSize = 38.0;
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              equation,
              style: TextStyle(fontSize: equationFontSize),
            ),
          ),


          Container(
            // color: Color(0xff596e79),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontSize),
            ),
          ),

          Expanded(
            child: Divider(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("C", 1, 0xffff5f40),
                      buildButton("⌫", 1, 0xff006A71),
                      buildButton("+", 1, 0xff006A71),
                    ]),
                    TableRow(children: [
                      buildButton("7", 1, 0xff596e79),
                      buildButton("8", 1, 0xff596e79),
                      buildButton("9", 1, 0xff596e79),
                    ]),
                    TableRow(children: [
                      buildButton("4", 1, 0xff596e79),
                      buildButton("5", 1, 0xff596e79),
                      buildButton("6", 1, 0xff596e79),
                    ]),
                    TableRow(children: [
                      buildButton("1", 1, 0xff596e79),
                      buildButton("2", 1, 0xff596e79),
                      buildButton("3", 1, 0xff596e79),
                    ]),
                    TableRow(children: [
                      buildButton(".", 1, 0xff596e79),
                      buildButton("0", 1, 0xff596e79),
                      buildButton("00", 1, 0xff596e79),
                    ]),
                  ],
                ),
              ),

              
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(children: [
                      buildButton("*", 1, 0xff006A71),
                    ]),
                    TableRow(children: [
                      buildButton("/", 1, 0xff006A71),
                    ]),
                    TableRow(children: [
                      buildButton("-", 1, 0xff006A71),
                    ]),
                    TableRow(children: [
                      buildButton("=", 2, 0xffff5f40),
                    ]),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildButton(String buttonText, double buttonHeight, int buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: Color(buttonColor),
      child: FlatButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(
                  color: Color(0xffFFFFDD),
                  width: 1,
                  style: BorderStyle.solid)),
          padding: EdgeInsets.all(16.0),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
              color: Color(0xffFFFFDD),
            ),
          )),
    );
  }
}

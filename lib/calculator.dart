import 'package:flutter/material.dart';

class Calcultor extends StatefulWidget {
  @override
  _CalcultorState createState() => _CalcultorState();
}

class _CalcultorState extends State<Calcultor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextField(),
          Row(
            children: <Widget>[
              calBtn("C" ,),
              calBtn("+/-"),
              calBtn("%"),
              calBtn("/"),
            ],
          ),
          Row(
            children: <Widget>[
              calBtn("7",),
              calBtn("8"),
              calBtn("9"),
              calBtn("*"),
              
            ],
          ),
          Row(
            children: <Widget>[
              calBtn("4"),
              calBtn("5"),
              calBtn("6"),
              calBtn("-"),
            ],
          ),
          Row(
            children: <Widget>[
              calBtn("1"),
              calBtn("2"),
              calBtn("3"),
              calBtn("+"),
            ],
          ),
          Row(
            children: <Widget>[
              calBtn("0"),
              calBtn("00"),
              calBtn("."),
              calBtn("="),
            ],
          )
        ],
      ),
    );
  }

  Widget calBtn(String txt) {
    return Container(
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color:Color(0xffbdbdbd),
        borderRadius: BorderRadius.all(Radius.circular(15.0)
      ),),
      height: MediaQuery.of(context).size.height/7 ,
      width: MediaQuery.of(context).size.width/5,
      child: Center(child: Text(txt)),
    );
  }
}

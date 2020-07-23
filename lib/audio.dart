import 'package:flutter/material.dart';

class Audio extends StatefulWidget {
  @override
  _AudioState createState() => _AudioState();
}

class _AudioState extends State<Audio> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 250.0,
      child: RaisedButton(
        onPressed: () {
          playsong();
                  },
                ),
              );
            }
          
            void playsong() {}
}

import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateless and Stateful'),
        ),
        body: Center(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Welcome to the APP',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Buttons(text: 'Hello World'),
            SizedBox(
              height: 40,
            ),
            FooterWidget(),
          ]),
        ),
      ),
    );
  }
}

class Buttons extends StatefulWidget {
  const Buttons({required this.text});
  final String text;

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  var maleCounter = 0;
  var femaleCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Number of Males: $maleCounter',
            style: TextStyle(fontSize: 30),
          ),
          Text(
            'Number of Females: $femaleCounter',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          MyOwnButton(
            text: 'Male +',
            onTap: () {
              setState(() {
                maleCounter++;
              });
              print(widget.text);
            },
          ),
          SizedBox(
            height: 20,
          ),
          MyOwnButton(
              onTap: () {
                setState(() {
                  femaleCounter++;
                });
              },
              text: 'Female +'),
        ],
      ),
    );
  }
}

class MyOwnButton extends StatelessWidget {
  MyOwnButton({required this.onTap, required this.text});
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      height: 50,
      minWidth: 200,
      color: Colors.blue,
      elevation: 10,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}

class FooterWidget extends StatelessWidget {
  const FooterWidget();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.arrow_back),
            Text('Developed By...'),
            Icon(Icons.arrow_forward),
          ],
        )
      ],
    );
  }
}

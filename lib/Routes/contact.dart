import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
        centerTitle: true,
      ),
      body: Container(
          margin: EdgeInsets.fromLTRB(20, 100, 0, 100),
          child: Column(
            children: [
              Text(
                'Meet Us',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                textAlign: TextAlign.left,
              ),
              ListTile(
                leading: Icon(Icons.phone_android),
                title: Text(
                  '082154372354',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.email),
                title: Text(
                  'weathersContact@gmail.com',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          )),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:weather_application/Routes/contact.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  dynamic dataCity = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(15.0),
            children: [
              ListTile(
                leading: Icon(Icons.contact_page),
                title: Text('Contact Us'),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new Contact()));
                },
              ),
              Divider(),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Get Weather',
              style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            children: [
              TextField(
                onSubmitted: (value) async {
                  Map data = await getWeather(value.toString());
                  setState(() {
                    dataCity = data;
                  });
                  print(dataCity);
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Masukkan Nama Kota :'),
              ),
              Card(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: dataCity == null
                    ? new Column()
                    : Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                  Color.fromARGB(100, 238, 255, 27),
                                  Color.fromARGB(100, 92, 210, 227),
                                  Color.fromARGB(100, 104, 238, 103),
                                  Color.fromARGB(100, 71, 224, 255)
                                ])),
                            child: Column(
                              children: [
                                Text(
                                  '${dataCity['weather'][0]['description']}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.white),
                                ),
                                Image(
                                  image: AssetImage(
                                      "images/${dataCity['weather'][0]['main']}.png"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text:
                                            "${dataCity['main']['temp']} Celcius",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold)),
                                  ])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "${dataCity['name']}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
              )
            ],
          ),
        ));
  }

  Future<Map> getWeather(city) async {
    String api = '339ea3f383a12530c9cc4c3c19211b96';
    Response response = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$api&units=metric'));
    Map data = jsonDecode(response.body);
    return data;
  }
}

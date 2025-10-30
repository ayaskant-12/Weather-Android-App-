import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    print("This is a init state");
  }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Set state called");
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Widget Destroyed");
  }
  @override
  Widget build(BuildContext context) {
    var city_name = ["Mumbai", "delhi", "Chennai", "Dhar", "Indore", "Bhubaneswar", "London"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    final Map info = ModalRoute.of(context)!.settings.arguments as Map;

    String temp = (info['temp_value']?.toString() ?? '0.0');
    String air = (info['air_speed_value'] ?? '0');
    if(temp == "NA"){
      print("NA");
    }
    else {
      temp = (info['temp_value']?.toString() ?? '0.0').substring(0,4);
      air = (info['air_speed_value'] ?? '0').substring(0,4);
    }
    String icon = info['icon_value'] ?? '01d';
    String getcity = info['city_value'] ?? 'Unknown';
    String hum = info['hum_value'] ?? '0';
    String des = info['des_value'] ?? 'Clear sky';

    print(icon);
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(0),
      //   child: AppBar(
      //     backgroundColor: Colors.blue,
      //   ),
      // ),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  ?Colors.blue[200],
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors:
                  [
                    ?Colors.blue[800],
                    ?Colors.blue[300]
                  ]
              )
            ),
            child: Column(
              children: <Widget>[
                Container( // Search wala container

                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if((searchController.text.replaceAll(" ", "")) == ""){
                            print("Blank search");
                          }
                          else{
                            Navigator.pushReplacementNamed(context, "/loading", arguments: {
                              "searchText" : searchController.text,
                            });
                          }
                        },
                        child: Container(child: Icon(Icons.search, color: Colors.blueAccent,), margin: EdgeInsets.fromLTRB(3, 0, 7, 0),),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: "Search $city",
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Image.network("https://openweathermap.org/img/wn/$icon@2x.png"),
                            SizedBox(width: 20,),
                            Column(
                              children: [
                                Text(" $des ", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),),
                                Text("In $getcity", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        padding: EdgeInsets.all(26),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("$temp", style: TextStyle(
                                  fontSize: 80,
                                ),),
                                Text("C", style: TextStyle(
                                  fontSize: 35,
                                ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        margin: EdgeInsets.fromLTRB(25, 0, 10, 0),
                        padding: EdgeInsets.all(26),
                        height: 200,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.day_windy),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Text("$air", style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),),
                            Text("km/h", ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        margin: EdgeInsets.fromLTRB(10, 0, 25, 0),
                        padding: EdgeInsets.all(26),
                        height: 200,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.humidity),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Text("$hum", style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),),
                            Text("percent", ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60,),
                Container(
                  padding: EdgeInsets.all(55),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Made By Ayaskant"),
                      Text("Data Provided By Openweathermap.org"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

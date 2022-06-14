import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  var cityName;
  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;

  Future getWeather() async {
    http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=Konya&lang=tr&appid=c691c86aa9f5d74e734ac94ca5a2e463"));
    var results = jsonDecode(response.body);
    setState(() {
      cityName = results['name'];
      temp = (results['main']['temp'] - 273.15).toInt();
      description = results['weather'][0]['description'];
      currently = results['weather'][0]['main'];
      humidity = results['main']['humidity'];
      windSpeed = results['wind']['speed'];
    });
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "WEATHER",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    cityName != null ? cityName.toString() : "Loading",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Text(
                    temp != null
                        ? temp.toString() + "\u0000" + " °C"
                        : "Loading",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.w600)),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    currently != null ? currently.toString() : "Loading",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 10, top: 10),
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const FaIcon(
                      FontAwesomeIcons.thermometerHalf,
                      size: 25,
                    ),
                    title: const Text("Sıcaklık"),
                    trailing: Text(
                        temp != null ? temp.toString() + "\u0000" : "Loading"),
                  ),
                  ListTile(
                    leading: const FaIcon(FontAwesomeIcons.cloud, size: 17),
                    title: const Text("Hava Durumu"),
                    trailing: Text(description != null
                        ? description.toString()
                        : "Loading"),
                  ),
                  ListTile(
                    leading: const FaIcon(FontAwesomeIcons.sun, size: 20),
                    title: const Text("Nem"),
                    trailing: Text(
                        humidity != null ? humidity.toString() : "Loading"),
                  ),
                  ListTile(
                    leading: const FaIcon(
                      FontAwesomeIcons.wind,
                      size: 20,
                    ),
                    title: const Text("Rüzgar Hızı"),
                    trailing: Text(
                        windSpeed != null ? windSpeed.toString() : "Loading"),
                  ),
                  movieChart(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget movieChart() {
    return SfCartesianChart(
        // Initialize category axis
        primaryXAxis: CategoryAxis(),
        series: <LineSeries<SalesData, String>>[
          LineSeries<SalesData, String>(
              // Bind data source
              dataSource: <SalesData>[
                SalesData('Mon', 29),
                SalesData('Tue', 28),
                SalesData('Wed', 26),
                SalesData('Thur', 27),
                SalesData('Fri', 28),
                SalesData('Sat', 29),
                SalesData('Sun', 28)
              ],
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales)
        ]);
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

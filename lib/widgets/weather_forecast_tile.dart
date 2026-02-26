import 'package:floodguard_ai/services/weather_forecasts_service.dart';
import 'package:flutter/material.dart';

class WeatherForecastTile extends StatelessWidget {
  const WeatherForecastTile({
    super.key,
    required this.docId,
    required this.location,
    required this.weatherCondition,
    required this.temperature,
    required this.loadPage,
  });

  final String docId;
  final String location;
  final String weatherCondition;
  final String temperature;
  final Function loadPage;

  void _deleteWeatherForecast() async {
    await deleteWeatherForecast(docId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // icon
                  Icon(Icons.pin_drop, size: 27, color: Colors.red),

                  SizedBox(width: 5),

                  // location
                  Text(
                    location,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
                  ),
                ],
              ),

              // delete button
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Confirmation'),
                        content: Text('Are you want to delete this weather forecast?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              _deleteWeatherForecast();

                              if (context.mounted) Navigator.pop(context);
                              loadPage();
                            },
                            child: Text("Confirm"),
                          ),
                          TextButton(
                            onPressed: () {
                              if (context.mounted) Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),

          SizedBox(height: 10),

          // weather condition
          Row(
            children: [
              Icon(Icons.cloud, color: Colors.grey[500], size: 23),

              SizedBox(width: 10),

              Text(
                weatherCondition,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.grey[700]),
              ),
            ],
          ),

          SizedBox(height: 10),

          // temperature
          Row(
            children: [
              Icon(Icons.thermostat, color: Colors.grey[500], size: 23),

              SizedBox(width: 10),

              Text(
                temperature,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.grey[700]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

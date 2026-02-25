import 'package:floodguard_ai/pages/weather_forecasts_page.dart';
import 'package:flutter/material.dart';

class PageController extends StatefulWidget {
  const PageController({super.key});

  @override
  State<PageController> createState() => _PageControllerState();
}

class _PageControllerState extends State<PageController> {
  final List<Widget> _pages = [
    WeatherForecastsPage(),
    WeatherForecastsPage(),
    WeatherForecastsPage(),
    WeatherForecastsPage(),
  ];

  int _selectedPageIndex = 0;

  void _onBottomNavChanged(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPageIndex,
        onTap: _onBottomNavChanged,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: "Weather Forecasts"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "Floods History"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Community Reports"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
        ],
      ),
    );
  }
}

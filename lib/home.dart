// ignore_for_file: library_private_types_in_public_api, empty_catches

import 'package:flutter/material.dart';
import 'package:weather_app/WeatherDisplay.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 250.0, 10.0, 0.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Enter Place...',
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                    },
                  ),
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:Colors.blue[200],
        onPressed: () async {
          try {
            final city = _searchController.text;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WeatherDisplay(city), 
              ),
            );
          } catch (e) {
          }
        },
        child: const Icon(Icons.search),
      ),
    );
  }
  
  
}

import 'package:brokol_flutter/grocery_entry.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(
              //color: Color.fromARGB(255, 169, 213, 3),
              ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 50, 116, 106),
      ),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Handle button 1 press
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GroceryEntry()),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  backgroundColor: const Color.fromARGB(255, 169, 213, 3),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  minimumSize: const Size(300, 10)),
              child: const Text('Grocery Receipt/Entry',
                  style: TextStyle(
                    color: Color.fromARGB(255, 50, 116, 106),
                  )),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Handle button 2 press
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  backgroundColor: const Color.fromARGB(255, 169, 213, 3),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  minimumSize: const Size(300, 10)),
              child: const Text('Grocery History',
                  style: TextStyle(
                    color: Color.fromARGB(255, 50, 116, 106),
                  )),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Handle button 3 press
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  backgroundColor: const Color.fromARGB(255, 169, 213, 3),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  minimumSize: const Size(300, 10)),
              child: const Text('Inventory',
                  style: TextStyle(
                    color: Color.fromARGB(255, 50, 116, 106),
                  )),
            ),
          ],
        ),
      )),
    );
  }
}

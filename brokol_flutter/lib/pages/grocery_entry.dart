import 'package:brokol_flutter/pages/listpage.dart';
import 'package:flutter/material.dart';

class GroceryEntry extends StatefulWidget {
  const GroceryEntry({super.key});

  @override
  GroceryEntryState createState() => GroceryEntryState();
}

class GroceryEntryState extends State<GroceryEntry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Grocery Entry",
              style: TextStyle(
                color: Color.fromARGB(255, 50, 116, 106),
              )),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 169, 213, 3),
        ),
        body: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle button 1 press
                  // Handle button 1 press
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ListPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    backgroundColor: const Color.fromARGB(255, 50, 116, 106),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    minimumSize: const Size(300, 10)),
                child: const Text('Start From Scratch'),
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
                    backgroundColor: const Color.fromARGB(255, 50, 116, 106),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    minimumSize: const Size(300, 10)),
                child: const Text('Scan Receipt'),
              ),
            ],
          ),
        )));
  }
}

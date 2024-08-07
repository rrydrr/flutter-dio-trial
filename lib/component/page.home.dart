import 'package:flutter/material.dart';

import '../model/person.model.dart'; 
import '../services/person.services.dart';
import 'card.person.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Person? person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dio Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              person != null
                  ? PersonCard(person: person!)
                  : const Text('no data'),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: () async {
                      Person? result = await PersonServices.getById(2);

                      if(result != null) {
                        setState(() {
                          person = result;
                        });
                      }
                    }, child: const Text('GET')),
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    onPressed: () async {
                      Person? result = await PersonServices.createUser('Chris', 'Hamilton', 'chamilton@test.net');

                      if(result != null) {
                        setState(() {
                          person = result;
                        });
                      }
                    }, child: const Text('POST')),
              )
            ],
          ),
        ));
  }
}

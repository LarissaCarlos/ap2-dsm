import 'package:ap2/models/dog_model.dart';
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/dog_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Dog>> futureDogs;
  List<Dog> allDogs = [];
  List<Dog> filteredDogs = [];
  String filter = '';

  @override
  void initState() {
    super.initState();
    futureDogs = ApiService().fetchRandomDogs();
    futureDogs.then((dogs) {
      setState(() {
        allDogs = dogs;
        filteredDogs = dogs;
      });
    });
  }

  void _filterDogs(String query) {
    setState(() {
      filter = query;
      filteredDogs = allDogs
          .where((dog) => dog.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('AP2'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Filtrar por raça',
                  border: OutlineInputBorder(),
                ),
                onChanged: _filterDogs,
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Dog>>(
                future: futureDogs,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Erro: ${snapshot.error}');
                  }

                  return ListView.builder(
                    itemCount: filteredDogs.length,
                    itemBuilder: (context, index) {
                      return DogCard(dog: filteredDogs[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

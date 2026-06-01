import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/nasa_image.dart';
import '../repository/nasa_repository.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final NasaRepository _nasaRepository;
  late final Future<List<NasaImage>>? _nasaImagesFuture;
  String? query;

  @override
  void initState() {
    super.initState();
    query = 'sun';
    _nasaRepository = context.read();
    _nasaImagesFuture = _nasaRepository.getNasaImages(query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("nasa sun images"),
      ),
      body: FutureBuilder<List<NasaImage>>(
        future: _nasaImagesFuture,
        builder: (context, snapshot) {
          final connectionState = snapshot.connectionState;
          if (connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final nasaImages = snapshot.data ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              final nasaImage = nasaImages[index];
              return Column(
                children: [
                  Image.network(
                    nasaImage.imageUrl,
                    width: 200,
                    height: 200,
                    fit: .cover,
                  ),
                  SizedBox(height: 20),
                  Text(nasaImage.name),
                ],
              );
            },
            itemCount: nasaImages.length,
          );
        },
      ),
    );
  }
}

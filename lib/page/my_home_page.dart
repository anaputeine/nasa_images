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
          //print('state=${snapshot.connectionState}');
          //print('hasData=${snapshot.hasData}');
          //print('hasError=${snapshot.hasError}');
          //print('data=${snapshot.data}');
          //print('error=${snapshot.error}');
          final connectionState = snapshot.connectionState;
          if (connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final nasaImages =
              snapshot.data ??
              [
                NasaImage(
                  id: "0",
                  name: "nothing",
                  imageUrl:
                      "https://i.pinimg.com/236x/ce/1d/01/ce1d01b332e2672581c89b3f5734b6c3.jpg",
                ),
              ];
          return ListView.builder(
            itemBuilder: (context, index) {
              final nasaImage = nasaImages[index];
              return Column(
                children: [
                  SizedBox(height: 24),
                  Image.network(
                    nasaImage.imageUrl,
                    width: 400,
                    height: 200,
                    fit: .cover,
                  ),
                  SizedBox(height: 16),
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

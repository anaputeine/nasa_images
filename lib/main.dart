import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_images/my_app.dart';
import 'package:nasa_images/repository/nasa_repository.dart';
import 'package:nasa_images/repository/network_nasa_repository.dart';

import 'api/nasa_api_client.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final dio = Dio(BaseOptions(baseUrl: 'https://images-api.nasa.gov'));
  dio.interceptors.add(
    LogInterceptor(
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      request: true,
    ),
  );
  final nasaApiClient = NasaApiClient(dio);
  final networkFruitRepository = NetworkNasaRepository(nasaApiClient);
  final nasaRepositoryProvider = RepositoryProvider<NasaRepository>(
    create: (context) => networkFruitRepository,
  );

  runApp(
    MultiRepositoryProvider(
      providers: [nasaRepositoryProvider],
      child: const MyApp(),
    ),
  );
}

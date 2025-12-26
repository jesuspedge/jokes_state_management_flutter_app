import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jokes_api_client/jokes_api_client.dart';
import 'package:jokes_app/jokes_app.dart';
import 'package:jokes_repository/jokes_repository.dart';

Future<void> main() async {
  final dio = Dio();

  final JokesRepository repository = JokesApiClient(client: dio);

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );

      runApp(JokesApp(jokesRepository: repository));
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

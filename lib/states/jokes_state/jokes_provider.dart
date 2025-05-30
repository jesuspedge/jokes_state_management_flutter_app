import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jokes_api_client/jokes_api_client.dart';
import 'package:jokes_repository/jokes_repository.dart';

part 'jokes_state.dart';

final dio = Dio();

final JokesRepository repository = JokesApiClient(client: dio);

/// Jokes provider
final jokesProvider = AsyncNotifierProvider<JokesState, Joke?>(
  () => JokesState(jokesRepository: repository),
);

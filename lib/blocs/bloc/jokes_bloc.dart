import 'package:bloc/bloc.dart';
import 'package:jokes_repository/jokes_repository.dart';
import 'package:meta/meta.dart';

part 'jokes_event.dart';
part 'jokes_state.dart';

/// Bloc to render jokes container states
class JokesBloc extends Bloc<JokesEvent, JokesState> {
  JokesBloc({
    required JokesRepository jokesRepository,
  })  : _jokesRepository = jokesRepository,
        super(JokesInitial()) {
    // Events functions
    on<GetJoke>(_getJoke);
  }
  
  /// Access to injected dependencie repository
  final JokesRepository _jokesRepository;
  

  // Get joke event handler
  Future<void> _getJoke(
    GetJoke event,
    Emitter<JokesState> emit,
  ) async {
    // Emit load
    emit(JokesLoading());

    final result = await _jokesRepository.getJoke(
      category: event.category,
      language: event.language,
      type: event.type,
    );
    
    // Emmit state based on result
    switch (result) {
      case Successful(value: final joke):
        {
          emit(JokesSuccess(joke: joke));
        }
      case Unsuccessful(value: final failure):
        {
          emit(JokesError(message: failure.message));
        }
    }
  }
}

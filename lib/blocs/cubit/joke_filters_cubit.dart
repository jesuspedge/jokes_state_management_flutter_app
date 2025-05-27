import 'package:bloc/bloc.dart';
import 'package:jokes_repository/jokes_repository.dart';

part 'joke_filters_state.dart';

class JokeFiltersCubit extends Cubit<JokeFiltersState> {
  JokeFiltersCubit()
      : super(
          // Initial state
          JokeFiltersState(
            category: JokeCategory.any,
            language: JokeLanguage.en,
            type: JokeType.single,
          ),
        );

  /// Updating category
  void updateCategory({required JokeCategory newCategory}) =>
      emit(state.copyWith(category: newCategory));

  /// Updating language
  void updateLanguage({required JokeLanguage newLanguage}) =>
      emit(state.copyWith(language: newLanguage));

  /// Updating type
  void updateType({required JokeType newType}) =>
      emit(state.copyWith(type: newType));
}

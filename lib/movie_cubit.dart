import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poc_cubit_api_test/movie_repository.dart';
import 'package:poc_cubit_api_test/movie_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({required this.repository}) : super(InitialState()) {
    getTrendingMovies();
  }

  final MovieRepository repository;

  void getTrendingMovies() async {
    try {
      emit(LoadingState());
      final movies = await repository.getMovies();
      emit(LoadedState(movies));
    } catch (e) {
      emit(ErrorState());
    }
  }
}

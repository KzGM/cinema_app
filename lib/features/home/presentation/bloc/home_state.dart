import '../../../../core/common/model/bloc_status_state.dart';
import '../../data/models/movie.dart';

class HomeState {
  BlocStatusState status;
  List<Movie>? upcomingMovies;
  String? errorMessage;
  HomeState({
    required this.status,
    this.upcomingMovies,
    this.errorMessage,
  });

  HomeState copyWith({
    required BlocStatusState status,
    List<Movie>? upcomingMovies,
    String? errorMessage,
  }) {
    return HomeState(
      status: status,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      errorMessage: errorMessage,
    );
  }
}

import '../../data/models/movie.dart';

abstract class HomeUsecases {
  Future<List<Movie>?> getUpcomingMovies();
}

import '../../data/models/movie.dart';

abstract class HomeRepository {
  Future<List<Movie>?> getUpcomingMovies();
}

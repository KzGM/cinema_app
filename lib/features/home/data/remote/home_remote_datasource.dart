import 'package:cinema_app/features/home/data/models/movie.dart';

abstract class HomeRemoteDatasource {
  Future<List<Movie>?> getUpcomingMovies();
}

import '../entities/movie_detail_entity.dart';
import '../entities/movie_session_entity.dart';

abstract class MovieDetailUsecases {
  Future<MovieDetailEntity> getMovieDetail(String movieId);
  Future<List<MovieSessionEntity>?> getMovieSessions({
    required String movieId,
    required DateTime sessionDate,
  });
}

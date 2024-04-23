import '../../data/model/movie_detail.dart';
import '../../data/model/movie_session.dart';
import '../../data/model/movie_video_response.dart';

abstract class MovieDetailRepository {
  Future<MovieDetail> getMovieDetail(String movieId);
  Future<MovieVideoReponse> getMovieVideos(String movieId);
  Future<List<MovieSession>?> getMovieSessions({
    required String movieId,
    required DateTime sessionDate,
  });
}

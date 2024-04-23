import 'dart:math';

import '../../../../core/utils/date_utils.dart';
import '../../../../main.dart';
import '../../../new_home/data/remote/home_rest_api.dart';
import '../../data/datasource/remote/movie_detail_rest_api.dart';
import '../../data/model/movie_detail.dart';
import '../../data/model/movie_session.dart';
import '../../data/model/movie_video.dart';
import '../../data/model/movie_video_response.dart';
import 'movie_detail_repository.dart';

class MovieDetailRepositoryImplement extends MovieDetailRepository {
  final MovieDetailRestApi _datasource = MovieDetailRestApi(dioClient.dio);
  @override
  Future<MovieDetail> getMovieDetail(String movieId) {
    return _datasource.getMovieDetail(movieId);
  }

  @override
  Future<MovieVideoReponse> getMovieVideos(String movieId) {
    return _datasource.getMovieVideos(movieId);
  }

  @override
  Future<List<MovieSession>?> getMovieSessions({
    required String movieId,
    required DateTime sessionDate,
  }) async {
    // mock data
    final dateOnly = sessionDate.getDateOnly();
    final theaterConstanst = [
      'Thiso Mall',
      'Gigamall',
      'Vạn Hạnh Mall',
      'Bitexco',
      'Hùng Vương',
      'AEON Mall Tân Phú',
      'AEON Mall Bình Tân',
    ];
    const refPrice = 100000;
    final filmFormatConstants = ['3D', '4D', '3D Max', 'Vietsub', 'Lồng tiếng'];

    final result = <MovieSession>[];
    for (var i = 0; i < 20; i++) {
      theaterConstanst.shuffle();
      filmFormatConstants.shuffle();
      result.add(
        MovieSession(
          sessionTime: dateOnly.copyWith(hour: Random().nextInt(23)),
          theaterName: theaterConstanst.first,
          filmFormat: filmFormatConstants.first,
          adultTicketPrice: refPrice,
          childTicketPrice: refPrice * 0.5,
          studentTicketPrice: refPrice * 0.7,
          vipTicketPrice: refPrice * 0.8,
        ),
      );
    }
    return result;
  }
}

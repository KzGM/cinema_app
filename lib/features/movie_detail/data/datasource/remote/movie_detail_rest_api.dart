import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/movie_detail.dart';
import '../../model/movie_video_response.dart';

part 'movie_detail_rest_api.g.dart';

@RestApi()
abstract class MovieDetailRestApi {
  factory MovieDetailRestApi(Dio dio, {String baseUrl}) = _MovieDetailRestApi;

  @GET('/movie/{movie_id}')
  Future<MovieDetail> getMovieDetail(
    @Path('movie_id') String movieId,
  );

  @GET('/movie/{movie_id}/videos')
  Future<MovieVideoReponse> getMovieVideos(
    @Path('movie_id') String movieId,
  );
}

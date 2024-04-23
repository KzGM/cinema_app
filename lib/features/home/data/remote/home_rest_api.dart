import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/movie_list_response.dart';

part 'home_rest_api.g.dart';

@RestApi()
abstract class HomeRestApi {
  factory HomeRestApi(Dio dio, {String baseUrl}) = _HomeRestApi;

  @GET('/movie/now_playing')
  Future<MovieListResponse> getNowPlayingMovies(
    @Query('language') String? language,
  );
}

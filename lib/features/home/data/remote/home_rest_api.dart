import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/movie_response.dart';

part 'home_rest_api.g.dart';

@RestApi()
abstract class HomeRestApi {
  factory HomeRestApi(Dio dio, {String baseUrl}) = _HomeRestApi;

  @GET('/movie/now_playing')
  Future<MovieResponse> getUpcomingMovies(
    @Query('language') String language,
    @Query('page') String page,
  );
}

import '../../data/models/movie.dart';
import '../../data/remote/home_rest_api.dart';
import 'home_repository.dart';

class HomeRepositoryImplement extends HomeRepository {
  final HomeRestApi datasource;

  HomeRepositoryImplement(this.datasource);
  @override
  Future<List<Movie>?> getUpcomingMovies() async {
    final response = await datasource.getUpcomingMovies('vi-VN', '1');
    return response.results;
  }
}

import '../../data/models/movie.dart';
import '../../data/remote/home_rest_api.dart';
import 'home_repository.dart';

class NewHomeRepositoryImplement extends HomeRepository {
  final HomeRestApi datasource;

  NewHomeRepositoryImplement(this.datasource);
  @override
  Future<List<Movie>?> getUpcomingMovies() async {
    final response = await datasource.getUpcomingMovies('vi-VN', '1');
    return response.results;
  }
}

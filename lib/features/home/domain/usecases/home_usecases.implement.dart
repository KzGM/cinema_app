import '../../data/models/movie.dart';
import '../repository/home_repository.dart';
import 'home_usecases.dart';

class HomeUsecasesImplement extends HomeUsecases {
  final HomeRepository repo;

  HomeUsecasesImplement(this.repo);
  @override
  Future<List<Movie>?> getUpcomingMovies() {
    return repo.getUpcomingMovies();
  }
}

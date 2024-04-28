import '../constants/app_constants.dart';

enum Genre {
  action,
  adventure,
  animation,
  comedy,
  crime,
  documentary,
  drama,
  family,
  fantasy,
  history,
  honor,
  music,
  mystery,
  romance,
  scienceFiction,
  tvMovie,
  thriller,
  war,
  western;

  static Genre? getGenreById(int id) {
    return genreIdsConstMap[id];
  }

  String getGenreString(String languageCode) {
    final isVi = languageCode == viStringCode;
    switch (this) {
      case action:
        return isVi ? 'Hành động' : 'Action';
      case adventure:
        return isVi ? 'Phiêu lưu' : 'Adventure';
      case animation:
        return isVi ? 'Hoạt hình' : 'Animation';
      case comedy:
        return isVi ? 'Hài kịch' : 'Comedy';
      case crime:
        return isVi ? 'Tội phạm' : 'Crime';
      case documentary:
        return isVi ? 'Tài liệu' : 'Documentary';
      case drama:
        return isVi ? 'Kịch' : 'Drama';
      case family:
        return isVi ? 'Gia đình' : 'Family';
      case fantasy:
        return isVi ? 'Viễn tưởng' : 'Fantasy';
      case history:
        return isVi ? 'Lịch sử' : 'History';
      case honor:
        return isVi ? 'Kinh dị' : 'Honor';
      case music:
        return isVi ? 'Âm nhạc' : 'Music';
      case mystery:
        return isVi ? 'Huyền ảo' : 'Mystery';
      case romance:
        return isVi ? 'Lãng mạn' : 'Romance';
      case scienceFiction:
        return isVi ? 'Khoa học viễn tưởng' : 'Science Fiction';
      case tvMovie:
        return isVi ? 'Phim truyền hình' : 'TV Movie';
      case thriller:
        return isVi ? 'Giật gân' : 'Thriller';
      case war:
        return isVi ? 'Chiến tranh' : 'Action';
      case western:
        return isVi ? 'Viễn tây' : 'Western';
    }
  }
}

import 'package:eng_mobile_app/data/models/library.dart';
import 'package:eng_mobile_app/data/repositories/user/enums.dart';

abstract class LibraryRepository {
  Future<List<InfoCard>> getCards();
  Future<List<ShortVideo>> getVideos();

  Future<List<int>> addCardToFavorites(InfoCard card);
  Future<List<int>> removeCardFromFavorites(InfoCard card);

  Future<List<int>> addVideoToFavorites(ShortVideo video);
  Future<List<int>> removeVideoFromFavorites(ShortVideo video);

  Future<List<Favorite>> getFavoriteResources();
  Future<FavoriteResponse?> getCardOrVideoByFavoriteId(int id);
}

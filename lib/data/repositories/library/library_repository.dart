import 'package:eng_mobile_app/data/models/library.dart';

abstract class LibraryRepository {
  Future<List<InfoCard>> getCards();
  Future<List<ShortVideo>> getVideos();

  Future<InfoCard?> getInfoCardById(int id);
  Future<ShortVideo?> getShortVideoById(int id);

  Future<List<int>> addCardToFavorites(InfoCard card);
  Future<List<int>> removeCardFromFavorites(InfoCard card);

  Future<List<int>> addVideoToFavorites(ShortVideo video);
  Future<List<int>> removeVideoFromFavorites(ShortVideo video);

  Future<List<Favorite>> getFavoriteResources();
}

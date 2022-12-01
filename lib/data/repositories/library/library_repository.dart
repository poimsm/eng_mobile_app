import 'package:eng_mobile_app/data/models/library.dart';

abstract class LibraryRepository {
  Future<List<InfoCard>> getCards();
  Future<bool> toggleCardFavorite(InfoCard card);

  Future<List<ShortVideo>> getVideos();
  Future<bool> toggleVideoFavorite(ShortVideo video);
}

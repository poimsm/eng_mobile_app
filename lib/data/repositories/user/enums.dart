import 'package:eng_mobile_app/data/models/library.dart';
import 'package:eng_mobile_app/pages/sentence_list/enums.dart';

class FavoriteResponse {
  ShortVideo? shortVideo;
  InfoCard? infoCard;
  int sourceType;

  FavoriteResponse(this.sourceType, {InfoCard? card, ShortVideo? video}) {
    if (sourceType == SourceType.shortVideo) {
      shortVideo = video;
    } else {
      infoCard = card;
    }
  }
}

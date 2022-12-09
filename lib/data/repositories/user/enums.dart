import 'package:eng_mobile_app/data/models/library.dart';
import 'package:eng_mobile_app/pages/sentence_list/enums.dart';

class FavoriteResponse {
  ShortVideo? shortVideo;
  InfoCard? infoCard;
  int type;

  FavoriteResponse(this.type, {InfoCard? card, ShortVideo? video}) {
    if (type == SourceType.shortVideo) {
      shortVideo = video;
    } else {
      infoCard = card;
    }
  }
}

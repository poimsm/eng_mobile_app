
import 'package:eng_mobile_app/data/models/activity.dart';

abstract class ActivityRepository {
  Future<List<Activity>> getActivities();
}

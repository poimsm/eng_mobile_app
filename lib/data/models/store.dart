// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'store.freezed.dart';
part 'store.g.dart';

@freezed
class Store with _$Store {
  const factory Store({
    required int id,
    required String email,
    required bool anonymous,
  }) = _Store;

  factory Store.fromJson(Map<String, Object?> json) =>
      _$StoreFromJson(json);
}

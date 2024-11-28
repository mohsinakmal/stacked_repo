import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stacked_state_management/models/image_links.dart';

part 'volume_info.freezed.dart';
part 'volume_info.g.dart';

@freezed
class VolumeInfo with _$VolumeInfo {
  factory VolumeInfo({
    required String title,
    required List<String> authors,
    String? description,
    ImageLinks? imageLinks,
  }) = _VolumeInfo;

  factory VolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stacked_state_management/models/image_links.dart';
import 'package:stacked_state_management/models/volume_info.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class Book with _$Book {
  factory Book({
    required VolumeInfo volumeInfo,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}

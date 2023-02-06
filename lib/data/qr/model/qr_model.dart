// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:floor/floor.dart';
import 'package:floor_annotation/floor_annotation.dart';

import '../../../domain/qr/entity/qr.dart';

@entity
class QRModel {
  @primaryKey
  final int? id;

  @ColumnInfo(name: 'qr_text')
  final String text;

  @ColumnInfo(name: 'qr_date')
  final DateTime date;

  QRModel({
    this.id,
    required this.text,
    required this.date,
  });

  QR toEntity() {
    return QR(
      id: id,
      text: text,
      date: date,
    );
  }

  factory QRModel.fromEntity(QR qr) {
    return QRModel(
      id: qr.id,
      text: qr.text,
      date: qr.date,
    );
  }

  @override
  bool operator ==(covariant QRModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.text == text && other.date == date;
  }

  @override
  int get hashCode => id.hashCode ^ text.hashCode ^ date.hashCode;

  @override
  String toString() => 'QRModel(id: $id, text: $text, date: $date)';

  QRModel copyWith({
    int? id,
    String? text,
    DateTime? date,
  }) {
    return QRModel(
      id: id ?? this.id,
      text: text ?? this.text,
      date: date ?? this.date,
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class QR {
  final int? id;
  final String text;
  final DateTime date;
  QR({
    this.id,
    required this.text,
    required this.date,
  });

  @override
  String toString() => 'QR(id: $id, text: $text, date: $date)';

  @override
  int get hashCode => id.hashCode ^ text.hashCode ^ date.hashCode;

  QR copyWith({
    int? id,
    String? text,
    DateTime? date,
  }) {
    return QR(
      id: id ?? this.id,
      text: text ?? this.text,
      date: date ?? this.date,
    );
  }

  @override
  bool operator ==(covariant QR other) {
    if (identical(this, other)) return true;

    return other.id == id && other.text == text && other.date == date;
  }
}

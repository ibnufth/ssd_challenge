enum PageMenu {
  screenA(title: "Screen A", initial: "A"),
  screenB(title: "Screen B", initial: "B"),
  screenC(title: "Screen C", initial: "C");

  const PageMenu({required this.title, required this.initial});
  final String initial;
  final String title;
}

enum SensorType {
  accelerometer,
  gyroscope,
  magnetometer;
}

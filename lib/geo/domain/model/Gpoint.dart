class Gpoint {
  final double latitude;
  final double longitude;

  Gpoint({this.latitude, this.longitude});

  factory Gpoint.fromMap(Map<String, dynamic> map) {
    return new Gpoint(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'latitude': this.latitude,
      'longitude': this.longitude,
    } as Map<String, dynamic>;
  }
}
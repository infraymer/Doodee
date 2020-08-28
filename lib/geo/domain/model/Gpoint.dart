class Gpoint {
  final double lat;
  final double lon;

  Gpoint({this.lat, this.lon});

  factory Gpoint.fromMap(Map<String, dynamic> map) {
    return new Gpoint(
      lat: map['lat'] as double,
      lon: map['lon'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'lat': this.lat,
      'lon': this.lon,
    } as Map<String, dynamic>;
  }
}
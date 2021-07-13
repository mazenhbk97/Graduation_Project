class City {
  String name;
  String id;
  int postalCode;
  List<int> services;
  String image;

  City.fromMap(Map<String, dynamic> cityMap) {
    this.id = cityMap['id'];
    this.name = cityMap['name'];
    this.postalCode = cityMap['postalCode'];
    // this.services =
    //     (cityMap['services'] as List<dynamic>).map((e) => e as int).toList();
    this.image = cityMap['image'];
  }
}

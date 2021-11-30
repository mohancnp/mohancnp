class Address {
  int id;
  String? addr1, addr2, phone, map;
  dynamic lat;
  dynamic long;
  String? instruction;

  Address.create(
      {required this.id,
      this.addr1,
      this.addr2,
      this.phone,
      this.map,
      required this.lat,
      required this.long,
      this.instruction});

  factory Address.fromJson(Map<dynamic, dynamic> data) {
    return Address.create(
      id: data['id'],
      lat: data['lat'],
      long: data['long'],
      map: data['map'],
      addr1: data['addr_1'],
      addr2: data['addr_2'],
      instruction: data['instruction'],
      phone: data['phone'],
    );
  }
}

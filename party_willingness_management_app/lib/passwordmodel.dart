class ModelPass {
  int? id;
  String? name;
  String? regno;
  String? email;
  String? phone;
  String? address;
  String? gender;
  int? status;
  passwordMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['name'] = name!;
    mapping['regno'] = regno!;
    mapping['email'] = email!;
    mapping['phone'] = phone!;
    mapping['address'] = address!;
    mapping['gender'] = gender!;
    mapping['status'] = status!;
    return mapping;
  }
}

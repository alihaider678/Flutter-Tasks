class modelnumber {
  int? id;
  int? number;
  passwordMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['num'] = number;
    return mapping;
  }
}

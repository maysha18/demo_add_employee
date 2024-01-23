class AddEmployeeModel {
  String? _name;
  String? _role;
  String? _startDate;
  String? _endDate;

  AddEmployeeModel(
      {String? name, String? role, String? startDate, String? endDate}) {
    if (name != null) {
      this._name = name;
    }
    if (role != null) {
      this._role = role;
    }
    if (startDate != null) {
      this._startDate = startDate;
    }
    if (endDate != null) {
      this._endDate = endDate;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get role => _role;
  set role(String? role) => _role = role;
  String? get startDate => _startDate;
  set startDate(String? startDate) => _startDate = startDate;
  String? get endDate => _endDate;
  set endDate(String? endDate) => _endDate = endDate;

  AddEmployeeModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _role = json['role'];
    _startDate = json['startDate'];
    _endDate = json['endDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['role'] = this._role;
    data['startDate'] = this._startDate;
    data['endDate'] = this._endDate;
    return data;
  }
}

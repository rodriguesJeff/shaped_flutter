class PatientStatusModel {
  int? id;
  String? paciente;
  String? status;
  String? data;

  PatientStatusModel({this.id, this.paciente, this.status, this.data});

  PatientStatusModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paciente = json['paciente'];
    status = json['status'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['paciente'] = this.paciente;
    data['status'] = this.status;
    data['data'] = this.data;
    return data;
  }
}

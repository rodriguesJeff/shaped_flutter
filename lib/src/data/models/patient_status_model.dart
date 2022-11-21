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
}

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:shaped_flutter/src/data/models/patient_status_model.dart';

class PatientStatusRepository {
  Future<String> getJson() {
    return rootBundle.loadString('assets/data.json');
  }

  getPatientDataFromJson() async {
    List<PatientStatusModel> _patientStatus = [];
    var response = json.decode(await getJson());

    for (final r in response['resultados']['exames']) {
      _patientStatus.add(PatientStatusModel.fromJson(r));
    }

    return _patientStatus;
  }
}

// ignore_for_file: prefer_final_fields, no_leading_underscores_for_local_identifiers, depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shaped_flutter/src/data/models/patient_status_model.dart';
import 'package:shaped_flutter/src/data/repositories/patient_status_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<PatientStatusModel> _statusModel = [];

  getPatientStatusModel() async {
    emit(HomeLoading());
    final PatientStatusRepository _repository = PatientStatusRepository();
    final result = await _repository.getPatientDataFromJson();
    _statusModel.addAll(result);
    emit(HomeLoaded(status: _statusModel));
  }
}

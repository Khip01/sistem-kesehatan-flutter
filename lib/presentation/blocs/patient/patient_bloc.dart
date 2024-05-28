import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sistem_kesehatan_flutter/domain/entities/patient.dart';

import '../../../data/datasource/remote_datasources/patient_remote_datasource.dart';

part 'patient_bloc.freezed.dart';
part 'patient_event.dart';
part 'patient_state.dart';

class PatientBloc extends Bloc<PatientEvent, PatientState> {
  final PatientRemoteDatasource _patientRemoteDatasource;
  PatientBloc(this._patientRemoteDatasource) : super(const _Initial()){
    on<_GetPatients>((event, emit) async {
      emit(const _Loading());
      final result = await _patientRemoteDatasource.getPatients();
      result.fold(
            (l) => emit(_Failure(l)),
            (r) => emit(_Success(r ?? [])),
      );
    });
  }
}
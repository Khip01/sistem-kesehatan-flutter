import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sistem_kesehatan_flutter/data/datasource/remote_datasources/doctor_remote_datasource.dart';
import 'package:sistem_kesehatan_flutter/domain/entities/doctor.dart';

part 'doctor_bloc.freezed.dart';
part 'doctor_event.dart';
part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final DoctorRemoteDatasource _doctorRemoteDatasource;
  DoctorBloc(
    this._doctorRemoteDatasource,
  ) : super(const _Initial()) {
    on<_GetDoctors>((event, emit) async {
      emit(const _Loading());
      final result = await _doctorRemoteDatasource.getDoctors();
      result.fold(
        (l) => emit(_Failure(l)),
        (r) => emit(_Success(r ?? [])),
      );
    });
  }
}

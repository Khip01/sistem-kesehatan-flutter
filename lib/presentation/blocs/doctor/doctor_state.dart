part of 'doctor_bloc.dart';

@freezed
class DoctorState with _$DoctorState {
  const factory DoctorState.initial() = _Initial;
  const factory DoctorState.loading() = _Loading;
  const factory DoctorState.failure(String message) = _Failure;
  const factory DoctorState.success(List<Doctor> doctors) = _Success;
}

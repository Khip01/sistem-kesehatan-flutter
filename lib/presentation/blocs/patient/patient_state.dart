part of 'patient_bloc.dart';

@freezed
class PatientState with _$PatientState {
  const factory PatientState.initial() = _Initial;
  const factory PatientState.loading() = _Loading;
  const factory PatientState.failure(String message) = _Failure;
  const factory PatientState.success(List<Patient> doctors) = _Success;
}

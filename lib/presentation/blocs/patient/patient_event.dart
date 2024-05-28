part of 'patient_bloc.dart';

@freezed
class PatientEvent {
  const factory PatientEvent.started() = _Started;
  const factory PatientEvent.getPatients() = _GetPatients;
}
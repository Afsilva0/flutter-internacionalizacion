part of 'preferences_bloc.dart';

class PreferencesState extends Equatable {
  final Locale locale;

  PreferencesState(this.locale);

  @override
  List<Object> get props => [locale];
}

import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_internalizacion/repository/preferences_repository.dart';

part 'preferences_event.dart';
part 'preferences_state.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  final PreferencesRepository _preferencesRepository;
  final PreferencesState _initialState;

  PreferencesBloc({
    required PreferencesRepository preferencesRepository,
    required Locale initialLocale,
  })  : _preferencesRepository = preferencesRepository,
        _initialState = PreferencesState(initialLocale),
        super(PreferencesState(initialLocale));

  PreferencesState get initialState => _initialState;

  @override
  Stream<PreferencesState> mapEventToState(
    PreferencesEvent event,
  ) async* {
    if (event is ChangeLocale) {
      await _preferencesRepository.saveLocale(event.locale);
      yield PreferencesState(event.locale);
    }
  }
}

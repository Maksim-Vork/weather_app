import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forecast/core/locator/service_locator.dart';
import 'package:forecast/features/Settings/domain/usecase/usecases.dart';
import 'package:forecast/features/Settings/presentation/bloc/bloc.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final ChangeThemeUsecase changeTheme = getIt<ChangeThemeUsecase>();
  final GetThemeDataUsecase getThemeData = getIt<GetThemeDataUsecase>();
  SettingsBloc() : super(SettingsState(themeData: false)) {
    on<GetThemeEvent>(_onGetTheme);
    on<ChangeThemeEvent>(_onChangeTheme);
  }

  void _onChangeTheme(
    ChangeThemeEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await changeTheme();
    final bool themeData = await getThemeData();

    emit(SettingsState(themeData: themeData));
  }

  void _onGetTheme(GetThemeEvent event, Emitter<SettingsState> emit) async {
    final bool themeData = await getThemeData();
    emit(SettingsState(themeData: themeData));
  }
}

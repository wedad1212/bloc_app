import 'package:bloc_app/service/shared_pre_lang.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<ChangeLocalState> {
  LocalCubit() : super(ChangeLocalState(locale: "en"));

  Future<void> changeAndSetLaguage(String locale) async {
    await HelperSharedPreLang().setLanguage(locale);
    emit(ChangeLocalState(locale: locale));
  }

  Future<void> getLaguage() async {
    final String language = await HelperSharedPreLang().getLanguge();
    emit(ChangeLocalState(locale: language));
  }
}

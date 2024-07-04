import 'package:auto_game/infrastructure/local_storage/local_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main_state.dart';

class MainNotifier extends StateNotifier<MainState> {
  MainNotifier() : super(const MainState());

  void selectIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  void getToken() {
    state = state.copyWith(tokensList: LocalStorage.getTokens());
  }

  void setToken(String token) {
    List<String> tokens = LocalStorage.getTokens();
    tokens.add(token);
    state = state.copyWith(tokensList: tokens);
  }
}

import 'package:flutter/material.dart';
import 'package:harrypotterapp/View/Service/hp_characters_service.dart';
import 'package:harrypotterapp/View/View/detail_view.dart';

import '../../Core/Base/base_view_model.dart';
import '../../Core/Service/Network/Response/response_model.dart';
import '../Model/hp_c.dart';

class HomeViewModel extends BaseViewModel {
  Future<ResponseModel<HPCharacters>> characters;
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  ScrollController _scrollCont = ScrollController();

  @override
  void init() {
    harryPotterCharacters();
  }

  GlobalKey<ScaffoldState> get globalKey => _globalKey;
  ScrollController get scrollController => _scrollCont;

  void harryPotterCharacters() {
    characters = HarrpPotterCharactersService().fetchCharacters();
  }

  void navigateToDetailPage(HPCharacters character) {
    navigator.navigateTo(DetailView(
      character: character,
    ));
  }
}

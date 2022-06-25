import 'package:mobx/mobx.dart';

part 'project_screen_store.g.dart';

class ProjectScreenStore = _ProjectScreenStoreBase with _$ProjectScreenStore;

abstract class _ProjectScreenStoreBase with Store {
  

  @observable
  int tabIndex = 0;

  
}

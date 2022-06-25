import 'package:mobx/mobx.dart';

part 'technician_store.g.dart';

class TechniciansScreenStore = _TechniciansScreenStoreBase with _$TechniciansScreenStore;

abstract class _TechniciansScreenStoreBase with Store {
  @observable
  int tabIndex = 0;
}

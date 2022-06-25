import 'package:mobx/mobx.dart';

part 'add_technician_store.g.dart';

class AddTechnicianScreenStore = _AddTechnicianScreenStoreBase
    with _$AddTechnicianScreenStore;

abstract class _AddTechnicianScreenStoreBase with Store {
  @observable
  bool isEdit = false;
}

import 'package:mobx/mobx.dart';

part 'manage_bids_store.g.dart';

class BidsScreenStore = _BidsScreenStoreBase with _$BidsScreenStore;

abstract class _BidsScreenStoreBase with Store {
  @observable
  int tabIndex = 0;
}

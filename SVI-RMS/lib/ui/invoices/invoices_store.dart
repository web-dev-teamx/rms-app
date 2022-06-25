import 'package:mobx/mobx.dart';

part 'invoices_store.g.dart';

class InvoicesScreenStore = _InvoicesScreenStoreBase with _$InvoicesScreenStore;

abstract class _InvoicesScreenStoreBase with Store {
  @observable
  int tabIndex = 0;
}

class HallModel {
  String title;
  List<TableModel> tables;
  HallModel({required this.title, required this.tables});
}

class TableModel {
  dynamic count;
  dynamic time;
  int personCount;
  List<ItemModel> items;
  String stateTitle;
  dynamic done;
  dynamic served;
  dynamic waiting;
  dynamic inProgress;
  dynamic sealed;
  String paymentTitle;
  dynamic payd;
  dynamic paymetWaiting;
  dynamic notPayd;
  dynamic guestBill;

  TableModel({
    required this.count,
    required this.time,
    required this.personCount,
    required this.items,
    required this.stateTitle,
    this.done,
    this.served,
    this.waiting,
    this.inProgress,
    this.sealed,
    required this.paymentTitle,
    this.payd,
    this.paymetWaiting,
    this.notPayd,
    this.guestBill,
  });
}

class ItemModel {
  int count;
  String title;
  int price;

  ItemModel({required this.count, required this.price, required this.title});
}

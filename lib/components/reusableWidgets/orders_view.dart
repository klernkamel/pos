import 'package:app/components/models/halls_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:styled_widget/styled_widget.dart';

class OrdersView extends StatefulWidget {
  OrdersView({Key? key}) : super(key: key);

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  List<HallModel> orders = [
    HallModel(title: 'Зал 1', tables: [
      TableModel(
          count: 'Стол 2',
          time: '15-11',
          personCount: 4,
          items: [
            ItemModel(count: 1, price: 400, title: 'Анус ежа'),
            ItemModel(count: 1, price: 200, title: 'Боярышник'),
            ItemModel(count: 2, price: 200, title: 'Кофе Американо'),
            ItemModel(count: 1, price: 400, title: 'Креветки по-жидкому'),
          ],
          stateTitle: 'Блюда готовы',
          done: true,
          paymentTitle: 'Оплчаено',
          payd: true),
      TableModel(
          count: 'Стол 4',
          time: '8-16',
          personCount: 1,
          items: [
            ItemModel(
                count: 1, price: 100, title: 'Спецпредложение Мастурбация'),
            ItemModel(count: 1, price: 130, title: 'Квас'),
            ItemModel(count: 2, price: 70, title: 'Кофе Американо'),
            ItemModel(count: 2, price: 95, title: 'Креветки по-жидкому'),
          ],
          stateTitle: 'Блюда поданы',
          served: true,
          paymentTitle: 'Пречек',
          guestBill: true)
    ]),
    HallModel(title: 'Бар', tables: [
      TableModel(
          count: 'Место 3',
          time: '12-20',
          personCount: 4,
          items: [
            ItemModel(count: 1, price: 400, title: 'Анус ежа'),
            ItemModel(count: 1, price: 200, title: 'Боярышник'),
            ItemModel(count: 2, price: 200, title: 'Кофе Американо'),
            ItemModel(count: 1, price: 400, title: 'Креветки по-жидкому'),
          ],
          stateTitle: 'Готовится',
          inProgress: true,
          paymentTitle: 'Оплчаено',
          payd: true),
      TableModel(
          count: 'Место 6',
          time: '12-20',
          personCount: 1,
          items: [],
          stateTitle: 'Ожидание',
          waiting: true,
          paymentTitle: 'Ожидание',
          paymetWaiting: true),
    ]),
    HallModel(title: 'Доставка', tables: [
      TableModel(
          count: 'Раздача',
          time: '11-15',
          personCount: 4,
          items: [
            ItemModel(count: 1, price: 400, title: 'Анус ежа'),
            ItemModel(count: 1, price: 200, title: 'Боярышник'),
            ItemModel(count: 1, price: 200, title: 'Кофе Американо'),
            ItemModel(count: 1, price: 400, title: 'Креветки по-жидкому'),
          ],
          stateTitle: 'Опечатан',
          sealed: true,
          paymentTitle: 'Не оплачен',
          notPayd: true),
    ])
  ];

  List<ItemModel> totalPriceList = [];

  totalPrice() {
    int total = 0;
    orders.forEach((element) {
      element.tables.forEach((element) {
        element.items.forEach((element) {
          total += element.count * element.price;
        });
      });
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // for (var hall in orders) Text(hall.title),
            for (var hall in orders)
              Container(
                  width: 100.w,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 100.w,
                        child: Text(
                          hall.title,
                          style: TextStyle(fontSize: 15.sp),
                        ).padding(vertical: 2.h, horizontal: 1.h),
                      ),
                      Container(
                        width: 100.w,
                        child: Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              for (var table in hall.tables)
                                Container(
                                  width: 45.w,
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              topRight: Radius.circular(10.0)),
                                          color: Colors.blueAccent[100],
                                        ),
                                        height: 5.h,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${table.count}',
                                                  style: TextStyle(
                                                      fontSize: 12.sp),
                                                ),
                                                Text(
                                                  table.stateTitle,
                                                  style: TextStyle(
                                                      fontSize: 10.sp),
                                                ),
                                              ],
                                            ),
                                            Text(table.time.toString()),
                                          ],
                                        ).padding(horizontal: 2),
                                      ),
                                      Container(
                                          color: Colors.white,
                                          height: 13.h,
                                          width: 45.w,
                                          child: SingleChildScrollView(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              for (var item in table.items)
                                                Text(
                                                  '${item.count} ${item.title}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                            ],
                                          ).padding(left: 3))),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                  bottom:
                                                      Radius.circular(10.0)),
                                          color: Colors.blueAccent[100],
                                        ),
                                        height: 5.h,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${table.personCount}',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14.sp,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.person_outline,
                                                      size: 15.sp,
                                                    )
                                                  ],
                                                ),
                                                Text(table.paymentTitle)
                                              ],
                                            ),
                                            Text(totalPrice().toString())
                                          ],
                                        ).padding(horizontal: 3),
                                      ),
                                    ],
                                  ),
                                ),
                            ]).padding(horizontal: 6),
                      )
                    ],
                  )))
          ],
        ),
      ),
    );
  }
}

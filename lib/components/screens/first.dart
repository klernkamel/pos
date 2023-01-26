import 'package:app/components/reusableWidgets/orders_page_button.dart';
import 'package:app/components/reusableWidgets/orders_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:styled_widget/styled_widget.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late Color firstBtn = Colors.blueAccent;

  late Color secondBtn = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.power_settings_new_rounded,
            color: Colors.black,
          ),
          iconSize: 30.0,
          splashRadius: 20.0,
        ),
        actions: [
          Container(
            width: 70.w,
            child: Wrap(
              spacing: 5.0,
              alignment: WrapAlignment.center,
              children: [
                OrdersPageButton(
                  title: 'Все заказы',
                  onPressed: () {
                    setState(() {
                      firstBtn = Colors.blueAccent;
                      secondBtn = Colors.white;
                    });
                  },
                  color: firstBtn,
                ),
                OrdersPageButton(
                    title: 'Мои заказы',
                    onPressed: () {
                      setState(() {
                        firstBtn = Colors.white;
                        secondBtn = Colors.blueAccent;
                      });
                    },
                    color: secondBtn),
              ],
            ),
          )
        ],
      ),
      body: OrdersView(),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.menu_rounded), label: 'Заказы'),
        BottomNavigationBarItem(icon: Icon(Icons.add_rounded), label: 'Столы'),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_rounded), label: 'C/C лист'),
      ]),
    );
  }
}

import 'package:flutter/material.dart';

class OrdersPageButton extends StatefulWidget {
  final String title;
  Color color;
  final void Function()? onPressed;
  OrdersPageButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.color})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OrdersPageButtonState createState() => _OrdersPageButtonState();
}

class _OrdersPageButtonState extends State<OrdersPageButton> {
  late Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(widget.color),
            foregroundColor: const MaterialStatePropertyAll(Colors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))))),
        onPressed: widget.onPressed,
        child: Text(widget.title),
      ),
    );
  }
}

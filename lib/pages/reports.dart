import 'package:flutter/material.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({super.key});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body:
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color(0xFF263238),
            child:
            SingleChildScrollView(child:
            Column(
              children: [
                const SizedBox(
                  height: 50,
                ),

                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  color: const Color(0xFF212121),
                ),


            ],
            ),
            ),

        ),
      );
    }
  }
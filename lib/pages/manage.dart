import 'package:flutter/material.dart';
import 'package:web_app/tabs/projects.dart';

import '../tabs/users.dart';

class ManagePage extends StatefulWidget {
  const ManagePage({super.key});

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> with SingleTickerProviderStateMixin {

  late TabController tabController;


  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }


  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFF263238),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Expanded(child:
                Container(
                      height: 50,
                      width: 400,
                      margin: const EdgeInsets.only(left: 15),
                      child: TabBar(
                          controller: tabController,
                          isScrollable: true,
                          padding: EdgeInsets.zero,
                          indicatorWeight: 1,
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: const [
                            Tab(text: "Users/Roles",),
                            Tab(text: "Projects/Clients"),
                          ]
                      ),
                    ),
                ),

              ],
              ),


              const SizedBox(height: 16,),

              Expanded(child:
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(left: 15,right: 15),
              child:
              TabBarView(
                  controller: tabController,
                  children: const [
                    UsersTab(),
                    ProjectsTab(),
                  ]

              ),
              ),
              ),
                ],
              ),
        ),
    );
  }
}

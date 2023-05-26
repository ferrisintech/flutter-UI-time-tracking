
import 'package:flutter/material.dart';
import 'package:web_app/pages/manage.dart';
import 'package:web_app/pages/dashboard.dart';
import 'package:web_app/pages/reports.dart';
import 'package:universal_html/html.dart' as html;



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


   List<IconData> pageIconSelected =[
     Icons.watch_later_outlined,
     Icons.bar_chart,
     Icons.settings,
   ];

  List<String> pageName =[
     "Time Tracker",
     "Reports",
     "Manage",
  ];


  List<bool> pageSelected = [
     true,
     false,
     false,
  ];


  final pages = [
    const DashboardPage(),
    const ReportsPage(),
    const ManagePage(),
  ];

  @override
  Widget build(BuildContext context) {
    //html.window.location.reload();
    return
      WillPopScope(
        onWillPop: () async => false,
      child: Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
             Container(
              height: MediaQuery.of(context).size.height,
              width: 170,
               color: const Color(0xFF212121),
              child: Column(
                children: [
                  const SizedBox(height: 50,),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blueGrey[800],
                  ),
                  const SizedBox(height: 30,),

                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: pageSelected.length,
                      itemBuilder: (context, index){
                        const colorInActive = Colors.white70;
                        final colorActive = Colors.purple[300];
                        final hoverColor = Colors.purple[500]!.withOpacity(0.3);

                        return  Material(
                            type: MaterialType.transparency,
                            child: ListTile(
                          selected: pageSelected[0],
                          title:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(pageIconSelected[index],size: 22,color: pageSelected[index]==true ? colorActive:colorInActive),
                              const SizedBox(width: 15,),
                              Text(pageName[index], style: TextStyle(fontSize: 16, color: pageSelected[index]==true ? colorActive:colorInActive),),
                            ],
                          ),
                          hoverColor: hoverColor,
                          onTap: () {
                            setState(() {
                                updateSelection(index);
                            });
                          },
                            ),
                        );
                      },
                  ),
                ],
              ),

            ),
            Expanded(
              flex: 5,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: pageSelected[0]==true? const DashboardPage() :
                       pageSelected[1]==true? const ReportsPage() :
                       pageSelected[2]==true? const ManagePage() :
                      // pageSelected[3]==true? const ManagePage() :
                       Container(),

                ),
                ),
          ],
        ),
      ),
      ),
    );
  }


  updateSelection(int i){
    setState(() {
      for (int menuItemIdx =0; menuItemIdx < pageSelected.length; menuItemIdx++){
        if(menuItemIdx == i){
          pageSelected[menuItemIdx]=true;
        }else{
          pageSelected[menuItemIdx]=false;
        }
      }
    });
  }
}


class MenuItem {
  final IconData icon;
  final String title;

  MenuItem({
    required this.icon,
    required this.title,
  });
}
















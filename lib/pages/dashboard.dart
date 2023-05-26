import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with TickerProviderStateMixin {
  bool isClock = true;
  bool buttonStart = true;
  bool isVisible = false;
  Duration duration = const Duration();
  Timer? timer;

  TextEditingController editingControllerPopMenu = TextEditingController();
  TextEditingController editingControllerMyList = TextEditingController();

  TextEditingController txtTimeController1 = TextEditingController();
  TextEditingController txtTimeController2 = TextEditingController();




  List<bool> section = [true, false];

  List<String> projectSearchList = [];

  List<String> projectList = [
    "roman",
    "komar", "orange",
    "topol", "topol2", "marchew",
  ];

  List<String> myProjectSearchList = [];

  List<String> myProjectList = [
    "ania", "kora", "bora",
    "piotr", "sandra", "sami", "tami",
  ];


  String projectName = "Project";

  List<String> results = [];

  late Animation<Offset> navAnimation, delayAnimation;
  late AnimationController navController;





  Widget buildTimer() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Text(
      "$hours:$minutes:$seconds",
      style: const TextStyle(fontSize: 20, color: Colors.white),
    );
  }

  Widget buildCounter() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final hours2 = twoDigits(duration.inHours);
    final minutes2 = twoDigits(duration.inMinutes.remainder(60));




    return Text(
      "$hours:$minutes",
      style: const TextStyle(fontSize: 20, color: Colors.white),
    );
  }



  @override
  void initState() {
    super.initState();

    results = projectList;


    navController = AnimationController(
      duration: const Duration(milliseconds: 580),
      vsync: this,
    )..forward(from: 0.0);

    navAnimation = Tween<Offset>(
      begin: const Offset(0.0, -6.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: navController,
      curve: Curves.linear,
    ));


  }

  @override
  void dispose() {
    editingControllerPopMenu.dispose();
    editingControllerMyList.dispose();
    navController.dispose();
    super.dispose();
  }



  Widget expanseTiles(){
    return
      Container(
       width: MediaQuery.of(context).size.width,
      color: const Color(0xFF212121),
      child:
      ExpansionTile(
        collapsedIconColor: Colors.white,
        leading:
        const FittedBox(child:
        Text(
          "20.01.2023" " - " "27.01.2023",
          style: TextStyle(
              color: Colors.white, fontSize: 16),
        ),),
        title:
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Flexible(child:
            Text(
              "Total: ",
              style: TextStyle(
                  color: Colors.white, fontSize: 15),
            ),
            ),
            Flexible(child:SizedBox(
              width: 20,
            ),),
            Flexible(child:
            Text(
              "8:00",
              style: TextStyle(
                  color: Colors.white, fontSize: 19),
            ),
            ),
            Flexible(child:
            SizedBox(
              width: 40,
            ),
            ),
          ],
        ),

        children: [
          Container(
            height: 50,
            //width: MediaQuery.of(context).size.width,
            color: Colors.blueGrey[900],
            child:
            ListTile(
              leading: SizedBox(
                height: 50,
                width: 400,
                child: TextFormField(
                  style: const TextStyle(
                      color: Colors.white, fontSize: 19),
                ),
              ),
              title:
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(child:
                  Text(
                    "08:00",
                    style: TextStyle(
                        color: Colors.grey[300]),
                  ),
                  ),
                  const Flexible(child:SizedBox(
                    width: 5,
                  ),
                  ),
                  Flexible(child:
                  Text("-",
                      style: TextStyle(
                          color: Colors.grey[300])),
                  ),
                  const Flexible(child: SizedBox(
                    width: 5,
                  ),
                  ),
                  Flexible(child:
                  Text(
                    "16:00",
                    style: TextStyle(
                        color: Colors.grey[300]),
                  ),
                  ),
                  const Flexible(child:SizedBox(
                    width: 100,
                  ),
                  ),
                  const Flexible(child:
                  Text(
                    "8:00",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18),
                  ),
                  ),
                  const Flexible(child: SizedBox(
                    width: 25,
                  ),
                  ),
                ],
              ),
              trailing: //SingleChildScrollView(child:
              FittedBox(child:
              Theme(
                data: Theme.of(context).copyWith(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                ),
                child: PopupMenuButton(
                  tooltip: "",
                  offset: const Offset(0, 40),
                  icon: Icon(
                    Icons.more_vert_outlined,
                    color: Colors.grey[400],
                    size: 23,
                  ),
                  color: Colors.black,
                  itemBuilder: (BuildContext context) => [
                    PopupMenuItem(
                      child: Text(
                        "Duplicate",
                        style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 14),
                      ),
                    ),
                    PopupMenuItem(
                      child: Text(
                        "Delete",
                        style: TextStyle(
                            color: Colors.red[300],
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFF263238),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
               Row(
                children: [
                  Expanded(
                    child: SlideTransition(
                      position: navAnimation,
                      child:
                      Container(
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      color: const Color(0xFF212121),
                      padding: EdgeInsets.zero,
                      child:
                      ListTile(
                        contentPadding: const EdgeInsets.only(right: 15),
                        leading: isClock ? SizedBox(
                          height: 42,
                          width: 580,
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            onChanged: (value) {
                            },
                            decoration: InputDecoration(
                              hintText: 'What are you working on ?',
                              hintStyle: TextStyle(color: Colors.grey[600], fontSize: 15),
                              filled: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 6.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[700]!),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26),
                              ),
                            ),
                          ),
                        ):
                        SizedBox(
                          height: 42,
                          width: 580,
                          child: TextFormField(
                            style: const TextStyle(color: Colors.white),
                            onChanged: (value) {
                            },
                            decoration: InputDecoration(
                              hintText: 'What have you worked on ?',
                              hintStyle: TextStyle(color: Colors.grey[600], fontSize: 15),
                              filled: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 6.0, top: 8.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey[700]!),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black26),
                              ),
                            ),
                          ),
                        ),
                        title: isClock?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Flexible(child: SizedBox(height: 30,),),
                                        PopupMenuButton(
                                          tooltip: "",
                                          padding: EdgeInsets.zero,
                                          position: PopupMenuPosition.under,
                                          offset: const Offset(80, 10),
                                          constraints: const BoxConstraints(
                                              maxWidth: 240),
                                          color: Colors.black,
                                          icon: null,
                                          iconSize: 0.0,
                                          itemBuilder: (context) =>
                                          [
                                            PopupMenuItem(
                                              height: 0,
                                              padding: EdgeInsets.zero,
                                              child:
                                              StatefulBuilder(
                                                builder: (stx, setState) =>
                                                Column(
                                                  children: [
                                              SizedBox(
                                                height: 40,
                                                width: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width,
                                                child: TextFormField(
                                                        controller: editingControllerPopMenu,
                                                        style: const TextStyle(
                                                            color: Colors
                                                                .white),
                                                        onChanged: (value) {
                                                          setState(() {
                                                            projectSearchList =
                                                                projectList
                                                                    .where((
                                                                    element) =>
                                                                    element
                                                                        .toLowerCase()
                                                                        .contains(
                                                                        value
                                                                            .toLowerCase()))
                                                                    .toList();
                                                          });
                                                        },
                                                        decoration: InputDecoration(
                                                          hintText: 'Search for a project',
                                                          hintStyle: TextStyle(
                                                              color: Colors
                                                                  .teal[300],
                                                              fontSize: 15),
                                                          filled: true,
                                                          contentPadding: const EdgeInsets
                                                              .only(
                                                              left: 14.0,
                                                              bottom: 6.0,
                                                              top: 8.0),
                                                          focusedBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .teal[300]!),
                                                          ),
                                                          enabledBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .teal[300]!),
                                                          ),
                                                        ),
                                                      ),
                                                ),

                                                Visibility(
                                                visible: isVisible,
                                                child: Container(
                                                  height: 40,
                                                  width: MediaQuery
                                                      .of(context)
                                                      .size
                                                      .width,
                                                  padding: const EdgeInsets
                                                      .only(
                                                      top: 5, bottom: 5),
                                                  child: OutlinedButton(
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      side: const BorderSide(
                                                        color: Colors
                                                            .transparent,
                                                      ),
                                                      splashFactory: NoSplash
                                                          .splashFactory,
                                                      foregroundColor: Colors
                                                          .transparent,
                                                    ),
                                                    onPressed: () {
                                                          isVisible = false;
                                                          projectName = "Project";
                                                          Text(
                                                            projectName,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .purple[300],
                                                                fontSize: 17),
                                                          );
                                                          Navigator.pop(context);
                                                        this.setState(() {
                                                        });
                                                    },
                                                    child: Text(
                                                      "no project",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .red[300],
                                                          fontSize: 17),),
                                                  ),
                                                ),
                                              ),

                                                SizedBox(
                                                      height: 200,
                                                      width: MediaQuery
                                                          .of(context)
                                                          .size
                                                          .width,
                                                      child: ListView.builder(
                                                                shrinkWrap: true,
                                                                itemCount: editingControllerPopMenu
                                                                    .text
                                                                    .isNotEmpty
                                                                    ? projectSearchList
                                                                    .length
                                                                    : projectList
                                                                    .length,
                                                                itemBuilder: (
                                                                    context,
                                                                    index) {
                                                                  return ListTile(
                                                                    onTap: () {
                                                                        if (editingControllerPopMenu
                                                                            .text
                                                                            .isEmpty &&
                                                                            projectName !=
                                                                                projectList[index]) {
                                                                          isVisible =
                                                                          true;
                                                                          projectName =
                                                                          projectList[index];
                                                                          Navigator
                                                                              .pop(
                                                                              context);
                                                                        }
                                                                        if (editingControllerPopMenu
                                                                            .text
                                                                            .isNotEmpty &&
                                                                            projectName !=
                                                                                projectSearchList[index]) {
                                                                          isVisible =
                                                                          true;
                                                                          projectName =
                                                                          projectSearchList[index];
                                                                          Navigator
                                                                              .pop(
                                                                              context);
                                                                        }
                                                                      this.setState(() {
                                                                      });
                                                                    },
                                                                    title: Row(
                                                                         children: [
                                                                           Icon(Icons.star_outlined, color: Colors.orange[400],size: 19,),
                                                                           const SizedBox(width: 8,),
                                                                           Text(
                                                                               editingControllerPopMenu
                                                                                   .text
                                                                                   .isNotEmpty
                                                                                   ? projectSearchList[index]
                                                                                   : projectList[index],
                                                                               style: TextStyle(
                                                                                   color: Colors
                                                                                       .orange[400],
                                                                                   fontSize: 16)),
                                                                        ],
                                                                      ),

                                                                  );
                                                                }
                                                            ),
                                                      ),

                                                SizedBox(
                                                height: 40,
                                                width: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width,
                                                child: OutlinedButton(
                                                  style: OutlinedButton
                                                      .styleFrom(
                                                    splashFactory: NoSplash
                                                        .splashFactory,
                                                    foregroundColor: Colors
                                                        .transparent,
                                                  ),
                                                  onPressed: () {},
                                                  child: Text("Add project",
                                                    style: TextStyle(
                                                        color: Colors.blue[300],
                                                        fontSize: 17),),
                                                ),
                                              ),
                                                ],
                                              ),
                                             ),
                                        ),
                                          ],
                                          child:
                                          Row(
                                                  children: [
                                                    isVisible == false ? Icon(
                                                      Icons
                                                          .add_circle_outline_outlined,
                                                      color: Colors.purple[300],
                                                      size: 20,
                                                    ) :  Icon(Icons.star_outlined, color: Colors.orange[400],size: 19,),
                                                    const SizedBox(width: 5,),

                                                      isVisible == false ? Text(
                                                        projectName,
                                                        style: TextStyle(
                                                            color: Colors
                                                                .purple[300],
                                                            fontSize: 17),
                                                      ) : Text(projectName,
                                                        style: TextStyle(
                                                            color: Colors
                                                                .orange[300],
                                                            fontSize: 17),
                                                      ),

                                                  ],
                                                ),
                                        ),

                            const Flexible(child: SizedBox(
                              width: 50,
                            ),
                            ),

                            const Flexible(child:SizedBox(
                              width: 50,
                            ),
                            ),
                            Flexible(child:
                            buildTimer(),
                            ),
                            const Flexible(child:SizedBox(
                              width: 40,
                            ),
                            ),
                            Flexible(child:
                            SizedBox(
                              height: 40,
                              width: 90,
                              child: buttonStart
                                  ?
                              ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          buttonStart = !buttonStart;
                                        });
                                      },
                                      child: const Text(
                                        "START",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      ))
                                  :
                              ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red),
                                      onPressed: () {
                                        setState(() {
                                          buttonStart = !buttonStart;
                                        });
                                      },
                                      child: const Text(
                                        "STOP",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      ),
                                    ),),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Flexible(child:
                            IconButton(
                              icon: isClock
                                  ? const Icon(
                                      Icons.list_outlined,
                                      color: Colors.green,
                                      size: 27,
                                    )
                                  : const Icon(
                                      Icons.watch_later_outlined,
                                      color: Colors.blue,
                                      size: 27,
                                    ),
                              onPressed: () {
                                setState(() {
                                  isClock = !isClock;
                                });
                              },
                            ),
                            ),
                          ],
                        ) :
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            const Flexible(child: SizedBox(height: 30,),),
                            Expanded(child:
                            PopupMenuButton(
                              tooltip: "",
                              padding: EdgeInsets.zero,
                              position: PopupMenuPosition.under,
                              offset: const Offset(80, 10),
                              constraints: const BoxConstraints(
                                  maxWidth: 240),
                              color: Colors.black,
                              icon: null,
                              iconSize: 0.0,
                              itemBuilder: (context) =>
                              [
                                PopupMenuItem(
                                  height: 0,
                                  padding: EdgeInsets.zero,
                                  child:
                                  StatefulBuilder(
                                    builder: (stx, setState) =>
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 40,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: TextFormField(
                                                controller: editingControllerPopMenu,
                                                style: const TextStyle(
                                                    color: Colors
                                                        .white),
                                                onChanged: (value) {
                                                  setState(() {
                                                    projectSearchList =
                                                        projectList
                                                            .where((
                                                            element) =>
                                                            element
                                                                .toLowerCase()
                                                                .contains(
                                                                value
                                                                    .toLowerCase()))
                                                            .toList();
                                                  });
                                                },
                                                decoration: InputDecoration(
                                                  hintText: 'Search for a project',
                                                  hintStyle: TextStyle(
                                                      color: Colors
                                                          .teal[300],
                                                      fontSize: 15),
                                                  filled: true,
                                                  contentPadding: const EdgeInsets
                                                      .only(
                                                      left: 14.0,
                                                      bottom: 6.0,
                                                      top: 8.0),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .teal[300]!),
                                                  ),
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors
                                                            .teal[300]!),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            Visibility(
                                              visible: isVisible,
                                              child: Container(
                                                height: 40,
                                                width: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width,
                                                padding: const EdgeInsets
                                                    .only(
                                                    top: 5, bottom: 5),
                                                child: OutlinedButton(
                                                  style: OutlinedButton
                                                      .styleFrom(
                                                    side: const BorderSide(
                                                      color: Colors
                                                          .transparent,
                                                    ),
                                                    splashFactory: NoSplash
                                                        .splashFactory,
                                                    foregroundColor: Colors
                                                        .transparent,
                                                  ),
                                                  onPressed: () {
                                                    isVisible = false;
                                                    projectName = "Project";
                                                    Text(
                                                      projectName,
                                                      style: TextStyle(
                                                          color: Colors
                                                              .purple[300],
                                                          fontSize: 17),
                                                    );
                                                    Navigator.pop(context);
                                                    this.setState(() {
                                                    });
                                                  },
                                                  child: Text(
                                                    "no project",
                                                    style: TextStyle(
                                                        color: Colors
                                                            .red[300],
                                                        fontSize: 17),),
                                                ),
                                              ),
                                            ),

                                            SizedBox(
                                              height: 200,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: ListView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: editingControllerPopMenu
                                                      .text
                                                      .isNotEmpty
                                                      ? projectSearchList
                                                      .length
                                                      : projectList
                                                      .length,
                                                  itemBuilder: (
                                                      context,
                                                      index) {
                                                    return ListTile(
                                                      onTap: () {
                                                        if (editingControllerPopMenu
                                                            .text
                                                            .isEmpty &&
                                                            projectName !=
                                                                projectList[index]) {
                                                          isVisible =
                                                          true;
                                                          projectName =
                                                          projectList[index];
                                                          Navigator
                                                              .pop(
                                                              context);
                                                        }
                                                        if (editingControllerPopMenu
                                                            .text
                                                            .isNotEmpty &&
                                                            projectName !=
                                                                projectSearchList[index]) {
                                                          isVisible =
                                                          true;
                                                          projectName =
                                                          projectSearchList[index];
                                                          Navigator
                                                              .pop(
                                                              context);
                                                        }
                                                        this.setState(() {
                                                        });
                                                      },
                                                      title: Row(
                                                        children: [
                                                          Icon(Icons.star_outlined, color: Colors.orange[400],size: 19,),
                                                          const SizedBox(width: 8,),
                                                          Text(
                                                              editingControllerPopMenu
                                                                  .text
                                                                  .isNotEmpty
                                                                  ? projectSearchList[index]
                                                                  : projectList[index],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .orange[400],
                                                                  fontSize: 16)),
                                                        ],
                                                      ),

                                                    );
                                                  }
                                              ),
                                            ),

                                            SizedBox(
                                              height: 40,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width,
                                              child: OutlinedButton(
                                                style: OutlinedButton
                                                    .styleFrom(
                                                  splashFactory: NoSplash
                                                      .splashFactory,
                                                  foregroundColor: Colors
                                                      .transparent,
                                                ),
                                                onPressed: () {},
                                                child: Text("Add project",
                                                  style: TextStyle(
                                                      color: Colors.blue[300],
                                                      fontSize: 17),),
                                              ),
                                            ),
                                          ],
                                        ),
                                  ),
                                ),
                              ],
                              child:
                              Row(
                                children: [
                                  isVisible == false ? Icon(
                                    Icons
                                        .add_circle_outline_outlined,
                                    color: Colors.purple[300],
                                    size: 20,
                                  ) :  Icon(Icons.star_outlined, color: Colors.orange[400],size: 19,),
                                  const SizedBox(width: 5,),

                                  isVisible == false ? Text(
                                    projectName,
                                    style: TextStyle(
                                        color: Colors
                                            .purple[300],
                                        fontSize: 17),
                                  ) : Text(projectName,
                                    style: TextStyle(
                                        color: Colors
                                            .orange[300],
                                        fontSize: 17),
                                  ),

                                ],
                              ),
                            ),
                            ),
                            const Flexible(child: SizedBox(
                              width: 50,
                            ),),

                            const Flexible(child: SizedBox(
                              width: 20,
                            ),),


                            Flexible(child:
                            SizedBox(
                              height: 40,
                              width: 60,
                              child: TextFormField(
                                controller: txtTimeController1,
                                style: const TextStyle(
                                    color: Colors
                                        .white),
                                onChanged: (value) {
                                  setState(() {
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: "11:30",
                                  hintStyle: TextStyle(
                                      color: Colors
                                          .grey[600],
                                      fontSize: 15),
                                  filled: true,
                                  contentPadding: const EdgeInsets
                                      .only(
                                      left: 6.0,
                                      bottom: 6.0,
                                      top: 8.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors
                                            .grey[700]!),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors
                                            .black26),
                                  ),
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r"[0-9]+|:")),
                                  LengthLimitingTextInputFormatter(5),

                                ],
                              ),
                            ),
                            ),
                            const SizedBox(width: 5,),
                            const Flexible(child: Text(" - ", style: TextStyle(color: Colors.white),),),
                            const SizedBox(width: 5,),
                            Flexible(child:
                            SizedBox(
                              height: 40,
                              width: 60,
                              child: TextFormField(
                                controller: txtTimeController2,
                                style: const TextStyle(
                                    color: Colors
                                        .white),
                                onChanged: (value) {
                                  setState(() {
                                    projectSearchList =
                                        projectList
                                            .where((
                                            element) =>
                                            element
                                                .toLowerCase()
                                                .contains(
                                                value
                                                    .toLowerCase()))
                                            .toList();
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: '12:30',
                                  hintStyle: TextStyle(
                                      color: Colors
                                          .grey[600],
                                      fontSize: 15),
                                  filled: true,
                                  contentPadding: const EdgeInsets
                                      .only(
                                      left: 6.0,
                                      bottom: 6.0,
                                      top: 8.0),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors
                                            .grey[700]!),
                                  ),
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors
                                            .black26),
                                  ),
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r"[0-9]+|:")),
                                  LengthLimitingTextInputFormatter(5),

                                ],
                              ),
                            ),
                            ),
                            const SizedBox(width: 50,),

                            Flexible(child:
                            buildCounter(),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Flexible(child:
                            SizedBox(
                              height: 40,
                              width: 90,
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      //add to list ...

                                    });
                                  },
                                  child: const Text(
                                    "ADD",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),),
                            ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Flexible(child:
                            IconButton(
                              icon: isClock
                                  ? const Icon(
                                Icons.list_outlined,
                                color: Colors.green,
                                size: 27,
                              )
                                  : const Icon(
                                Icons.watch_later_outlined,
                                color: Colors.blue,
                                size: 27,
                              ),
                              onPressed: () {
                                setState(() {
                                  isClock = !isClock;
                                });
                              },
                            ),
                            ),
                          ],
                        ),
                      ),
                      ),
                      ),
                    ),

                ],
              ),

              const SizedBox(
                height: 20,
              ),

              Expanded(
                  child: Row(
                    children: [
                  SingleChildScrollView(child:
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: 250,
                        margin: const EdgeInsets.only(left: 15),
                        child: Column(
                          children: [
                           // Expanded(child:
                           Container(
                              height: 180,
                              width: 250,
                              color: const Color(0xFF212121),
                              child: Column(
                                children: [
                                  Theme(
                                    data: Theme.of(context).copyWith(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                    ),
                                    child: ToggleButtons(
                                      isSelected: section,
                                      color: Colors.grey[500]!,
                                      selectedColor: Colors.blue[300],
                                      fillColor: const Color(0xFF212121),
                                      renderBorder: false,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              right: 10, left: 10),
                                          child: const Text(
                                            "This month",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: const Text(
                                            "Last month",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ],
                                      onPressed: (int newindex) {
                                        setState(() {
                                          for (int index = 0;
                                          index < section.length;
                                          index++) {
                                            if (index == newindex) {
                                              section[index] = true;
                                            } else {
                                              section[index] = false;
                                            }
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  section[0] == true
                                      ? Text(
                                    "82",
                                    style: TextStyle(
                                        color: Colors.tealAccent[200],
                                        fontSize: 50),
                                  )
                                      : Text(
                                    "154",
                                    style: TextStyle(
                                        color: Colors.yellow[300],
                                        fontSize: 50),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Expanded(
                              flex: 4,
                              child: Container(
                                height: 700,
                                width: 250,
                                color: const Color(0xFF212121),
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: editingControllerMyList,
                                      style: const TextStyle(color: Colors.white),
                                      onChanged: (value) {
                                        setState(() {
                                          myProjectSearchList = myProjectList.where((element) =>
                                              element.toLowerCase().contains(value.toLowerCase())).toList();
                                        });
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'My projects',
                                        hintStyle: TextStyle(color: Colors.orange[500]?.withOpacity(0.8), fontSize: 16),
                                        filled: true,
                                        contentPadding: const EdgeInsets.only(
                                            left: 14.0, bottom: 6.0, top: 8.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey[800]!),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey[800]!),
                                        ),
                                      ),
                                    ),

                                    Expanded(
                                      child: ListView.builder(
                                          padding: const EdgeInsets.only(bottom: 15),
                                          shrinkWrap: true,
                                          itemCount: editingControllerMyList.text.isNotEmpty ? myProjectSearchList.length : myProjectList.length,
                                          itemBuilder: (context, index) {
                                            return SizedBox(
                                              height: 30,
                                              child: ListTile(
                                                leading: Text(
                                                  editingControllerMyList.text.isNotEmpty ? myProjectSearchList[index] : myProjectList[index],
                                                  style: TextStyle(
                                                      color: Colors.grey[400],
                                                      fontSize: 18),
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                ),

                              ),

                            ),
                          ],
                        ),
                      ),
                  ),
                      const SizedBox(width: 10,),
                      Expanded(child:
                      Container(
                        height: 800,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(right: 15),
                        color: const Color(0xFF212121),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),
                            expanseTiles(),

                            /*
                            Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.blueGrey[800],
                              child:
                              ExpansionTile(
                                collapsedIconColor: Colors.white,
                                leading: const Text(
                                  "20.01.2023" " - " "27.01.2023",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                title:
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Flexible(child:
                                    Text(
                                      "Total: ",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Flexible(child:
                                    Text(
                                      "8:00",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 19),
                                    ),
                                    ),
                                    Flexible(child:
                                    SizedBox(
                                      width: 40,
                                    ),
                                    ),
                                  ],
                                ),
                                children: [
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.blueGrey[700],
                                    child:
                                    ListTile(
                                      leading: SizedBox(
                                        height: 50,
                                        width: 300,
                                        child: TextFormField(
                                          style: const TextStyle(
                                              color: Colors.white, fontSize: 19),
                                        ),
                                      ),
                                      title:
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Flexible(child:
                                          Text(
                                            "08:00",
                                            style: TextStyle(
                                                color: Colors.grey[300]),
                                          ),
                                          ),
                                          const Flexible(child:SizedBox(
                                            width: 5,
                                          ),
                                          ),
                                          Flexible(child:
                                          Text("-",
                                              style: TextStyle(
                                                  color: Colors.grey[300])),
                                          ),
                                          const Flexible(child: SizedBox(
                                            width: 5,
                                          ),
                                          ),
                                          Flexible(child:
                                          Text(
                                            "16:00",
                                            style: TextStyle(
                                                color: Colors.grey[300]),
                                          ),
                                          ),
                                          const Flexible(child:SizedBox(
                                            width: 100,
                                          ),
                                          ),
                                          const Flexible(child:
                                           Text(
                                            "8:00",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                          ),
                                          const Flexible(child: SizedBox(
                                            width: 25,
                                          ),
                                          ),
                                        ],
                                      ),
                                      trailing: SingleChildScrollView(child:
                                        Theme(
                                        data: Theme.of(context).copyWith(
                                          highlightColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                        ),
                                        child: PopupMenuButton(
                                          tooltip: "",
                                          offset: const Offset(0, 40),
                                          icon: Icon(
                                            Icons.more_vert_outlined,
                                            color: Colors.grey[400],
                                            size: 23,
                                          ),
                                          color: Colors.black,
                                          itemBuilder: (BuildContext context) => [
                                            PopupMenuItem(
                                              child: Text(
                                                "Duplicate",
                                                style: TextStyle(
                                                    color: Colors.grey[300],
                                                    fontSize: 14),
                                              ),
                                            ),
                                            PopupMenuItem(
                                              child: Text(
                                                "Delete",
                                                style: TextStyle(
                                                    color: Colors.red[300],
                                                    fontSize: 14),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ),
                                    ),

                                  ),
                                ],
                              ),
                            ),
                            */


                          ],
                        ),
                      ),
                      ),
                    ],
                  )
              ),


            ],
          ),

      ),
      ),
    );
  }
}

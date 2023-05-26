import 'package:flutter/material.dart';

class UsersTab extends StatefulWidget {
  const UsersTab({super.key});

  @override
  State<UsersTab> createState() => _UsersTabState();
}

class _UsersTabState extends State<UsersTab> {
  List<String> roles = ["Admin", "Manager", "Coordinator", "Normal", "HR"];

  List<Map> sections0 = [
    {"name": "Time Tracker", "isChecked": true},
    {"name": "Reports", "isChecked": true},
    {"name": "Home", "isChecked": true},
    {"name": "Settings", "isChecked": true},
  ];

  List<Map> sections1 = [
    {"name": "Time Tracker", "isChecked": true},
    {"name": "Reports", "isChecked": true},
    {"name": "Home", "isChecked": true},
    {"name": "Settings", "isChecked": false},
  ];

  List<Map> sections2 = [
    {"name": "Time Tracker", "isChecked": false},
    {"name": "Reports", "isChecked": false},
    {"name": "Home", "isChecked": false},
    {"name": "Settings", "isChecked": false},
  ];

  List<Map> sections3 = [
    {"name": "Time Tracker", "isChecked": true},
    {"name": "Reports", "isChecked": false},
    {"name": "SocialMedia", "isChecked": true},
    {"name": "Settings", "isChecked": false},
  ];

  List<Map> sections4 = [
    {"name": "Time Tracker", "isChecked": true},
    {"name": "Reports", "isChecked": false},
    {"name": "SocialMedia", "isChecked": true},
    {"name": "Settings", "isChecked": false},
  ];

  TextEditingController searchMembers = TextEditingController();
  TextEditingController addMembers = TextEditingController();

  List searchListMembers = [];
  int? _currentSortColumnT;
  bool _isAscending = true;

  List teamTB = [
    {
      "NAME": "Time Tracker",
      "EMAIL": "miloszewski.marcin@wp.pl",
      "ROLE": "Admin",
    },
    {
      "NAME": "Reports",
      "EMAIL": "comedy.adres@widelab.co",
      "ROLE": "Admin",
    },
    {
      "NAME": "Home",
      "EMAIL": "mateusz.kapica@widelab.co",
      "ROLE": "Admin",
    },
    {
      "NAME": "Settings",
      "EMAIL": "",
      "ROLE": "Admin",
    },
  ];

  void _showAddMemberDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: const Text('Material Dialog'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: const Text('Close')),
              TextButton(
                onPressed: () {
                  _dismissDialog();
                },
                child: const Text('HelloWorld!'),
              )
            ],
          );
        });
  }

  _dismissDialog() {
    Navigator.pop(context);
  }


  DataTable _createTeamDataTableHeader() {
    return
      DataTable(
        sortColumnIndex: _currentSortColumnT,
        sortAscending: _isAscending,
        columnSpacing: 124.0,
        columns: _createTeamColumns(),
        rows: const []);
  }


  DataTable _createTeamDataTable() {
    return DataTable(
        headingRowHeight: 0,
        columns: _createTeamColumns(),
        rows: _createTeamRows()!);
  }

  List<DataColumn> _createTeamColumns() {
    return [
      DataColumn(
          onSort: (int columnIndex, bool ascending) {
            int compareString(bool ascending, String value1, String value2) =>
                ascending ? value1.compareTo(value2) : value2.compareTo(value1);
            if (columnIndex == 0) {
              teamTB.sort((teamA, teamB) =>
                  compareString(ascending, teamA["NAME"], teamB["NAME"]));
            }
            setState(() {
              _currentSortColumnT = columnIndex;
              _isAscending = ascending;
            });
          },
          label: Text(
            'NAME',
            style: TextStyle(color: Colors.grey[300]),
          )),
      const DataColumn(label: Text("")),
      DataColumn(
          label: Text('EMAIL', style: TextStyle(color: Colors.grey[300]))),
      const DataColumn(label: Text("")),
      const DataColumn(label: Text("")),
      const DataColumn(label: Text("")),
      DataColumn(
          onSort: (int columnIndex, bool ascending) {
            int compareString(bool ascending, String value1, String value2) =>
                ascending ? value1.compareTo(value2) : value2.compareTo(value1);
            if (columnIndex == 5) {
              teamTB.sort((teamA, teamB) =>
                  compareString(ascending, teamA["ROLE"], teamB["ROLE"]));
            }
            setState(() {
              _currentSortColumnT = columnIndex;
              _isAscending = ascending;
            });
          },
          label: Text('ROLE', style: TextStyle(color: Colors.grey[300]))),
      const DataColumn(label: Text("")),
      const DataColumn(label: Text("")),
      const DataColumn(label: Text("")),
      DataColumn(
          label: Text('ACTION', style: TextStyle(color: Colors.grey[300]))),
    ];
  }

  List<DataRow>? _createTeamRows() {
    if (searchMembers.text.isNotEmpty) {
      return searchListMembers
          .map(
            (cl) => DataRow(
              cells: [
                DataCell(Text(cl['NAME'],
                    style: TextStyle(
                        color: Colors.orange[500],
                        fontSize: 17,
                        fontWeight: FontWeight.bold))),
                const DataCell(Text("")),
                DataCell(Text(cl['EMAIL'],
                    style: TextStyle(
                        color: Colors.teal[300],
                        fontSize: 17,
                        fontWeight: FontWeight.bold))),
                const DataCell(Text("")),
                const DataCell(Text("")),
                const DataCell(Text("")),
                DataCell(
                  DropdownButton<String>(
                    iconSize: 0.0,
                    icon: const SizedBox.shrink(),
                    dropdownColor: Colors.black,
                    value: cl["ROLE"],
                    items: roles
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item,
                                  style: TextStyle(
                                      color: Colors.blue[300],
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                            ))
                        .toList(),
                    onChanged: (String? item) => setState(() {
                      cl["ROLE"] = item!;
                    }),
                  ),
                ),
                const DataCell(Text("")),
                const DataCell(Text("")),
                const DataCell(Text("")),
                DataCell(
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
                        color: Colors.grey[500],
                        size: 23,
                      ),
                      color: Colors.black,
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem(
                          onTap: () {
                            setState(() {
                              teamTB.remove(cl);
                            });
                          },
                          child: Text(
                            "Archive",
                            style: TextStyle(
                                color: Colors.grey[300], fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
          .toList();
    } else {
      return teamTB
          .map(
            (cl) => DataRow(
              cells: [
                DataCell(Text(cl['NAME'],
                    style: TextStyle(
                        color: Colors.orange[500],
                        fontSize: 17,
                        fontWeight: FontWeight.bold))),
                const DataCell(Text("")),
                DataCell(Text(cl['EMAIL'],
                    style: TextStyle(
                        color: Colors.teal[300],
                        fontSize: 17,
                        fontWeight: FontWeight.bold))),
                const DataCell(Text("")),
                const DataCell(Text("")),
                const DataCell(Text("")),
                DataCell(
                  DropdownButton<String>(
                    iconSize: 0.0,
                    icon: const SizedBox.shrink(),
                    dropdownColor: Colors.black,
                    value: cl["ROLE"],
                    items: roles
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item,
                                  style: TextStyle(
                                      color: Colors.blue[300],
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                            ))
                        .toList(),
                    onChanged: (String? item) => setState(() {
                      cl["ROLE"] = item!;
                    }),
                  ),
                ),
                const DataCell(Text("")),
                const DataCell(Text("")),
                const DataCell(Text("")),
                DataCell(
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
                        color: Colors.grey[500],
                        size: 23,
                      ),
                      color: Colors.black,
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem(
                          onTap: () {
                            setState(() {
                              teamTB.remove(cl);
                            });
                          },
                          child: Text(
                            "Archive",
                            style: TextStyle(
                                color: Colors.grey[300], fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFF263238),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child:
            Container(
              color: const Color(0xFF212121),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "Team",
                          style:
                              TextStyle(color: Colors.pink[400]!, fontSize: 26),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child:
                      Container(
                        height: 40,
                        width: 300,
                        margin: const EdgeInsets.only(left: 15),
                        child: TextFormField(
                          controller: searchMembers,
                          style: const TextStyle(color: Colors.white),
                          onChanged: (value) {
                            setState(() {
                              searchListMembers = teamTB
                                  .where((item) =>
                                      item['NAME'].toLowerCase().contains(
                                          searchMembers.text.toLowerCase()) ||
                                      item['EMAIL'].toLowerCase().contains(
                                          searchMembers.text.toLowerCase()))
                                  .toList();
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Search by name',
                            hintStyle: TextStyle(
                                color: Colors.grey[600], fontSize: 15),
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
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Container(
                          height: 40,
                          width: 170,
                          margin: const EdgeInsets.only(right: 15),
                          child: ElevatedButton(
                            onPressed: () {
                              _showAddMemberDialog();
                            },
                            child: const Text(
                              "ADD NEW MEMBER",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Flexible(child:
                  SizedBox(
                    height: 35,
                  ),
                  ),
                  Expanded(child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(child:
                    _createTeamDataTableHeader(),
                      ),
                  ],),
                  ),
                // SingleChildScrollView(
                  Expanded(
                    flex: 5,
                    child:
                  ListView(
                    shrinkWrap: true,
                    children: [
                      _createTeamDataTable()

                        ],
                  ),
                  ),
              ],
            ),
            ),
            ),


        const SizedBox(
               height: 10,
        ),

          Expanded(
            flex: 2,
            child:
            Container(
              color: const Color(0xFF212121),
              child:
               //   SingleChildScrollView(child:
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                 SingleChildScrollView(child:
                 Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child:
                      Center(
                        child: Text(
                          "Roles",
                          style:
                              TextStyle(color: Colors.pink[400]!, fontSize: 26),
                        ),
                      ),
                      ),
                    ],
                  ),
                 ),
                  const SizedBox(
                    height: 25,
                  ),

              Expanded(
                flex: 2,
                child:
                SingleChildScrollView(
                  child:
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 Expanded(
                   flex:2,
                   child:
                  Column(
                    children: [
                    SingleChildScrollView(child:
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      child:
                      Text(
                        roles[0],
                        style: TextStyle(
                            color: Colors.cyan[600],
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      width: 220,
                      color: Colors.blueGrey[900],
                      child:
                      SingleChildScrollView(child:
                      ListView(
                        shrinkWrap: true,
                        children: sections0
                            .map(
                              (element2) => Padding(
                            padding: const EdgeInsets.only(
                                left: 5, right: 5),
                            child: Theme(
                              data: ThemeData(
                                unselectedWidgetColor:
                                Colors.white54,
                              ),
                              child:
                              SizedBox(
                                width: 220,
                                child:
                              CheckboxListTile(
                                  activeColor: Colors.black,
                                  checkColor: Colors.blue,
                                  enabled: false,
                                  title:
                                  Text(
                                    element2["name"],
                                    style: const TextStyle(
                                        color: Colors.white54,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),

                                  value: element2["isChecked"],
                                  onChanged: (bool? val) {
                                    setState(() {
                                      element2["isChecked"] = val;
                                    });
                                  }),),
                            ),
                          ),
                        )
                            .toList(),
                       ),
                     ),
                      ),
                  ],),
                  ),

                  const Flexible(child: SizedBox(width: 20,),),

                  Expanded(
                    flex: 2,
                    child:
                  Column(children: [
                  SingleChildScrollView(child:
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      roles[1],
                      style: TextStyle(
                          color: Colors.cyan[600],
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ),
                  const SizedBox(height: 20,),
                    SingleChildScrollView(child:
                  Container(
                    width: 220,
                    color: Colors.blueGrey[900],
                    child:
                    ListView(
                      shrinkWrap: true,
                      children: sections1
                          .map(
                            (element2) => Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5),
                          child: Theme(
                            data: ThemeData(
                              unselectedWidgetColor:
                              Colors.white54,
                            ),
                            child:
                            CheckboxListTile(
                                activeColor: Colors.black,
                                checkColor: Colors.blue,
                                title: Text(
                                  element2["name"],
                                  style: const TextStyle(
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                ),
                                value: element2["isChecked"],
                                onChanged: (bool? val) {
                                  setState(() {
                                    element2["isChecked"] = val;
                                  });
                                }),
                          ),
                        ),
                      )
                          .toList(),
                    ),
                    ),
                  ),
                  ],),
                  ),
                  const Flexible(child: SizedBox(width: 20,),),
                  Expanded(
                    flex: 2,
                    child:
                  Column(children: [
                  SingleChildScrollView(child:
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      roles[2],
                      style: TextStyle(
                          color: Colors.cyan[600],
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ),
                  const SizedBox(height: 20,),
                SingleChildScrollView(child:
                  Container(
                    width: 220,
                    color: Colors.blueGrey[900],
                    child:
                    ListView(
                      shrinkWrap: true,
                      children: sections2
                          .map(
                            (element2) => Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5),
                          child: Theme(
                            data: ThemeData(
                              unselectedWidgetColor:
                              Colors.white54,
                            ),
                            child:
                            CheckboxListTile(
                                activeColor: Colors.black,
                                checkColor: Colors.blue,
                                title: Text(
                                  element2["name"],
                                  style: const TextStyle(
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                ),
                                value: element2["isChecked"],
                                onChanged: (bool? val) {
                                  setState(() {
                                    element2["isChecked"] = val;
                                  });
                                }),
                          ),
                        ),
                      )
                          .toList(),
                    ),
                    ),

                   ),
                  ],),
                  ),
                  const Flexible(child: SizedBox(width: 20,),),
                  Expanded(
                    flex:2,
                    child:
                  Column(children: [
                  SingleChildScrollView(child:
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      roles[3],
                      style: TextStyle(
                          color: Colors.cyan[600],
                          fontSize: 19,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  ),
                  const SizedBox(height: 20,),
                    SingleChildScrollView(child:
                  Container(
                    width: 220,
                    color: Colors.blueGrey[900],
                    child:
                    ListView(
                      shrinkWrap: true,
                      children: sections3
                          .map(
                            (element2) => Padding(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5),
                          child: Theme(
                            data: ThemeData(
                              unselectedWidgetColor:
                              Colors.white54,
                            ),
                            child:
                            CheckboxListTile(
                                activeColor: Colors.black,
                                checkColor: Colors.blue,
                                title: Text(
                                  element2["name"],
                                  style: const TextStyle(
                                      color: Colors.white54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                ),
                                value: element2["isChecked"],
                                onChanged: (bool? val) {
                                  setState(() {
                                    element2["isChecked"] = val;
                                  });
                                }),
                          ),
                        ),
                      ).toList(),
                    ),
                    ),
                  ),
                  ],),
                  ),
                  const Flexible(child: SizedBox(width: 20,),),

                  Expanded(
                    flex: 2,
                    child:
                  Column(
                    children: [
                  SingleChildScrollView(child:
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        roles[4],
                        style: TextStyle(
                            color: Colors.cyan[600],
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                   ),
                    const SizedBox(height: 20,),
                    SingleChildScrollView(child:
                    Container(
                      width: 220,
                      color: Colors.blueGrey[900],
                      child:
                      ListView(
                        shrinkWrap: true,
                        children: sections4
                            .map(
                              (element2) => Padding(
                            padding: const EdgeInsets.only(
                                left: 5, right: 5),
                            child:
                            Theme(
                              data: ThemeData(
                                unselectedWidgetColor:
                                Colors.white54,
                              ),

                              child:
                              CheckboxListTile(
                                  activeColor: Colors.black,
                                  checkColor: Colors.blue,
                                  title:
                                  Text(
                                    element2["name"],
                                    style: const TextStyle(
                                        color: Colors.white54,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),

                                  value: element2["isChecked"],
                                  onChanged: (bool? val) {
                                    setState(() {
                                      element2["isChecked"] = val;
                                    });
                                  },),

                            ),
                          ),
                        ).toList(),
                      ),
                      ),
                   ),
                  ],),
                  ),




       /*
                  Expanded(child:
                  Column(
                    children: [
                      SingleChildScrollView(child:
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          roles[4],
                          style: TextStyle(
                              color: Colors.cyan[600],
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      ),
                      const SizedBox(height: 20,),
                      SingleChildScrollView(child:
                      Container(
                        width: 220,
                        color: Colors.blueGrey[900],
                        child:
                        SingleChildScrollView(child:
                        ListView(
                          shrinkWrap: true,
                          children: sections4
                              .map(
                                (element2) => Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5),
                              child:
                              SingleChildScrollView(child:
                              Theme(
                                data: ThemeData(
                                  unselectedWidgetColor:
                                  Colors.white54,
                                ),

                                child:
                                SingleChildScrollView(child:
                                CheckboxListTile(
                                  activeColor: Colors.black,
                                  checkColor: Colors.blue,
                                  title:
                                  Text(
                                    element2["name"],
                                    style: const TextStyle(
                                        color: Colors.white54,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),

                                  value: element2["isChecked"],
                                  onChanged: (bool? val) {
                                    setState(() {
                                      element2["isChecked"] = val;
                                    });
                                  },),

                                ),

                              ),
                              ),
                            ),
                          ).toList(),
                        ),
                        ),
                      ),
                      ),
                    ],),
                  ),
*/
                ],
                  ),
                ),
              ),

                ],
              ),

            ),
          ),
      ],
    ),
      ),

    );

  }
}

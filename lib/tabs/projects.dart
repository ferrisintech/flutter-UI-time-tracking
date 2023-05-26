

import 'package:flutter/material.dart';

class ProjectsTab extends StatefulWidget {
  const ProjectsTab({super.key});

  @override
  State<ProjectsTab> createState() => _ProjectsTabState();
}

class _ProjectsTabState extends State<ProjectsTab> {

  TextEditingController searchClients = TextEditingController();
  TextEditingController searchProjects = TextEditingController();

  TextEditingController addClients = TextEditingController();
  TextEditingController addProjects = TextEditingController();


  List searchListClients = [];
  List searchListProjects = [];

  int? _currentSortColumnP;
  int? _currentSortColumnC;

  bool _isAscending = true;

  _dismissDialog() {
    Navigator.pop(context);
  }

  List projectsTB = [
    {"NAME": "Time Tracker", "CLIENT": "", "TRACKED": "123"},
    {"NAME": "Reports", "CLIENT": "", "TRACKED": "234"},
    {"NAME": "Home", "CLIENT": "roman", "TRACKED": "222"},
    {"NAME": "Settings", "CLIENT": "conan", "TRACKED": ""},
  ];

  List clientsTB = [
    {"NAME": "Manhatan"},
    {"NAME": "40seas"},
    {"NAME": "roman1"},
    {"NAME": "libia"},
  ];

  void _showAddClientDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: const Text('Add new client'),
            actions: <Widget>[
              TextFormField(
                controller: addClients,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Provide client name',
                  hintStyle: TextStyle(
                      color: Colors.grey[600], fontSize: 15),
                  filled: true,
                  contentPadding: const EdgeInsets.only(
                      left: 8.0, bottom: 6.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.grey[700]!),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Colors.black26),
                  ),
                ),
              ),

              const SizedBox(height: 20,),

              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: const Text('Close')),
              ElevatedButton(
                onPressed: () {
                  if(addClients.text.isNotEmpty){

                    setState(() {
                      clientsTB.add({"NAME":addClients.text});
                    });

                    addClients.clear();
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add'),
              )
            ],
          );
        });
  }


  void _showAddProjectDialog() {
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



  void sortClientTable(int columnIndex,bool ascending){
      int compareString(bool ascending, String value1, String value2)=>
          ascending ? value1.compareTo(value2) : value2.compareTo(value1);
      if(columnIndex==0) {
        clientsTB.sort((clientA, clientB) =>
            compareString(ascending, clientA["NAME"], clientB["NAME"]));
      }
      setState(() {
        _currentSortColumnC = columnIndex;
        _isAscending = ascending;
      });
    }





  DataTable _createClientsDataTableHeader() {
    return DataTable(
        sortColumnIndex: _currentSortColumnC,
        sortAscending: _isAscending,
        columnSpacing: 85.0,
        columns: _createClientsColumns(),
        rows: const []);
  }



  DataTable _createClientsDataTable() {
    return DataTable(
      headingRowHeight: 0,
        columns: _createClientsColumns(),
        rows: _createClientsRows());
  }


  List<DataColumn> _createClientsColumns() {
    return [
      DataColumn(
          onSort: (int columnIndex,bool ascending) {
            int compareString(bool ascending, String value1, String value2)=>
                ascending ? value1.compareTo(value2) : value2.compareTo(value1);
            if(columnIndex==0) {
              clientsTB.sort((clientA, clientB) =>
                  compareString(ascending, clientA["NAME"], clientB["NAME"]));
            }
            setState(() {
              _currentSortColumnC = columnIndex;
              _isAscending = ascending;
            });
          },
          label: Text(
            'NAME',
            style: TextStyle(color: Colors.grey[300]),
          )),
      const DataColumn(label: Text("")),
      const DataColumn(label: Text("")),
      DataColumn(
          label: Text('ACTION', style: TextStyle(color: Colors.grey[300]))),
    ];
  }

  List<DataRow> _createClientsRows() {
    return searchClients.text.isNotEmpty
        ? searchListClients
        .map(
          (cl) => DataRow(
        cells: [
          DataCell(Text(cl['NAME'],
              style: TextStyle(
                  color: Colors.orange[500],
                  fontSize: 17,
                  fontWeight: FontWeight.bold))),
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
                        clientsTB.remove(cl);
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
        .toList()
        : clientsTB
        .map(
          (cl) => DataRow(
        cells: [
          DataCell(Text(cl['NAME'],
              style: TextStyle(
                  color: Colors.orange[500],
                  fontSize: 17,
                  fontWeight: FontWeight.bold))),
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
                        clientsTB.remove(cl);
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

  DataTable _createProjectsDataTableHeader() {
    return DataTable(
      sortColumnIndex: _currentSortColumnP,
      sortAscending: _isAscending,
      columnSpacing: 70.0,
      columns: _createProjectsColumns(),
      rows: const [],
    );
  }



  DataTable _createProjectsDataTable() {
    return DataTable(
      headingRowHeight: 0,
      columns: _createProjectsColumns(),
      rows: _createProjectsRows(),
    );
  }



  List<DataColumn> _createProjectsColumns() {
    return [
      DataColumn(
          onSort: (int columnIndex,bool ascending) {
            int compareString(bool ascending, String value1, String value2)=>
                ascending ? value1.compareTo(value2) : value2.compareTo(value1);
            if(columnIndex==0) {
              projectsTB.sort((projectA, projectB) =>
                  compareString(ascending, projectA["NAME"], projectB["NAME"]));
            }else if(columnIndex==1) {
              projectsTB.sort((projectA, projectB) =>
                  compareString(ascending, projectA["CLIENT"], projectB["CLIENT"]));
            }else if(columnIndex==2) {
              projectsTB.sort((projectA, projectB) =>
                  compareString(ascending, projectA["TRACKED"], projectB["TRACKED"]));
            }
            setState(() {
              _currentSortColumnP = columnIndex;
              _isAscending = ascending;
            });
          },
          label: Text(
            'NAME',
            style: TextStyle(color: Colors.grey[300]),
          )),
      const DataColumn(label: Text("")),
      const DataColumn(label: Text("")),
      const DataColumn(label: Text("")),
      DataColumn(
          onSort: (int columnIndex,bool ascending) {
            int compareString(bool ascending, String value1, String value2)=>
                ascending ? value1.compareTo(value2) : value2.compareTo(value1);

            if(columnIndex==2) {
              projectsTB.sort((projectA, projectB) =>
                  compareString(ascending, projectA["CLIENT"], projectB["CLIENT"]));
            }else if(columnIndex==1) {
              projectsTB.sort((projectA, projectB) =>
                  compareString(ascending, projectA["CLIENT"], projectB["CLIENT"]));
            }else if(columnIndex==2) {
              projectsTB.sort((projectA, projectB) =>
                  compareString(ascending, projectA["TRACKED"], projectB["TRACKED"]));
            }
            setState(() {
              _currentSortColumnP = columnIndex;
              _isAscending = ascending;
            });
          },
          label: Text('CLIENT', style: TextStyle(color: Colors.grey[300]))),
      const DataColumn(label: Text("")),
      const DataColumn(label: Text("")),
      const DataColumn(label: Text("")),
      DataColumn(
          onSort: (int columnIndex,bool ascending) {
            int compareString(bool ascending, String value1, String value2)=>
                ascending ? value1.compareTo(value2) : value2.compareTo(value1);
            if(columnIndex==6) {
              projectsTB.sort((projectA, projectB) =>
                  compareString(ascending, projectA["TRACKED"], projectB["TRACKED"]));
            }
            setState(() {
              _currentSortColumnP = columnIndex;
              _isAscending = ascending;
            });
          },
          label: Text('TRACKED', style: TextStyle(color: Colors.grey[300]))),
      const DataColumn(label: Text("")),
      const DataColumn(label: Text("")),
      DataColumn(
          label: Text('ACTION', style: TextStyle(color: Colors.grey[300]))),
    ];
  }


  List<DataRow> _createProjectsRows() {
    return searchProjects.text.isNotEmpty
        ? searchListProjects
        .map(
          (cl) => DataRow(
        cells: [
          DataCell(Text(cl['NAME'],
              style: TextStyle(
                  color: Colors.orange[500],
                  fontSize: 17,
                  fontWeight: FontWeight.bold))),
          const DataCell(Text("")),
          const DataCell(Text("")),
          const DataCell(Text("")),
          DataCell(Text(cl['CLIENT'],
              style: TextStyle(
                  color: Colors.teal[300],
                  fontSize: 17,
                  fontWeight: FontWeight.bold))),
          const DataCell(Text("")),
          const DataCell(Text("")),
          const DataCell(Text("")),
          DataCell(Text(cl['TRACKED'],
              style: TextStyle(
                  color: Colors.pink[300],
                  fontSize: 17,
                  fontWeight: FontWeight.bold))),
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
                        projectsTB.remove(cl);
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
        .toList()
        : projectsTB
        .map(
          (cl) => DataRow(
        cells: [
          DataCell(Text(cl['NAME'],
              style: TextStyle(
                  color: Colors.orange[500],
                  fontSize: 17,
                  fontWeight: FontWeight.bold))),
          const DataCell(Text("")),
          const DataCell(Text("")),
          const DataCell(Text("")),
          DataCell(Text(cl['CLIENT'],
              style: TextStyle(
                  color: Colors.teal[300],
                  fontSize: 17,
                  fontWeight: FontWeight.bold))),
          const DataCell(Text("")),
          const DataCell(Text("")),
          const DataCell(Text("")),
          DataCell(Text(cl['TRACKED'],
              style: TextStyle(
                  color: Colors.pink[300],
                  fontSize: 17,
                  fontWeight: FontWeight.bold))),
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
                        projectsTB.remove(cl);
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







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFF263238),
        child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                      color: const Color(0xFF212121),
                      child: Column(
                        children: [
                          Flexible(child:
                          Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Text(
                                  "Projects",
                                  style: TextStyle(
                                      color: Colors.pink[400]!, fontSize: 26),
                                ),
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
                                      controller: searchProjects,
                                      style: const TextStyle(color: Colors.white),
                                      onChanged: (value) {
                                        setState(() {
                                          searchListProjects = projectsTB
                                              .where((item) =>
                                          item['NAME'].toLowerCase().contains(
                                              searchProjects.text
                                                  .toLowerCase()) ||
                                              item['CLIENT']
                                                  .toLowerCase()
                                                  .contains(searchProjects.text
                                                  .toLowerCase()))
                                              .toList();
                                        });
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Find by name',
                                        hintStyle: TextStyle(
                                            color: Colors.grey[600], fontSize: 15),
                                        filled: true,
                                        contentPadding: const EdgeInsets.only(
                                            left: 14.0, bottom: 6.0, top: 8.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.grey[700]!),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.black26),
                                        ),
                                      ),
                                    ),
                                  ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(child:
                                  Container(
                                    height: 40,
                                    width: 180,
                                    margin: const EdgeInsets.only(right: 15),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        _showAddProjectDialog();
                                      },
                                      child: const Text(
                                        "ADD NEW PROJECT",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
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
                                Expanded(child:
                                  _createProjectsDataTableHeader(),
                                ),
                              ],),

                              Expanded(
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: [
                                      _createProjectsDataTable()],
                                  ),
                              ),
                            ],
                          ),
                          ),
                        ],
                      ),
                    ),
                    ),

                const SizedBox(width: 10,),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: const Color(0xFF212121),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                "Clients",
                                style: TextStyle(
                                    color: Colors.pink[400]!, fontSize: 26),
                              ),
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
                                  width: 180,
                                  margin: const EdgeInsets.only(left: 15),
                                  child: TextFormField(
                                    controller: searchClients,
                                    style: const TextStyle(color: Colors.white),
                                    onChanged: (value) {
                                      setState(() {
                                        searchListClients = clientsTB
                                            .where((item) => item['NAME']
                                            .toLowerCase()
                                            .contains(searchClients.text
                                            .toLowerCase()))
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
                                        borderSide:
                                        BorderSide(color: Colors.grey[700]!),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.black26),
                                      ),
                                    ),
                                  ),
                                ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(child:
                                  Container(
                                    height: 40,
                                    width: 170,
                                    margin: const EdgeInsets.only(right: 15),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        _showAddClientDialog();
                                      },
                                      child: const Text(
                                        "ADD NEW CLIENT",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
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
                                Expanded(child:
                              _createClientsDataTableHeader(),
                                ),
                            ],),
                            Expanded(
                            //  child: SizedBox(
                               // width: 380,
                                child: ListView(
                                      shrinkWrap: true,
                                      children: [
                                        _createClientsDataTable(),
                                      ],
                                      // children: [_createClientsDataTable()],
                                    ),
                                    ),
                              //    ],
                              //  ),

                            //  ),
                          //  ),
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
import 'package:flutter/material.dart';
import 'package:giv_test/models/data/menu.dart';
import 'package:giv_test/models/data/menu_dua.dart';
import 'package:giv_test/models/data/table_data.dart';
import 'package:giv_test/presenter/home/component/feature_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var idx = 0;
  var tableIdx = 1;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Menu> menuSatu = [
    Menu(image: 'icons_folder', title: 'Documents'),
    Menu(image: 'icons_template', title: 'Templates'),
    Menu(title: 'Scan Documents', image: 'icons_camera')
  ];

  final List<MenuDua> menuDua = [
    MenuDua(
        title: 'Workflow List',
        image: 'icons_flow-chart',
        detail: 'you have 1 submission left to submit',
        icon: 'icon_menu_satu'),
    MenuDua(
        title: 'Attendance',
        image: 'icons_alarm-clock',
        detail: 'Check attendance and clock in - out ',
        icon: 'icon_menu_satu')
  ];

  final List<Menu> menuTiga = [
    Menu(image: 'icons_clock', title: 'Clocking Reports'),
    Menu(image: 'icons_about', title: 'Incident Reports'),
    Menu(title: 'SOS Reports', image: 'icons_sos')
  ];

  final List<MenuDua> menuEmpat = [
    MenuDua(
        title: 'Reports History',
        image: 'icons_fine-print',
        detail: '40 Saved and Submitted Reports',
        icon: 'icon_menu_dua'),
    MenuDua(
        title: 'Personnel Managements',
        image: 'icons_conference-call',
        detail: '32 Active Personnel',
        icon: 'icon_menu_dua')
  ];

  final List<TableData> tableData = [
    TableData(name: 'Medical Leave Form', type: 'Template', status: 'Pending'),
    TableData(name: 'Approval Flow', type: 'Workflow', status: 'Draft'),
    TableData(name: 'Incident Form', type: 'Form (Docs)', status: 'Assigned'),
    TableData(name: 'Approval Flow', type: 'Workflow', status: 'Draft'),
    TableData(name: 'Incident Form', type: 'Form (Docs)', status: 'Assigned'),
  ];

  ClipRRect _getBtmNavBar() {
    return ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomAppBar(
          child: Container(
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Column(
                  children: [
                    IconButton(
                      iconSize: 30.0,
                      icon: idx == 0
                          ? Image.asset('assets/images/icon_home_selected.png')
                          : Image.asset('assets/images/icon_home.png'),
                      onPressed: () {
                        setState(() {
                          idx = 0;
                        });
                      },
                    ),
                    Text('Home'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      iconSize: 30.0,
                      icon: idx == 1
                          ? Image.asset(
                              'assets/images/icon_folder_selected.png')
                          : Image.asset('assets/images/icon_folder.png'),
                      onPressed: () {
                        setState(() {
                          idx = 1;
                        });
                      },
                    ),
                    Text('Docs'),
                  ],
                ),
                Column(
                  children: [
                    MaterialButton(
                      onPressed: () {},
                    ),
                    Text('Scan'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      iconSize: 30.0,
                      icon: idx == 3
                          ? Image.asset(
                              'assets/images/icon_setting_selected.png')
                          : Image.asset('assets/images/icon_setting.png'),
                      onPressed: () {
                        setState(() {
                          idx = 3;
                        });
                      },
                    ),
                    Text('Settings'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      iconSize: 30.0,
                      icon: idx == 4
                          ? Image.asset(
                              'assets/images/icon_profile_selected.png')
                          : Image.asset('assets/images/icon_profile.png'),
                      onPressed: () {
                        setState(() {
                          idx = 4;
                        });
                      },
                    ),
                    Text('Profile'),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color(0XFFE5E5E5),
        endDrawer: Drawer(
          child: DrawerComponent(),
        ),
        bottomNavigationBar: _getBtmNavBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Container(
            width: 64,
            height: 64,
            child: Image.asset("assets/images/icon_scan.png"),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0XFFFBEFA4), Color(0XFFF6DA2B)])),
          ),
          onPressed: () {},
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 34),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage("assets/images/header_home_background.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.275,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(scaffoldKey: _scaffoldKey),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(top: 34),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Hello, welcome',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                  Text(
                                    'Bruno Neptune',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Text(
                                    'PT Del Sol Valley Company',
                                    style: Theme.of(context).textTheme.caption,
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                                child: Image.asset(
                                    'assets/images/header_image.png'))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 34.0),
                child: Theme(
                  data: Theme.of(context).copyWith(
                      // override textfield's icon color when selected
                      primaryColor: Colors.yellow,
                      accentColor: Colors.yellow),
                  child: TextFormField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.yellow),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          hintText: 'Search everything here..',
                          hintStyle: Theme.of(context).textTheme.bodyText2,
                          prefixIcon: Icon(Icons.search))),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              FeatureHome(menu: menuSatu, menuDua: menuDua),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 34.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Feature',
                        style: Theme.of(context)
                            .textTheme
                            .copyWith(
                                subtitle2:
                                    TextStyle(fontWeight: FontWeight.w700))
                            .subtitle2),
                    Container(
                      width: 32,
                      height: 2,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              FeatureHome(menu: menuTiga, menuDua: menuEmpat),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 34.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Latest Update',
                            style: Theme.of(context)
                                .textTheme
                                .copyWith(
                                    subtitle2:
                                        TextStyle(fontWeight: FontWeight.w700))
                                .subtitle2),
                        Container(
                          width: 32,
                          height: 2,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (tableIdx != 1) {
                                tableIdx--;
                              }
                            });
                          },
                          child: SizedBox(
                            height: 24,
                            width: 24,
                            child: Container(
                              decoration: new BoxDecoration(
                                  color: Color(0XCCFFF198),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0))),
                              child: Icon(
                                Icons.chevron_left_rounded,
                                color: Color(0XFFE5A94A),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: SizedBox(
                            height: 24,
                            width: 24,
                            child: Container(
                              decoration: new BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0))),
                              child: Center(
                                child: Text(
                                  tableIdx.toString(),
                                  style: Theme.of(context).textTheme.caption,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              tableIdx++;
                            });
                          },
                          child: SizedBox(
                            height: 24,
                            width: 24,
                            child: Container(
                              decoration: new BoxDecoration(
                                  color: Color(0XCCFFF198),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.0))),
                              child: Icon(
                                Icons.chevron_right_rounded,
                                color: Color(0XFFE5A94A),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              DataTableComponent(tableData: tableData),
              SizedBox(
                height: 56,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/photo_profile.png',
            height: 20,
          ),
          Image.asset(
            'assets/images/adept_logo.png',
            height: 20,
          ),
          GestureDetector(
            onTap: () => _scaffoldKey.currentState!.openEndDrawer(),
            child: Image.asset(
              'assets/images/drawer_icon.png',
              height: 20,
            ),
          )
        ],
      ),
    );
  }
}

class DataTableComponent extends StatelessWidget {
  const DataTableComponent({
    Key? key,
    required this.tableData,
  }) : super(key: key);

  final List<TableData> tableData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 34.0),
      child: DataTable(
          columnSpacing: 24,
          columns: [
            DataColumn(
              label: Text(
                'Name',
                style: Theme.of(context)
                    .textTheme
                    .copyWith(bodyText2: TextStyle(fontWeight: FontWeight.w700))
                    .bodyText2,
              ),
            ),
            DataColumn(
                label: Text(
              'Type',
              style: Theme.of(context)
                  .textTheme
                  .copyWith(bodyText2: TextStyle(fontWeight: FontWeight.w700))
                  .bodyText2,
            )),
            DataColumn(
                label: Text(
              'Status',
              style: Theme.of(context)
                  .textTheme
                  .copyWith(bodyText2: TextStyle(fontWeight: FontWeight.w700))
                  .bodyText2,
            )),
            DataColumn(label: Text(''))
          ],
          rows: tableData
              .map((e) => DataRow(cells: [
                    DataCell(Text(e.name,
                        style: Theme.of(context).textTheme.caption)),
                    DataCell(Text(
                      e.type,
                      style: Theme.of(context).textTheme.caption,
                    )),
                    DataCell(Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: new BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0))),
                        child: Text(
                          e.status,
                          style: Theme.of(context).textTheme.caption,
                        ))),
                    DataCell(Icon(Icons.more_vert)),
                  ]))
              .toList()),
    );
  }
}

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close_rounded))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Shortcuts'),
              SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/icons_template.png',
                    height: 32,
                  ),
                  Text('Template')
                ],
              ),
              Divider(),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  decoration: new BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(4.0))),
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Add More Shortcuts'),
                    ],
                  ))
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'assets/images/icon_moon.png',
              width: 128,
            ),
          )
        ],
      ),
    );
  }
}

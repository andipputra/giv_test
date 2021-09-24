import 'package:flutter/material.dart';
import 'package:giv_test/models/data/menu.dart';
import 'package:giv_test/models/data/menu_dua.dart';

class FeatureHome extends StatelessWidget {
  const FeatureHome({Key? key, required this.menu, required this.menuDua})
      : super(key: key);

  final List<Menu> menu;
  final List<MenuDua> menuDua;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 34),
      child: Column(
        children: [
          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, i) => GestureDetector(
                    onTap: () {
                      if (menu[i].title == 'Clocking Reports') {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                            builder: (context) => DraggableScrollableSheet(
                                  maxChildSize: 0.9,
                                  minChildSize: 0.3,
                                  initialChildSize: 0.7,
                                  builder: (context, controller) => Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 24, horizontal: 32),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20))),
                                      child: BottomSheetPage()),
                                ));
                      }
                    },
                    child: Card(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/${menu[i].image}.png',
                              height: 42,
                            ),
                            Text(
                              menu[i].title,
                              style: Theme.of(context).textTheme.caption,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
              itemCount: menu.length),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, i) => Card(
              child: Container(
                height: 86,
                padding: EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/${menuDua[i].image}.png',
                      height: 42,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          menuDua[i].title,
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Text(
                          menuDua[i].detail,
                          style: Theme.of(context)
                              .textTheme
                              .copyWith(
                                  caption: menuDua[i].title == 'Workflow List'
                                      ? TextStyle(
                                          color: Colors.red, fontSize: 12)
                                      : null)
                              .caption,
                        )
                      ],
                    ),
                    Image.asset('assets/images/${menuDua[i].icon}.png')
                  ],
                ),
              ),
            ),
            itemCount: menuDua.length,
          )
        ],
      ),
    );
  }
}

class BottomSheetPage extends StatefulWidget {
  @override
  _BottomSheetPageState createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  Widget circle = new Container(
    width: 8.0,
    height: 8.0,
    decoration: new BoxDecoration(
      color: Colors.yellow,
      shape: BoxShape.circle,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/images/icon_dismiss.png',
                height: 32,
              ),
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/icon_bottom_sheet.png',
                  height: 8,
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Clocking Reports',
                  style: Theme.of(context)
                      .textTheme
                      .copyWith(
                          bodyText1: TextStyle(fontWeight: FontWeight.w700))
                      .bodyText1,
                )
              ],
            ),
            Image.asset(
              'assets/images/icon_refresh.png',
              height: 32,
            )
          ],
        ),
        SizedBox(
          height: 32,
        ),
        Text("Today's Job List"),
        SizedBox(
          height: 12,
        ),
        Stack(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Image.asset(
                    'assets/images/icon_check.png',
                    height: 32,
                  ),
                )),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              decoration: new BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
              child: Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Table(
                  children: [
                    TableRow(children: [
                      Text(
                        'Jobs Name:',
                        style: Theme.of(context)
                            .textTheme
                            .copyWith(
                                caption: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700))
                            .caption,
                      ),
                      Text(
                        'Block A Clocking Route',
                        style: Theme.of(context)
                            .textTheme
                            .copyWith(
                                caption: TextStyle(
                                    color: Colors.black, fontSize: 12))
                            .caption,
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Client :',
                          style: Theme.of(context)
                              .textTheme
                              .copyWith(
                                  caption: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700))
                              .caption,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Del Sol Valley',
                          style: Theme.of(context)
                              .textTheme
                              .copyWith(
                                  caption: TextStyle(
                                      color: Colors.black, fontSize: 12))
                              .caption,
                        ),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Area Address :',
                          style: Theme.of(context)
                              .textTheme
                              .copyWith(
                                  caption: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700))
                              .caption,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Chateau Peak street, 22 A',
                          style: Theme.of(context)
                              .textTheme
                              .copyWith(
                                  caption: TextStyle(
                                      color: Colors.black, fontSize: 12))
                              .caption,
                        ),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Clock In Time :',
                          style: Theme.of(context)
                              .textTheme
                              .copyWith(
                                  caption: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700))
                              .caption,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Text(
                              'May 5, 2021',
                              style: Theme.of(context)
                                  .textTheme
                                  .copyWith(
                                      caption: TextStyle(
                                          color: Colors.black, fontSize: 12))
                                  .caption,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: circle,
                            ),
                            Text(
                              '09:22:12',
                              style: Theme.of(context)
                                  .textTheme
                                  .copyWith(
                                      caption: TextStyle(
                                          color: Colors.black, fontSize: 12))
                                  .caption,
                            ),
                          ],
                        ),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Clock Out Time :',
                          style: Theme.of(context)
                              .textTheme
                              .copyWith(
                                  caption: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700))
                              .caption,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Text(
                              'May 5, 2021',
                              style: Theme.of(context)
                                  .textTheme
                                  .copyWith(
                                      caption: TextStyle(
                                          color: Colors.black, fontSize: 12))
                                  .caption,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: circle,
                            ),
                            Text(
                              '11:45:03',
                              style: Theme.of(context)
                                  .textTheme
                                  .copyWith(
                                      caption: TextStyle(
                                          color: Colors.black, fontSize: 12))
                                  .caption,
                            ),
                          ],
                        ),
                      )
                    ])
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          decoration: new BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Table(
                  children: [
                    TableRow(children: [
                      Text(
                        'Jobs Name:',
                        style: Theme.of(context)
                            .textTheme
                            .copyWith(
                                caption: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700))
                            .caption,
                      ),
                      Text(
                        'Block A Clocking Route',
                        style: Theme.of(context)
                            .textTheme
                            .copyWith(
                                caption: TextStyle(
                                    color: Colors.black, fontSize: 12))
                            .caption,
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Client :',
                          style: Theme.of(context)
                              .textTheme
                              .copyWith(
                                  caption: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700))
                              .caption,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Del Sol Valley',
                          style: Theme.of(context)
                              .textTheme
                              .copyWith(
                                  caption: TextStyle(
                                      color: Colors.black, fontSize: 12))
                              .caption,
                        ),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Area Address :',
                          style: Theme.of(context)
                              .textTheme
                              .copyWith(
                                  caption: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700))
                              .caption,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Chateau Peak street, 22 A',
                          style: Theme.of(context)
                              .textTheme
                              .copyWith(
                                  caption: TextStyle(
                                      color: Colors.black, fontSize: 12))
                              .caption,
                        ),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Clock In Time :',
                          style: Theme.of(context)
                              .textTheme
                              .copyWith(
                                  caption: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700))
                              .caption,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Text(
                              'May 5, 2021',
                              style: Theme.of(context)
                                  .textTheme
                                  .copyWith(
                                      caption: TextStyle(
                                          color: Colors.black, fontSize: 12))
                                  .caption,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: circle,
                            ),
                            Text(
                              '09:22:12',
                              style: Theme.of(context)
                                  .textTheme
                                  .copyWith(
                                      caption: TextStyle(
                                          color: Colors.black, fontSize: 12))
                                  .caption,
                            ),
                          ],
                        ),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Clock Out Time :',
                          style: Theme.of(context)
                              .textTheme
                              .copyWith(
                                  caption: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700))
                              .caption,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Text(
                              'May 5, 2021',
                              style: Theme.of(context)
                                  .textTheme
                                  .copyWith(
                                      caption: TextStyle(
                                          color: Colors.black, fontSize: 12))
                                  .caption,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: circle,
                            ),
                            Text(
                              '11:45:03',
                              style: Theme.of(context)
                                  .textTheme
                                  .copyWith(
                                      caption: TextStyle(
                                          color: Colors.black, fontSize: 12))
                                  .caption,
                            ),
                          ],
                        ),
                      )
                    ])
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        decoration: BoxDecoration(
                            // gradient: LinearGradient(
                            //   begin: Alignment.topCenter,
                            //   end: Alignment.bottomCenter,
                            //   colors: <Color>[
                            //     Color(0XFF898B96),
                            //     Color(0XFF383838)
                            //   ],
                            // ),
                            border: Border.all(color: Colors.yellow),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        child: Text('Report Problem')),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                Color(0XFFFBEFA4),
                                Color(0XFFF6DA2B)
                              ],
                            ),
                            // border: Border.all(color: Colors.yellow),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        child: Text('Mark as Complete')),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 50),
          child: Text(
            "That’s it for today, thank you.",
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

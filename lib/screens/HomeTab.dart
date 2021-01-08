import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_gator/screens/ProgramDetails.dart';
import 'package:student_gator/utils/Colors.dart';
import 'package:student_gator/utils/Styles.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  TextEditingController _searchController = TextEditingController();

  RangeValues _currentRangeValues = const RangeValues(40, 80);

  List<Map<String, dynamic>> _countryCheckedValue = [
    {"Label": "All", "Selected": true},
    {"Label": "France", "Selected": false},
    {"Label": "UK", "Selected": false}
  ];

  List<Map<String, dynamic>> _programCheckedValue = [
    {"Label": "All", "Selected": true},
    {"Label": "Bachelor", "Selected": false},
    {"Label": "Master", "Selected": false},
    {"Label": "MBA", "Selected": false},
    {"Label": "PHD", "Selected": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(17.0, 0.0, 9.0, 0.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 64.0,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/images/svg/full-moon.svg",
                  width: 35.0,
                  height: 33.0,
                ),
                SizedBox(
                  width: 9.0,
                ),
                Column(
                  children: [
                    Text("Good Evening Ali"),
                    Text("Welcome Back"),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Container(
                  height: 42.0,
                  width: 286.0,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x29000000),
                          offset: Offset(0, 0),
                          blurRadius: 6,
                          spreadRadius: 0)
                    ],
                  ),
                  child: TextField(
                    onChanged: (value) {},
                    controller: _searchController,
                    style: CustomStyles.searchBarStyle,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      suffixIcon: IconButton(
                          icon: Icon(Icons.search), onPressed: () {}),
                      hintText: "Search By Program Name",
                    ),
                  ),
                ),
                Container(
                  width: 42.0,
                  height: 42.0,
                  margin: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x29000000),
                          offset: Offset(0, 0),
                          blurRadius: 6,
                          spreadRadius: 0)
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(builder:
                                (BuildContext context, StateSetter mystate) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                width: MediaQuery.of(context).size.width,
                                padding:
                                    EdgeInsets.fromLTRB(16.0, 23.0, 16.0, 42.0),
                                decoration: new BoxDecoration(
                                  color: Color(0xffffffff),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0x4d000000),
                                        offset: Offset(0, -0.5),
                                        blurRadius: 20,
                                        spreadRadius: 0)
                                  ],
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Country",
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Color(0xff000000),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: -0.384,
                                        ),
                                      ),
                                      ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount:
                                              _countryCheckedValue.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return CheckboxListTile(
                                              title: Text(
                                                _countryCheckedValue[index]
                                                    ["Label"],
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  color: Color(0xff000000),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                                  letterSpacing: -0.336,
                                                ),
                                              ),
                                              value: _countryCheckedValue[index]
                                                  ["Selected"],
                                              onChanged: (newValue) {
                                                mystate(() {
                                                  _countryCheckedValue[index]
                                                      ["Selected"] = newValue;
                                                });
                                              },
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                            );
                                          }),
                                      Text(
                                        "Program",
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Color(0xff000000),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: -0.384,
                                        ),
                                      ),
                                      ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount:
                                              _programCheckedValue.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return CheckboxListTile(
                                              title: Text(
                                                _programCheckedValue[index]
                                                    ["Label"],
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  color: Color(0xff000000),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                                  letterSpacing: -0.336,
                                                ),
                                              ),
                                              value: _programCheckedValue[index]
                                                  ["Selected"],
                                              onChanged: (newValue) {
                                                mystate(() {
                                                  _programCheckedValue[index]
                                                      ["Selected"] = newValue;
                                                });
                                              },
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                            );
                                          }),
                                      SizedBox(
                                        height: 24.0,
                                      ),
                                      Text(
                                        "Price Range",
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Color(0xff000000),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: -0.384,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      RangeSlider(
                                        values: _currentRangeValues,
                                        min: 0,
                                        max: 1000000,
                                        labels: RangeLabels(
                                          _currentRangeValues.start
                                              .round()
                                              .toString(),
                                          _currentRangeValues.end
                                              .round()
                                              .toString(),
                                        ),
                                        onChanged: (RangeValues values) {
                                          mystate(() {
                                            _currentRangeValues = values;
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        height: 12.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("from"),
                                              SizedBox(
                                                height: 13.0,
                                              ),
                                              Container(
                                                  width: 162,
                                                  height: 30,
                                                  child: TextField(
                                                    enabled: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          _currentRangeValues
                                                              .start
                                                              .round()
                                                              .toString(),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                    ),
                                                  ))
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("to"),
                                              SizedBox(
                                                height: 13.0,
                                              ),
                                              Container(
                                                  width: 162,
                                                  height: 30,
                                                  child: TextField(
                                                    enabled: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          _currentRangeValues
                                                              .end
                                                              .round()
                                                              .toString(),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
                                                      ),
                                                    ),
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MaterialButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            elevation: 2,
                                            child: Text("Cancel"),
                                            minWidth: 108.0,
                                            height: 42.0,
                                          ),
                                          MaterialButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            elevation: 2,
                                            color: CustomColors.primaryColor,
                                            child: Text("Apply Filter"),
                                            minWidth: 216.0,
                                            height: 42.0,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                          });
                    },
                    child: SvgPicture.asset(
                      "assets/images/svg/Filter.svg",
                      width: 23.0,
                      height: 21.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 22.0,
            ),
            Text("Recommended Schools"),
            SizedBox(
              height: 23.0,
            ),
            Container(
              height: 120.0,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 80,
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                      padding: EdgeInsets.fromLTRB(20.0, 19.0, 20.0, 16.0),
                      decoration: new BoxDecoration(
                          color: Color(0xff42c1af).withOpacity(0.05),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          SvgPicture.asset("assets/images/svg/full-moon.svg"),
                          SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            "test text long",
                            style: CustomStyles.gridStyle,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 23.0,
            ),
            Text("Programs"),
            SizedBox(
              height: 21.0,
            ),
            Container(
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){return ProgramDetailsScreen();}));
                      },
                      child: Container(
                        width: 343,
                        height: 196,
                        margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
                        padding: EdgeInsets.all(15.0),
                        decoration: new BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x29000000),
                                offset: Offset(0, 0),
                                blurRadius: 10,
                                spreadRadius: 0)
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                    decoration: new BoxDecoration(
                                      color: Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0x29000000),
                                            offset: Offset(0, 0),
                                            blurRadius: 6,
                                            spreadRadius: 0)
                                      ],
                                    ),
                                    child: SvgPicture.asset(
                                      "assets/images/svg/full-moon.svg",
                                      width: 90.0,
                                      height: 90.0,
                                    )),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.55,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Title",
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Color(0xff000000),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: -0.36,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(
                                        "Subtitle",
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Color(0xff000000),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: -0.336,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: "TUITION FEE  ",
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  color: Color(0xff000000),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                                  letterSpacing: -0.312,
                                                )),
                                            TextSpan(
                                              text: "9,000 per year Rennes",
                                              style: CustomStyles
                                                  .registerRichTextStyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            MaterialButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        padding: EdgeInsets.fromLTRB(
                                            16.0, 33.0, 16.0, 42.0),
                                        height: 240.0,
                                        decoration: new BoxDecoration(
                                          color: Color(0xffffffff),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color(0x4d000000),
                                                offset: Offset(0, -0.5),
                                                blurRadius: 20,
                                                spreadRadius: 0)
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Confirm",
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Color(0xff000000),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.normal,
                                                letterSpacing: 0.36,
                                              ),
                                            ),
                                            SizedBox(height: 27.0),
                                            Text(
                                              "Apply in certain program",
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                color: Color(0xff000000),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                letterSpacing: 0.32,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 40.0,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                MaterialButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  minWidth: 108.0,
                                                  height: 42.0,
                                                  child: Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      color: Color(0xffc4c4c4),
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500,
                                                      fontStyle: FontStyle.normal,
                                                      letterSpacing: -0.384,
                                                    ),
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      side: BorderSide(),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  elevation: 2,
                                                ),
                                                MaterialButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    showModalBottomSheet(
                                                        context: context,
                                                        builder: (context) {
                                                          return Container(
                                                            padding: EdgeInsets
                                                                .fromLTRB(
                                                                    16.0,
                                                                    34.0,
                                                                    16.0,
                                                                    42.0),
                                                            height: 240.0,
                                                            decoration:
                                                                new BoxDecoration(
                                                              color: Color(
                                                                  0xffffffff),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                    color: Color(
                                                                        0x4d000000),
                                                                    offset:
                                                                        Offset(0,
                                                                            -0.5),
                                                                    blurRadius:
                                                                        20,
                                                                    spreadRadius:
                                                                        0)
                                                              ],
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                Text(
                                                                  "Done",
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: Color(
                                                                        0xff000000),
                                                                    fontSize: 18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal,
                                                                    letterSpacing:
                                                                        0.36,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height: 27.0),
                                                                Text(
                                                                  "Check your email address you received it has\nall details",
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: Color(
                                                                        0xff000000),
                                                                    fontSize: 16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal,
                                                                    letterSpacing:
                                                                        0.32,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.035,
                                                                ),
                                                                MaterialButton(
                                                                  onPressed: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  height: 42.0,
                                                                  color: CustomColors
                                                                      .primaryColor,
                                                                  minWidth:
                                                                      MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width,
                                                                  child: Text(
                                                                    "Mores Offers",
                                                                    style: CustomStyles
                                                                        .loginButtonLabelStyle,
                                                                  ),
                                                                  shape: RoundedRectangleBorder(
                                                                      side:
                                                                          BorderSide(),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                                  elevation: 2,
                                                                )
                                                              ],
                                                            ),
                                                          );
                                                        });
                                                  },
                                                  minWidth: 216.0,
                                                  height: 42.0,
                                                  child: Text(
                                                    "Apply Now",
                                                    style: CustomStyles
                                                        .loginButtonLabelStyle,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      side: BorderSide(),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  elevation: 2,
                                                  color:
                                                      CustomColors.primaryColor,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Text(
                                "Apply Now",
                                style: CustomStyles.loginButtonLabelStyle,
                              ),
                              color: CustomColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              elevation: 3,
                              minWidth: MediaQuery.of(context).size.width,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

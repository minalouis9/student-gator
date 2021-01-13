import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:student_gator/models/Application.dart';
import 'package:student_gator/models/Cities.dart';
import 'package:student_gator/models/Levels.dart';
import 'package:student_gator/models/Programs.dart';
import 'package:student_gator/models/Schools.dart';
import 'package:student_gator/models/User.dart';
import 'package:student_gator/screens/ProgramDetails.dart';
import 'package:student_gator/services/FirebaseClient.dart';
import 'package:student_gator/utils/Colors.dart';
import 'package:student_gator/utils/InterfaceUtilities.dart';
import 'package:student_gator/utils/LocalStorage.dart';
import 'package:student_gator/utils/Styles.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  FutureBuilder<List<Schools>> _schoolsBuilder;
  FutureBuilder<Users> _userBuilder;

  Users user = Users();
  List<Map<String, dynamic>> _levelsList = List();
  List<Map<String, dynamic>> _citiesList = List();
  List<Programs> _allProgramsList = List();
  List<Programs> _programsList = List();

  TextEditingController _searchController = TextEditingController();

  RangeValues _currentRangeValues = const RangeValues(10000, 30000);

  _buildPrograms() {
    if (_programsList.isNotEmpty) {
      return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _programsList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProgramDetailsScreen(
                      program: _programsList.elementAt(index), currentUser: user);
                }));
              },
              child: Card(
                margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
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
                                  _programsList.elementAt(index).name,
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Color(0xff000000),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: -0.36,
                                  ),
                                ),
                                Divider(color: CustomColors.primaryColor,thickness: 1.25,),
                                Text(
                                  _programsList.elementAt(index).school,
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Color(0xff000000),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: -0.336,
                                  ),
                                ),
                                Divider(color: CustomColors.primaryColor,thickness: 0.75,indent: 20.0,endIndent: 20.0,),
                                Text(
                                  _programsList.elementAt(index).city,
                                  style: CustomStyles.registerRichTextStyle,
                                ),
                                Divider(color: CustomColors.primaryColor,thickness: 0.75,indent: 20.0,endIndent: 20.0,),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("TUITION FEE  ",
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Color(0xff000000),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: -0.312,
                                        )),
                                    Text("${_programsList.elementAt(index).fee.toString()} per year",
                                      style:
                                      CustomStyles.registerRichTextStyle,)
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: InterfaceUtilities.getPercentageOfScreenHeight(
                            context, 0.01),
                      ),
                      MaterialButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  padding: EdgeInsets.fromLTRB(
                                      16.0, 33.0, 16.0, 42.0),
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
                                    mainAxisSize: MainAxisSize.min,
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
                                      SizedBox(height: 20.0),
                                      Text(
                                        "Apply in ${_programsList.elementAt(index).name}, don't worry you can cancel any time",
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Color(0xff000000),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: 0.32,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MaterialButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            minWidth: InterfaceUtilities
                                                .getPercentageOfScreenWidth(
                                                    context, 0.25),
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
                                                    BorderRadius.circular(5)),
                                            elevation: 2,
                                          ),
                                          MaterialButton(
                                            onPressed: () async {
                                              Application app = Application(studentUserName: user.name,program: _programsList.elementAt(index).name,school: _programsList.elementAt(index).school, studentEmail: user.email);
                                              await FirebaseClient().applicationsService().setApplications(app, user.id, user.appliedPrograms).whenComplete((){
                                                Navigator.pop(context);
                                                showModalBottomSheet(
                                                    context: context,
                                                    builder: (context) {
                                                      return Container(
                                                        padding:
                                                        EdgeInsets.fromLTRB(
                                                            16.0,
                                                            34.0,
                                                            16.0,
                                                            42.0),
                                                        height: 240.0,
                                                        decoration: BoxDecoration(
                                                          color:
                                                          Color(0xffffffff),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Color(
                                                                    0x4d000000),
                                                                offset: Offset(
                                                                    0, -0.5),
                                                                blurRadius: 20,
                                                                spreadRadius: 0)
                                                          ],
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              "Done",
                                                              style: TextStyle(
                                                                fontFamily:
                                                                'Roboto',
                                                                color: Color(
                                                                    0xff000000),
                                                                fontSize: 18.0,
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
                                                              style: TextStyle(
                                                                fontFamily:
                                                                'Roboto',
                                                                color: Color(
                                                                    0xff000000),
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                fontStyle:
                                                                FontStyle
                                                                    .normal,
                                                                letterSpacing:
                                                                0.32,
                                                              ),
                                                              textAlign: TextAlign
                                                                  .center,
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
                                                              InterfaceUtilities
                                                                  .getPercentageOfScreenWidth(
                                                                  context,
                                                                  1.0),
                                                              child: Text(
                                                                "Mores Offers",
                                                                style: CustomStyles
                                                                    .loginButtonLabelStyle,
                                                              ),
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      5)),
                                                              elevation: 2,
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    });
                                              });
                                            },
                                            minWidth: InterfaceUtilities
                                                .getPercentageOfScreenWidth(
                                                    context, 0.55),
                                            height: 42.0,
                                            child: Text(
                                              "Apply Now",
                                              style: CustomStyles
                                                  .loginButtonLabelStyle,
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            elevation: 2,
                                            color: CustomColors.primaryColor,
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
              ),
            );
          });
    } else {
      return Shimmer.fromColors(
        period: Duration(seconds: 1),
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: (_, __) => Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            width: double.infinity,
            // color: Colors.white,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 90.0,
                      height: 90.0,
                      color: Colors.white,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                    ),
                    Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.5),
                            height: 17.0,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                          ),
                          Container(
                            width: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.2),
                            height: 17.0,
                            color: Colors.white,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                          ),
                          Container(
                            width: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.4),
                            height: 17.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                  ],
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 4.0)),
                Container(
                  width: double.infinity,
                  height: 42.0,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
                )
              ],
            ),
          ),
          itemCount: 6,
        ),
      );
    }
  }

  _buildSchools() {
    return FutureBuilder<List<Schools>>(
        future: Future.delayed(Duration(seconds: 2), () {
          print("in school build");
          return FirebaseClient().schoolsService().getSchools();
        }),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                itemBuilder: (context, index) {
                  return Card(
                    color: CustomColors.primaryColor.withOpacity(0.25),
                    margin: EdgeInsets.fromLTRB(0.0, 5.0, 20.0, 5.0),
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 19.0, 20.0, 16.0),
                      child: Column(
                        children: [
                          SvgPicture.asset("assets/images/svg/full-moon.svg"),
                          SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            snapshot.data.elementAt(index).name,
                            style: CustomStyles.gridStyle,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Shimmer.fromColors(
                period: Duration(seconds: 1),
                child: GridView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1),
                    itemBuilder: (_, __) => Container(
                          margin: EdgeInsets.all(8.0),
                          padding: EdgeInsets.all(8.0),
                          width: 60.0,
                          height: 110.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2.0),
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
                              Container(
                                width: 60.0,
                                height: 60.0,
                                color: Colors.white,
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4.0)),
                              Container(
                                height: 15.0,
                                width: 70.0,
                                color: Colors.white,
                              )
                            ],
                          ),
                        )),
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100]);
          }
        });
  }

  _buildUserData() {
    return FutureBuilder<Users>(
        future: Future.delayed(Duration(seconds: 1), () {
          return LocalStorage().getUser();
        }),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: FadeInImage(
                    width: 40.0,
                    height: 40.0,
                    image: NetworkImage(snapshot.data
                        .profilePictureURL),
                    placeholder: AssetImage(
                        "assets/images/png/full-moon.png"),
                  ),
                ),
                SizedBox(
                  width: 9.0,
                ),
                Column(
                  children: [
                    Text(snapshot.data.name),
                    Text("Welcome Back"),
                  ],
                ),
              ],
            );
          } else {
            return Shimmer.fromColors(
                period: Duration(seconds: 1),
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        width: 35.0,
                        height: 33.0,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 9.0,
                      ),
                      Column(
                        children: [
                          Container(
                            width:
                                InterfaceUtilities.getPercentageOfScreenWidth(
                                    context, 0.4),
                            height: 13.0,
                            color: Colors.white,
                          ),
                          Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
                          Container(
                            width:
                                InterfaceUtilities.getPercentageOfScreenWidth(
                                    context, 0.2),
                            height: 13.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100]);
          }
        });
  }

  _buildLevels(mystate) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 4.5),
        physics: NeverScrollableScrollPhysics(),
        itemCount: _levelsList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            child: CheckboxListTile(
              title: Text(
                _levelsList.elementAt(index)["level"],
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xff000000),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: -0.336,
                ),
              ),
              value: _levelsList.elementAt(index)["checked"],
              onChanged: (newValue) {
                mystate(() {
                  if (_levelsList.elementAt(index)["level"] == "All") {
                    _levelsList.forEach((element) {
                      if (element["level"] != "All") {
                        element["checked"] = false;
                      }
                    });
                  } else {
                    _levelsList.firstWhere((element) =>
                        element.containsValue("All"))["checked"] = false;
                  }
                  _levelsList.elementAt(index)["checked"] = newValue;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
          );
        });
  }

  _buildCities(mystate) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 4.5),
        physics: NeverScrollableScrollPhysics(),
        itemCount: _citiesList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            child: CheckboxListTile(
              title: Text(
                _citiesList.elementAt(index)["city"],
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xff000000),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: -0.336,
                ),
              ),
              value: _citiesList.elementAt(index)["checked"],
              onChanged: (newValue) {
                mystate(() {
                  if (_citiesList.elementAt(index)["city"] == "All") {
                    _citiesList.forEach((element) {
                      if (element["city"] != "All") {
                        element["checked"] = false;
                      }
                    });
                  } else {
                    _citiesList.firstWhere((element) =>
                        element.containsValue("All"))["checked"] = false;
                  }
                  _citiesList.elementAt(index)["checked"] = newValue;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
          );
        });
  }

  _loadData() async {
    await FirebaseClient().levelsService().getLevels().then((value) {
      setState(() {
        _levelsList.add({"level": "All", "checked": true});
        value.forEach((element) {
          _levelsList.add({"level": element.level, "checked": false});
        });
      });
    });

    await FirebaseClient().citiesService().getCities().then((value) {
      setState(() {
        _citiesList.add({"city": "All", "checked": true});
        value.forEach((element) {
          _citiesList.add({"city": element.name, "checked": false});
        });
      });
    });

    await LocalStorage().getUser().then((value){
      setState(() {
        user = value;
      });
    });

    Future.delayed(Duration(seconds: 2), () {
      FirebaseClient().programsService().getPrograms().then((value) {
        print("in programs build");
        setState(() {
          _allProgramsList = value;
          _programsList = value;
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userBuilder = _buildUserData();
    _schoolsBuilder = _buildSchools();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(17.0, 0.0, 9.0, 0.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.0,
            ),
            _userBuilder,
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Container(
                  height: 42.0,
                  width: InterfaceUtilities.getPercentageOfScreenWidth(
                      context, 0.7),
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
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(builder:
                              (BuildContext context, StateSetter mystate) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.8,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                    _buildCities(mystate),
                                    Padding(
                                        padding: EdgeInsets.only(bottom: 23.0)),
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
                                    _buildLevels(mystate),
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
                                      max: 100000,
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
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
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
                                                        _currentRangeValues.end
                                                            .round()
                                                            .toString(),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
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
                                          minWidth: InterfaceUtilities
                                              .getPercentageOfScreenWidth(
                                                  context, 0.25),
                                          height: 42.0,
                                        ),
                                        MaterialButton(
                                          onPressed: () async {
                                            print("Applying filter : ${_allProgramsList.length}");
                                            List<String> levelList = List(),
                                                cityList = List();
                                            mystate(() {
                                              _programsList = List();
                                            });
                                            int startFee = _currentRangeValues
                                                    .start
                                                    .toInt(),
                                                endFee = _currentRangeValues.end
                                                    .toInt();
                                            _levelsList.forEach((element) {
                                              if (element["checked"]) {
                                                levelList.add(element["level"]);
                                              }
                                            });
                                            _citiesList.forEach((element) {
                                              if (element["checked"]) {
                                                cityList.add(element["city"]);
                                              }
                                            });
                                            if (levelList.elementAt(0) ==
                                                    "All" &&
                                                cityList.elementAt(0) ==
                                                    "All") {
                                              _allProgramsList
                                                  .forEach((element) {
                                                if (element.fee != null && element.fee >= startFee &&
                                                    element.fee <= endFee) {
                                                  mystate(() {
                                                    _programsList.add(element);
                                                  });
                                                }
                                              });
                                            } else if (levelList.elementAt(0) ==
                                                    "All" &&
                                                cityList.elementAt(0) !=
                                                    "All") {
                                              _allProgramsList
                                                  .forEach((element) {
                                                if (cityList.contains(
                                                        element.city) && element.fee != null &&
                                                    element.fee >= startFee &&
                                                    element.fee <= endFee) {
                                                  mystate(() {
                                                    _programsList.add(element);
                                                  });
                                                }
                                              });
                                            } else if (levelList.elementAt(0) !=
                                                    "All" &&
                                                cityList.elementAt(0) ==
                                                    "All") {
                                              _allProgramsList
                                                  .forEach((element) {
                                                if (levelList.contains(
                                                        element.level) && element.fee != null &&
                                                    element.fee >= startFee &&
                                                    element.fee <= endFee) {
                                                  mystate(() {
                                                    _programsList.add(element);
                                                  });
                                                }
                                              });
                                            } else {
                                              _allProgramsList
                                                  .forEach((element) {
                                                if (levelList.contains(
                                                        element.level) &&
                                                    cityList.contains(
                                                        element.city) && element.fee != null &&
                                                    element.fee >= startFee &&
                                                    element.fee <= endFee) {
                                                  mystate(() {
                                                    _programsList.add(element);
                                                  });
                                                }
                                              });
                                            }
                                            // await FirebaseClient().programsService().getFilteredPrograms(levelList, cityList, startFee, endFee).then((value){
                                            //   value.forEach((element) {
                                            //     print(element.name);
                                            //   });
                                            // });
                                            Navigator.pop(context);
                                          },
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          elevation: 2,
                                          color: CustomColors.primaryColor,
                                          child: Text(
                                            "Apply Filter",
                                            style: CustomStyles
                                                .loginButtonLabelStyle,
                                          ),
                                          minWidth: InterfaceUtilities
                                              .getPercentageOfScreenWidth(
                                                  context, 0.55),
                                          height: 42.0,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                        }).then((value) {
                      setState(() {});
                    });
                  },
                  child: Container(
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
                    child: SvgPicture.asset(
                      "assets/images/svg/Filter.svg",
                      width: 23.0,
                      height: 21.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
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
              height:
                  InterfaceUtilities.getPercentageOfScreenHeight(context, 0.15),
              width: MediaQuery.of(context).size.width,
              child: _schoolsBuilder,
            ),
            SizedBox(
              height: 23.0,
            ),
            Text("Programs"),
            SizedBox(
              height: 21.0,
            ),
            Container(
              child: _buildPrograms(),
            )
          ],
        ),
      ),
    );
  }
}

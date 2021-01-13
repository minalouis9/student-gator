import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:student_gator/models/User.dart';
import 'package:student_gator/screens/AppliedTab.dart';
import 'package:student_gator/services/FirebaseClient.dart';
import 'package:student_gator/utils/Colors.dart';
import 'package:student_gator/utils/InterfaceUtilities.dart';
import 'package:student_gator/utils/Styles.dart';

class StudentsTab extends StatefulWidget {
  @override
  _StudentsTabState createState() => _StudentsTabState();
}

class _StudentsTabState extends State<StudentsTab> {
  TextEditingController _searchController = TextEditingController();

  int appliedPrograms = 0;

  _buildStudents() {
    return FutureBuilder<List<Users>>(
        future: Future.delayed(Duration(seconds: 2), () {
          return FirebaseClient().usersService().getAllStudents();
        }),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            snapshot.data.forEach((element) {
              appliedPrograms += element.appliedPrograms;
            });
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                    decoration: new BoxDecoration(
                        color: CustomColors.primaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Students",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xff000000),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.48,
                          ),
                        ),
                        SizedBox(
                          height: 13.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Total",
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Color(0xff000000),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      letterSpacing: -0.384,
                                    )),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0)),
                                Text(snapshot.data.length.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Color(0xff42c1af),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      letterSpacing: -0.384,
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Applied Programs",
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Color(0xff000000),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      letterSpacing: -0.384,
                                    )),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0)),
                                Text(appliedPrograms.toString(),
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Color(0xff42c1af),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      letterSpacing: -0.384,
                                    ))
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                  Container(
                    height: 42.0,
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
                        hintText: "Search By Student Name",
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                  snapshot.data.isNotEmpty
                      ? ListView.builder(
                          itemCount: snapshot.data.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                print(snapshot.data.elementAt(index).id);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return AppliedTab(
                                      user: snapshot.data.elementAt(index));
                                }));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            height: 50.0,
                                            width: 50.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: FadeInImage(
                                              image: NetworkImage(snapshot.data
                                                  .elementAt(index)
                                                  .profilePictureURL),
                                              placeholder: AssetImage(
                                                  "assets/images/png/full-moon.png"),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.0)),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                snapshot.data
                                                    .elementAt(index)
                                                    .name,
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  color: Color(0xff000000),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal,
                                                  letterSpacing: -0.36,
                                                )),
                                            Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 3.0)),
                                            Text(
                                                "${snapshot.data.elementAt(index).appliedPrograms} Programs applied",
                                                style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  color: Color(0xff000000),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400,
                                                  fontStyle: FontStyle.normal,
                                                  letterSpacing: -0.312,
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.grey[400],
                                    thickness: 1.0,
                                  ),
                                ],
                              ),
                            );
                          })
                      : Container(
                          padding: EdgeInsets.only(
                              top: InterfaceUtilities
                                  .getPercentageOfScreenHeight(context, 0.1)),
                          alignment: Alignment.center,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/images/png/panda.png"),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 20.0)),
                                Text("There is no students yet",
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Color(0xff000000),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      letterSpacing: -0.384,
                                    ))
                              ],
                            ),
                          ),
                        ),
                ],
              ),
            );
          } else {
            return Shimmer.fromColors(
                child: ListView(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 16.0),
                      decoration: new BoxDecoration(
                          color: CustomColors.primaryColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 20.0,
                            width:
                                InterfaceUtilities.getPercentageOfScreenWidth(
                                    context, 0.5),
                          ),
                          SizedBox(
                            height: 13.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 17.0,
                                width: InterfaceUtilities
                                    .getPercentageOfScreenWidth(context, 0.35),
                                color: Colors.white,
                              ),
                              Container(
                                height: 17.0,
                                width: InterfaceUtilities
                                    .getPercentageOfScreenWidth(context, 0.35),
                                color: Colors.white,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                    Container(
                      height: 42.0,
                      width: InterfaceUtilities.getPercentageOfScreenWidth(
                          context, 0.8),
                      color: Colors.white,
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
                    ListView.builder(
                        itemCount: 6,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(5.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 34.0,
                                      height: 34.0,
                                      color: Colors.white,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.0)),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          color: Colors.white,
                                          height: 16.0,
                                          width: InterfaceUtilities
                                              .getPercentageOfScreenWidth(
                                                  context, 0.2),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 3.0)),
                                        Container(
                                          color: Colors.white,
                                          height: 16.0,
                                          width: InterfaceUtilities
                                              .getPercentageOfScreenWidth(
                                                  context, 0.4),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.white,
                                thickness: 1.0,
                              ),
                            ],
                          );
                        })
                  ],
                ),
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100]);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
        child: _buildStudents(),
      ),
    );
  }
}

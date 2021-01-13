import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:student_gator/models/Application.dart';
import 'package:student_gator/models/Programs.dart';
import 'package:student_gator/models/Schools.dart';
import 'package:student_gator/models/User.dart';
import 'package:student_gator/services/FirebaseClient.dart';
import 'package:student_gator/utils/Colors.dart';
import 'package:student_gator/utils/InterfaceUtilities.dart';
import 'package:student_gator/utils/Styles.dart';
import 'package:student_gator/widgets/Button.dart';

class ProgramDetailsScreen extends StatefulWidget {
  final Programs program;
  final Users currentUser;
  ProgramDetailsScreen({this.program, this.currentUser});

  @override
  _ProgramDetailsScreenState createState() => _ProgramDetailsScreenState();
}

class _ProgramDetailsScreenState extends State<ProgramDetailsScreen> {
  _buildSchoolDescription() {
    return FutureBuilder<Schools>(
        future: Future.delayed(Duration(seconds: 2), () {
          return FirebaseClient()
              .schoolsService()
              .getSchoolByName(widget.program.school);
        }),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(
              snapshot.data.description,
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Color(0xff000000),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                letterSpacing: -0.384,
              ),
            );
          } else {
            return Shimmer.fromColors(
              child: Container(
                child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (_, __) {
                      Random random = new Random();
                      int randomNumber = random.nextInt((MediaQuery
                          .of(context)
                          .size
                          .width * 0.8).toInt());
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 4.0),
                        height: 13.0,
                        width: randomNumber + 0.0,
                        color: Colors.white,
                      );
                    }),
              ),
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              period: Duration(seconds: 1),
            );
          }
        });
  }

  _buildSchoolPrograms() {
    return FutureBuilder<List<Programs>>(
        future: Future.delayed(Duration(seconds: 3), () {
          return FirebaseClient().programsService().getProgramsBySchool(
              widget.program.school);
        }),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(InterfaceUtilities.borderRadius),
                  color: index % 2 == 0 ? Colors.transparent : Colors.grey[300],
                ),
                margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      snapshot.data.elementAt(index).name,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Wrap(
                            children: [
                              Text(
                                "TUITION FEE",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xff000000),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: -0.312,
                                ),
                              ),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
                              Text(
                                "${snapshot.data.elementAt(index).fee} Per Year",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xff42c1af),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: -0.312,
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){return ProgramDetailsScreen(program: snapshot.data.elementAt(index));}));
                          },
                          child: Text(
                            "More Info",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(0xff42c1af),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              letterSpacing: -0.336,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            });
          } else {
            return Shimmer.fromColors(
              child: ListView.builder(
                itemCount: 7,
                  shrinkWrap: true,
                  itemBuilder: (_, __) {
                return Container(
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 13.0,
                        width: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.7),
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 13.0,
                            width: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.2),
                            color: Colors.white,
                          ),
                          Container(
                            height: 13.0,
                            width: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.2),
                            color: Colors.white,
                          ),
                          Container(
                            height: 13.0,
                            width: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.2),
                            color: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }),
              baseColor: Colors.grey[300],
              highlightColor: Colors.grey[100],
              period: Duration(seconds: 1),);
          }
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Program",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
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
                            height: 90.0,
                            width: 90.0,
                          )),
                      SizedBox(
                        width: 15.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width:
                            InterfaceUtilities.getPercentageOfScreenWidth(
                                context, 0.65),
                            child: Text(
                              widget.program.name,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Color(0xff000000),
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                letterSpacing: -0.36,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            width:
                            InterfaceUtilities.getPercentageOfScreenWidth(
                                context, 0.65),
                            child: Text(
                              widget.program.school,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Color(0xff000000),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                letterSpacing: -0.336,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                          Button(
                            label: "Apply Now",
                            width:
                            InterfaceUtilities.getPercentageOfScreenWidth(
                                context, 0.6),
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
                                            "Apply in ${widget.program.name}, don't worry you can cancel any time",
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
                                                  Application app = Application(studentUserName: widget.currentUser.name,program: widget.program.name,school:widget.program.school, studentEmail: widget.currentUser.email);
                                                  await FirebaseClient().applicationsService().setApplications(app, widget.currentUser.id, widget.currentUser.appliedPrograms).whenComplete((){
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
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 28.0,
                ),
                Text(
                  "About ${widget.program.school}",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Color(0xff42c1af),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    letterSpacing: -0.432,
                  ),
                ),
                SizedBox(
                  height: 21.0,
                ),
                _buildSchoolDescription(),
                SizedBox(
                  height: 28.0,
                ),
                Text(
                  "All programs",
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Color(0xff42c1af),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    letterSpacing: -0.432,
                  ),
                ),
                SizedBox(
                  height: 19.0,
                ),
                _buildSchoolPrograms(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

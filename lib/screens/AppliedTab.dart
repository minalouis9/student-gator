import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_gator/utils/Colors.dart';
import 'package:student_gator/utils/Styles.dart';

class AppliedTab extends StatefulWidget {
  @override
  _AppliedTabState createState() => _AppliedTabState();
}

class _AppliedTabState extends State<AppliedTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(17.0, 0.0, 9.0, 0.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 74.0,
            ),
            Container(
              height: 106,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(16.0, 29.0, 16.0, 10.0),
              decoration: new BoxDecoration(
                  color: CustomColors.primaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Applied Programs",
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
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: "Total ",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(0xff000000),
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              letterSpacing: -0.432,
                            )),
                        TextSpan(
                          text: "5",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xff42c1af),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.432,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
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
                      child: Column(children: [
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
                              ),
                            ),
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
                                            text: "Status  ",
                                            style: TextStyle(
                                              fontFamily: 'Roboto',
                                              color: Color(0xff000000),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              fontStyle: FontStyle.normal,
                                              letterSpacing: -0.312,
                                            )),
                                        TextSpan(
                                          text: "In progress",
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
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              elevation: 2,
                              color: Color(0xffc14242),
                              child: Text(
                                "Delete",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xffffffff),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: -0.36,
                                ),
                              ),
                              minWidth: 147.0,
                              height: 42.0,
                            ),
                            MaterialButton(
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              elevation: 2,
                              color: Color(0xff42c1af),
                              child: Text(
                                "Update",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color(0xffffffff),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  letterSpacing: -0.36,
                                ),
                              ),
                              minWidth: 147.0,
                              height: 42.0,
                            ),
                          ],
                        )
                      ]));
                })
          ],
        ),
      ),
    );
  }
}

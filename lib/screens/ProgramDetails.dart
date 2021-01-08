import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:student_gator/utils/Colors.dart';
import 'package:student_gator/utils/Styles.dart';

class ProgramDetailsScreen extends StatefulWidget {
  final String title;

  ProgramDetailsScreen({this.title});

  @override
  _ProgramDetailsScreenState createState() => _ProgramDetailsScreenState();
}

class _ProgramDetailsScreenState extends State<ProgramDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Program"),
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
                    boxShadow: [BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(0,0),
                        blurRadius: 6,
                        spreadRadius: 0
                    ) ],),
                          child: SvgPicture.asset("assets/images/svg/full-moon.svg", height: 90.0, width: 90.0,)),
                      SizedBox(width: 15.0,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("widget.title", style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xff000000),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.36,
                          ),),
                          SizedBox(height: 8.0,),
                          Text("SubTitle", style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xff000000),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.336,
                          ),),
                          SizedBox(height: 14.0,),
                          MaterialButton(
                            minWidth: MediaQuery.of(context).size.width * 0.5,
                            height: 42.0,
                            onPressed: (){},
                            color: CustomColors.primaryColor,
                            child: Text("Apply Now", style: CustomStyles.loginButtonLabelStyle,),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 28.0,),
                Text("About Rennes School Of Business", style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xff42c1af),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  letterSpacing: -0.432,
                ),),
                SizedBox(height: 21.0,),
                Text("ennes School of Business is considered to be the\nmost international School of Management in\nEurope. With 95% of faculty members being\nnon-French, 55% foreign students, classes in\nEnglish and a network of more than 300 partner\nuniversities worldwide, Rennes School of Business\ngives the students a unique opportunity to learn in\na continuous international environment from first\nyear to graduation. ", style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xff000000),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  letterSpacing: -0.384,
                ),),
                SizedBox(height: 28.0,),
                Text("All programs", style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xff42c1af),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  letterSpacing: -0.432,
                ),),
                SizedBox(height: 18.0,),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Bachelor IBPM major Purchase and Supply Chain", style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xff000000),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        letterSpacing: -0.36,
                      ),),
                      SizedBox(height: 12.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text("TUITION FEE", style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(0xff000000),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          letterSpacing: -0.312,
                        ),),
                        Text("9,000 Per Year", style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(0xff42c1af),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          letterSpacing: -0.312,
                        ),),
                        Text("More Info", style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(0xff42c1af),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          letterSpacing: -0.336,
                        ),)
                      ],)
                    ],
                  ),
                ),
                SizedBox(height: 19.0,),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("MSC in international accounting management control\n& auditing", style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xff000000),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        letterSpacing: -0.36,
                      ),),
                      SizedBox(height: 12.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("TUITION FEE", style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xff000000),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.312,
                          ),),
                          Text("9,000 Per Year", style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xff42c1af),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.312,
                          ),),
                          Text("More Info", style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xff42c1af),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.336,
                          ),)
                        ],)
                    ],
                  ),
                ),
                SizedBox(height: 19.0,),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("MIM international negotiation and sales management", style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xff000000),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        letterSpacing: -0.36,
                      ),),
                      SizedBox(height: 12.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("TUITION FEE", style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xff000000),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.312,
                          ),),
                          Text("9,000 Per Year", style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xff42c1af),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.312,
                          ),),
                          Text("More Info", style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Color(0xff42c1af),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            letterSpacing: -0.336,
                          ),)
                        ],)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

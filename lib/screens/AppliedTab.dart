import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:student_gator/models/Application.dart';
import 'package:student_gator/models/User.dart';
import 'package:student_gator/services/FirebaseClient.dart';
import 'package:student_gator/utils/Colors.dart';
import 'package:student_gator/utils/InterfaceUtilities.dart';
import 'package:student_gator/utils/LocalStorage.dart';
import 'package:student_gator/utils/Styles.dart';

class AppliedTab extends StatefulWidget {
  final Users user;

  AppliedTab({this.user});

  @override
  _AppliedTabState createState() => _AppliedTabState();
}

class _AppliedTabState extends State<AppliedTab> {
  Users user = Users();

  _buildAppliedPrograms() {
    return FutureBuilder<List<Application>>(
        future: Future.delayed(Duration(seconds: 2), () {
          return FirebaseClient()
              .applicationsService()
              .getApplications(widget.user == null ? user.id : widget.user.id);
        }),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data.length);
            if(snapshot.data.isNotEmpty){
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 74.0,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 16.0),
                      decoration: new BoxDecoration(
                          color: CustomColors.primaryColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.user == null ? "Applied Programs" : snapshot.data.elementAt(0).studentUserName,
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
                                  text: snapshot.data.length.toString(),
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
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
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
                                mainAxisSize: MainAxisSize.min,
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
                                            snapshot.data.elementAt(index).program,
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
                                            snapshot.data.elementAt(index).school,
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
                                      onPressed: () async {
                                        showDialog(
                                            context: context,
                                            child: AlertDialog(
                                              backgroundColor: CustomColors.primaryColor,
                                              title: Text("Deleting program ...", style: TextStyle(color: Colors.white),),
                                              content: Wrap(
                                                children: [
                                                  Center(child: CircularProgressIndicator()),
                                                ],
                                              ),
                                            ));
                                        await FirebaseClient().applicationsService().deleteApplications(widget.user == null ? user.id : widget.user.id, snapshot.data.elementAt(index).id, widget.user == null ? user.appliedPrograms : widget.user.appliedPrograms).whenComplete((){
                                          setState(() {});
                                          Future.delayed(Duration(milliseconds: 2200),(){
                                            Navigator.pop(context);
                                          });
                                        });
                                      },
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
                        }),
                  ],
                ),
              );
            }
            else{
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/png/panda.png"),
                    Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
                    Text("There no applied programs yet,\nlet's go and discover programs",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color(0xff000000),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          letterSpacing: -0.384,
                        )
                    )
                  ],
                ),
              );
            }
          } else {
            return Shimmer.fromColors(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 74.0,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 16.0),
                      decoration: new BoxDecoration(
                          border: Border.all(color: Colors.white,width: 2.0),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.4),
                            height: 17.0,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 13.0,
                          ),
                          Container(
                            width: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.25),
                            height: 17.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    ListView.builder(
                        itemCount: 6,
                        shrinkWrap: true,
                        itemBuilder: (_, __) {
                          return Container(
                              width: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.7),
                              margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 20.0),
                              padding: EdgeInsets.all(15.0),
                              decoration: new BoxDecoration(
                                border: Border.all(color: Colors.white,width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                  children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 90.0,
                                      height: 90.0,
                                      decoration: new BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      )
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.55,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.4),
                                            height: 15.0,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            height: 8.0,
                                          ),
                                          Container(
                                            width: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.6),
                                            height: 15.0,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Container(
                                            width: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.3),
                                            height: 15.0,
                                            color: Colors.white,
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
                                    Container(
                                      width: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.3),
                                      height: 42.0,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(5.0)
                                      ),
                                    ),
                                    Container(
                                      width: InterfaceUtilities.getPercentageOfScreenWidth(context, 0.3),
                                      height: 42.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5.0)
                                      ),
                                    ),
                                  ],
                                )
                              ]));
                        }),
                  ],
                ),
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100]);
          }
        });
  }

  _loadData() async {
    await LocalStorage().getUser().then((value) {
      setState(() {
        user = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.user);
    if(widget.user == null){
      return Container(
        padding: EdgeInsets.fromLTRB(17.0, 0.0, 9.0, 0.0),
        child: _buildAppliedPrograms(),
      );
    }
    else{
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("Student Programs", style: TextStyle(color: Colors.white),),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(17.0, 0.0, 9.0, 0.0),
          child: _buildAppliedPrograms(),
        ),
      );
    }
  }
}

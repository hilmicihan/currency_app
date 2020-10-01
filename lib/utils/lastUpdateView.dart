import 'package:currency_app/dataHandle/serviceData.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LastUpdateView extends StatelessWidget {
  const LastUpdateView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.blueAccent),
      child: timeData == null
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Loading",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(children: [
                  Column(
                    children: [
                      FaIcon(FontAwesomeIcons.calendarAlt),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Date"),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    timeData.day.toString() +
                        ": " +
                        timeData.month.toString() +
                        ": " +
                        timeData.year.toString(),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ]),
                SizedBox(width: 20),
                Column(
                  children: [
                    Column(
                      children: [
                        FaIcon(FontAwesomeIcons.clock),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Hour"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      timeData.hour.toString() +
                          ":" +
                          timeData.minute.toString() +
                          ":" +
                          timeData.second.toString(),
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Column(
                      children: [
                        FaIcon(FontAwesomeIcons.globeAsia),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Time Zone")
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(timeData.timeZoneName,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                  ],
                ),
              ]),
            ),
    );
  }
}

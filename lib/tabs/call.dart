import 'package:flutter/material.dart';
import 'package:whats_app/model/call-model.dart';

class Call extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: callsData.length,
        itemBuilder: (context, i) => new Column(
              children: [
                new Divider(
                  height: 0.3 ,
                ),
                new ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(callsData[i].pic),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Text(
                          callsData[i].name,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600),
                        ),
                        new Icon(
                          i % 2 == 0 ? Icons.call : Icons.videocam,
                          color: Theme.of(context).primaryColor,
                        )
                      ],
                    ),
                    subtitle: Text(
                      callsData[i].time,
                      style: TextStyle(color: Colors.grey, fontSize: 15.0),
                    ))
              ],
            ));
  }
}

import 'package:flutter/material.dart';
import 'package:vost/domain/models/occurrence_model.dart';
import 'package:vost/presentation/assets/text_styles.dart';
import 'package:vost/presentation/utils/misc.dart';

class OccurrencesItem extends StatelessWidget {
  final OccurrenceModel occurrence;

  OccurrencesItem({this.occurrence});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(occurrence.type.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    )),
              ),
              Container(
                width: 26.909088134765625,
                height: 26.909090042114258,
                child: Icon(
                  Icons.star,
                  color: Color(0xfffbc02d),
                ),
              )
            ],
          ),
          Text(occurrence.parish.name, style: styleOccurrencesSubText()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(occurrence.status.name, style: styleOccurrencesSubText()),
              Text(formatTime(occurrence.updatedAt),
                  style: styleOccurrencesSubText())
            ],
          ),
        ],
      ),
    );
  }
}

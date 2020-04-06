import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_offers/models/workingDay.dart';
import 'package:flutter_offers/utils/date_utils.dart';

class WorkSchedule extends StatefulWidget {
  final List<WorkingDay> workingDays;

  WorkSchedule(this.workingDays, {Key key}) : super(key: key);

  @override
  _WorkScheduleState createState() => _WorkScheduleState();
}

class _WorkScheduleState extends State<WorkSchedule> {
  WorkingDay today;
  String currentDay;
  bool _isWorkingTime = false;

  bool isWorkingTime(WorkingDay date) {
    DateTime now = DateTime.now();
    if (currentDay == date.day) {
      int openHour = int.parse(date.openingTime.split(':')[0]);
      int openMinute = int.parse(date.openingTime.split(':')[1]);

      int closeHour = int.parse(date.closingTime.split(':')[0]);
      int closeMinute = int.parse(date.closingTime.split(':')[1]);
      if (now.hour >= openHour &&
          now.hour < (closeHour == 0 ? 24 : closeHour)) {
        return true;
      } else if (openHour == now.hour) {
        if (now.minute >= openMinute && now.minute <= closeMinute) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    currentDay = DateUtils.weekdays[now.weekday];
    final day = widget.workingDays.where((d) => d.day == currentDay).toList();
    today = day.isEmpty != true ? day.first : null;
    _isWorkingTime = today != null ? isWorkingTime(today) : false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Icon(
              Icons.access_time,
              size: 20.0,
              color: Colors.black.withOpacity(0.38),
            )),
        Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'График работы',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.54),
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(_isWorkingTime ? 'Открыто' : 'Закрыто',
                          style: TextStyle(
                              color: _isWorkingTime
                                  ? Theme.of(context).primaryColor
                                  : Color(0xFFFF473D),
                              fontSize: 14,
                              fontWeight: FontWeight.w600))
                    ],
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: widget.workingDays.length,
                      itemBuilder: (context, index) {
                        final WorkingDay date = widget.workingDays[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                date.day,
                                style: TextStyle(
                                    color: isWorkingTime(date)
                                        ? Colors.black
                                        : Colors.black.withOpacity(0.54),
                                    fontSize: 14,
                                    fontWeight: isWorkingTime(date)
                                        ? FontWeight.bold
                                        : FontWeight.w600),
                              ),
                              Text(
                                date.openingTime.toString() +
                                    ' - ' +
                                    date.closingTime.toString(),
                                style: TextStyle(
                                    color: isWorkingTime(date)
                                        ? Colors.black
                                        : Colors.black.withOpacity(0.54),
                                    fontSize: 14,
                                    fontWeight: isWorkingTime(date)
                                        ? FontWeight.bold
                                        : FontWeight.w600),
                              )
                            ],
                          ),
                        );
                      })
                ],
              ),
            )),
      ],
    );
  }
}

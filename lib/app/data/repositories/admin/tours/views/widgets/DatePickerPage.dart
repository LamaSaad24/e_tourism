import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerPage extends StatefulWidget {
  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  String _selectedDate = '';
  String _range = '';
  String start = '';
  String end="";

  /// استدعاء عند تغيير الاختيار في محدد التواريخ
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        start = '${DateFormat('yyyy-MM-dd').format(args.value.startDate)}';
        end = '${DateFormat('yyyy-MM-dd').format(args.value.endDate ?? args.value.startDate)}';
        _range = '${DateFormat('yyyy-MM-dd').format(args.value.startDate)} -'
            ' ${DateFormat('yyyy-MM-dd').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        _selectedDate = DateFormat('dd/MM/yyyy').format(args.value).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اختر التاريخ'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          // محدد التواريخ
          SfDateRangePicker(
            onSelectionChanged: _onSelectionChanged,
            selectionMode:
                DateRangePickerSelectionMode.range, // يمكن تغييرها حسب الحاجة
            initialSelectedRange: PickerDateRange(
              DateTime.now().subtract(const Duration(days: 2)),
              DateTime.now().add(const Duration(days: 2)),
            ),
          ),
          SizedBox(height: 20),
          // عرض التواريخ المختارة
          // Text('التاريخ المختار: $_selectedDate'),
          Text('النطاق المختار: $_range'),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/report', arguments: {
                'start': start,
                'end' : end
              });
            },
            child: Text('إنشاء تقرير', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:get/get.dart';

class DatePickerPage extends StatefulWidget {
  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  String selectedDate = '';
  String _range = '';

  /// استدعاء عند تغيير الاختيار في محدد التواريخ
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
            ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
      } else if (args.value is DateTime) {
        selectedDate = DateFormat('yyyy-MM-dd').format(args.value).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اختر التاريخ'),
      ),
      body: Column(
        children: [
          // محدد التواريخ
          SfDateRangePicker(
            onSelectionChanged: _onSelectionChanged,
            selectionMode:
                DateRangePickerSelectionMode.single, // يمكن تغييرها حسب الحاجة
            initialSelectedRange: PickerDateRange(
              DateTime.now().subtract(const Duration(days: 2)),
              DateTime.now().add(const Duration(days: 2)),
            ),
          ),
          SizedBox(height: 20),
          // عرض التواريخ المختارة
          Text('التاريخ المختار: $selectedDate'),
          ElevatedButton(
            onPressed: () {
              Get.toNamed('/available_programme',
                  arguments: {'id': selectedDate});
            },
            child: Text('عرض البرامج المتاحة',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

}

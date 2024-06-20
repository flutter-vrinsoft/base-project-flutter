import 'package:intl/intl.dart';
import 'package:base_project_flutter/export.dart';

class CustomDatePicker extends StatelessWidget {
  final Function(String) onDateSelected;

  const CustomDatePicker({super.key, required this.onDateSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );

        if (pickedDate != null) {
          String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
          onDateSelected(formattedDate);
        }
      },
      child: const Icon(Icons.calendar_month),
    );
  }
}

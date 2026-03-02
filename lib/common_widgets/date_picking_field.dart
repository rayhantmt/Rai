import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rai/utils/app_images.dart';

class DatePickerField extends StatelessWidget {
  final String tittle;
  final String hint;
  final TextEditingController? textcontroller;
  
  const DatePickerField({
    super.key,
    required this.tittle,
    required this.hint,
    this.textcontroller,
  });

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xffB2B3BD), // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: Colors.black, // Body text color
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && textcontroller != null) {
      // Format date as 2025-12-06
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      textcontroller!.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tittle,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color:Color(0xffEEEEF0),
          ),
        ),
        GestureDetector(
          onTap: () => _selectDate(context),
          child: Container(
            height: Get.height * 0.05,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppImages.primarycolor,
              border: Border.all(width: 1, color: Color(0xff5F606A)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: textcontroller,
                      readOnly: true, // Prevent keyboard from appearing
                      enabled: false, // Make it non-editable
                      decoration: InputDecoration(
                        hintText: hint,
                        hintStyle: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xffC7C7C7),
                        ),
                        border: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xffEEEEF0),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.calendar_month_outlined,
                    color: Color(0xffEEEEF0),
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
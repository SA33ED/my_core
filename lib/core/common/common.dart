import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../utils/app_colors.dart';
// import '../utils/app_text_styles.dart';
// import 'package:mime/mime.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:dio/dio.dart';
// import 'package:http_parser/http_parser.dart'; // For MediaType
// import 'package:bottom_sheet/bottom_sheet.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:url_launcher/url_launcher.dart';

String? displayDate(DateTime? dateTime) {
  if (dateTime == null) {
    return null;
  }
  return DateFormat('dd/MM/yyyy').format(dateTime);
}

String? displayDateAndTime(DateTime? dateTime) {
  if (dateTime == null) {
    return null;
  }
  return DateFormat('MM/dd/yyyy - hh:mm a').format(dateTime);
}

String? formatTimeOfDay(TimeOfDay? timeOfDay) {
  if (timeOfDay != null) {
    final hours = timeOfDay.hourOfPeriod == 0 ? 12 : timeOfDay.hourOfPeriod;
    final minutes = timeOfDay.minute.toString().padLeft(2, '0');
    final period = timeOfDay.period == DayPeriod.am ? "AM" : "PM";
    return "$hours:$minutes $period";
  }
  return null;
}

String formatDate(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  return DateFormat('dd MMM').format(dateTime);
}

String convertTime(DateTime? date) {
  if (date == null) {
    return '--:--';
  }
  return DateFormat('hh:mm a').format(date);
}

String generateRandomString(int length) {
  const characters =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();

  return List.generate(
      length, (index) => characters[random.nextInt(characters.length)]).join();
}

// Future<MultipartFile> uploadImageToAPI(XFile image) async {
//   // Get the mime type of the file
//   String? mimeType = lookupMimeType(image.path);

//   return MultipartFile.fromFile(
//     image.path,
//     filename: image.path.split('/').last,
//     contentType: MediaType.parse(
//         mimeType ?? 'image/jpeg'), // defaulting to image/jpeg if not found
//   );
// }

// Future launchCustomUrl(context, String? url) async {
//   if (url != null) {
//     Uri uri = Uri.parse(url);
//     await launchUrl(uri);
//   }
// }

// Future<void> launchPhoneDialer(context, String phoneNumber) async {
//   final Uri launchUri = Uri(
//     scheme: 'tel',
//     path: phoneNumber,
//   );
//   if (await canLaunchUrl(launchUri)) {
//     await launchUrl(launchUri);
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text("Cannot launch $phoneNumber"),
//       ),
//     );
//   }
// }

// Future<void> launchWhatsApp(context, String phoneNumber) async {
//   final Uri launchUri = Uri(
//     scheme: 'https',
//     host: 'wa.me',
//     path: phoneNumber,
//   );
//   if (await canLaunchUrl(launchUri)) {
//     await launchUrl(launchUri);
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text("Cannot Lunch $phoneNumber"),
//       ),
//     );
//   }
// }

// Future<void> launchEmailClient(
//     BuildContext context, String? emailAddress) async {
//   final Uri emailUri = Uri(
//     scheme: 'mailto',
//     path: emailAddress,
//   );
//   if (emailAddress != null) {
//     await launchUrl(emailUri);
//   }
// }

// Future<String?> convertWavToBase64() async {
//   try {
//     // Get the application documents directory
//     final directory = await getApplicationDocumentsDirectory();
//     final filePath = '${directory.path}/recording.wav';

//     // Read the file as bytes
//     final file = File(filePath);
//     if (await file.exists()) {
//       final bytes = await file.readAsBytes();

//       // Convert bytes to base64 string
//       final base64String = base64Encode(bytes);
//       printGreen(base64String);
//       return base64String;
//     } else {
//       printRed('File not found');
//       return null;
//     }
//   } catch (e) {
//     printRed('Error: $e');
//     return null;
//   }
// }


// showExpandedBottomSheet(
//   context, {
//   // required List<Widget> children,
//   required SliverChildDelegate Function(BuildContext, double) bodyBuilder,
//   Widget? header,
//   double? minHeight,
//   double? initHeight,
//   double? maxHeight,
//   double? headerHeight,
//   bool? isExpand,
//   bool? isDismissible,
//   bool? isCollapsible,
// }) {
//   showStickyFlexibleBottomSheet(
//     context: context,
//     minHeight: minHeight ?? 0,
//     initHeight: initHeight ?? 0.5,
//     maxHeight: maxHeight ?? 0.5,
//     headerHeight: headerHeight ?? 0.25,
//     keyboardBarrierColor: Colors.transparent,
//     isCollapsible: isCollapsible ?? false,
//     isDismissible: isDismissible ?? false,
//     isExpand: isExpand ?? false,
//     isSafeArea: true,
//     isModal: true,
//     bottomSheetBorderRadius: BorderRadius.only(
//       topLeft: Radius.circular(20.r),
//       topRight: Radius.circular(20.r),
//     ),
//     headerBuilder: (BuildContext context, double offset) {
//       return header ?? const SizedBox();
//     },
//     bodyBuilder: bodyBuilder,
//   );
// }

// showFixedBottomSheet(
//   BuildContext context, {
//   required Widget Function(BuildContext, ScrollController, double) builder,
//   double? minHeight,
//   double? initHeight,
//   double? maxHeight,
//   bool? isDismissible,
//   bool? isCollapsible,
//   bool? isExpand,
// }) {
//   showFlexibleBottomSheet(
//     context: context,
//     minHeight: minHeight ?? 0,
//     initHeight: initHeight ?? 0.4,
//     maxHeight: maxHeight ?? 0.4,
//     isExpand: isExpand ?? false,
//     isDismissible: isDismissible ?? false,
//     isCollapsible: isCollapsible ?? false,
//     bottomSheetBorderRadius: BorderRadius.only(
//       topLeft: Radius.circular(20.r),
//       topRight: Radius.circular(20.r),
//     ),
//     builder: builder,
//   );
// }


  import 'package:intl/intl.dart';

String dateFormat() {
     var currentDate = DateTime.now();
    
    var formattedCurrentDate =
        DateFormat.yMd().format(currentDate);
    return formattedCurrentDate;
  }

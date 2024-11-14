import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class AppUtils {
  static String getCurrentYear() {
    final now = DateTime.now();
    final formatter = DateFormat('yyyy');
    final formattedDate = formatter.format(now);
    return formattedDate;
  }

  static String reformatDate(String inputDate) {
    final parsedDate = DateFormat('yyyy-MM-dd').parse(inputDate);
    final formatter =
        DateFormat('d MMMM y', 'id'); // Format dalam bahasa Indonesia
    final formattedDate = formatter.format(parsedDate);
    return formattedDate;
  }

  static String reformatDateWithTime(String inputDate) {
    final parsedDate = DateFormat('yyyy-MM-ddTHH:mm:ss').parse(inputDate);
    final formatter =
        DateFormat('d MMMM y | HH:mm', 'id'); // Format dalam bahasa Indonesia
    final formattedDate = formatter.format(parsedDate);
    return formattedDate;
  }

  static String getTodayDate() {
    final now = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd');
    final formattedDate = formatter.format(now);
    return formattedDate;
  }

  static String getFirstDateOfYear() {
    final now = DateTime.now();
    final formatter = DateFormat('yyyy');
    final formattedDate = formatter.format(now);
    return "$formattedDate-01-01";
  }

  static String getLastDateOfYear() {
    final now = DateTime.now();
    final formatter = DateFormat('yyyy');
    final formattedDate = formatter.format(now);
    return "$formattedDate-12-31";
  }

  static String getDateDaysAgo(int dateCount) {
    final now = DateTime.now();
    final thirtyDaysAgo = now.subtract(Duration(days: dateCount));
    final formatter = DateFormat('yyyy-MM-dd');
    final formattedDate = formatter.format(thirtyDaysAgo);
    return formattedDate;
  }

  static String formatRupiah(int number) {
    final formatCurrency =
        NumberFormat.currency(locale: 'id', symbol: 'Rp ', decimalDigits: 0);
    return formatCurrency.format(number);
  }

  static String inputFormatCurrency(String text) {
    if (text.isEmpty) return '';
    final int value = int.parse(text);
    final formatter = NumberFormat('#,###');
    return formatter.format(value).replaceAll(',', '.');
  }

  static String addDate(String tanggalAwal, int jumlahHari) {
    var splitTanggalAwal = tanggalAwal.split("-");
    var resultDate = DateTime(int.parse(splitTanggalAwal[0]), int.parse(splitTanggalAwal[1]), int.parse(splitTanggalAwal[2])).add(Duration(days: jumlahHari - 1));
    var formatter = DateFormat('yyyy-MM-dd');
    return jumlahHari == 0 ? tanggalAwal : formatter.format(resultDate);
  }

  static String convertTimeFormat(String time) {
    List<String> parts = time.split(':');
    String formattedTime = '${parts[0]}:${parts[1]}';
    return formattedTime;
  }

  Future<void> launch(String url, {bool isNewTab = true}) async {
    await launchUrl(
      Uri.parse(url),
      webOnlyWindowName: isNewTab ? '_blank' : '_self',
    );
  }

  static const timeout = Duration(minutes: 3);
}

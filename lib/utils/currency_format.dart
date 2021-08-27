import 'package:intl/intl.dart';
import 'package:nyoba/provider/GeneralSettingsProvider.dart';
import 'package:nyoba/utils/utility.dart';
import 'package:provider/provider.dart';

stringToCurrency(double idr, context) {
  final currencySetting =
      Provider.of<GeneralSettingsProvider>(context, listen: false);

  var symbol = 'Rp ';
  var thousandSeparator = '.';
  var decimalSeparator = ',';
  var decimalNumber = 0;

  if (currencySetting.currency.title == 'IDR') {
    symbol = 'Rp ';
  } else {
    symbol = convertHtmlUnescape(currencySetting.currency.description);
  }
  decimalNumber = int.parse(currencySetting.formatCurrency.slug);
  thousandSeparator = currencySetting.formatCurrency.image;
  decimalSeparator = currencySetting.formatCurrency.title;

  final currency = NumberFormat.currency(
      symbol: symbol,
      decimalDigits: decimalNumber,
      customPattern: '$symbol#$thousandSeparator###$decimalSeparator#');
  String currencyString = currency.format(idr);
  return currencyString;
}

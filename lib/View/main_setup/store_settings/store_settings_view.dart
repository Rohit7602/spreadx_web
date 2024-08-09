import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/currency_picker_dialog.dart';
import 'package:country_currency_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/View/main_setup/security/security_view.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';
import 'package:timezone/timezone.dart' as tz;

class StoreSettingsView extends StatelessWidget {
  final void Function()? onPressedBack;
  StoreSettingsView({super.key, this.onPressedBack});

  final RxBool isVATEnabled = RxBool(false);

  final RxString currency = "AED".obs;
  final RxString timeZone = "GMT".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                onPressed: onPressedBack,
                icon: const Icon(Icons.arrow_back_outlined)),
          ),
          Expanded(
              child: Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                margin: const EdgeInsets.all(15).copyWith(right: 10, top: 10),
                width: 400,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: styleSheet.COLOR.primaryDarkBGColor, width: 10),
                    borderRadius: BorderRadius.circular(40)),
                child: Column(
                  children: [
                    Text("Business name",
                        style: styleSheet.TEXT_THEME.fs16Bold),
                    Text("Store name", style: styleSheet.TEXT_THEME.fs14Bold),
                    styleSheet.appConfig.addHeight(30),
                    Text("Tax Invoice", style: styleSheet.TEXT_THEME.fs14Bold),
                    Text("세금계산서", style: styleSheet.TEXT_THEME.fs14Bold),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Grand Total",
                            style: styleSheet.TEXT_THEME.fs14Bold),
                        Text("AED 2000.00",
                            style: styleSheet.TEXT_THEME.fs14Bold),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Column(
                children: [
                  SecurityListTile(
                      title: "Currency",
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => _CurrencyPickerDialog(
                                    onSelect: (Country country) {
                                  currency(country.currencyCode);
                                }));
                      },
                      subtitle:
                          "Preferred currency to show inside the application.",
                      trailing: Obx(() => Text(currency.value,
                          style: styleSheet.TEXT_THEME.fs16Bold.copyWith(
                              color: styleSheet.COLOR.primaryColor)))),
                  SecurityListTile(
                      title: "TimeZone",
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => _TimeZoneDialog(
                                    onSelect: (tz.Location location) {
                                  timeZone(
                                      location.currentTimeZone.abbreviation);
                                }));
                      },
                      subtitle: "Preferred timezone to show dates in.",
                      trailing: Obx(() => Text(timeZone.value,
                          style: styleSheet.TEXT_THEME.fs16Bold.copyWith(
                              color: styleSheet.COLOR.primaryColor)))),
                  SecurityListTile(
                      title: "Store Name",
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => const _EnterTextDialog());
                      },
                      trailing: Text("",
                          style: styleSheet.TEXT_THEME.fs16Bold
                              .copyWith(color: styleSheet.COLOR.primaryColor))),
                  SecurityListTile(
                      title: "Invoice Title",
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => const _EnterTextDialog());
                      },
                      subtitle: "Preferred title for tax invoices.",
                      divider: false,
                      trailing: Text("Tax Invoice",
                          style: styleSheet.TEXT_THEME.fs16Bold
                              .copyWith(color: styleSheet.COLOR.primaryColor))),
                  SecurityListTile(
                      title: "Invoice Title (Other)",
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => const _EnterTextDialog());
                      },
                      subtitle:
                          "Preferred title in the other language for tax invoices.",
                      divider: false,
                      trailing: Text("세금계산서",
                          style: styleSheet.TEXT_THEME.fs16Bold
                              .copyWith(color: styleSheet.COLOR.primaryColor))),
                  SecurityListTile(
                      title: "Return Title",
                      subtitle: "Preferred title for tax credit notes.",
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => const _EnterTextDialog());
                      },
                      divider: false,
                      trailing: Text("Tax Credit Note",
                          style: styleSheet.TEXT_THEME.fs16Bold
                              .copyWith(color: styleSheet.COLOR.primaryColor))),
                  SecurityListTile(
                      title: "Return Title (Other)",
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => const _EnterTextDialog());
                      },
                      subtitle:
                          "Preferred title in other language for tax credit notes.",
                      trailing: Text("Tax Credit Note",
                          style: styleSheet.TEXT_THEME.fs16Bold
                              .copyWith(color: styleSheet.COLOR.primaryColor))),
                  SecurityListTile(
                      title: "VAT",
                      subtitle:
                          "Enable or disable VAT management in invoices and summaries.",
                      divider: false,
                      onTap: () {
                        isVATEnabled(!(isVATEnabled.value));
                      },
                      trailing: Obx(() => Switch.adaptive(
                          value: isVATEnabled.value,
                          onChanged: (v) {
                            isVATEnabled(v);
                          }))),
                ],
              ))
            ],
          ))
        ],
      )),
    );
  }
}

class _CurrencyPickerDialog extends StatelessWidget {
  final Function(Country country) onSelect;
  const _CurrencyPickerDialog({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 400),
      child: Theme(
          data: Theme.of(context)
              .copyWith(primaryColor: styleSheet.COLOR.primaryColor),
          child: CurrencyPickerDialog(
              titlePadding: const EdgeInsets.all(8.0),
              searchCursorColor: styleSheet.COLOR.primaryColor,
              searchInputDecoration:
                  const InputDecoration(hintText: 'Search...'),
              isSearchable: true,
              title: const Text('Select your Currency'),
              onValuePicked: (Country country) {
                onSelect(country);
              },
              itemBuilder: _buildCurrencyDialogItem)),
    );
  }

  Widget _buildCurrencyDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          const SizedBox(width: 8.0),
          Text("(${country.currencyCode})"),
          const SizedBox(width: 8.0),
          Flexible(child: Text(country.name ?? ''))
        ],
      );
}

class _TimeZoneDialog extends StatelessWidget {
  final Function(tz.Location) onSelect;
  const _TimeZoneDialog({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    var locations = tz.timeZoneDatabase.locations;
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 400),
        child: Dialog(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15)
                      .copyWith(bottom: 10),
                  child: Text("Select Time Zone",
                      style: styleSheet.TEXT_THEME.fs20Bold),
                ),
                Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: locations.keys.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                              onTap: () {
                                onSelect((locations.values.toList())[i]);
                                Navigator.of(context).pop();
                              },
                              title: Text((locations.keys.toList())[i]));
                        }))
              ],
            ),
          ),
        ));
  }
}

class _EnterTextDialog extends StatelessWidget {
  const _EnterTextDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 450),
      child: Dialog(
        child: Padding(
          padding: styleSheet.DECORATION.PADDING_20,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Enter Text", style: styleSheet.TEXT_THEME.fs16Bold),
              styleSheet.appConfig.addHeight(20),
              SecondaryTextFormField(
                  onTap: () => openVirtualKeyboard(),
                  hinttext: "Your Value",
                  fillColor: false),
              styleSheet.appConfig.addHeight(20),
              PrimaryBtnView(
                  btnName: "Submit",
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  isExpanded: true)
            ],
          ),
        ),
      ),
    );
  }
}

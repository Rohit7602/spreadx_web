import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/currency_picker_dialog.dart';
import 'package:country_currency_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spreadx_web/Components/Button/primary_btn.dart';
import 'package:spreadx_web/Components/Controller/users_controller.dart';
import 'package:spreadx_web/Components/Dialog/Widget/header_dialog.dart';
import 'package:spreadx_web/Components/Dropdown/primary_drop_down.dart';
import 'package:spreadx_web/Components/primary_textfield.dart';
import 'package:spreadx_web/Responsive/responsive_handler.dart';
import 'package:spreadx_web/View/main_setup/security/security_view.dart';
import 'package:spreadx_web/keyboard_handler.dart';
import 'package:spreadx_web/main.dart';
import 'package:timezone/timezone.dart' as tz;

class StoreSettingsView extends StatelessWidget {
  final void Function()? onPressedBack;
  StoreSettingsView({super.key, this.onPressedBack});

  final userController = Get.find<UsersController>();

  final RxString currency = "AED".obs;
  final RxString timeZone = "GMT".obs;

  final RxString storeName = "".obs;
  final RxString invoiceTitle = "".obs;
  final RxString invoiceTitleOther = "".obs;

  final RxString returnTitle = "".obs;
  final RxString returnTitleOther = "".obs;

  final RxString trnValue = "".obs;
  final RxString defaultVat = "0.0".obs;

  final RxString vatType = "".obs;

  final RxBool showDrop = RxBool(false);

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
                    Obx(
                      () => Text(storeName.value,
                          style: styleSheet.TEXT_THEME.fs14Bold),
                    ),
                    Obx(() {
                      return userController.setVatValue.value
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("TRN: ",
                                    style: styleSheet.TEXT_THEME.fs14Bold),
                                Text(trnValue.value,
                                    style: styleSheet.TEXT_THEME.fs14Bold)
                              ],
                            )
                          : const SizedBox();
                    }),
                    styleSheet.appConfig.addHeight(30),
                    Obx(
                      () => Text(invoiceTitle.value,
                          style: styleSheet.TEXT_THEME.fs14Bold),
                    ),
                    Obx(
                      () => Text(invoiceTitleOther.value,
                          style: styleSheet.TEXT_THEME.fs14Bold),
                    ),
                    styleSheet.appConfig.addHeight(20),
                    Obx(() {
                      return userController.setVatValue.value
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total VAT",
                                    style: styleSheet.TEXT_THEME.fs14Bold),
                                Text("AED 100.00",
                                    style: styleSheet.TEXT_THEME.fs14Bold),
                              ],
                            )
                          : const SizedBox();
                    }),
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
                  child: ListView(
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
                                builder: (context) => _EnterTextDialog())
                            .then((val) {
                          if (val != null) {
                            storeName(val);
                          }
                        });
                      },
                      trailing: Obx(
                        () => Text(storeName.value,
                            style: styleSheet.TEXT_THEME.fs16Bold.copyWith(
                                color: styleSheet.COLOR.primaryColor)),
                      )),
                  SecurityListTile(
                      title: "Invoice Title",
                      onTap: () {
                        showDialog(
                                context: context,
                                builder: (context) => _EnterTextDialog())
                            .then((val) {
                          if (val != null) {
                            invoiceTitle(val);
                          }
                        });
                      },
                      subtitle: "Preferred title for tax invoices.",
                      divider: false,
                      trailing: Obx(() => Text(invoiceTitle.value,
                          style: styleSheet.TEXT_THEME.fs16Bold.copyWith(
                              color: styleSheet.COLOR.primaryColor)))),
                  SecurityListTile(
                      title: "Invoice Title (Other)",
                      onTap: () {
                        showDialog(
                                context: context,
                                builder: (context) => _EnterTextDialog())
                            .then((val) {
                          if (val != null) {
                            invoiceTitleOther(val);
                          }
                        });
                      },
                      subtitle:
                          "Preferred title in the other language for tax invoices.",
                      divider: false,
                      trailing: Obx(() => Text(invoiceTitleOther.value,
                          style: styleSheet.TEXT_THEME.fs16Bold.copyWith(
                              color: styleSheet.COLOR.primaryColor)))),
                  SecurityListTile(
                    title: "Return Title",
                    subtitle: "Preferred title for tax credit notes.",
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => _EnterTextDialog()).then((val) {
                        if (val != null) {
                          return returnTitle(val);
                        }
                      });
                    },
                    divider: false,
                    trailing: Obx(() => Text(returnTitle.value,
                        style: styleSheet.TEXT_THEME.fs16Bold
                            .copyWith(color: styleSheet.COLOR.primaryColor))),
                  ),
                  SecurityListTile(
                    title: "Return Title (Other)",
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => _EnterTextDialog()).then((val) {
                        if (val != null) {
                          returnTitleOther(val);
                        }
                      });
                    },
                    subtitle:
                        "Preferred title in other language for tax credit notes.",
                    trailing: Obx(() => Text(returnTitleOther.value,
                        style: styleSheet.TEXT_THEME.fs16Bold
                            .copyWith(color: styleSheet.COLOR.primaryColor))),
                  ),
                  SecurityListTile(
                    title: "VAT",
                    subtitle:
                        "Enable or disable VAT management in invoices and summaries.",
                    divider: false,
                    onTap: () {
                      userController
                          .setVatValue(!(userController.setVatValue.value));
                    },
                    trailing: Obx(
                      () => Switch.adaptive(
                        value: userController.setVatValue.value,
                        onChanged: (v) {
                          userController.setVatValue(v);
                        },
                      ),
                    ),
                  ),
                  Obx(() {
                    return userController.setVatValue.value
                        ? Column(
                            children: [
                              Obx(
                                () => Stack(
                                  children: [
                                    SecurityListTile(
                                        divider: false,
                                        title: "VAT Type",
                                        onTap: () {
                                          showDrop(true);
                                        },
                                        subtitle: "Select VAT Type (Inc./Exc.)",
                                        trailing: Text(vatType.value,
                                            style: styleSheet
                                                .TEXT_THEME.fs16Bold
                                                .copyWith(
                                                    color: styleSheet
                                                        .COLOR.primaryColor))),
                                    showDrop.value
                                        ? Container(
                                            margin:
                                                const EdgeInsets.only(top: 60),
                                            decoration: BoxDecoration(
                                                boxShadow: styleSheet
                                                    .DECORATION.primaryShadow,
                                                color:
                                                    styleSheet.COLOR.whiteColor,
                                                borderRadius: styleSheet
                                                    .DECORATION.RADIUS_10),
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  onTap: () {
                                                    vatType("VAT Include");
                                                    showDrop(false);
                                                  },
                                                  title:
                                                      const Text("VAT Include"),
                                                ),
                                                ListTile(
                                                  onTap: () {
                                                    vatType("VAT Exclude");
                                                    showDrop(false);
                                                  },
                                                  title:
                                                      const Text("VAT Exclude"),
                                                ),
                                              ],
                                            ),
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                              ),
                              styleSheet.appConfig.addHeight(10),
                              SecurityListTile(
                                  divider: false,
                                  title: "TRN",
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => _EnterTextDialog(
                                              title: "TRN",
                                              hintText: "Enter TRN",
                                            )).then((val) {
                                      if (val != null) {
                                        trnValue(val);
                                      }
                                    });
                                  },
                                  subtitle:
                                      "The Tax Registration Number assigned to the store",
                                  trailing: Obx(() => Text(trnValue.value,
                                      style: styleSheet.TEXT_THEME.fs16Bold
                                          .copyWith(
                                              color: styleSheet
                                                  .COLOR.primaryColor)))),

                              // Obx(() => PrimaryDropDown(
                              //     hint: "VAT Included ",
                              //     isExpanded: true,
                              //     dropdownValue: vatType.value,
                              //     border: true,
                              //     items: const ["VAT Include", "VAT Exclude"],
                              //     value: (v) =>
                              //         vatType(v))).paddingSymmetric(
                              //     horizontal: 20),
                              styleSheet.appConfig.addHeight(12),
                              SecurityListTile(
                                  divider: false,
                                  title: "Default VAT",
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => _EnterTextDialog(
                                              title: "Enter VAT",
                                              hintText: "0.0",
                                            )).then((val) {
                                      if (val != null) {
                                        defaultVat(val);
                                      }
                                    });
                                  },
                                  subtitle:
                                      "Default VAT value to show and use.",
                                  trailing: Obx(() => Text(defaultVat.value,
                                      style: styleSheet.TEXT_THEME.fs16Bold
                                          .copyWith(
                                              color: styleSheet
                                                  .COLOR.primaryColor))))
                            ],
                          )
                        : const SizedBox();
                  })
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
    return Center(
      child: Container(
        constraints: BoxConstraints(
            maxWidth: styleSheet.appConfig.getScreenWidth(context) *
                ResponsiveHandler().getResponsiveness(context).dialogWidth),
        child: CurrencyPickerDialog(
            titlePadding: const EdgeInsets.all(8.0),
            searchCursorColor: styleSheet.COLOR.primaryColor,
            searchInputDecoration: const InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: const Text('Select your Currency'),
            onValuePicked: (Country country) {
              onSelect(country);
            },
            itemBuilder: _buildCurrencyDialogItem),
      ),
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
    return CustomHeaderDialog(
        title: "",
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
        ));
  }
}

class _EnterTextDialog extends StatelessWidget {
  String title;
  String hintText;

  _EnterTextDialog({this.title = "", this.hintText = "", super.key});

  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomHeaderDialog(
        title: "",
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Enter ${title.isNotEmpty ? title : "Text"}",
                style: styleSheet.TEXT_THEME.fs16Bold),
            styleSheet.appConfig.addHeight(20),
            SecondaryTextFormField(
                controller: valueController,
                onTap: () => openVirtualKeyboard(),
                hinttext: hintText.isNotEmpty ? hintText : "Your Value",
                fieldColor: false),
            styleSheet.appConfig.addHeight(20),
            PrimaryBtnView(
                btnName: "Submit",
                onPressed: () {
                  Navigator.of(context).pop(valueController.text);
                },
                isExpanded: true)
          ],
        ));
  }
}

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_clone/common/helper/show_alert_dialog.dart';
import 'package:whatsapp_clone/common/widgets/custom_elevated_button.dart';
import 'package:whatsapp_clone/common/widgets/custom_icon_button.dart';
import 'package:whatsapp_clone/constants/colors.dart';
import 'package:whatsapp_clone/feature/auth/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;

  sendCodeToPhone() {
    final phone = phoneNumberController.text;
    final name = countryNameController.text;

    if (phone.isEmpty) {
      return showAlertDialog(
        context: context,
        message: "Please enter your phone number",
      );
    } else if (phone.length < 9) {
      return showAlertDialog(
        context: context,
        message: "The phone number you entered is too short for the country: $name. \n\nInclude your area code if yoe haven't",
      );
    } else if (phone.length > 10) {
      return showAlertDialog(context: context, message: "The phone number you entered is too long for the country: $name");
    }
  }

  showCountryCodePicker() {
    showCountryPicker(
        context: context,
        showPhoneCode: true,
        favorite: ['ET'],
        countryListTheme: CountryListThemeData(
          bottomSheetHeight: 600,
          backgroundColor: AppColors.backgroundDark,
          flagSize: 22,
          borderRadius: BorderRadius.circular(20),
          textStyle: TextStyle(color: context.theme.greyColor),
          inputDecoration: InputDecoration(
              labelStyle: TextStyle(color: context.theme.greyColor),
              prefixIcon: const Icon(
                Icons.language,
                color: AppColors.greenDark,
              ),
              hintText: 'Search country code or name',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: context.theme.greyColor!.withOpacity(0.2)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.greenDark),
              )),
        ),
        onSelect: (country) {
          countryNameController.text = country.name;
          countryCodeController.text = country.countryCode;
        });
  }

  @override
  void initState() {
    countryNameController = TextEditingController(text: 'Ethiopia');
    countryCodeController = TextEditingController(text: '251');
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    countryNameController.dispose();
    countryCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          "Enter your number phone",
          style: TextStyle(color: context.theme.authAppbarTextColor),
        ),
        centerTitle: true,
        actions: [
          CustomIconButton(
            onTap: () {},
            icon: Icons.more_vert,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "WhatsApp will need to verify your phone number. ",
                  style: TextStyle(
                    color: context.theme.greyColor,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text: "What's my number?",
                      style: TextStyle(
                        color: context.theme.blueColor,
                      ),
                    )
                  ]),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CustomTextField(
              onTap: showCountryCodePicker,
              controller: countryNameController,
              readOnly: true,
              suffixIcon: const Icon(
                Icons.arrow_drop_down,
                color: AppColors.greenDark,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  child: CustomTextField(
                    onTap: showCountryCodePicker,
                    controller: countryCodeController,
                    prefixText: '+',
                    readOnly: true,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: CustomTextField(
                  controller: phoneNumberController,
                  hintText: 'phone number',
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.number,
                ))
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Carrier charges my apply",
            style: TextStyle(color: context.theme.greyColor),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        onPressed: sendCodeToPhone,
        text: 'NEXT',
        buttonWidth: 90,
      ),
    );
  }
}

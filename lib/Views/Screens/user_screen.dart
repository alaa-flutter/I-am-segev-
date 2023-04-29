import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../Const/color_theme.dart';
import '../../Helpers/warning_dialog.dart';
import '../../Providers/lang_provider.dart';
import '../../Providers/theme_provider.dart';
import '../Widgets/custom_list_tile.dart';
import '../Widgets/custom_text.dart';


class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen>with WarningDialogHelper {
  late TextEditingController addressEditingController;
  @override
  void initState() {
    addressEditingController = TextEditingController(text: 'BitLid');
    super.initState();
  }

  @override
  void dispose() {
    addressEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color color = ColorTheme(context).color;
    return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 36,
                  ),
                  Row(
                    children: [
                      CustomText(
                        title: 'Hi, ',
                        color: Colors.cyan,
                        fontSize: 27.sp,
                        isTitle: true,
                      ),
                      CustomText(
                        title: 'Oday',
                        color: color,
                        fontSize: 25.sp,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  CustomText(
                    title: 'oday@gmail.com',
                    color: Colors.grey,
                    fontSize: 18.sp,
                    isTitle: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomListTile(
                    title: 'Address',
                    subtitle: 'My Address',
                    leading: IconlyLight.profile,
                    onPressed: () async {
                      await buildAddressDialog(context);
                    },
                  ),
                  CustomListTile(
                    title: 'Forgot Password',
                    leading: IconlyLight.unlock,
                    onPressed: () {
                      ///
                    },
                  ),
                  SwitchListTile(
                    title: CustomText(
                      title: Provider.of<ThemeProvider>(context).isDarkMode
                          ? 'Light Mode'
                          : 'Dark Mode',
                      color:  color,
                      fontSize: 22.sp,
                      isTitle: true,
                    ),
                    secondary: Icon(Provider.of<ThemeProvider>(context).isDarkMode
                        ?Icons.light_mode_outlined
                        : Icons.dark_mode_outlined),
                    value: Provider.of<ThemeProvider>(context).isDarkMode,
                    onChanged: (bool value) {
                      setState(() {
                        Provider.of<ThemeProvider>(context , listen: false).toggleTheme(value);
                      });
                    },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomListTile(
                    title: Provider.of<LangProviders>(context).lang_ == 'en'
                        ? 'العربية'
                        : 'Language',
                    leading: Icons.language,
                    onPressed: () async {
                      await Provider.of<LangProviders>(context, listen: false)
                          .changeLanguage();
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomListTile(
                    title: 'Logout',
                    leading: IconlyLight.logout,
                    onPressed: ()  {
                      showWarningDialog(context, title:'Sign out', subtitle: 'Do you wanna sign out ?', actionOK: (){});
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> buildAddressDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update'),
        content: TextField(
          controller: addressEditingController,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: 'Your Address',
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                ///
              },
              child: const Text(
                'Update',
              )),
        ],
      ),
    );
  }

}

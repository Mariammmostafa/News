import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newss_app/core/cubit/main_cubit/main_cubit.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String _selectedLanguage = 'en';

  late MainCubit _mainCubit;

  @override
  void initState() {
    super.initState();
    _mainCubit = BlocProvider.of<MainCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(
                  Icons.imagesearch_roller_outlined,
                  color: Colors.white,
                ),
                SizedBox(width: 6),
                Text(
                  "Theme",
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(
                color: Colors.white,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Light Theme',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                CupertinoSwitch(
                  value: !_mainCubit.isDark,
                  onChanged: (value) {
                    _mainCubit.changeAppTheme();
                    Scaffold.of(context).closeDrawer();
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                SizedBox(width: 6),
                Text(
                  "Language",
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(
                color: Colors.white,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Language',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                CupertinoButton(
                  onPressed: () async {
                    String? newLanguage = await showCupertinoDialog<String>(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: const Text('Choose Language'),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            child: const Text('English'),
                            onPressed: () {
                              Navigator.pop(context, 'en');
                            },
                          ),
                          CupertinoDialogAction(
                            child: const Text('Arabic'),
                            onPressed: () {
                              Navigator.pop(context, 'ar');
                            },
                          ),
                        ],
                      ),
                    );

                    if (newLanguage != null) {
                      setState(() {
                        _selectedLanguage = newLanguage;
                      });
                    }
                  },
                  child: Text(
                    _selectedLanguage == 'en' ? 'English' : 'Arabic',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

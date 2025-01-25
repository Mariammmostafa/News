import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isLightTheme = true;
  String _selectedLanguage = 'en';

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
          SizedBox(
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
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Light Theme',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                CupertinoSwitch(
                  value: _isLightTheme,
                  onChanged: (value) {
                    setState(() {
                      _isLightTheme = value;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
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
          SizedBox(
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
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Language',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                CupertinoButton(
                  onPressed: () async {
                    String? newLanguage = await showCupertinoDialog<String>(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: Text('Choose Language'),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            child: Text('English'),
                            onPressed: () {
                              Navigator.pop(context, 'en');
                            },
                          ),
                          CupertinoDialogAction(
                            child: Text('Arabic'),
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
                  child: Text(_selectedLanguage == 'en' ? 'English' : 'Arabic'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

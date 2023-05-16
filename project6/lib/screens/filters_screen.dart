import 'package:flutter/material.dart';
import 'package:project6/widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isInSummer = false;
  var _isForFamilies = false;
  var _isInWinter = false;

  Widget BuiledSwitchListTile(
      String title, String subTitle, var value, void Function(bool)? onchange) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: value,
      onChanged: onchange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("الفلترة"),
        ),
        drawer: const AppDrawer(),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView(
                children: [
                  BuiledSwitchListTile(
                    "الرحلات الصيفية فقط",
                    'اظهار الرحلات الصيفية فقط',
                    _isInSummer,
                    (neValue) {
                      setState(() {
                        _isInSummer = neValue;
                      });
                    },
                  ),
                  BuiledSwitchListTile(
                    "الرحلات الشتوية فقط",
                    'اظهار الرحلات الشتوية فقط',
                    _isInWinter,
                    (neValue) {
                      setState(() {
                        _isInWinter = neValue;
                      });
                    },
                  ),
                  BuiledSwitchListTile(
                    "الرحلات العائلية فقط",
                    "اظهار الرحلات العائلية فقط",
                    _isForFamilies,
                    (neValue) {
                      setState(() {
                        _isForFamilies = neValue;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

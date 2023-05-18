import 'package:flutter/material.dart';
import 'package:project6/widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const screenRoute = "/filter_screen";
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _summer = false;
  var _family = false;
  var _winter = false;

  @override
  void initState() {
    _summer = widget.currentFilters["summer"] as bool;
    _winter = widget.currentFilters["winter"] as bool;
    _family = widget.currentFilters["family"] as bool;

    // TODO: implement initState
    super.initState();
  }

  Widget BuiledSwitchListTile(String title, String subTitle, var cueValue,
      void Function(bool)? onchange) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: cueValue,
      onChanged: onchange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("الفلترة"),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  "summer": _summer,
                  "winter": _winter,
                  "family": _family,
                };
                widget.saveFilters(selectedFilters);
              },
            )
          ],
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
                    _summer,
                    (neValue) {
                      setState(() {
                        _summer = neValue;
                      });
                    },
                  ),
                  BuiledSwitchListTile(
                    "الرحلات الشتوية فقط",
                    'اظهار الرحلات الشتوية فقط',
                    _winter,
                    (neValue) {
                      setState(() {
                        _winter = neValue;
                      });
                    },
                  ),
                  BuiledSwitchListTile(
                    "الرحلات العائلية فقط",
                    "اظهار الرحلات العائلية فقط",
                    _family,
                    (neValue) {
                      setState(() {
                        _family = neValue;
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

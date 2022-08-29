import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:revanced_manager/app/app.locator.dart';
import 'package:revanced_manager/ui/views/home/home_viewmodel.dart';
import 'package:revanced_manager/ui/widgets/shared/application_item.dart';

class InstalledAppsCard extends StatelessWidget {
  const InstalledAppsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      children: locator<HomeViewModel>()
          .patchedInstalledApps
          .map((app) => ApplicationItem(
                icon: app.icon,
                name: app.name,
                patchDate: app.patchDate,
                changelog: app.changelog,
                isUpdatableApp: false,
                onPressed: () => DeviceApps.openApp(app.packageName),
              ))
          .toList(),
    );
  }
}

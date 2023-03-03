import 'package:flutter/material.dart';
import 'package:perf_rse/modules/styled_scrollview.dart';

import '../../../../constants/colors.dart';
import '../../../../helper/responsive.dart';
import 'components/header.dart';

import 'components/my_fields.dart';
import 'components/recent_files.dart';
import 'components/storage_details.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          const Header(),
          const SizedBox(height: defaultPadding),
          Expanded(child: StyledScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5,child: Container(
                  child: Column(
                    children: [
                      MyFiles(),
                      SizedBox(height: defaultPadding),
                      RecentFiles()
                    ],
                  ),
                )),
                if (!Responsive.isMobile(context))
                const SizedBox(width: defaultPadding),
                if (!Responsive.isMobile(context))
                const Expanded(flex: 2,child: StarageDetails())
              ],
            ),
          )),
        ],
      ),
    );
  }
}

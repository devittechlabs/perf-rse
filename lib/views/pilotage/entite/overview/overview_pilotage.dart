import 'package:flutter/material.dart';
import 'package:perf_rse/modules/styled_scrollview.dart';

import '../../../../constants/colors.dart';
import '../../../../helper/responsive.dart';
import 'widgets/header_overview.dart';

import 'widgets/suivi_details/section_suivi.dart';
import 'widgets/contributeur/liste_contributeur.dart';
import 'widgets/suivi_details/suivi_details.dart';

class OverviewPilotage extends StatelessWidget {
  const OverviewPilotage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      child: StyledScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 5,child: Column(
              children: const [
                SectionSuivi(),
                SizedBox(height: defaultPadding),
                ListeContributeur()
              ],
            )),
            if (!Responsive.isMobile(context))
            const SizedBox(width: defaultPadding),
            if (!Responsive.isMobile(context))
            const Expanded(flex: 2,child: SuiviDetails())
          ],
        ),
      ),
    );
  }
}

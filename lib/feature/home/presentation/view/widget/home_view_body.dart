import 'package:flutter/material.dart';
import 'package:quran_app/feature/home/presentation/manager/location/location_cubit.dart';
import 'package:quran_app/feature/home/presentation/manager/quran/quran_cubit.dart';
import 'package:quran_app/feature/home/presentation/view/customer_tap_ber.dart';
import 'package:quran_app/feature/home/presentation/view/widget/customer_adan.dart';
import 'package:quran_app/feature/home/presentation/view/widget/customer_last_read.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RefreshIndicator(
        onRefresh: () async {
          await LocationCubit.get(context).getLocation();
          await LocationCubit.get(context).getAdan();
          await QuranCubit.get(context).fetchAllQuran();
        },
        child: const CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomerAdan(),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 5),
                    child: Text("Reading surah"),
                  ),
                  CustomerLastRead(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: CustomerTapBer(),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/widget/customer_error.dart';
import 'package:quran_app/core/widget/customer_loading.dart';
import 'package:quran_app/feature/home/presentation/manager/surah/surah_cubit.dart';
import 'package:quran_app/feature/home/presentation/manager/surah/surah_states.dart';
import 'package:quran_app/feature/home/presentation/view/widget/customer_list_surah.dart';
import 'package:quran_app/feature/home/presentation/view/widget/customer_shap_details.dart';
import 'package:quran_app/feature/home/presentation/view/widget/customer_top_details_quran.dart';

class DetailsQuranBody extends StatelessWidget {
  const DetailsQuranBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Surah"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.navigate_before_rounded, size: 26)),
      ),
      body: BlocBuilder<SurahCubit, SurahStates>(
        builder: (context, state) {
          if (state is SuccessSurahStates) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        CustomerTopDetailsQuran(
                          surahModel: state.surah[0],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomerShapeDetails(),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomerListSurah(
                          surahModel: state.surah[0],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is FailureSurahStates) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomerError(errorMessage: state.errorMessage),
            );
          } else {
            return const CustomerLoading();
          }
        },
      ),
    );
  }
}

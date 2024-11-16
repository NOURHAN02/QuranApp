import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/utils/style/styles.dart';
import 'package:quran_app/feature/bearish/presentation/manager/bearish/bearish_cubit.dart';
import 'package:quran_app/feature/bearish/presentation/manager/bearish/bearish_states.dart';

class BearishViewBody extends StatelessWidget {
  const BearishViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BearishCubit, BearishStates>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Text(
                  "${BearishCubit.get(context).currentCount}",
                  style: Styles.textStyle20.copyWith(
                    fontSize: 50,
                    color: Colors.purpleAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () => BearishCubit.get(context).incrementCount(),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: const LinearGradient(
                      colors: [Colors.purpleAccent, Colors.deepPurple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.4),
                        spreadRadius: 5,
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton.icon(
                onPressed: () => BearishCubit.get(context).restartCount(),
                icon: const Icon(Icons.refresh, color: Colors.purpleAccent),
                label: const Text(
                  'إعادة ضبط',
                  style: TextStyle(
                    color: Colors.purpleAccent,
                    fontSize: 18,
                  ),
                ),
                style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  backgroundColor: Colors.purple[50],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

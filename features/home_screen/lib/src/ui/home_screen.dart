import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navigation/navigation.dart';
import '../bloc/home_bloc.dart';
import 'package:core/core.dart';
import 'widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(appRouter: appLocator.get<AppRouter>())
            ..add(const LoadHomeDataEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            onTap: () {
              context.read<HomeBloc>().add(const LogoPressedEvent());
            },
            child: Text(
              LocaleKeys.appName.tr(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              context.read<HomeBloc>().add(const MenuPressedEvent());
            },
          ),
          actions: [
            ShowSettingsBottomSheet(
              logout: const BackAuthorizationScreenEvent(),
            ),
          ],
        ),

        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.status == HomeStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? LocaleKeys.mainPage_homeScreen_error.tr()),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state.status == HomeStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.status == HomeStatus.error) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(LocaleKeys.mainPage_homeScreen_somethingWentWrong.tr()),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<HomeBloc>().add(const LoadHomeDataEvent());
                      },
                      child: Text(LocaleKeys.mainPage_homeScreen_retry.tr()),
                    ),
                  ],
                ),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      context.read<HomeBloc>().add(
                        const RefreshHomeDataEvent(),
                      );
                      await context.read<HomeBloc>().stream.firstWhere(
                        (s) => s.status != HomeStatus.loading,
                      );
                    },
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(children: []),
                    ),
                  ),
                ),

                BottomNavigationBar(
                  currentIndex: state.selectedTabIndex,
                  onTap: (index) {
                    context.read<HomeBloc>().add(ChangeTabEvent(index));
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.person),
                      label: LocaleKeys.mainPage_homeScreen_exercises.tr(),
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.fitness_center),
                      label: LocaleKeys.mainPage_homeScreen_trainings.tr(),
                    ),
                    BottomNavigationBarItem(
                      icon: const Icon(Icons.menu_book),
                      label: LocaleKeys.mainPage_homeScreen_info.tr(),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

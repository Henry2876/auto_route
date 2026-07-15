import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(const LoadHomeData()),
      child: Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            onTap: () {
              context.read<HomeBloc>().add(const LogoPressed());
            },
            child: const Text(
              'FI',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              context.read<HomeBloc>().add(const MenuPressed());
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                context.read<HomeBloc>().add(const SettingsPressed());
              },
            ),
          ],
        ),

        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.status == HomeStatus.error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? 'Ошибка'),
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
                    const Text('Что-то пошло не так'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<HomeBloc>().add(const LoadHomeData());
                      },
                      child: const Text('Повторить'),
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
                      context.read<HomeBloc>().add(const RefreshHomeData());
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
                    context.read<HomeBloc>().add(ChangeTab(index));
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Упражнения',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.fitness_center),
                      label: 'Тренировки',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.menu_book),
                      label: 'Знания',
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

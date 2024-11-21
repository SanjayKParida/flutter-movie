import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie/core/theme/app_theme.dart';
import 'package:iconly/iconly.dart';

import '../bloc/movie_bloc.dart';
import '../bloc/movie_event.dart';
import '../pages/home_page.dart';
import '../pages/search_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = [
    const HomePage(),
    const SearchPage(),
  ];

  void _onItemTapped(int index) {
    if (index == 0) {
      context.read<MovieBloc>().add(FetchAllMoviesEvent());
    }
    if (index == 1) {
      context.read<MovieBloc>().add(ClearMoviesEvent());
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.search),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppTheme.primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}

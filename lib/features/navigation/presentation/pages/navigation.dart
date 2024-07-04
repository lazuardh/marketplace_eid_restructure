import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../lib.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final List<BottomNavigationEntity> _bottomNavList =
      BottomNavigationEntity.bottomNavList;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationCubit(),
      child: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, state) {
          if (state is BottomNavigationChangedIndex) {
            _selectedIndex = state.selectedIndex;
          }
          return BottomNavigationWrapper(
            keys: _key,
            selectedIndex: _selectedIndex,
            bottomNavList: _bottomNavList,
          );
        },
      ),
    );
  }
}

class BottomNavigationWrapper extends StatefulWidget {
  final int _selectedIndex;
  final GlobalKey<ScaffoldState> _keys;
  final List<BottomNavigationEntity> _bottomNavList;
  const BottomNavigationWrapper({
    Key? key,
    required int selectedIndex,
    required GlobalKey<ScaffoldState> keys,
    required List<BottomNavigationEntity> bottomNavList,
  })  : _selectedIndex = selectedIndex,
        _keys = keys,
        _bottomNavList = bottomNavList,
        super(key: key);

  @override
  State<BottomNavigationWrapper> createState() =>
      _BottomNavigationWrapperState();
}

class _BottomNavigationWrapperState extends State<BottomNavigationWrapper>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ScaffoldConstraint(
      keyScaffold: widget._keys,
      onWillPop: () {},
      resizeToAvoidBottomInset: false,
      isBottomNavBar: true,
      bottomNavigationBar: _bottomNavigation(context),
      child: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: widget._selectedIndex,
              children: const [
                HomeScreen(),
                ArticleScreen(),
                FavoriteScreen(),
                HistoryScreen(),
                ProfileScreen(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _bottomNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.neutral200, width: 1),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, -1),
            blurRadius: 0,
            spreadRadius: 0,
            color: AppColors.neutral100,
          )
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        currentIndex: widget._selectedIndex,
        selectedFontSize: AppFontSize.extraSmall,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: (index) => _onItemTapped(index, context),
        items: <BottomNavigationBarItem>[
          ...List.generate(
            widget._bottomNavList.length,
            (index) => BottomNavigationBarItem(
              icon: widget._bottomNavList[index].icon,
              activeIcon: widget._bottomNavList[index].activeIcon,
              label: widget._bottomNavList[index].label,
            ),
          )
        ],
      ),
    );
  }

  Future<void> _onItemTapped(int index, BuildContext ctx) async {
    FocusScope.of(context).unfocus();
    FocusScope.of(context).requestFocus(FocusNode());

    context.read<BottomNavigationCubit>().changeTab(index);
  }
}

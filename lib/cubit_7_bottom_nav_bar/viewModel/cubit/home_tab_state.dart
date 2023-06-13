part of 'home_tab_cubit.dart';

enum HomeTab { page1, page2 }

@immutable
class HomeState extends Equatable {
  final HomeTab homeTab;

  const HomeState({this.homeTab = HomeTab.page1});

  @override
  List<Object?> get props => [homeTab];

  HomeState copWith({HomeTab? homeTab}) {
    return HomeState(homeTab: homeTab ?? this.homeTab);
  }
}

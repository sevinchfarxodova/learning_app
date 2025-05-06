import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:learingn_app/features/homepage/presentation/pages/search/search_history.dart';
import 'package:learingn_app/features/homepage/presentation/pages/search/search_result.dart';
import '../../../../../core/constants/colors/app_colors.dart';
import '../../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../../profile_settings_page/presentation/pages/help_center/widgets/choice_chip.dart';
import '../../bloc/home_event.dart';
import '../../bloc/search/search_bloc.dart';
import '../../bloc/search/search_state.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();
  bool _isFocused = false;
  String _query = "";
  RangeValues _currentRangeValues = const RangeValues(40, 80);
  int selectedIndex = 0;

  final List<String> options = [
    '🔥 All',
    '💡 3D Design',
    '💰 Business',
    '🎨 Design',
  ];

  int selectedRatingIndex = 0;

  final List<String> optionsRating = ['All', '5', '4', '3', '2', '1'];

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onSearchSubmitted(String query) {
    setState(() {
      _query = query;
      _isFocused = false;
    });
    context.read<SearchBloc>().add(SearchEvent(query: query));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey50,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.grey50,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(IconlyLight.arrow_left, size: appH(25)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          height: appH(53),
          decoration: BoxDecoration(
            color:
            _isFocused
                ? const Color(0xffEFF3FF)
                : AppColors.grey100,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color:
              _isFocused
                  ? AppColors.blue500
                  : AppColors.grey100,
              width: 2,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: appW(16)),
          child: Row(
            children: [
              Icon(
                IconlyLight.search,
                size: appH(20),
                color: AppColors.grey400,
              ),
              SizedBox(width: appW(12)),
              Expanded(
                child: TextField(
                  focusNode: _focusNode,
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: AppColors.grey400,
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                  onTap: () {
                    setState(() {
                      _isFocused = true;
                    });
                  },
                  onSubmitted: (value) {
                    _onSearchSubmitted(value);
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  _modalBottomSheetFilter();
                },
                icon: Icon(
                  IconlyLight.filter,
                  size: 20,
                  color: AppColors.blue500,
                ),
              ),
            ],
          ),
        ),
      ),
      body:
      _query.isEmpty
          ?  SearchHistoryBody()
          : BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return Center(
              child: CircularProgressIndicator()
            );
          } else if (state is SearchLoaded) {
            return SearchResultBody(
              searchResponse: state.searchResponse!,
              query: _query,
            );
          } else if (state is SearchError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  void _modalBottomSheetFilter() {
    showModalBottomSheet(
      backgroundColor: AppColors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(20),
              height: appH(581),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: appH(15)),
                    Center(
                      child: Text(
                        "Filter",
                        style: TextStyle(
                          color: AppColors.grey900,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    SizedBox(height: appH(15)),
                    Divider(thickness: 1, color: AppColors.grey200),
                    Text(
                      'Category',
                      style: TextStyle(
                        color: AppColors.grey900,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: appH(15)),
                    // ! Category check bar
                    SizedBox(
                      height: appH(40),
                      child: ListView.builder(
                        itemCount: options.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder:
                            (context, index) => CustomChoiceChipWg(
                          index: index,
                          label: options[index],
                          selectedIndex: selectedIndex,
                          onSelected: (selected) {
                            setModalState(() {
                              selectedIndex =
                              selected ? index : selectedIndex;
                            });
                          },
                        ),
                      ),
                    ),
                    // ! Category check bar
                    SizedBox(height: appH(15)),
                    Text(
                      'Price',
                      style: TextStyle(
                        color: AppColors.grey900,
                        fontSize: 20,
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        showValueIndicator: ShowValueIndicator.always,
                        valueIndicatorColor: AppColors.blue500,
                        valueIndicatorTextStyle: TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                      child: RangeSlider(
                        values: _currentRangeValues,
                        max: 100,
                        activeColor: AppColors.blue500,
                        inactiveColor: AppColors.grey200,
                        labels: RangeLabels(
                          '\$${_currentRangeValues.start.round()}',
                          '\$${_currentRangeValues.end.round()}',
                        ),
                        onChanged: (RangeValues values) {
                          setModalState(() {
                            _currentRangeValues = values;
                          });
                        },
                      ),
                    ),

                    // SizedBox(height: appH(10)),
                    Text(
                      'Rating',
                      style: TextStyle(
                        color: AppColors.grey900,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: appH(15)),
                    //! Rating check bar
                    SizedBox(
                      height: appH(40),
                      child: ListView.builder(
                        itemCount: optionsRating.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder:
                            (context, index) => CustomChoiceChipWg(
                          showIcon: true,
                          index: index,
                          label: optionsRating[index],
                          selectedIndex: selectedRatingIndex,
                          onSelected: (selected) {
                            setModalState(() {
                              selectedRatingIndex =
                              selected ? index : selectedRatingIndex;
                            });
                          },
                        ),
                      ),
                    ),
                    //! Rating check bar
                    SizedBox(height: appH(10)),
                    Divider(thickness: 1, color: AppColors.grey200),
                    SizedBox(height: appH(10)),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setModalState(() {
                                selectedIndex = 0;
                                selectedRatingIndex = 0;
                                _currentRangeValues = RangeValues(1, 100);
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.blue100,
                              padding: EdgeInsets.symmetric(
                                horizontal: appW(30),
                              ),
                              minimumSize: const Size(0, 58),
                            ),
                            child: Text(
                              "Reset",
                              style: TextStyle(
                                color: AppColors.blue500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: appW(10)),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.blue500,
                              padding: EdgeInsets.symmetric(
                                horizontal: appW(30),
                              ),
                              minimumSize: const Size(0, 58),
                            ),
                            child: Text(
                              "Filter",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
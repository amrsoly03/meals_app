import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/filters_provider.dart';
// import 'package:meal_app/screens/tabs_screen.dart';
// import 'package:meal_app/widgets/main_drawer.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<Filter, bool> activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      // drawer: MainDrawer(onSelectScreen: (String identifier) {
      //   if (identifier == 'meals') {
      //     Navigator.of(context).pop();
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(
      //       builder: (context) => TabsScreen(),
      //     ));
      //   } else {
      //     Navigator.of(context).pop();
      //   }
      // }),
      body: Column(
        children: [
          customSwitch(
              context,
              'Gluteen-Free',
              'only include Gluteen-Free meals',
              activeFilters[Filter.glutenFree]!,
              (bool newvalue) => ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, newvalue)),
          customSwitch(
              context,
              'Vegan',
              'only include Vegan meals',
              activeFilters[Filter.vegan]!,
              (bool newvalue) => ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, newvalue)),
          customSwitch(
              context,
              'Vegetarian',
              'only include Vegetarian meals',
              activeFilters[Filter.vegetarian]!,
              (bool newvalue) => ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, newvalue)),
          customSwitch(
              context,
              'Lactose-Free',
              'only include Lactose-Free meals',
              activeFilters[Filter.lactoseFree]!,
              (bool newvalue) => ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, newvalue)),
        ],
      ),
    );
  }

  SwitchListTile customSwitch(
    BuildContext context,
    String title,
    String subtitle,
    bool filter,
    void Function(bool newvalue) onChanged,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).primaryColorLight,
            ),
      ),
      subtitle: Text(
        //'only include Gluteen-Free meals',
        subtitle,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).primaryColorLight,
            ),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      value: filter,
      onChanged: onChanged,
    );
  }
}

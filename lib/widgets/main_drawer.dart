import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.6),
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.9),
            ])),
            padding: const EdgeInsets.all(45),
            child: Row(
              children: [
                const Icon(Icons.fastfood),
                const SizedBox(width: 10),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).primaryColorLight,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () => onSelectScreen('meals'),
            leading: const Icon(Icons.food_bank),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).primaryColorLight,
                  ),
            ),
          ),
          ListTile(
            onTap: () => onSelectScreen('filters'),
            leading: const Icon(Icons.settings),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).primaryColorLight,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:marketwick_assignment/constant/assets.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
           DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(Assets.profile),
                  backgroundColor: Colors.blue,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Aditya Kumar',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            )

          ),

          _buildListTileWidget(context,'Quotes'),
          _buildListTileWidget(context,'Chart'),
          _buildListTileWidget(context,'Trade'),
          _buildListTileWidget(context,'History'),
          _buildListTileWidget(context,'Message'),

        ],
      ),
    );
  }
  Widget _buildListTileWidget(BuildContext context, String label){
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200], // Light grey background color
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10), // Optional: Adds margin around the ListTile
      child: ListTile(
        title: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.tertiaryFixed,
            ),
          ),
        ),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
    );

  }
}

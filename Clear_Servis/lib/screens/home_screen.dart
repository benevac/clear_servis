import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subscription_provider.dart';
import '../providers/housekeeper_provider.dart';
import 'housekeeper_detail_screen.dart';
import 'subscription_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchHousekeepers();
  }

  Future<void> _fetchHousekeepers() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<HousekeeperProvider>(context, listen: false).fetchHousekeepers();
    } catch (error) {
      // Handle error
    }
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final subscriptionProvider = Provider.of<SubscriptionProvider>(context);
    final housekeeperProvider = Provider.of<HousekeeperProvider>(context);
    final housekeepers = housekeeperProvider.housekeepers;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cleaning Service'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Handle logout
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'City'),
                    onChanged: (value) {
                      housekeeperProvider.setCityFilter(value);
                    },
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Country'),
                    onChanged: (value) {
                      housekeeperProvider.setCountryFilter(value);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : subscriptionProvider.isSubscribed
                ? ListView.builder(
              itemCount: housekeepers.length,
              itemBuilder: (ctx, i) => ListTile(
                leading: Image.network(housekeepers[i].imageUrl),
                title: Text('${housekeepers[i].firstName} ${housekeepers[i].lastName}'),
                subtitle: Text('${housekeepers[i].city}, ${housekeepers[i].country}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${housekeepers[i].rating}'),
                    Icon(Icons.star, color: Colors.yellow),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    HousekeeperDetailScreen.routeName,
                    arguments: housekeepers[i],
                  );
                },
              ),
            )
                : Center(
              child: ElevatedButton(
                child: const Text('Buy Subscription'),
                onPressed: () {
                  Navigator.of(context).pushNamed(SubscriptionScreen.routeName);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subscription_provider.dart';

class SubscriptionScreen extends StatelessWidget {
  static const routeName = '/subscription';

  @override
  Widget build(BuildContext context) {
    final subscriptionProvider = Provider.of<SubscriptionProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            subscriptionProvider.subscribe();
            Navigator.of(context).pop();
          },
          child: const Text('Subscribe for \$100/month'),
        ),
      ),
    );
  }
}

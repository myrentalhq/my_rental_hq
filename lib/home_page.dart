import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandLordHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> properties = [];

  LandLordHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          automaticallyImplyLeading: false,
          title: const Text('MyRentalHQ'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to MyRentalHQ!',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 16),
            Text(
              'Your property management solution.',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 32),
            Expanded(
              child: properties.isEmpty
                  ? Center(
                      child: Text(
                        'No properties available, click on the Add Property button',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    )
                  : ListView.builder(
                      itemCount: properties.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.home),
                          title: Text(properties[index]['name']),
                          subtitle: Text(
                              'Earnings: \$${properties[index]['earnings']}'),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PropertyDetails(
                                  property: properties[index],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
        floatingActionButton: Container(
          width: 100, // Set the desired width
          height: 100, // Set the desired height
          child: FloatingActionButton(
            onPressed: () {
              // Implement navigation or action here.
            },
            backgroundColor: Colors.blue,
            tooltip: 'Add Property',
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the content vertically
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //Icon(Icons.home),
                const Text('Add Property'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PropertyDetails extends StatelessWidget {
  final Map<String, dynamic> property;

  PropertyDetails({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('${property['name']} Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Tenant Information:',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            // Replace the below Container with your tenant information widget.
            Container(
              height: 100,
              color: Colors.grey.shade700,
              child: const Center(child: Text('Tenant Information')),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Water and Electricity Bills:',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            // Replace the below Container with your bills widget.
            Container(
              height: 100,
              color: Colors.grey.shade700,
              child: const Center(child: Text('Water and Electricity Bills')),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Chat with Tenant:',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            // Replace the below Container with your chat widget.
            Container(
              height: 300,
              color: Colors.grey.shade700,
              child: const Center(child: Text('Chat with Tenant')),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

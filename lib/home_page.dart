import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RentalHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> properties = [

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('MyRentalHQ'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to MyRentalHQ!',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 16),
          Text(
            'Your property management solution.',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 32),
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
                        leading: Icon(Icons.home),
                        title: Text(properties[index]['name']),
                        subtitle: Text('Earnings: \$${properties[index]['earnings']}'),
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
            mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //Icon(Icons.home),
              Text('Add Property'),
            ],
          ),
        ),
      ),
    );
  }
}


class PropertyDetails extends StatelessWidget {
  final Map<String, dynamic> property;

  PropertyDetails({required this.property});

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
            SizedBox(height: 16),
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
              child: Center(child: Text('Tenant Information')),
            ),
            SizedBox(height: 16),
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
              child: Center(child: Text('Water and Electricity Bills')),
            ),
            SizedBox(height: 16),
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
              child: Center(child: Text('Chat with Tenant')),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

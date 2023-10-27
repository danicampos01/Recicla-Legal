import 'package:financial/home.dart';
import 'package:financial/settings.dart';
import 'package:flutter/material.dart';

class EntregaPage extends StatefulWidget {
  const EntregaPage({Key? key}) : super(key: key);

  @override
  _EntregaPageState createState() => _EntregaPageState();
}

class _EntregaPageState extends State<EntregaPage> {
  int _selectedItemIndex = 2;

  late final List<Container> _buildContactRows = [];

  @override
  Widget build(BuildContext context) {
   Container? cont = buildContactRow(
        "Joanna Kingsman",
        "+236254122",
        "https://images.pexels.com/photos/2764976/pexels-photo-2764976.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        false,
        'Ontem 15H \npor Geraldo Robin');

    _buildContactRows.add(cont);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF00B686),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) => const HomePage()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              setState(
                () {
                  //_buildContactRows.clear();
                 Container c = buildContactRow(
                      "Joanna Kingsman",
                      "+236254122",
                      "https://images.pexels.com/photos/2764976/pexels-photo-2764976.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                      true,
                      'Angendado para Hoje');


                  _buildContactRows.add(c);
                },
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
            color: const Color(0XFF00B686),
          ),
          Positioned(
            top: 0,
            height: MediaQuery.of(context).size.height - 80,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: ListView(
                      children: [
                        const Text(
                          "",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: const TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search,
                                  size: 30, color: Colors.grey),
                              hintText: "Buscar",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SingleChildScrollView(
                          child: ListView.builder(
                            itemCount: _buildContactRows.length,
                            itemBuilder: (context, index) {
                              return _buildContactRows[index];
                            },
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(20.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildContactRow(
      String name, String phone, String url, bool isOpen, String dia) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.blue),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(url),
                radius: 25,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        (isOpen != true) ? dia : dia,
                        style: (TextStyle(
                          fontWeight: FontWeight.bold,
                          color: (isOpen == true) ? Colors.green : Colors.grey,
                        )),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: (isOpen != true)
                  ? Colors.grey.withOpacity(0.2)
                  : Colors.greenAccent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: (isOpen == true)
                ? Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: (isOpen == true) ? Colors.grey : Colors.green,
                  )
                : Text(
                    '\n   0,25 \n      T',
                    style: (TextStyle(
                      fontWeight: FontWeight.bold,
                      color: (isOpen == true) ? Colors.green : Colors.grey,
                    )),
                  ),
          )
        ],
      ),
    );
  }

  Container buildRecentContact(String name, String url) {
    return Container(
      margin: const EdgeInsets.only(right: 30),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.grey),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(url),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: const TextStyle(
                fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey),
          )
        ],
      ),
    );
  }

  Container buildExpenseBotton(IconData icon, String title, bool isActive) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isActive ? const Color(0XFF00B686) : Colors.white,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isActive ? const Color(0XFF00B686) : Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

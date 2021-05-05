import 'package:flutter/material.dart';
import 'package:pruebatecnica/domain/entities/model_data.dart';
import 'package:pruebatecnica/ui/pages/register/state/StateInitial.dart';

class StateLoaded extends StatefulWidget {
  final List<Register> register;
  StateLoaded({Key key, @required this.register}) : super(key: key);

  @override
  _StateLoadedState createState() => _StateLoadedState();
}

class _StateLoadedState extends State<StateLoaded> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Details Users'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> StateInitial()));
            },
          ),
        ),
        body: Container(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: widget.register
                  .map((e) => Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all()),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  Text('Name: ',
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
                                  Text(
                                    e.name,
                                    style: TextStyle(
                                        fontSize: 22, color: Color(0xffE04536)),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text('LastName: ',
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
                                  Text(
                                    e.lastname,
                                    style: TextStyle(
                                        fontSize: 22, color: Color(0xffE04536)),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Date of birth : ',
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
                                  Text(
                                    e.date,
                                    style: TextStyle(
                                        fontSize: 22, color: Color(0xffE04536)),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Direcciones : ',
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: (e.direction.length * 40.0),
                                child: ListView.builder(
                                    itemCount: e.direction.length,
                                    itemBuilder: (context, index) {
                                      return Text(
                                        '-- ' + e.direction[index],
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xffE04536)),
                                      );
                                    }),
                              )
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ));
  }
}

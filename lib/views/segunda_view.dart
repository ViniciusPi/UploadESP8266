import 'dart:typed_data';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as prefix;
import 'package:modbus/modbus.dart' as modbus;

class SegundaView extends StatefulWidget {
  const SegundaView({Key? key}) : super(key: key);

  @override
  State<SegundaView> createState() => _SegundaViewState();
}

class _SegundaViewState extends State<SegundaView> {
  Future<Uint16List> getModbusdata() async {
    var client = modbus.createTcpClient(
      '10.1.25.100',
      port: 1001,
      mode: modbus.ModbusMode.rtu,
    );

    try {
      await client.connect();

      var slaveIdResponse = await client.reportSlaveId();
      var signal = await client.readHoldingRegisters(68, 2);
      print("Slave ID: $slaveIdResponse");
      print(signal);
      return signal;
    } finally {
      client.close();
    }
  }

  @override
  void initState() {
    super.initState();
    getModbusdata();
  }

  void atribuir(var data2) async {
    var data = await getModbusdata();
    setState(() {
      ddd = data.toList().first.toString() + data.toList().last.toString();
    });
  }

  var ddd;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(
      children: [
        Container(
          color: Color.fromRGBO(255, 192, 0, 1.0),
        ),
        prefix.Scaffold(
          backgroundColor: Colors.transparent,
          appBar: prefix.AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: false,
            titleSpacing: 0.0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Icon(FluentIcons.add_home),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    'DLB-ELDAQ',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          atribuir(ddd);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black,
                          ),
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.width / 6,
                          child: Center(
                            child: FutureBuilder(
                              builder: ((context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    '${ddd}',
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Color.fromRGBO(255, 192, 0, 1.0),
                                    ),
                                  );
                                } else {
                                  return Text(
                                    'deu errado',
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Color.fromRGBO(255, 192, 0, 1.0),
                                    ),
                                  );
                                }
                              }),
                              future: getModbusdata(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black,
                        ),
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width / 6,
                        child: Center(
                          child: Text(
                            '',
                            style: TextStyle(
                              fontSize: 40,
                              color: Color.fromRGBO(255, 192, 0, 1.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black,
                        ),
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width / 6,
                        child: Center(
                          child: Text(
                            '$ddd',
                            style: TextStyle(
                              fontSize: 40,
                              color: Color.fromRGBO(255, 192, 0, 1.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black,
                        ),
                        height: MediaQuery.of(context).size.height / 6,
                        width: MediaQuery.of(context).size.width / 6,
                        child: Center(
                          child: Text(
                            '5,00V',
                            style: TextStyle(
                              fontSize: 40,
                              color: Color.fromRGBO(255, 192, 0, 1.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

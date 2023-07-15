import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oneline_absen/bloc/data_pengajuan_bloc.dart';
import 'package:oneline_absen/bloc/pengajuan_izin_bloc.dart';
import 'package:oneline_absen/page/data_pengajuan_page.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final pengajuanBloc = context.watch<PengajuanIzinBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 64, 90, 183),
      ),
      body: Stack(alignment: Alignment.center, children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                      ),
                      context: context,
                      builder: (BuildContext bc) {
                        return Wrap(
                          children: <Widget>[
                            PengajuanIjinBottomUp(
                                pengajuanIzinBloc: pengajuanBloc),
                          ],
                        );
                      });
                },
                child: Text("Ijin"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DataPengajuanPage()),
                  );
                },
                child: Text("Data Pengajuan"),
              ),
              BlocBuilder<PengajuanIzinBloc, String>(
                bloc: pengajuanBloc,
                builder: (context, state) {
                  print("rebuild text sakit");
                  return Text(state);
                },
              ),
              Text("Jenis Pengajuan"),
            ],
          ),
        )
      ]),
    );
  }
}

class PengajuanIjinBottomUp extends StatefulWidget {
  PengajuanIjinBottomUp({Key? key, required this.pengajuanIzinBloc})
      : super(key: key);
  final PengajuanIzinBloc pengajuanIzinBloc;

  @override
  State<PengajuanIjinBottomUp> createState() => _PengajuanIjinBottomUpState();
}

class _PengajuanIjinBottomUpState extends State<PengajuanIjinBottomUp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    String _keperluanIzin = context.select<PengajuanIzinBloc, String>(
        (pengajuanIjinBloc) => pengajuanIjinBloc.state);
    return Container(
      height: MediaQuery.of(context).size.height * .60,
      padding: EdgeInsets.fromLTRB(12, 14, 0, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0))),
      child: BlocBuilder<PengajuanIzinBloc, String>(
        builder: (context, pengajuanIzinState) {
          print("Pngajuan izin di rebuild");
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Pengajuan Izin",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Keperluan Izin untuk",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                    width: 20,
                    child: Radio(
                      value: "Sakit",
                      groupValue: _keperluanIzin,
                      onChanged: (value) {
                        print("KONZ " + _keperluanIzin);
                        widget.pengajuanIzinBloc
                            .add(SetKeteranganIzinEvent(value ?? ""));
                        // print("KONZ 2" +
                        //     widget.pengajuanIzinBloc.state.keperluanIzin);
                        // setState(() {

                        // });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Sakit")
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                    width: 20,
                    child: Radio(
                      value: "Lainnya",
                      groupValue: _keperluanIzin,
                      onChanged: (value) {
                        print(value);
                        print("KONZ 5 " + _keperluanIzin);
                        widget.pengajuanIzinBloc
                            .add(SetKeteranganIzinEvent(value ?? ""));
                        // print("KONZ 6" +
                        //     widget.pengajuanIzinBloc.add(event));
                        // setState(() {

                        // });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Lainnya")
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

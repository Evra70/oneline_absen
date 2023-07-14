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
                            PengajuanIjinBottomUp(pengajuanIzinBloc: pengajuanBloc),
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
              BlocBuilder<PengajuanIzinBloc, PengajuanIzinState>(
                bloc: pengajuanBloc,
                builder: (context, state) {
                  return Text(state.keperluanIzin);
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

class PengajuanIjinBottomUp extends StatelessWidget {
  PengajuanIjinBottomUp({Key? key, required this.pengajuanIzinBloc})
      : super(key: key);
  final PengajuanIzinBloc pengajuanIzinBloc;

  @override
  Widget build(BuildContext context) {
    PengajuanIzinBloc _pengajuanIzinBloc = context.read<PengajuanIzinBloc>();
    String _keperluanIzin = context.select<PengajuanIzinBloc, String>(
        (pengajuanIjinBloc) => pengajuanIjinBloc.state.keperluanIzin);
    return Container(
      height: MediaQuery.of(context).size.height * .60,
      padding: EdgeInsets.fromLTRB(12, 14, 0, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0))),
      child: BlocBuilder<PengajuanIzinBloc, PengajuanIzinState>(
        builder: (context, pengajuanIzinState) {
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
                        pengajuanIzinBloc.add(PengajuanIzinSakitEvent(value));
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
                        pengajuanIzinBloc.add(PengajuanIzinLainnyaEvent(value));
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

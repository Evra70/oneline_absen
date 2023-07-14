import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oneline_absen/bloc/data_pengajuan_bloc.dart';
import 'package:oneline_absen/bloc/pengajuan_izin_bloc.dart';
import 'package:oneline_absen/page/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PengajuanIzinBloc(),
        ),
        BlocProvider(
          create: (context) => DataPengajuanBloc()..add(DataPengajuanEvent()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}

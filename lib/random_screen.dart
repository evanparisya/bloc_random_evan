import 'package:flutter/material.dart';
import 'random_bloc.dart'; // Impor BLoC yang sudah dibuat

class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  // Langkah 11: Buat variabel BLoC
  final _bloc = RandomNumberBloc();

  // Langkah 12: Tutup StreamController saat widget dihapus
  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  // Langkah 13: Bangun UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Number')),
      body: Center(
        // StreamBuilder mendengarkan perubahan dari BLoC
        child: StreamBuilder<int>(
          stream: _bloc.randomNumber,
          initialData: 0, // Nilai awal
          builder: (context, snapshot) {
            return Text(
              'Random Number: ${snapshot.data}',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Ketika tombol ditekan, event dikirim ke BLoC
        onPressed: () => _bloc.generateRandom.add(null),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
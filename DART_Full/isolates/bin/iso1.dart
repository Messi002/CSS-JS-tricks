import 'dart:convert';
import 'dart:isolate';
import 'dart:io';

void main(List<String> args) async {
  do {
    stdout.write('Say something to me...');
    final line = stdin.readLineSync(encoding: utf8);
    switch (line?.trim().toLowerCase()) {
      case null:
        continue;
      case 'exit':
        exit(0);
      default:
        final msg = await getMessage(line!);
        print(msg);
    }
  } while (true);
}

const messagesAndResponse = {
  '': 'Ask me a question like "How are you?"',
  'Hello': 'Hi',
  'How are you doing?': 'Fine!',
  'What are you doing?': 'Learning about isolates in Dart!',
  'Are you having fun?': 'Yeah sure!',
};

Future<String> getMessage(String forGreeting) async {
  final rp = ReceivePort();
  Isolate.spawn(_communicator, rp.sendPort);

  final rpBroadCast = rp.asBroadcastStream();
  final SendPort communicatorSendPort = await rpBroadCast.first;
  communicatorSendPort.send(forGreeting);

  return rpBroadCast
      .takeWhile((element) => element is String)
      .cast<String>()
      .take(1)
      .first;
}

void _communicator(SendPort sp) async {
  final rp = ReceivePort();
  sp.send(rp);

  final messages = rp.takeWhile((element) => element is String).cast<String>();
  await for (final message in messages) {
    for (var entry in messagesAndResponse.entries) {
      if (message.trim().toLowerCase() == entry.key.trim().toLowerCase()) {
        sp.send(entry.value);
        continue;
      }
    }
    sp.send('I do not have any responses....');
  }
}

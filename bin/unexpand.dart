import "dart:io";

import "package:coreutils/coreutils.dart";

main(List<String> args) async {
  var opts = handleArguments(args, "unexpand", usage: "[files]");
  var paths = opts.rest.isNotEmpty ? opts.rest : ["-"];
  List<File> files = paths.map((it) => it == "-" ? new File("/dev/stdin") : new File(it)).toList();

  for (var file in files) {
    stdout.write((await file.readAsString()).replaceAll(" " * 8, " \t"));
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_admin_app/core/class/status_request.dart';
import 'package:ecommerce_admin_app/core/function/check_internet.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

String _basicAuth =
    'Basic ${base64Encode(utf8.encode('atowi7:ecommerece123'))}';
Map<String, String> headers = {'authorization': _basicAuth};

class Crud {
  Future<Either<StatusRequest, Map>> postData(String urlLink, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(urlLink), body: data);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map res = json.decode(response.body);
          return Right(res);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.unexpectedError);
    }
  }

  Future<Either<StatusRequest, Map>> postDataWithImage(
      String urlLink, Map data, File? imagefile) async {
    var request = http.MultipartRequest('POST', Uri.parse(urlLink));
    //request.headers.addAll(headers);
    if (imagefile != null) {
      var length = await imagefile.length();
      var stream = http.ByteStream(imagefile.openRead());
      stream.cast();
      var mutiparfile = http.MultipartFile('imagefile', stream, length,
          filename: basename(imagefile.path));

      request.files.add(mutiparfile);
    }
    data.forEach((key, value) {
      request.fields[key] = value;
    });

    var responseStream = await request.send();

    var response = await http.Response.fromStream(responseStream);
    print(response.body.isEmpty);
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Map res = json.decode(response.body);
      return const Right({'status': 'sucess'});
    } else {
      return const Left(StatusRequest.serverFailure);
    }
  }
}

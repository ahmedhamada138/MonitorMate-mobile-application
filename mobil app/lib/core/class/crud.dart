import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:icumonitoring/api_links.dart';
import 'package:icumonitoring/core/class/statuseRequest.dart';
import 'package:icumonitoring/core/functios/checkInternet.dart';
import 'package:path/path.dart';

class Crud {
  Future<Either<StatuseRequest, Map>> postData(
      String linkurl, data, Map<String, String>? header,
      {String requestType = 'post'}) async {
    try {
      if (await checkInternet()) {
        http.Response? response;

        switch (requestType) {
          case 'post':
            response = await http.post(
                Uri.parse('${AppLinksApi.protocol}${AppLinksApi.host}$linkurl'),
                headers: header,
                body: data);

            break;
          case 'put':
            response = await http.put(
                Uri.parse('${AppLinksApi.protocol}${AppLinksApi.host}$linkurl'),
                headers: header,
                body: data);
            break;
          case 'delet':
            response = await http.delete(Uri.http(AppLinksApi.host, linkurl),
                body: data);
            break;
          case 'get':
            response = await http.get(
                Uri.http(
                  AppLinksApi.host,
                  linkurl,
                  // data,
                ),
                headers: header);
            break;
        }
        if (kDebugMode) {
          print(
              '=================================================================curd');
          print(response!.statusCode);
          print(response.body);
        }

        if (response!.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          if (kDebugMode) {
            print(
                '=================================================================curd');
            print('1 done =============================');

            print(responsebody);
          }

          return Right(responsebody);
        } else if (response.statusCode == 404) {
          return const Left(StatuseRequest.notfound);
        } else if (response.statusCode == 401) {
          return const Left(StatuseRequest.authFailer);
        } else {
          return const Left(StatuseRequest.failure);
        }
      } else {
        return const Left(StatuseRequest.offlinefailure);
      }
    } catch (_) {
      if (kDebugMode) {
        print(
            '=====================$_============================================chatch erorr');
      }

      return const Left(StatuseRequest.failure);
    }
  }

  Future<Either<StatuseRequest, Map>> postImageData(
      String linkurl, Map data, File? image,
      {String? nameRequest}) async {
    try {
      if (await checkInternet()) {
        nameRequest ??= "files";

        var uri = Uri.parse(linkurl);
        if (kDebugMode) {
          print(
              '=================================================================cheak 2');
        }
        var request = http.MultipartRequest('POST', uri);

        // request.headers.addAll(_myheaders);

        if (image != null) {
          var lenth = await image.length();
          var stream = http.ByteStream(image.openRead());
          stream.cast();
          var multipartfile = http.MultipartFile(nameRequest, stream, lenth,
              filename: basename(image.path));
          request.files.add(multipartfile);
        }

        data.forEach(
          (key, value) {
            request.fields[key] = value;
          },
        );

        var myrequest = await request.send();

        var response = await http.Response.fromStream(myrequest);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          if (kDebugMode) {
            print(
                '=================================================================curd');
            print('1 done =============================');

            print(responsebody);
          }

          return Right(responsebody);
        } else {
          return const Left(StatuseRequest.serverfailure);
        }
      } else {
        return const Left(StatuseRequest.offlinefailure);
      }
    } catch (_) {
      if (kDebugMode) {
        print(
            '==========================$_=======================================chatch erorr');
      }

      return const Left(StatuseRequest.serverfailure);
    }
  }
}

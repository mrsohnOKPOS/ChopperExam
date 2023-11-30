import 'dart:async';

import 'package:chopper/chopper.dart';

part 'definition.chopper.dart';

@ChopperApi(baseUrl: '/')
abstract class MyService extends ChopperService {
  static MyService create(ChopperClient client) => _$MyService(client);

  @Get(path: '/api/store/list', headers: {'X-Auth-Token': '21a2c0ac-0995-4abd-8ae0-92d338162a6e'})
  Future<Response> getStoreList();

  @Get(path: '/{id}')
  Future<Response> getResource(
    @Path() String id,
  );

  @Get(path: '/', headers: {'foo': 'bar'})
  Future<Response<Map>> getMapResource(
    @Query() String id,
  );

  @Get(path: '/resources')
  Future<Response<List<Map>>> getListResources();

  @Post(path: '/')
  Future<Response> postResourceUrlEncoded(
    @Field('a') String toto,
    @Field() String b,
  );

  @Post(path: '/multi')
  @multipart
  Future<Response> postResources(
    @Part('1') Map a,
    @Part('2') Map b,
    @Part('3') String c,
  );

  @Post(path: '/file')
  @multipart
  Future<Response> postFile(
    @Part('file') List<int> bytes,
  );
}

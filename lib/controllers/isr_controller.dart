import 'dart:io';
import 'package:conduit_core/conduit_core.dart';
import 'package:isr_dart/models/RangoIsr.dart';
import 'package:isr_dart/utils/constants.dart';

class IsrController extends ResourceController {

  @Operation.get()
  Future<Response> getAll() async {
    final List<Map<String, dynamic>> lista = rangoIsr.map((rango) => rango.toJson()).toList();
    
    final Response res = Response.ok(lista)
    ..contentType = ContentType.json;

    return res;
  }
  @Operation.get('monto')
  Future<Response> getImpuesto(@Bind.path('monto') double monto) async {

    final rangoJson = rangoIsr.firstWhere((r) => r.estaDentroDelRango(monto), 
    orElse: ()=> RangoIsr(
      limiteInferior: 0, 
      limiteSuperior: 0,
      cuotaFija: 0,
      porcentaje: 0)
    ).toJson();

    final res = Response.ok(rangoJson)
    ..contentType = ContentType.json;

    return res;
  }
}
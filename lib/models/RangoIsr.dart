class RangoIsr{

  RangoIsr({
    required this.limiteInferior, 
    required this.limiteSuperior, 
    required this.cuotaFija, 
    required this.porcentaje});

  double limiteInferior;
  double limiteSuperior;
  double cuotaFija;
  double porcentaje;

  bool estaDentroDelRango(double salario){
    return salario >= limiteInferior && salario <= limiteSuperior;
  }
  double calcularImpuesto(double ingreso){
    if(estaDentroDelRango(ingreso)){
      return cuotaFija + ((ingreso - limiteInferior) * (porcentaje / 100));
    }
    return 0.0;
  }

  Map<String, dynamic> toJson() {
    return {
      'limiteInferior': limiteInferior,
      'limiteSuperior': limiteSuperior,
      'cuotaFija': cuotaFija,
      'porcentaje': porcentaje
    };
  }
}
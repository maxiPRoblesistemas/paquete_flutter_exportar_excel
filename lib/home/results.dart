class Results {
  static const List<String> columnasObligatorias = [
    'nombre',
    'apellido',
    'email',
    'localidad',
    'domicilio',
  ];

  static const List<Map<String, dynamic>> dataList = [
    {
      'nombre': 'Anna',
      'apellido': 'Castela',
      'email': 'anna_castela_cantora@test.com',
      'dataDireccion': {
        'localidad': 'Eldorado',
        'domicilio': 'Calle 1',
      }
    },
    {
      'nombre': 'Jose',
      'apellido': 'Balanta',
      'email': 'jose@test.com',
      'dataDireccion': {
        'localidad': 'Posadas',
        'domicilio': 'Calle 152',
      }
    },
    {
      'nombre': 'Alberto',
      'apellido': 'Alvarado',
      'email': 'albert@test.com',
      'dataDireccion': {
        'localidad': 'Puerto Rico',
        'domicilio': 'Calle 144',
      }
    },
    {
      'nombre': 'Homero',
      'apellido': 'Simpson',
      'email': 'homer@test.com',
      'dataDireccion': {
        'localidad': 'Springfield',
        'domicilio': 'Av. siempre vivas 745',
      }
    },
  ];
}

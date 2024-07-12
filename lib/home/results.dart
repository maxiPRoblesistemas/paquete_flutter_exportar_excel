class Results {
  Map<String, dynamic> esquema = {
    "type": "object",
    "coleccion": "pais",
    "properties": {
      "idPais": {
        "type": "string",
        "label": "Pais",
        "mostrarColumna": true,
        "ordenar": true,
      },
      "descripcion": {
        "type": "string",
        "label": "Descripcion",
        "mostrarColumna": true
      },
      "continente": {
        "type": "string",
        "label": "Continente",
        "mostrarColumna": true,
      },
      "latitud": {
        "type": "string",
      },
      "longitud": {
        "type": "string",
      },
      "codigoAfip": {
        "type": "number",
        "label": "Codigo Afip",
        "mostrarColumna": true,
      },
      "creadoEl": {
        "type": "string",
        "label": "Fecha modificacion",
        "mostrarColumna": true
      },
      "habitantes": {
        "type": "number",
        "label": "Nro Habitantes",
        "mostrarColumna": true,
        'sumar': true, //! ver que hacer con esto
        "totalizador": true, //valor que define a la columna como totalizador
        'relacion': 'continente' //tabla con la que se relaciona el totalizador
        // "porcentajes": true,
      }
    },
  };

  Map<String, String> opciones = {
    'ordenar': 'number,string',
    'totalizador': 'number',
    'porcentajes': 'number',
    'indices': 'number,string'
  };
  
  List<Map<String, dynamic>> datos = [
    {
      "idPais": "ARG",
      "descripcion": "Argentina",
      "latitud": "-34.6037",
      "longitud": "-58.3816",
      "codigoAfip": 12345,
      "creadoEl": "2024-06-01",
      "habitantes": 45000000,
      "continente": "América del Sur"
    },
    {
      "idPais": "BRA",
      "descripcion": "Brasil",
      "latitud": "-15.8267",
      "longitud": "-47.9218",
      "codigoAfip": 67890,
      "creadoEl": "2024-06-02",
      "habitantes": 210000000,
      "continente": "América del Sur"
    },
    {
      "idPais": "USA",
      "descripcion": "Estados Unidos",
      "latitud": "37.7749",
      "longitud": "-122.4194",
      "codigoAfip": 11111,
      "creadoEl": "2024-06-03",
      "habitantes": 331000000,
      "continente": "América del Norte"
    },
    {
      "idPais": "CAN",
      "descripcion": "Canadá",
      "latitud": "45.4215",
      "longitud": "-75.6972",
      "codigoAfip": 22222,
      "creadoEl": "2024-06-04",
      "habitantes": 38000000,
      "continente": "América del Norte"
    },
    {
      "idPais": "MEX",
      "descripcion": "México",
      "latitud": "19.4326",
      "longitud": "-99.1332",
      "codigoAfip": 33333,
      "creadoEl": "2024-06-05",
      "habitantes": 126000000,
      "continente": "América del Norte"
    },
    {
      "idPais": "UK",
      "descripcion": "Reino Unido",
      "latitud": "51.5074",
      "longitud": "-0.1278",
      "codigoAfip": 44444,
      "creadoEl": "2024-06-06",
      "habitantes": 67000000,
      "continente": "Europa"
    },
    {
      "idPais": "FRA",
      "descripcion": "Francia",
      "latitud": "48.8566",
      "longitud": "2.3522",
      "codigoAfip": 55555,
      "creadoEl": "2024-06-07",
      "habitantes": 67000000,
      "continente": "Europa"
    },
    {
      "idPais": "GER",
      "descripcion": "Alemania",
      "latitud": "52.5200",
      "longitud": "13.4050",
      "codigoAfip": 66666,
      "creadoEl": "2024-06-08",
      "habitantes": 83000000,
      "continente": "Europa"
    },
    {
      "idPais": "ITA",
      "descripcion": "Italia",
      "latitud": "41.9028",
      "longitud": "12.4964",
      "codigoAfip": 77777,
      "creadoEl": "2024-06-09",
      "habitantes": 60000000,
      "continente": "Europa"
    },
    {
      "idPais": "ESP",
      "descripcion": "España",
      "latitud": "40.4168",
      "longitud": "-3.7038",
      "codigoAfip": 88888,
      "creadoEl": "2024-06-10",
      "habitantes": 47000000,
      "continente": "Europa"
    },
    {
      "idPais": "JPN",
      "descripcion": "Japón",
      "latitud": "35.6895",
      "longitud": "139.6917",
      "codigoAfip": 99999,
      "creadoEl": "2024-06-11",
      "habitantes": 125800000,
      "continente": "Asia"
    },
    {
      "idPais": "CHN",
      "descripcion": "China",
      "latitud": "39.9042",
      "longitud": "116.4074",
      "codigoAfip": 10101,
      "creadoEl": "2024-06-12",
      "habitantes": 1441000000,
      "continente": "Asia"
    },
    {
      "idPais": "RUS",
      "descripcion": "Rusia",
      "latitud": "55.7558",
      "longitud": "37.6173",
      "codigoAfip": 20202,
      "creadoEl": "2024-06-13",
      "habitantes": 146000000,
      "continente": "Europa/Asia"
    },
    {
      "idPais": "IND",
      "descripcion": "India",
      "latitud": "28.6139",
      "longitud": "77.2090",
      "codigoAfip": 30303,
      "creadoEl": "2024-06-14",
      "habitantes": 1380000000,
      "continente": "Asia"
    },
    {
      "idPais": "AUS",
      "descripcion": "Australia",
      "latitud": "-33.8688",
      "longitud": "151.2093",
      "codigoAfip": 40404,
      "creadoEl": "2024-06-15",
      "habitantes": 25600000,
      "continente": "Oceanía"
    },
    {
      "idPais": "NZL",
      "descripcion": "Nueva Zelanda",
      "latitud": "-40.9006",
      "longitud": "174.8860",
      "codigoAfip": 50505,
      "creadoEl": "2024-06-16",
      "habitantes": 5000000,
      "continente": "Oceanía"
    },
    {
      "idPais": "KOR",
      "descripcion": "Corea del Sur",
      "latitud": "37.5665",
      "longitud": "126.9780",
      "codigoAfip": 60606,
      "creadoEl": "2024-06-17",
      "habitantes": 52000000,
      "continente": "Asia"
    },
    {
      "idPais": "SAU",
      "descripcion": "Arabia Saudita",
      "latitud": "24.7136",
      "longitud": "46.6753",
      "codigoAfip": 70707,
      "creadoEl": "2024-06-18",
      "habitantes": 34800000,
      "continente": "Asia"
    },
    {
      "idPais": "ZAF",
      "descripcion": "Sudáfrica",
      "latitud": "-25.7479",
      "longitud": "28.2293",
      "codigoAfip": 80808,
      "creadoEl": "2024-06-19",
      "habitantes": 60000000,
      "continente": "África"
    },
    {
      "idPais": "EGY",
      "descripcion": "Egipto",
      "latitud": "30.0444",
      "longitud": "31.2357",
      "codigoAfip": 90909,
      "creadoEl": "2024-06-20",
      "habitantes": 102000000,
      "continente": "África"
    },
    {
      "idPais": "TUR",
      "descripcion": "Turquía",
      "latitud": "41.0082",
      "longitud": "28.9784",
      "codigoAfip": 11011,
      "creadoEl": "2024-06-21",
      "habitantes": 84000000,
      "continente": "Europa/Asia"
    },
    {
      "idPais": "IRN",
      "descripcion": "Irán",
      "latitud": "35.6892",
      "longitud": "51.3890",
      "codigoAfip": 12121,
      "creadoEl": "2024-06-22",
      "habitantes": 83000000,
      "continente": "Asia"
    },
    {
      "idPais": "PAK",
      "descripcion": "Pakistán",
      "latitud": "30.3753",
      "longitud": "69.3451",
      "codigoAfip": 13131,
      "creadoEl": "2024-06-23",
      "habitantes": 225200000,
      "continente": "Asia"
    },
    {
      "idPais": "IDN",
      "descripcion": "Indonesia",
      "latitud": "-6.2088",
      "longitud": "106.8456",
      "codigoAfip": 14141,
      "creadoEl": "2024-06-24",
      "habitantes": 273500000,
      "continente": "Asia"
    },
    {
      "idPais": "NGA",
      "descripcion": "Nigeria",
      "latitud": "9.0820",
      "longitud": "8.6753",
      "codigoAfip": 15151,
      "creadoEl": "2024-06-25",
      "habitantes": 206000000,
      "continente": "África"
    },
    {
      "idPais": "ETH",
      "descripcion": "Etiopía",
      "latitud": "9.1450",
      "longitud": "40.4897",
      "codigoAfip": 16161,
      "creadoEl": "2024-06-26",
      "habitantes": 114000000,
      "continente": "África"
    },
    {
      "idPais": "COL",
      "descripcion": "Colombia",
      "latitud": "4.7110",
      "longitud": "-74.0721",
      "codigoAfip": 17171,
      "creadoEl": "2024-06-27",
      "habitantes": 50800000,
      "continente": "América del Sur"
    },
    {
      "idPais": "PER",
      "descripcion": "Perú",
      "latitud": "-9.1900",
      "longitud": "-75.0152",
      "codigoAfip": 18181,
      "creadoEl": "2024-06-28",
      "habitantes": 33000000,
      "continente": "América del Sur"
    },
    {
      "idPais": "VEN",
      "descripcion": "Venezuela",
      "latitud": "10.4806",
      "longitud": "-66.9036",
      "codigoAfip": 19191,
      "creadoEl": "2024-06-29",
      "habitantes": 28600000,
      "continente": "América del Sur"
    },
    {
      "idPais": "CHL",
      "descripcion": "Chile",
      "latitud": "-33.4489",
      "longitud": "-70.6693",
      "codigoAfip": 20202,
      "creadoEl": "2024-06-30",
      "habitantes": 19100000,
      "continente": "América del Sur"
    },
  ];

  // Map<String, dynamic> esquema = {
  //   "type": "object",
  //   "properties": {
  //     "idCiudadano": {
  //       "type": "string",
  //       "required": true,
  //       "label": "Ciudadano",
  //       "dynamicListValue": {
  //         "coleccion": "pais",
  //         "campoVisualizacion": ["nombre", "apellido"],
  //         "valoresDeFiltrado": {"A": "Activo", "B": "Bloqueado"}
  //       },
  //     },
  //     "nombre": {
  //       "type": "string",
  //       "required": true,
  //       "label": "Nombre",
  //     },
  //     "apellido": {
  //       "type": "string",
  //       "required": true,
  //       "label": "Apellido",
  //     },
  //     "latitud": {
  //       "type": "string",
  //       "required": false,
  //     },
  //     "longitud": {
  //       "type": "string",
  //       "required": false,
  //     },
  //     "codigoAfip": {
  //       "type": "number",
  //       "required": true,
  //       "label": "Codigo Afip",
  //     },
  //     "creadoEl": {
  //       "type": "string",
  //       "required": false,
  //       "label": "Fecha modificacion",
  //     }
  //   },
  //   "required": true
  // };

  // List<Map<String, dynamic>> baseData = [
  //   {
  //     "idCiudadano": "1",
  //     "nombre": "Fulano",
  //     "apellido": "Cosme",
  //     "latitud": "-34.6037",
  //     "longitud": "-58.3816",
  //     "codigoAfip": 12345,
  //     "creadoEl": "2024-07-22"
  //   },
  //   {
  //     "idCiudadano": "2",
  //     "nombre": "Mengano",
  //     "apellido": "Menganito",
  //     "latitud": "-34.6044",
  //     "longitud": "-58.3817",
  //     "codigoAfip": 12346,
  //     "creadoEl": "2024-07-02"
  //   },
  //   {
  //     "idCiudadano": "3",
  //     "nombre": "Ardulio",
  //     "apellido": "Lopez",
  //     "latitud": "-34.6558",
  //     "longitud": "-58.3411",
  //     "codigoAfip": 12347,
  //     "creadoEl": "2024-07-05"
  //   },
  //   {
  //     "idCiudadano": "4",
  //     "nombre": "Fichinilo",
  //     "apellido": "alvarez",
  //     "latitud": "-34.7894",
  //     "longitud": "-58.7779",
  //     "codigoAfip": 12348,
  //     "creadoEl": "2024-07-15"
  //   },
  // ];
}

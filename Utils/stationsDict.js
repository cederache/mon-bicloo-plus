// url : https://data.nantesmetropole.fr/api/records/1.0/search/?dataset=244400404_stations-velos-libre-service-nantes-metropole-disponibilites&q=&rows=130

const fs = require('fs')

var records = [{
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "0936ef4cd68763e1bc12ea1ae6f9f7cedf4992e4",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "038-RICORDEAU",
            "bonus": "False",
            "bike_stands": 40,
            "number": 38,
            "last_update": "2020-10-22T12:35:41+00:00",
            "available_bike_stands": 2,
            "banking": "True",
            "available_bikes": 38,
            "address": "Place Alexis-Ricordeau - Chaussée de la Madeleine",
            "position": [
                47.2121084631,
                -1.55304912932
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55304912932,
                47.2121084631
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "317e392d4f875a6ae26368833eb818efd23a457e",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "090-PROCÉ",
            "bonus": "False",
            "bike_stands": 15,
            "number": 90,
            "last_update": "2020-10-22T12:33:59+00:00",
            "available_bike_stands": 7,
            "banking": "False",
            "available_bikes": 8,
            "address": "Angle boulevard Gaston Serpette - Boulevard Auguste Pageot",
            "position": [
                47.2241950617,
                -1.57661284373
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.57661284373,
                47.2241950617
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "fff11334fc42e45ca8ccd6fd74147188ceb21735",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "028-ÉDIT DE NANTES",
            "bonus": "False",
            "bike_stands": 13,
            "number": 28,
            "last_update": "2020-10-22T12:35:06+00:00",
            "available_bike_stands": 12,
            "banking": "False",
            "available_bikes": 1,
            "address": "2, rue de Gigant - Place de l'Edit de Nantes",
            "position": [
                47.2144634274,
                -1.56756801666
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.56756801666,
                47.2144634274
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "ec786db1dc48cfc30c9db0e8cb594affec87fbdd",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "005-BROSSARD",
            "bonus": "False",
            "bike_stands": 18,
            "number": 5,
            "last_update": "2020-10-22T12:34:51+00:00",
            "available_bike_stands": 16,
            "banking": "False",
            "available_bikes": 2,
            "address": "12, Allée Duquesne",
            "position": [
                47.2188372305,
                -1.55674926308
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55674926308,
                47.2188372305
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "3af0e63d86ad725ac6beb241eb0db5730f8dbf53",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "117-MAIRIE DE CHANTENAY",
            "bonus": "False",
            "bike_stands": 15,
            "number": 117,
            "last_update": "2020-10-22T12:33:53+00:00",
            "available_bike_stands": 7,
            "banking": "False",
            "available_bikes": 8,
            "address": "Place de la Liberté",
            "position": [
                47.20656,
                -1.58785
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.58785,
                47.20656
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "a77b8d3dd8504a608cf3d52133ccdc6d6e94d6ff",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "003-STRASBOURG",
            "bonus": "False",
            "bike_stands": 15,
            "number": 3,
            "last_update": "2020-10-22T12:37:14+00:00",
            "available_bike_stands": 10,
            "banking": "False",
            "available_bikes": 5,
            "address": "4, rue des Carmélites - Place Tirant Lo Blanc",
            "position": [
                47.2164797718,
                -1.55154060535
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55154060535,
                47.2164797718
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "e1f7847b3b392b904d97df678451220a85aa4228",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "043-MACHINE DE L'ÎLE",
            "bonus": "False",
            "bike_stands": 36,
            "number": 43,
            "last_update": "2020-10-22T12:36:26+00:00",
            "available_bike_stands": 9,
            "banking": "True",
            "available_bikes": 27,
            "address": "3, boulevard Léon Bureau",
            "position": [
                47.2069189587,
                -1.56480679078
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.56480679078,
                47.2069189587
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "7181bb0ab087a8d693a4b631d0a18411d7f8ab6b",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "019-SAINT SIMILIEN",
            "bonus": "False",
            "bike_stands": 15,
            "number": 19,
            "last_update": "2020-10-22T12:37:29+00:00",
            "available_bike_stands": 15,
            "banking": "False",
            "available_bikes": 0,
            "address": "1, place Saint Similien",
            "position": [
                47.2198544673,
                -1.55892089047
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55892089047,
                47.2198544673
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "a802020328dbf28b74ebaf026bdcdb626a38b64e",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "056-VINCENT GACHE",
            "bonus": "False",
            "bike_stands": 15,
            "number": 56,
            "last_update": "2020-10-22T12:36:07+00:00",
            "available_bike_stands": 6,
            "banking": "False",
            "available_bikes": 9,
            "address": "9, rue François Albert",
            "position": [
                47.2067986186,
                -1.54177773985
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.54177773985,
                47.2067986186
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "d9367d6e06e28631e22e780cd35ee04bbfe30d71",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "085-BEL AIR",
            "bonus": "False",
            "bike_stands": 14,
            "number": 85,
            "last_update": "2020-10-22T12:36:32+00:00",
            "available_bike_stands": 7,
            "banking": "False",
            "available_bikes": 7,
            "address": "102, rue Paul Bellamy",
            "position": [
                47.226394431,
                -1.56002281968
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.56002281968,
                47.226394431
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "c8ec57d497b1097f20a6e2678ee7497c7f02c333",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "055-MAGELLAN",
            "bonus": "False",
            "bike_stands": 17,
            "number": 55,
            "last_update": "2020-10-22T12:37:07+00:00",
            "available_bike_stands": 5,
            "banking": "False",
            "available_bikes": 12,
            "address": "11, rue de Belfort",
            "position": [
                47.2107814066,
                -1.54429847095
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.54429847095,
                47.2107814066
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "406360c716a1df98d572b32626aadc16389c17f3",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "053-OLIVETTES",
            "bonus": "False",
            "bike_stands": 15,
            "number": 53,
            "last_update": "2020-10-22T12:37:32+00:00",
            "available_bike_stands": 6,
            "banking": "False",
            "available_bikes": 9,
            "address": "10, rue des Olivettes",
            "position": [
                47.2117363932,
                -1.54988602494
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.54988602494,
                47.2117363932
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "2890fad0004dbf511c25d0fecface479d6b0cd4b",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "116-LIBERTÉ",
            "bonus": "False",
            "bike_stands": 20,
            "number": 116,
            "last_update": "2020-10-22T12:37:33+00:00",
            "available_bike_stands": 11,
            "banking": "False",
            "available_bikes": 9,
            "address": "Rond-Point de Louisiane",
            "position": [
                47.198124,
                -1.588395
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.588395,
                47.198124
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "2beb087d3846d19f04852f2eb75f676d0a07ff82",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "104-ANTILLES",
            "bonus": "False",
            "bike_stands": 24,
            "number": 104,
            "last_update": "2020-10-22T12:36:04+00:00",
            "available_bike_stands": 18,
            "banking": "False",
            "available_bikes": 6,
            "address": "20, quai des Antilles",
            "position": [
                47.202547,
                -1.572325
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.572325,
                47.202547
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "8c6686ae7aff4583a73d1834a60c4ac1c2f45e91",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "017-SAINTE ÉLISABETH",
            "bonus": "False",
            "bike_stands": 14,
            "number": 17,
            "last_update": "2020-10-22T12:37:11+00:00",
            "available_bike_stands": 9,
            "banking": "False",
            "available_bikes": 5,
            "address": "4, place Sainte Elisabeth",
            "position": [
                47.2192139526,
                -1.56157014764
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.56157014764,
                47.2192139526
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "ca84b4656a878ebbb9126cc05a2300a8c80c8e13",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "071-TALENSAC NORD",
            "bonus": "False",
            "bike_stands": 14,
            "number": 71,
            "last_update": "2020-10-22T12:37:47+00:00",
            "available_bike_stands": 8,
            "banking": "False",
            "available_bikes": 6,
            "address": "18, rue Talensac - 26, rue de Bel Air",
            "position": [
                47.2218536382,
                -1.55894074669
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55894074669,
                47.2218536382
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "e8300734ef7d64dd81850d987cd1edbe29c8d625",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "086-HAUTS PAVÉS",
            "bonus": "False",
            "bike_stands": 16,
            "number": 86,
            "last_update": "2020-10-22T12:37:17+00:00",
            "available_bike_stands": 7,
            "banking": "False",
            "available_bikes": 9,
            "address": "Rue de Berry - Rue des Hauts Pavés",
            "position": [
                47.225470627,
                -1.5675018425
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.5675018425,
                47.225470627
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "486a46cccafbe919242c269da596e32a024f86ed",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "070-GARE DE NANTES SUD",
            "bonus": "False",
            "bike_stands": 70,
            "number": 70,
            "last_update": "2020-10-22T12:36:01+00:00",
            "available_bike_stands": 65,
            "banking": "True",
            "available_bikes": 5,
            "address": "Quai de Malakoff - Canal Saint-Félix",
            "position": [
                47.215505,
                -1.542844
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.542844,
                47.215505
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "f27bcd9642f307690a21603db218b11e4785d4e2",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "124-PAS ENCHANTÉS",
            "bonus": "False",
            "bike_stands": 25,
            "number": 124,
            "last_update": "2020-10-22T12:36:19+00:00",
            "available_bike_stands": 22,
            "banking": "True",
            "available_bikes": 3,
            "address": "Boulevard des Pas Enchantés - SAINT-SÉBASTIEN-SUR-LOIRE",
            "position": [
                47.205239,
                -1.522726
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.522726,
                47.205239
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "4cb816dd5acaf38151bda5fe86c86d22ded3498e",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "013-BRETAGNE SUD",
            "bonus": "False",
            "bike_stands": 20,
            "number": 13,
            "last_update": "2020-10-22T12:37:21+00:00",
            "available_bike_stands": 15,
            "banking": "False",
            "available_bikes": 5,
            "address": "3, rue Pierre Chereau",
            "position": [
                47.2167879499,
                -1.55916106662
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55916106662,
                47.2167879499
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "b12ccb4c03bfa6fa81782d7f1efa28eae5fd75fc",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "051-TABARLY",
            "bonus": "False",
            "bike_stands": 20,
            "number": 51,
            "last_update": "2020-10-22T12:38:30+00:00",
            "available_bike_stands": 9,
            "banking": "False",
            "available_bikes": 11,
            "address": "5, boulevard de Berlin",
            "position": [
                47.2141946315,
                -1.52973588598
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.52973588598,
                47.2141946315
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "9874eceb4ae4c0482fa4d881483dd9e55410f0e4",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "027-GUIST'HAU NORD",
            "bonus": "False",
            "bike_stands": 15,
            "number": 27,
            "last_update": "2020-10-22T12:39:32+00:00",
            "available_bike_stands": 12,
            "banking": "False",
            "available_bikes": 3,
            "address": "42, boulevard Gabriel Guist'Hau",
            "position": [
                47.2179298163,
                -1.5691718833
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.5691718833,
                47.2179298163
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "2816032a28cf95dda25314d62bead9c5a88c883b",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "037-FÉLIX ÉBOUÉ",
            "bonus": "False",
            "bike_stands": 27,
            "number": 37,
            "last_update": "2020-10-22T12:38:47+00:00",
            "available_bike_stands": 2,
            "banking": "False",
            "available_bikes": 25,
            "address": "1, allée de l'Île Gloriette",
            "position": [
                47.2114650634,
                -1.55682453719
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55682453719,
                47.2114650634
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "f097eaddd8b6f8ba7a935e5992b3da9536f27ae2",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "120-ROND-POINT DE PARIS",
            "bonus": "False",
            "bike_stands": 30,
            "number": 120,
            "last_update": "2020-10-22T12:39:52+00:00",
            "available_bike_stands": 15,
            "banking": "True",
            "available_bikes": 14,
            "address": "16, boulevard Jules Verne",
            "position": [
                47.234853,
                -1.534981
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.534981,
                47.234853
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "9f89d496439e62adc8b5999718c9ac8a24ad21a3",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "054-CITÉ INTERNATIONALE DES CONGRÈS",
            "bonus": "False",
            "bike_stands": 36,
            "number": 54,
            "last_update": "2020-10-22T12:38:52+00:00",
            "available_bike_stands": 23,
            "banking": "True",
            "available_bikes": 11,
            "address": "2, rue de Jemmapes - 2, avenue Jean-Claude Bonduelle",
            "position": [
                47.2131800855,
                -1.54495254167
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.54495254167,
                47.2131800855
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "8cc14b270ba339bbcb63c08161f75c222d566ddb",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "060-GARE DE NANTES NORD",
            "bonus": "False",
            "bike_stands": 40,
            "number": 60,
            "last_update": "2020-10-22T12:39:25+00:00",
            "available_bike_stands": 23,
            "banking": "False",
            "available_bikes": 17,
            "address": "Rue Stanislas Baudry",
            "position": [
                47.219009,
                -1.544071
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.544071,
                47.219009
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "382a10b2e4525f3f7c79fa86a68524651185617e",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "024-VERSAILLES",
            "bonus": "False",
            "bike_stands": 15,
            "number": 24,
            "last_update": "2020-10-22T12:38:55+00:00",
            "available_bike_stands": 5,
            "banking": "False",
            "available_bikes": 10,
            "address": "25, quai de Versailles - Ile de Versailles",
            "position": [
                47.2245149072,
                -1.5537119614
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.5537119614,
                47.2245149072
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "992ae6b63fc1d7149c5ac78397eb7da6fbe62e5a",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "079-MALAKOFF",
            "bonus": "False",
            "bike_stands": 15,
            "number": 79,
            "last_update": "2020-10-22T12:41:40+00:00",
            "available_bike_stands": 9,
            "banking": "False",
            "available_bikes": 6,
            "address": "15, quai de Malakoff",
            "position": [
                47.213395,
                -1.536954
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.536954,
                47.213395
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "a74a80445016cd02d91b7dc26f11e488212a9901",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "048-VERDUN",
            "bonus": "False",
            "bike_stands": 14,
            "number": 48,
            "last_update": "2020-10-22T12:40:41+00:00",
            "available_bike_stands": 4,
            "banking": "True",
            "available_bikes": 10,
            "address": "15, rue de Verdun",
            "position": [
                47.2175053747,
                -1.55184978437
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55184978437,
                47.2175053747
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "4ea6db8c36414d9dc906b8e104e376b9fa24b3c6",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "088-MELLINET",
            "bonus": "False",
            "bike_stands": 15,
            "number": 88,
            "last_update": "2020-10-22T12:40:31+00:00",
            "available_bike_stands": 10,
            "banking": "False",
            "available_bikes": 5,
            "address": "1, boulevard Allard - Place Général Mellinet",
            "position": [
                47.2115010701,
                -1.57717541432
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.57717541432,
                47.2115010701
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "514a5033ac454eb083101c1d1a63b186194e7602",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "004-MOULIN",
            "bonus": "False",
            "bike_stands": 15,
            "number": 4,
            "last_update": "2020-10-22T12:41:08+00:00",
            "available_bike_stands": 6,
            "banking": "False",
            "available_bikes": 8,
            "address": "18, rue du Moulin",
            "position": [
                47.216667582,
                -1.55438471388
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55438471388,
                47.216667582
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "7ff48fa227a2063f2973492699250a2f85363c96",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "065-COURS SULLY",
            "bonus": "False",
            "bike_stands": 15,
            "number": 65,
            "last_update": "2020-10-22T12:41:01+00:00",
            "available_bike_stands": 11,
            "banking": "False",
            "available_bikes": 4,
            "address": "9, cours Sully",
            "position": [
                47.2225873399,
                -1.55166644255
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55166644255,
                47.2225873399
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "e43fcce82bdebfba297f419c4fe306ba2e77b08e",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "084-RÉGION",
            "bonus": "False",
            "bike_stands": 22,
            "number": 84,
            "last_update": "2020-10-22T12:42:52+00:00",
            "available_bike_stands": 16,
            "banking": "False",
            "available_bikes": 3,
            "address": "Rue de la Loire - place Gaston Defferre",
            "position": [
                47.2107421422,
                -1.52593345193
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.52593345193,
                47.2107421422
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "bf2c238a290f418a48f99bcf50b17e3ff5574cf1",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "031-BOURSE",
            "bonus": "False",
            "bike_stands": 22,
            "number": 31,
            "last_update": "2020-10-22T12:43:30+00:00",
            "available_bike_stands": 1,
            "banking": "True",
            "available_bikes": 21,
            "address": "Allée de la Bourse - Boulevard des Nations-Unies",
            "position": [
                47.2120830308,
                -1.55908655124
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55908655124,
                47.2120830308
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "b8f0f9b57d5d3aa2ed51493553850d12f811e6b6",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "032-FOCH",
            "bonus": "False",
            "bike_stands": 14,
            "number": 32,
            "last_update": "2020-10-22T12:43:49+00:00",
            "available_bike_stands": 12,
            "banking": "True",
            "available_bikes": 2,
            "address": "Place Foch",
            "position": [
                47.2192484,
                -1.550185
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.550185,
                47.2192484
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "6d70f15c6407de2fe69db94e59b65a71a2fa9784",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "096-TORTIÈRE",
            "bonus": "False",
            "bike_stands": 16,
            "number": 96,
            "last_update": "2020-10-22T12:43:04+00:00",
            "available_bike_stands": 15,
            "banking": "True",
            "available_bikes": 1,
            "address": "Pont de la Tortière - boulevard Eugène Orieux",
            "position": [
                47.2353352222,
                -1.54922176681
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.54922176681,
                47.2353352222
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "7f18947cd941433a67583b16c9ce1de0c4d4b85f",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "064-SAINT CLÉMENT",
            "bonus": "False",
            "bike_stands": 15,
            "number": 64,
            "last_update": "2020-10-22T12:43:09+00:00",
            "available_bike_stands": 15,
            "banking": "False",
            "available_bikes": 0,
            "address": "24, rue du Maréchal Joffre",
            "position": [
                47.2217851835,
                -1.54709923372
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.54709923372,
                47.2217851835
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "090664986006770fc578d48fa9a374d15cf27644",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "009-GUÉPIN",
            "bonus": "False",
            "bike_stands": 14,
            "number": 9,
            "last_update": "2020-10-22T12:42:56+00:00",
            "available_bike_stands": 8,
            "banking": "False",
            "available_bikes": 6,
            "address": "8, rue de l'Arche Sèche",
            "position": [
                47.2158145871,
                -1.55901748517
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55901748517,
                47.2158145871
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "382ee2b083264e50cbc32e0edbd93de920f4bbbd",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "01012 - BORNE TEST NANTES 2",
            "bonus": "False",
            "bike_stands": 1,
            "number": 1012,
            "last_update": "2020-04-10T14:57:37+00:00",
            "available_bike_stands": 1,
            "banking": "False",
            "available_bikes": 0,
            "address": "CREATION STATION TEST NANTES 2",
            "position": [
                47.195299,
                -1.557559
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.557559,
                47.195299
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "f3b7666d95717bbfe47820fe8e5887c353441cbc",
        "fields": {
            "status": "CLOSED",
            "contract_name": "nantes",
            "name": "075-LAMORICIÈRE",
            "bonus": "False",
            "bike_stands": 18,
            "number": 75,
            "last_update": "2020-09-28T06:56:26+00:00",
            "available_bike_stands": 0,
            "banking": "False",
            "available_bikes": 0,
            "address": "14 bis, rue Lamoricière - Place Beaumanoir",
            "position": [
                47.2123089588,
                -1.57136936022
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.57136936022,
                47.2123089588
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "099de1988e0156cc58df6434eddbc54da787e533",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "018-VIARME",
            "bonus": "False",
            "bike_stands": 14,
            "number": 18,
            "last_update": "2020-10-22T12:35:27+00:00",
            "available_bike_stands": 9,
            "banking": "False",
            "available_bikes": 5,
            "address": "23, place Viarme",
            "position": [
                47.221429339,
                -1.56330836687
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.56330836687,
                47.221429339
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "a199993cb14198fe657eb55f78968941fa723d0d",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "095-MICHELET",
            "bonus": "False",
            "bike_stands": 25,
            "number": 95,
            "last_update": "2020-10-22T12:34:34+00:00",
            "available_bike_stands": 7,
            "banking": "False",
            "available_bikes": 18,
            "address": "50, boulevard Michelet",
            "position": [
                47.235158,
                -1.556322
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.556322,
                47.235158
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "ae2c68842fb0a60720740d829488f731dca4044c",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "020-BOUFFAY",
            "bonus": "False",
            "bike_stands": 15,
            "number": 20,
            "last_update": "2020-10-22T12:35:04+00:00",
            "available_bike_stands": 15,
            "banking": "False",
            "available_bikes": 0,
            "address": "7, allée du Port Maillard - Cours Franklin Roosevelt",
            "position": [
                47.214301,
                -1.552782
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.552782,
                47.214301
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "6ac3801217a94477ebe115a58573e0d68eea45a5",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "026-GUIST'HAU SUD",
            "bonus": "False",
            "bike_stands": 15,
            "number": 26,
            "last_update": "2020-10-22T12:35:23+00:00",
            "available_bike_stands": 15,
            "banking": "False",
            "available_bikes": 0,
            "address": "30, boulevard Gabriel Guist'Hau - Rue Harouys",
            "position": [
                47.21682796,
                -1.56700452627
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.56700452627,
                47.21682796
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "cfa6be408372d84cd6ab4e136bd3dec1438b4aab",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "052-BACO",
            "bonus": "False",
            "bike_stands": 15,
            "number": 52,
            "last_update": "2020-10-22T12:34:25+00:00",
            "available_bike_stands": 11,
            "banking": "False",
            "available_bikes": 4,
            "address": "8, allée Baco",
            "position": [
                47.2143275246,
                -1.54875055574
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.54875055574,
                47.2143275246
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "4143c08d3796ffa8e800b2d1cc8732a2f53d35a5",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "036-ALGER",
            "bonus": "False",
            "bike_stands": 15,
            "number": 36,
            "last_update": "2020-10-22T12:35:47+00:00",
            "available_bike_stands": 12,
            "banking": "False",
            "available_bikes": 3,
            "address": "10, rue d'Alger",
            "position": [
                47.210549,
                -1.567368
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.567368,
                47.210549
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "dd095db68f117d9058999c906eebd241be5d4def",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "047-MARTYRS NANTAIS",
            "bonus": "False",
            "bike_stands": 27,
            "number": 47,
            "last_update": "2020-10-22T12:38:17+00:00",
            "available_bike_stands": 13,
            "banking": "True",
            "available_bikes": 14,
            "address": "1, boulevard des Martyrs Nantais de la Résistance",
            "position": [
                47.206933,
                -1.548169
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.548169,
                47.206933
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "ccd1d4fde29a9d57536b5a3975f1c3ca680f311d",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "113-MAIRIE DE REZÉ",
            "bonus": "False",
            "bike_stands": 21,
            "number": 113,
            "last_update": "2020-10-22T12:38:30+00:00",
            "available_bike_stands": 9,
            "banking": "False",
            "available_bikes": 12,
            "address": "Place Jean-Baptiste Daviais - REZÉ",
            "position": [
                47.191117,
                -1.569362
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.569362,
                47.191117
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "ae46c0553925bd3b61d26d1942fef8039418eb0d",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "123-TRARIEUX",
            "bonus": "False",
            "bike_stands": 20,
            "number": 123,
            "last_update": "2020-10-22T12:38:58+00:00",
            "available_bike_stands": 18,
            "banking": "False",
            "available_bikes": 2,
            "address": "3, place Gabriel Trarieux",
            "position": [
                47.225957,
                -1.522334
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.522334,
                47.225957
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "a3d92dfaf8954c7e9ea376d5cc48ce1f3378c1d0",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "073-SARRADIN",
            "bonus": "False",
            "bike_stands": 13,
            "number": 73,
            "last_update": "2020-10-22T12:39:41+00:00",
            "available_bike_stands": 8,
            "banking": "False",
            "available_bikes": 5,
            "address": "4, place Emile Sarradin",
            "position": [
                47.220882433,
                -1.57043859807
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.57043859807,
                47.220882433
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "efa7ff76e2607fc858f952d037fa2d15c27db62b",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "101-PIRMIL",
            "bonus": "False",
            "bike_stands": 28,
            "number": 101,
            "last_update": "2020-10-22T12:38:55+00:00",
            "available_bike_stands": 21,
            "banking": "True",
            "available_bikes": 7,
            "address": "13, rue Esnoul des Châtelets",
            "position": [
                47.1965313642,
                -1.5415680912
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.5415680912,
                47.1965313642
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "930e26a7b951a916496944847c96656815cf3a55",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "006-PLACE DU CIRQUE",
            "bonus": "False",
            "bike_stands": 21,
            "number": 6,
            "last_update": "2020-10-22T12:39:26+00:00",
            "available_bike_stands": 12,
            "banking": "True",
            "available_bikes": 9,
            "address": "7, allée Duquesne",
            "position": [
                47.2175966824,
                -1.55693764538
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55693764538,
                47.2175966824
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "fb8e90dc65d5439215542a3ed7debf159701af88",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "002-HÔTEL DE VILLE",
            "bonus": "False",
            "bike_stands": 20,
            "number": 2,
            "last_update": "2020-10-22T12:36:58+00:00",
            "available_bike_stands": 6,
            "banking": "False",
            "available_bikes": 14,
            "address": "29, rue de Strasbourg",
            "position": [
                47.2185718131,
                -1.55348429039
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55348429039,
                47.2185718131
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "6ea0c8445d279d7df8fc4f5520f968c05c8184f8",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "034-MÉDIATHÈQUE",
            "bonus": "False",
            "bike_stands": 25,
            "number": 34,
            "last_update": "2020-10-22T12:37:18+00:00",
            "available_bike_stands": 10,
            "banking": "True",
            "available_bikes": 15,
            "address": "24, quai de la Fosse",
            "position": [
                47.2108869258,
                -1.56174490565
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.56174490565,
                47.2108869258
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "3a423b2a4ecf62d5d6212abe51ef55c7baacda00",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "059-STADE SAUPIN",
            "bonus": "False",
            "bike_stands": 24,
            "number": 59,
            "last_update": "2020-10-22T12:36:05+00:00",
            "available_bike_stands": 14,
            "banking": "False",
            "available_bikes": 10,
            "address": "35, quai de Malakoff",
            "position": [
                47.213682,
                -1.540181
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.540181,
                47.213682
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "0e08dd85eebe809c9161232c084e1b4932d185ec",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "093-FACULTÉS",
            "bonus": "False",
            "bike_stands": 40,
            "number": 93,
            "last_update": "2020-10-22T12:37:44+00:00",
            "available_bike_stands": 18,
            "banking": "True",
            "available_bikes": 22,
            "address": "A l'angle route de la Jonelière -  Boulevard Guy Mollet",
            "position": [
                47.2462980684,
                -1.55530901111
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55530901111,
                47.2462980684
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "2fc968a4c315e11eaf5ef08c12b556a4c7f5acbe",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "044-PALAIS DE JUSTICE",
            "bonus": "False",
            "bike_stands": 31,
            "number": 44,
            "last_update": "2020-10-22T12:36:51+00:00",
            "available_bike_stands": 8,
            "banking": "True",
            "available_bikes": 23,
            "address": "19, quai François Mitterand - 1, rue Olympe de Gouges",
            "position": [
                47.2083172884,
                -1.56117307799
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.56117307799,
                47.2083172884
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "b80aae0836c4bd24288979722cba1c8b3b1009a7",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "099-ST JACQUES",
            "bonus": "False",
            "bike_stands": 15,
            "number": 99,
            "last_update": "2020-10-22T12:36:20+00:00",
            "available_bike_stands": 4,
            "banking": "False",
            "available_bikes": 11,
            "address": "ST JACQUES - RUE ST JACQUES",
            "position": [
                47.195898909,
                -1.53654066346
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.53654066346,
                47.195898909
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "c7f30dd01b22e7824d19ef153cab629d1eb83b82",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "110-AUDITORIUM",
            "bonus": "False",
            "bike_stands": 20,
            "number": 110,
            "last_update": "2020-10-22T12:40:18+00:00",
            "available_bike_stands": 13,
            "banking": "False",
            "available_bikes": 7,
            "address": "1, avenue de Bretagne - REZÉ",
            "position": [
                47.185402,
                -1.554025
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.554025,
                47.185402
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "501375163679b22a2e0411358fe2d8b47d45695e",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "007-BARILLERIE",
            "bonus": "False",
            "bike_stands": 30,
            "number": 7,
            "last_update": "2020-10-22T12:40:57+00:00",
            "available_bike_stands": 18,
            "banking": "True",
            "available_bikes": 12,
            "address": "2, allée Penthièvre",
            "position": [
                47.215331358,
                -1.55612612598
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55612612598,
                47.215331358
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "08b2cdb956a952883692b4282d5011b43653aee3",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "091-ROND POINT DE VANNES",
            "bonus": "False",
            "bike_stands": 18,
            "number": 91,
            "last_update": "2020-10-22T12:40:52+00:00",
            "available_bike_stands": 11,
            "banking": "False",
            "available_bikes": 5,
            "address": "65, boulevard Lelasseur",
            "position": [
                47.2295806054,
                -1.57211457799
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.57211457799,
                47.2295806054
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "41e278203c9f66a70a475c57673c83d74f652ec7",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "076-RENÉ BOUHIER",
            "bonus": "False",
            "bike_stands": 15,
            "number": 76,
            "last_update": "2020-10-22T12:40:06+00:00",
            "available_bike_stands": 9,
            "banking": "False",
            "available_bikes": 4,
            "address": "8, place René Bouhier",
            "position": [
                47.2094290925,
                -1.57051533628
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.57051533628,
                47.2094290925
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "04985c5371d8e7ef6416afc223aad3b242411817",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "008-BOUCHERIE",
            "bonus": "False",
            "bike_stands": 24,
            "number": 8,
            "last_update": "2020-10-22T12:40:20+00:00",
            "available_bike_stands": 16,
            "banking": "True",
            "available_bikes": 8,
            "address": "4, rue de la Boucherie",
            "position": [
                47.2162008926,
                -1.5571116802
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.5571116802,
                47.2162008926
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "76772ef489f6c55b3073f1b3682fcd857fc31877",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "001-PRÉFECTURE",
            "bonus": "False",
            "bike_stands": 28,
            "number": 1,
            "last_update": "2020-10-22T12:41:40+00:00",
            "available_bike_stands": 13,
            "banking": "True",
            "available_bikes": 15,
            "address": "6, quai Ceineray",
            "position": [
                47.2202551837,
                -1.55408380741
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55408380741,
                47.2202551837
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "b6379678971d119238cc14052362bebf97587f65",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "080-VICTOR HUGO",
            "bonus": "False",
            "bike_stands": 15,
            "number": 80,
            "last_update": "2020-10-22T12:41:36+00:00",
            "available_bike_stands": 14,
            "banking": "False",
            "available_bikes": 1,
            "address": "25, boulevard Victor Hugo - 28, boulevard Gustave Roch",
            "position": [
                47.2040032085,
                -1.5515484848
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.5515484848,
                47.2040032085
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "7906e4cbeb9f412bcc00fd525d30e973bedf32e4",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "035-JEAN V",
            "bonus": "False",
            "bike_stands": 15,
            "number": 35,
            "last_update": "2020-10-22T12:41:47+00:00",
            "available_bike_stands": 15,
            "banking": "False",
            "available_bikes": 0,
            "address": "Place Jean V",
            "position": [
                47.2121689744,
                -1.56554398608
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.56554398608,
                47.2121689744
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "bde0caae1c66f3c24f4940f3f03c97a6ecd028d4",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "082-SÉBILLEAU",
            "bonus": "False",
            "bike_stands": 16,
            "number": 82,
            "last_update": "2020-10-22T12:41:26+00:00",
            "available_bike_stands": 13,
            "banking": "True",
            "available_bikes": 3,
            "address": "120, rue Dr Jules Sébilleau",
            "position": [
                47.2067575123,
                -1.53311824492
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.53311824492,
                47.2067575123
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "ce56895953b110efc55d992ba2aac544e6915ca6",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "062-GARE DE NANTES NORD 2",
            "bonus": "False",
            "bike_stands": 40,
            "number": 62,
            "last_update": "2020-10-22T12:42:06+00:00",
            "available_bike_stands": 34,
            "banking": "False",
            "available_bikes": 6,
            "address": "22-23 boulevard de Stalingrad",
            "position": [
                47.218103,
                -1.541751
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.541751,
                47.218103
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "d082483b44787d74ab9d25c523e9cf04a7235956",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "074-CANCLAUX",
            "bonus": "False",
            "bike_stands": 15,
            "number": 74,
            "last_update": "2020-10-22T12:43:12+00:00",
            "available_bike_stands": 10,
            "banking": "False",
            "available_bikes": 5,
            "address": "8, place Canclaux",
            "position": [
                47.2143336609,
                -1.57492461719
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.57492461719,
                47.2143336609
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "325cdf6d89f4d9dcace7c03bc91ce61b88148cb1",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "089-SAINT-AIGNAN",
            "bonus": "False",
            "bike_stands": 14,
            "number": 89,
            "last_update": "2020-10-22T12:43:41+00:00",
            "available_bike_stands": 8,
            "banking": "False",
            "available_bikes": 6,
            "address": "65, boulevard Saint-Aignan",
            "position": [
                47.2074386375,
                -1.57868926431
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.57868926431,
                47.2074386375
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "3376b31fa1a1d78bce6d71452eb47ed6ad9037d8",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "102-GARE DE PONT ROUSSEAU",
            "bonus": "False",
            "bike_stands": 20,
            "number": 102,
            "last_update": "2020-10-22T12:43:10+00:00",
            "available_bike_stands": 13,
            "banking": "True",
            "available_bikes": 7,
            "address": "Rue de la Gare - REZÉ",
            "position": [
                47.19316,
                -1.549212
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.549212,
                47.19316
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "08dce36e0ab907bbcfc7678dada372b392889622",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "015-ARISTIDE BRIAND",
            "bonus": "False",
            "bike_stands": 17,
            "number": 15,
            "last_update": "2020-10-22T12:42:28+00:00",
            "available_bike_stands": 12,
            "banking": "False",
            "available_bikes": 4,
            "address": "Place Aristide Briand",
            "position": [
                47.2171848233,
                -1.56298679329
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.56298679329,
                47.2171848233
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "6edbcefa7ab5baa50160296f50b85d7dfc3b7a08",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "103-GRUE JAUNE",
            "bonus": "False",
            "bike_stands": 21,
            "number": 103,
            "last_update": "2020-10-22T12:42:14+00:00",
            "available_bike_stands": 1,
            "banking": "False",
            "available_bikes": 20,
            "address": "Grue Jaune - Face au mail des Chantiers",
            "position": [
                47.204879,
                -1.569191
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.569191,
                47.204879
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "8cf0a19815ee507de8cd1ed17b87a1d49be4d0b1",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "115-TRENTEMOULT",
            "bonus": "False",
            "bike_stands": 26,
            "number": 115,
            "last_update": "2020-10-22T12:43:40+00:00",
            "available_bike_stands": 11,
            "banking": "False",
            "available_bikes": 15,
            "address": "Face 11, quai Marcel Boissard - Trentemoult - REZÉ",
            "position": [
                47.195308,
                -1.581806
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.581806,
                47.195308
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "f419de12bbe87368c80fea682d7d3b6fd524feeb",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "081-MANGIN",
            "bonus": "False",
            "bike_stands": 14,
            "number": 81,
            "last_update": "2020-10-22T12:43:50+00:00",
            "available_bike_stands": 12,
            "banking": "False",
            "available_bikes": 2,
            "address": "Devant le 8, place Mangin",
            "position": [
                47.2009555172,
                -1.54550725123
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.54550725123,
                47.2009555172
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "a1c608933ef01ddb357bc3c349ec84606339fcb1",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "057-GAËTAN RONDEAU",
            "bonus": "False",
            "bike_stands": 20,
            "number": 57,
            "last_update": "2020-10-22T12:43:48+00:00",
            "available_bike_stands": 8,
            "banking": "False",
            "available_bikes": 12,
            "address": "20, rue Gaëtan Rondeau",
            "position": [
                47.2053961322,
                -1.537581863
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.537581863,
                47.2053961322
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "6adfbcf99c3c059968362a68b16a135aba5e9737",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "050-CHÂTEAU",
            "bonus": "False",
            "bike_stands": 16,
            "number": 50,
            "last_update": "2020-10-22T12:42:23+00:00",
            "available_bike_stands": 12,
            "banking": "True",
            "available_bikes": 4,
            "address": "7, rue des Etats",
            "position": [
                47.2151496952,
                -1.55022624256
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55022624256,
                47.2151496952
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "c5155a97fea950a45188f15c9aad860a672a7997",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "114-ATOUTSUD",
            "bonus": "False",
            "bike_stands": 25,
            "number": 114,
            "last_update": "2020-10-22T12:42:45+00:00",
            "available_bike_stands": 15,
            "banking": "True",
            "available_bikes": 10,
            "address": "Angle rue de l'Abbé Grégoire - avenue Maréchal de Tassigny - REZÉ",
            "position": [
                47.194493,
                -1.570365
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.570365,
                47.194493
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "0730c51ec3aa9dec2f0b99c44d2e5845389d1d3c",
        "fields": {
            "status": "CLOSED",
            "contract_name": "nantes",
            "name": "#00029-DUGUAY TROUIN",
            "bonus": "False",
            "bike_stands": 15,
            "number": 29,
            "last_update": "2019-03-07T12:54:24+00:00",
            "available_bike_stands": 0,
            "banking": "False",
            "available_bikes": 2,
            "address": "7, allée Duguay Trouin",
            "position": [
                47.2134502314,
                -1.55526992266
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55526992266,
                47.2134502314
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "57edfb8f06bd854b60a30326ead2f18d2906f0b0",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "058-PALAIS DES SPORTS",
            "bonus": "False",
            "bike_stands": 15,
            "number": 58,
            "last_update": "2020-10-22T12:34:45+00:00",
            "available_bike_stands": 7,
            "banking": "False",
            "available_bikes": 8,
            "address": "8, rue André Tardieu",
            "position": [
                47.208465,
                -1.536657
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.536657,
                47.208465
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "9de94eebc6554ea2126854c55841350e0580aceb",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "106-GARENNES",
            "bonus": "False",
            "bike_stands": 15,
            "number": 106,
            "last_update": "2020-10-22T12:34:43+00:00",
            "available_bike_stands": 8,
            "banking": "False",
            "available_bikes": 7,
            "address": "2, rue des Garennes",
            "position": [
                47.202127,
                -1.5787
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.5787,
                47.202127
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "92fb87033cbf0584089780d1e99aff5eec54138a",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "030-COMMERCE",
            "bonus": "False",
            "bike_stands": 45,
            "number": 30,
            "last_update": "2020-10-22T12:34:29+00:00",
            "available_bike_stands": 24,
            "banking": "True",
            "available_bikes": 18,
            "address": "Place du Commerce - Cours Franklin Roosevelt",
            "position": [
                47.213120551,
                -1.55739323563
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55739323563,
                47.213120551
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "fe27bbc6e8db085765b0cf5928ee9bf59cc825b2",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "046-RÉPUBLIQUE",
            "bonus": "False",
            "bike_stands": 26,
            "number": 46,
            "last_update": "2020-10-22T12:34:04+00:00",
            "available_bike_stands": 15,
            "banking": "False",
            "available_bikes": 11,
            "address": "3, place de la République",
            "position": [
                47.2053240903,
                -1.55518310792
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55518310792,
                47.2053240903
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "484df0516130e536aced4c9af1d5bfcb415281ba",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "078-DE GAULLE",
            "bonus": "False",
            "bike_stands": 21,
            "number": 78,
            "last_update": "2020-10-22T12:35:16+00:00",
            "available_bike_stands": 10,
            "banking": "False",
            "available_bikes": 11,
            "address": "7, rue Françoise Giroud - Boulevard Général de Gaulle",
            "position": [
                47.2084436772,
                -1.54051448829
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.54051448829,
                47.2084436772
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "3c91b66d64cdf480f63417506363c7d91e12c5c7",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "100-GRÉNERAIE",
            "bonus": "False",
            "bike_stands": 20,
            "number": 100,
            "last_update": "2020-10-22T12:34:08+00:00",
            "available_bike_stands": 7,
            "banking": "True",
            "available_bikes": 13,
            "address": "Parc de la Gréneraie - NANTES",
            "position": [
                47.1999230929,
                -1.53471754047
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.53471754047,
                47.1999230929
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "4e6c777dbf949497601cbab049fb4683c87874ad",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "014-SAINT FÉLIX",
            "bonus": "False",
            "bike_stands": 14,
            "number": 14,
            "last_update": "2020-10-22T12:33:55+00:00",
            "available_bike_stands": 8,
            "banking": "False",
            "available_bikes": 6,
            "address": "35, Boulevard Amiral Courbet",
            "position": [
                47.230334,
                -1.556133
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.556133,
                47.230334
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "223781bcf324cc324cc744a298147df38c1027d1",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "040-MADELEINE",
            "bonus": "False",
            "bike_stands": 21,
            "number": 40,
            "last_update": "2020-10-22T12:38:20+00:00",
            "available_bike_stands": 13,
            "banking": "False",
            "available_bikes": 8,
            "address": "Quai Moncousu - Pont Général Audibert",
            "position": [
                47.2088046424,
                -1.55041191412
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55041191412,
                47.2088046424
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "4451440f9d488d76af90fa625f86cd703d880471",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "097-SAINT DONATIEN",
            "bonus": "False",
            "bike_stands": 20,
            "number": 97,
            "last_update": "2020-10-22T12:38:05+00:00",
            "available_bike_stands": 19,
            "banking": "False",
            "available_bikes": 1,
            "address": "Place du 51ème Régiment d'Artillerie",
            "position": [
                47.2290880871,
                -1.54029259429
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.54029259429,
                47.2290880871
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "a13cd2b1f99d2fb5641b77d5be19b08b38b06315",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "045-PRAIRIE AU DUC",
            "bonus": "False",
            "bike_stands": 13,
            "number": 45,
            "last_update": "2020-10-22T12:38:27+00:00",
            "available_bike_stands": 3,
            "banking": "False",
            "available_bikes": 10,
            "address": "25, boulevard de la Prairie au Duc",
            "position": [
                47.2047839356,
                -1.55892310937
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55892310937,
                47.2047839356
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "96ea2a4138ea95b0773af2fa47cf2d152d1cca19",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "092-ROND POINT DE RENNES",
            "bonus": "False",
            "bike_stands": 20,
            "number": 92,
            "last_update": "2020-10-22T12:38:36+00:00",
            "available_bike_stands": 8,
            "banking": "True",
            "available_bikes": 12,
            "address": "Angle boulevard Lelasseur - Rue Paul Bellamy",
            "position": [
                47.2330281848,
                -1.56605906934
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.56605906934,
                47.2330281848
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "c413258c35764b92a764e7d16d9ef18c888b2b7e",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "049-DUCHESSE ANNE",
            "bonus": "False",
            "bike_stands": 15,
            "number": 49,
            "last_update": "2020-10-22T12:38:12+00:00",
            "available_bike_stands": 13,
            "banking": "False",
            "available_bikes": 2,
            "address": "2, place de la Duchesse Anne",
            "position": [
                47.2167,
                -1.547253
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.547253,
                47.2167
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "658eca590f86581f990fd4cce02689ed5a507ed2",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "025-DALBY",
            "bonus": "False",
            "bike_stands": 15,
            "number": 25,
            "last_update": "2020-10-22T12:39:32+00:00",
            "available_bike_stands": 13,
            "banking": "False",
            "available_bikes": 2,
            "address": "61, boulevard Ernest Dalby",
            "position": [
                47.2235088698,
                -1.5299595927
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.5299595927,
                47.2235088698
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "cfc58936d6c12638878a3dc7edc42d5d5693c224",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "061-LIEU UNIQUE",
            "bonus": "False",
            "bike_stands": 15,
            "number": 61,
            "last_update": "2020-10-22T12:39:29+00:00",
            "available_bike_stands": 12,
            "banking": "False",
            "available_bikes": 3,
            "address": "23, quai Ferdinand Favre",
            "position": [
                47.215591464,
                -1.54590593911
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.54590593911,
                47.215591464
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "650c094449ab6e6547c9eb3d3a9f69f011217b82",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "021-TALENSAC SUD",
            "bonus": "False",
            "bike_stands": 16,
            "number": 21,
            "last_update": "2020-10-22T12:38:00+00:00",
            "available_bike_stands": 6,
            "banking": "False",
            "available_bikes": 10,
            "address": "6, rue Talensac",
            "position": [
                47.2211433291,
                -1.55647633933
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55647633933,
                47.2211433291
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "be429f47541d993184fedf2ff608321eee34c670",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "012-DELORME",
            "bonus": "False",
            "bike_stands": 20,
            "number": 12,
            "last_update": "2020-10-22T12:39:04+00:00",
            "available_bike_stands": 20,
            "banking": "True",
            "available_bikes": 0,
            "address": "1, boulevard Gabriel Guist'Hau - Place Delorme",
            "position": [
                47.2151581887,
                -1.56390067347
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.56390067347,
                47.2151581887
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "13187d44899a1c8929cfb4dd3f453c9a2ba0c8cd",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "119-ZOLA",
            "bonus": "False",
            "bike_stands": 25,
            "number": 119,
            "last_update": "2020-10-22T12:38:20+00:00",
            "available_bike_stands": 21,
            "banking": "False",
            "available_bikes": 4,
            "address": "Place Emile Zola",
            "position": [
                47.213859,
                -1.586108
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.586108,
                47.213859
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "acb2008571ce315e958f4e2b9a8e535be035ed3a",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "068-LIVET",
            "bonus": "False",
            "bike_stands": 15,
            "number": 68,
            "last_update": "2020-10-22T12:38:50+00:00",
            "available_bike_stands": 8,
            "banking": "True",
            "available_bikes": 7,
            "address": "65, rue Dufour",
            "position": [
                47.2240678795,
                -1.54521243422
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.54521243422,
                47.2240678795
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "c347cc113c61631339a4e5c445fb30b6d69caf39",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "069-MANUFACTURE",
            "bonus": "False",
            "bike_stands": 15,
            "number": 69,
            "last_update": "2020-10-22T12:39:50+00:00",
            "available_bike_stands": 8,
            "banking": "False",
            "available_bikes": 7,
            "address": "11 bis, boulevard Stalingrad",
            "position": [
                47.2192163807,
                -1.53584744328
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.53584744328,
                47.2192163807
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "a7e8cd13e905bfd721ee65928abf21d5b9dafac2",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "010- PICASSO",
            "bonus": "False",
            "bike_stands": 40,
            "number": 10,
            "last_update": "2020-10-22T12:37:06+00:00",
            "available_bike_stands": 15,
            "banking": "False",
            "available_bikes": 25,
            "address": "12, mail Pablo Picasso",
            "position": [
                47.216207,
                -1.533796
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.533796,
                47.216207
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "e36db14e0a10619162c571a5da3ba13d0a0a9683",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "121-VICTOR RICHARD",
            "bonus": "False",
            "bike_stands": 15,
            "number": 121,
            "last_update": "2020-10-22T12:36:54+00:00",
            "available_bike_stands": 11,
            "banking": "False",
            "available_bikes": 4,
            "address": "12, place Victor Richard",
            "position": [
                47.228614,
                -1.533329
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.533329,
                47.228614
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "359251a1b83db0a5dbe93c4af3d344691249c6df",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "094-PETIT PORT",
            "bonus": "False",
            "bike_stands": 20,
            "number": 94,
            "last_update": "2020-10-22T12:36:42+00:00",
            "available_bike_stands": 4,
            "banking": "False",
            "available_bikes": 15,
            "address": "Boulevard du Petit Port - place du 8 mai 1945",
            "position": [
                47.243263915,
                -1.55634461017
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55634461017,
                47.243263915
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "66e07b22f169f84cfb75c27d254742fe7c1fcee9",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "042-GARE MARITIME",
            "bonus": "False",
            "bike_stands": 28,
            "number": 42,
            "last_update": "2020-10-22T12:37:47+00:00",
            "available_bike_stands": 19,
            "banking": "True",
            "available_bikes": 9,
            "address": "Quai Ernest Renaud - Place Jacksonville",
            "position": [
                47.206597729,
                -1.57261028697
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.57261028697,
                47.206597729
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "1d110a0c03b409f5db4b69c168eb24f9404aa889",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "109-CLOS TOREAU",
            "bonus": "False",
            "bike_stands": 21,
            "number": 109,
            "last_update": "2020-10-22T12:36:02+00:00",
            "available_bike_stands": 11,
            "banking": "False",
            "available_bikes": 10,
            "address": "Face 31, boulevard Emile Gabory",
            "position": [
                47.19426,
                -1.529313
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.529313,
                47.19426
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "758b5ffb9a44bca48b04dce24f68fe598390342d",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "083-MILLERAND",
            "bonus": "False",
            "bike_stands": 14,
            "number": 83,
            "last_update": "2020-10-22T12:36:37+00:00",
            "available_bike_stands": 8,
            "banking": "False",
            "available_bikes": 6,
            "address": "9, boulevard Alexandre Millerand - 28, boulevard Georges Pompidou",
            "position": [
                47.208199645,
                -1.53018043596
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.53018043596,
                47.208199645
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "59c60c7fcb639aa4fc42ef5613505ba4d90d8e2d",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "122-MITRIE",
            "bonus": "False",
            "bike_stands": 15,
            "number": 122,
            "last_update": "2020-10-22T12:35:58+00:00",
            "available_bike_stands": 6,
            "banking": "False",
            "available_bikes": 9,
            "address": "5, route de Sainte Luce",
            "position": [
                47.22865,
                -1.526193
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.526193,
                47.22865
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "6b13d6d1bda457ec6cf028091fcadad294ea5981",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "023-BUAT",
            "bonus": "False",
            "bike_stands": 11,
            "number": 23,
            "last_update": "2020-10-22T12:36:36+00:00",
            "available_bike_stands": 10,
            "banking": "False",
            "available_bikes": 1,
            "address": "118, rue de Coulmiers",
            "position": [
                47.2271454682,
                -1.54240474125
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.54240474125,
                47.2271454682
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "0cb11a81d9d508e8d1e2c5de6408d63d844bbaf0",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "098-HUIT MAI",
            "bonus": "False",
            "bike_stands": 15,
            "number": 98,
            "last_update": "2020-10-22T12:37:20+00:00",
            "available_bike_stands": 9,
            "banking": "False",
            "available_bikes": 6,
            "address": "Avenue de la Libération - rue Eugène Pottier - REZÉ",
            "position": [
                47.1892120475,
                -1.55082803646
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55082803646,
                47.1892120475
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "064996a9c5da7e929c6b7358e0704429f50f9f77",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "011-CALVAIRE",
            "bonus": "False",
            "bike_stands": 15,
            "number": 11,
            "last_update": "2020-10-22T12:36:34+00:00",
            "available_bike_stands": 14,
            "banking": "False",
            "available_bikes": 1,
            "address": "8, rue du Calvaire - Place des Volontaires de la Défense Passive",
            "position": [
                47.2155789424,
                -1.5606752837
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.5606752837,
                47.2155789424
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "bf82b3e51096209850e3c8477275aab70272870d",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "125-PLACIS",
            "bonus": "False",
            "bike_stands": 18,
            "number": 125,
            "last_update": "2020-10-22T12:36:44+00:00",
            "available_bike_stands": 7,
            "banking": "False",
            "available_bikes": 11,
            "address": "Avenue de la Martellière - SAINT-SÉBASTIEN-SUR-LOIRE",
            "position": [
                47.199378,
                -1.520481
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.520481,
                47.199378
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "ab484ecea273b7450ec1150bbc8e886825441c76",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "063-JARDIN DES PLANTES",
            "bonus": "False",
            "bike_stands": 15,
            "number": 63,
            "last_update": "2020-10-22T12:37:03+00:00",
            "available_bike_stands": 15,
            "banking": "False",
            "available_bikes": 0,
            "address": "Rue Stanislas Baudry  - face rue Georges Clémenceau",
            "position": [
                47.2198341973,
                -1.54471896453
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.54471896453,
                47.2198341973
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "3851b15b786f9b469d459b6a8c8a8be21802c21c",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "107-MOUTONNERIE",
            "bonus": "False",
            "bike_stands": 15,
            "number": 107,
            "last_update": "2020-10-22T12:36:03+00:00",
            "available_bike_stands": 10,
            "banking": "False",
            "available_bikes": 5,
            "address": "Rue Francisco Ferrer",
            "position": [
                47.219901,
                -1.532947
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.532947,
                47.219901
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "f973f1e17a1136c4dfa87dbe115c4d8772036db2",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "072-BELLAMY-GUÉ MOREAU",
            "bonus": "False",
            "bike_stands": 15,
            "number": 72,
            "last_update": "2020-10-22T12:41:50+00:00",
            "available_bike_stands": 5,
            "banking": "False",
            "available_bikes": 10,
            "address": "138, rue Paul Bellamy",
            "position": [
                47.2286256906,
                -1.56180639301
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.56180639301,
                47.2286256906
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "c27110a92a7cf85b0507347d24ee8cca325e4d2d",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "112-PÔLE SOCIAL MARION CAHOUR",
            "bonus": "False",
            "bike_stands": 15,
            "number": 112,
            "last_update": "2020-10-22T12:40:57+00:00",
            "available_bike_stands": 13,
            "banking": "False",
            "available_bikes": 2,
            "address": "10, rue Marion Cahour - REZÉ",
            "position": [
                47.188684,
                -1.567201
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.567201,
                47.188684
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "0727d4356e6f36ede5e2945495d4de9b42963c33",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "067-WALDECK ROUSSEAU",
            "bonus": "False",
            "bike_stands": 22,
            "number": 67,
            "last_update": "2020-10-22T12:40:31+00:00",
            "available_bike_stands": 6,
            "banking": "True",
            "available_bikes": 16,
            "address": "Place Waldeck Rousseau - Pont Général de la Motte Rouge",
            "position": [
                47.2277747611,
                -1.55214798607
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55214798607,
                47.2277747611
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "1cc68a2a93f2abcf548b68491f0663134c118adf",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "108-BONNE GARDE",
            "bonus": "False",
            "bike_stands": 24,
            "number": 108,
            "last_update": "2020-10-22T12:39:58+00:00",
            "available_bike_stands": 16,
            "banking": "False",
            "available_bikes": 8,
            "address": "Face 97, rue Bonne Garde",
            "position": [
                47.197217,
                -1.532105
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.532105,
                47.197217
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "e10c1e6bfcd2e36e5210858105b6e913b2e776b5",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "039-QUAI MONCOUSU",
            "bonus": "False",
            "bike_stands": 24,
            "number": 39,
            "last_update": "2020-10-22T12:40:50+00:00",
            "available_bike_stands": 0,
            "banking": "False",
            "available_bikes": 24,
            "address": "1, quai Moncousu - Pont Haudaudine",
            "position": [
                47.2094065739,
                -1.55523314463
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55523314463,
                47.2094065739
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "3c9f45fb12289b8d2f5adbc4180c687ba2e3f12f",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "016-ÉDOUARD NORMAND",
            "bonus": "False",
            "bike_stands": 15,
            "number": 16,
            "last_update": "2020-10-22T12:40:01+00:00",
            "available_bike_stands": 8,
            "banking": "False",
            "available_bikes": 7,
            "address": "Face au 7, place Edouard Normand",
            "position": [
                47.2190275447,
                -1.56341948405
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.56341948405,
                47.2190275447
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "a62c4bc2896fefd08de4cd887997d08ba15f98cd",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "066-CHANZY",
            "bonus": "False",
            "bike_stands": 15,
            "number": 66,
            "last_update": "2020-10-22T12:42:15+00:00",
            "available_bike_stands": 10,
            "banking": "False",
            "available_bikes": 5,
            "address": "Face au 23, avenue Chanzy",
            "position": [
                47.2254298853,
                -1.54799992591
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.54799992591,
                47.2254298853
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "08a9b5371f331ea136e33102e43f4ec9fe3f0b3e",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "022-MOQUECHIEN",
            "bonus": "False",
            "bike_stands": 20,
            "number": 22,
            "last_update": "2020-10-22T12:42:54+00:00",
            "available_bike_stands": 12,
            "banking": "False",
            "available_bikes": 8,
            "address": "8, rue Moquechien - 17, allée des Tanneurs",
            "position": [
                47.2203921267,
                -1.55553104194
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55553104194,
                47.2203921267
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "2f6d12c0a8c2ec992074e48c2439f4d1cc83fd14",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "077-ÉCOLE D'ARCHITECTURE",
            "bonus": "False",
            "bike_stands": 32,
            "number": 77,
            "last_update": "2020-10-22T12:43:29+00:00",
            "available_bike_stands": 2,
            "banking": "True",
            "available_bikes": 30,
            "address": "6, quai François Mitterrand",
            "position": [
                47.2076056402,
                -1.55753246791
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.55753246791,
                47.2076056402
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "de1fd6b5dab799c18461c7f6e6e37bcdb8868993",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "087-ANATOLE FRANCE",
            "bonus": "False",
            "bike_stands": 15,
            "number": 87,
            "last_update": "2020-10-22T12:43:41+00:00",
            "available_bike_stands": 8,
            "banking": "False",
            "available_bikes": 7,
            "address": "41, rue Alexandre Dumas - Place Anatole France",
            "position": [
                47.2236048154,
                -1.57137357811
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.57137357811,
                47.2236048154
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "d2a8524f6472620d7433835e22b44f5c9727846b",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "041-BRUNELIÈRE",
            "bonus": "False",
            "bike_stands": 15,
            "number": 41,
            "last_update": "2020-10-22T12:42:41+00:00",
            "available_bike_stands": 0,
            "banking": "False",
            "available_bikes": 15,
            "address": "88, quai de la Fosse",
            "position": [
                47.208905,
                -1.56823
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.56823,
                47.208905
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "63ae5d146969dc7e9d7e8ad7029047298509a6b1",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "111-DIDEROT",
            "bonus": "False",
            "bike_stands": 21,
            "number": 111,
            "last_update": "2020-10-22T12:42:10+00:00",
            "available_bike_stands": 11,
            "banking": "False",
            "available_bikes": 8,
            "address": "Avenue de la Vendée - Face à l'Espace Diderot - REZÉ",
            "position": [
                47.184491,
                -1.562532
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.562532,
                47.184491
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "2db81d10e39aa0df76d3135398891c40470214bf",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "105-HANGAR À BANANES",
            "bonus": "False",
            "bike_stands": 15,
            "number": 105,
            "last_update": "2020-10-22T12:42:10+00:00",
            "available_bike_stands": 13,
            "banking": "False",
            "available_bikes": 2,
            "address": "Boulevard des Antilles - quai Président Wilson - Grue Titan Grise",
            "position": [
                47.199408,
                -1.573184
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.573184,
                47.199408
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    },
    {
        "datasetid": "244400404_stations-velos-libre-service-nantes-metropole-disponibilites",
        "recordid": "6a056e95e1dbccd2e1ffaa90b18a6097c0f13ce7",
        "fields": {
            "status": "OPEN",
            "contract_name": "nantes",
            "name": "033-RACINE",
            "bonus": "False",
            "bike_stands": 15,
            "number": 33,
            "last_update": "2020-10-22T12:43:38+00:00",
            "available_bike_stands": 13,
            "banking": "False",
            "available_bikes": 2,
            "address": "5, rue Racine",
            "position": [
                47.2135226137,
                -1.56314087443
            ]
        },
        "geometry": {
            "type": "Point",
            "coordinates": [
                -1.56314087443,
                47.2135226137
            ]
        },
        "record_timestamp": "1970-01-01T00:00:00+00:00"
    }
];

const stationId = str => str.match(/#?[0-9]*\s*-/).pop();
const stationName = str => str.replace(stationId(str), "").trim();

var dict = "";
records.sort((r1, r2) => {
    const r1Name = stationName(r1.fields.name).toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "");
    const r2Name = stationName(r2.fields.name).toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "");
    
    if (r1Name < r2Name) {
        return -1;
    } else if (r1Name === r2Name) {
        return 0;
    }
    return 1;
}).forEach((record) => {
    dict = dict + `
    stations.append(Station(identifier: "${ stationId(record.fields.name).replace(/[^0-9]/g, "") }", display: "${ stationName(record.fields.name) }"))`
});

fs.writeFile('RecordDict.txt', dict, (err) => { 
    // In case of a error throw err. 
    if (err) throw err;
});
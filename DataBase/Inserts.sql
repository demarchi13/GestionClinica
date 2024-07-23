USE TP_FINAL_PR3
GO

--INSERT ROLES--
INSERT INTO Roles (id_rol, nombre_rol, descripcion_rol)
SELECT 1, 'Administrador','Usuario con privilegios administrativos completos' UNION
SELECT 2, 'UsuarioMedico','Usuario estándar con acceso limitado'

--INSERT USUARIOS ADMINISTRADORES--
INSERT INTO Usuarios (idRol_us, NombreUsuario_us, Contrasenia_us)
SELECT 1, 'admin1','123' UNION
SELECT 1, 'admin2','123' 

--INSERT PROVINCIAS--
INSERT INTO Provincias (IdProvincia_pro, NombreProvincia_pro)
SELECT '01', 'Buenos Aires' UNION
SELECT '02', 'Catamarca' UNION
SELECT '03', 'Chaco' UNION
SELECT '04', 'Chubut' UNION
SELECT '05', 'Córdoba' UNION
SELECT '06', 'Corrientes' UNION
SELECT '07', 'Entre Ríos' UNION
SELECT '08', 'Formosa' UNION
SELECT '09', 'Jujuy' UNION
SELECT '10', 'La Pampa' UNION
SELECT '11', 'La Rioja' UNION
SELECT '12', 'Mendoza' UNION
SELECT '13', 'Misiones' UNION
SELECT '14', 'Neuquén' UNION
SELECT '15', 'Río Negro' UNION
SELECT '16', 'Salta' UNION
SELECT '17', 'San Juan' UNION
SELECT '18', 'San Luis' UNION
SELECT '19', 'Santa Cruz' UNION
SELECT '20', 'Santa Fe' UNION
SELECT '21', 'Santiago del Estero' UNION
SELECT '22', 'Tierra del Fuego' UNION
SELECT '23', 'Tucumán'
GO

--BUENOS AIRES--
INSERT INTO Localidades(IdProvincia_lo, NombreLocalidad)
SELECT '01', 'La Plata' UNION
SELECT '01', 'Mar del Plata' UNION
SELECT '01', 'Bahía Blanca' UNION
SELECT '01', 'Tandil' UNION
SELECT '01', 'Olavarría' UNION
SELECT '01', 'Pergamino' UNION
SELECT '01', 'Junín' UNION
SELECT '01', 'Necochea' UNION
SELECT '01', 'Zárate' UNION
SELECT '01', 'San Nicolás' UNION
SELECT '01', 'Campana' UNION
SELECT '01', 'Tres Arroyos' UNION
SELECT '01', 'Balcarce' UNION
SELECT '01', 'Chivilcoy' UNION
SELECT '01', 'Luján'
GO

--CATAMARCA--
INSERT INTO Localidades(IdProvincia_lo, NombreLocalidad)
SELECT '02', 'San Fernando del Valle de Catamarca' UNION
SELECT '02', 'Valle Viejo' UNION
SELECT '02', 'Recreo' UNION
SELECT '02', 'Tinogasta' UNION
SELECT '02', 'Santa María' UNION
SELECT '02', 'Belén' UNION
SELECT '02', 'Andalgalá' UNION
SELECT '02', 'San Isidro' UNION
SELECT '02', 'Fray Mamerto Esquiú' UNION
SELECT '02', 'Saujil' UNION
SELECT '02', 'San José' UNION
SELECT '02', 'Santa Rosa' UNION
SELECT '02', 'Los Altos' UNION
SELECT '02', 'Mutquín' UNION
SELECT '02', 'Fiambalá'
GO

--CHACO--
INSERT INTO Localidades(IdProvincia_lo, NombreLocalidad)
SELECT '03', 'Resistencia' UNION
SELECT '03', 'Sáenz Peña' UNION
SELECT '03', 'Villa Ángela' UNION
SELECT '03', 'Charata' UNION
SELECT '03', 'Las Breñas' UNION
SELECT '03', 'Castelli' UNION
SELECT '03', 'Presidencia Roca' UNION
SELECT '03', 'Machagai' UNION
SELECT '03', 'Corzuela' UNION
SELECT '03', 'Villa Berthet' UNION
SELECT '03', 'General San Martín' UNION
SELECT '03', 'Las Palmas' UNION
SELECT '03', 'Quitilipi' UNION
SELECT '03', 'La Leonesa' UNION
SELECT '03', 'Puerto Tirol'
GO

--CHUBUT--
INSERT INTO Localidades(IdProvincia_lo, NombreLocalidad)
SELECT '04', 'Rawson' UNION
SELECT '04', 'Trelew' UNION
SELECT '04', 'Puerto Madryn' UNION
SELECT '04', 'Comodoro Rivadavia' UNION
SELECT '04', 'Esquel' UNION
SELECT '04', 'Gaiman' UNION
SELECT '04', 'Dolavon' UNION
SELECT '04', 'Paso de Indios' UNION
SELECT '04', 'Lago Puelo' UNION
SELECT '04', 'El Maitén' UNION
SELECT '04', 'Epuyén' UNION
SELECT '04', 'Sarmiento' UNION
SELECT '04', 'Cholila' UNION
SELECT '04', 'Tecka' UNION
SELECT '04', 'Río Mayo'
GO

--CÓRDOBA--
INSERT INTO Localidades(IdProvincia_lo, NombreLocalidad)
SELECT '05', 'Córdoba' UNION
SELECT '05', 'Villa Carlos Paz' UNION
SELECT '05', 'Río Cuarto' UNION
SELECT '05', 'Villa María' UNION
SELECT '05', 'San Francisco' UNION
SELECT '05', 'Jesús María' UNION
SELECT '05', 'Cosquín' UNION
SELECT '05', 'Alta Gracia' UNION
SELECT '05', 'La Falda' UNION
SELECT '05', 'Río Tercero' UNION
SELECT '05', 'Arroyito' UNION
SELECT '05', 'Villa Dolores' UNION
SELECT '05', 'Laboulaye' UNION
SELECT '05', 'La Carlota' UNION
SELECT '05', 'Marcos Juárez'
GO

--CORRIENTES--
INSERT INTO Localidades(IdProvincia_lo, NombreLocalidad)
SELECT '06', 'Corrientes' UNION
SELECT '06', 'Goya' UNION
SELECT '06', 'Paso de los Libres' UNION
SELECT '06', 'Curuzú Cuatiá' UNION
SELECT '06', 'Mercedes' UNION
SELECT '06', 'Santo Tomé' UNION
SELECT '06', 'Esquina' UNION
SELECT '06', 'Bella Vista' UNION
SELECT '06', 'Monte Caseros' UNION
SELECT '06', 'Ituzaingó' UNION
SELECT '06', 'Virasoro' UNION
SELECT '06', 'Saladas' UNION
SELECT '06', 'San Luis del Palmar' UNION
SELECT '06', 'Santa Lucía' UNION
SELECT '06', 'Empedrado'
GO

--ENTRE RÍOS--
INSERT INTO Localidades(IdProvincia_lo, NombreLocalidad)
SELECT '07', 'Paraná' UNION
SELECT '07', 'Concordia' UNION
SELECT '07', 'Gualeguaychú' UNION
SELECT '07', 'Gualeguay' UNION
SELECT '07', 'Victoria' UNION
SELECT '07', 'Concepción del Uruguay' UNION
SELECT '07', 'Villaguay' UNION
SELECT '07', 'Chajarí' UNION
SELECT '07', 'Federación' UNION
SELECT '07', 'San José' UNION
SELECT '07', 'Colón' UNION
SELECT '07', 'Nogoyá' UNION
SELECT '07', 'Basavilbaso' UNION
SELECT '07', 'La Paz' UNION
SELECT '07', 'Viale'
GO

--FORMOSA--
INSERT INTO Localidades(IdProvincia_lo, NombreLocalidad)
SELECT '08', 'Formosa' UNION
SELECT '08', 'Clorinda' UNION
SELECT '08', 'Pirané' UNION
SELECT '08', 'El Colorado' UNION
SELECT '08', 'Ibarreta' UNION
SELECT '08', 'Las Lomitas' UNION
SELECT '08', 'Laguna Blanca' UNION
SELECT '08', 'Misión Tacaaglé' UNION
SELECT '08', 'Villa Escolar' UNION
SELECT '08', 'Riacho He-Hé' UNION
SELECT '08', 'Ingeniero Juárez' UNION
SELECT '08', 'General Belgrano' UNION
SELECT '08', 'Comandante Fontana' UNION
SELECT '08', 'Estanislao del Campo' UNION
SELECT '08', 'Gran Guardia'
GO

--JUJUY--
INSERT INTO Localidades(IdProvincia_lo, NombreLocalidad)
SELECT '09', 'San Salvador de Jujuy' UNION
SELECT '09', 'Palpalá' UNION
SELECT '09', 'Perico' UNION
SELECT '09', 'San Pedro de Jujuy' UNION
SELECT '09', 'Libertador General San Martín' UNION
SELECT '09', 'La Quiaca' UNION
SELECT '09', 'Tilcara' UNION
SELECT '09', 'Humahuaca' UNION
SELECT '09', 'El Carmen' UNION
SELECT '09', 'Monterrico' UNION
SELECT '09', 'Maimará' UNION
SELECT '09', 'San Antonio' UNION
SELECT '09', 'Purmamarca' UNION
SELECT '09', 'Caimancito' UNION
SELECT '09', 'Calilegua'
GO

--LA PAMPA--
INSERT INTO Localidades(IdProvincia_lo, NombreLocalidad)
SELECT '10', 'Santa Rosa' UNION
SELECT '10', 'General Pico' UNION
SELECT '10', 'Toay' UNION
SELECT '10', 'General Acha' UNION
SELECT '10', 'Realicó' UNION
SELECT '10', 'Eduardo Castex' UNION
SELECT '10', 'Victorica' UNION
SELECT '10', 'Catriló' UNION
SELECT '10', 'Macachín' UNION
SELECT '10', '25 de Mayo' UNION
SELECT '10', 'Intendente Alvear' UNION
SELECT '10', 'Guatraché' UNION
SELECT '10', 'Bernasconi' UNION
SELECT '10', 'Jacinto Arauz' UNION
SELECT '10', 'Doblas'
GO

--LA RIOJA--
INSERT INTO Localidades(IdProvincia_lo, NombreLocalidad)
SELECT '11', 'La Rioja' UNION
SELECT '11', 'Chilecito' UNION
SELECT '11', 'Chamical' UNION
SELECT '11', 'Aimogasta' UNION
SELECT '11', 'Chepes' UNION
SELECT '11', 'Villa Unión' UNION
SELECT '11', 'Olta' UNION
SELECT '11', 'Nonogasta' UNION
SELECT '11', 'Anillaco' UNION
SELECT '11', 'Villa Castelli' UNION
SELECT '11', 'Ulapes' UNION
SELECT '11', 'Famatina' UNION
SELECT '11', 'Sanagasta' UNION
SELECT '11', 'Patquía' UNION
SELECT '11', 'Catuna'
GO

--MENDOZA--
INSERT INTO Localidades(IdProvincia_lo, NombreLocalidad)
SELECT '12', 'Mendoza' UNION
SELECT '12', 'San Rafael' UNION
SELECT '12', 'Godoy Cruz' UNION
SELECT '12', 'Guaymallén' UNION
SELECT '12', 'Maipú' UNION
SELECT '12', 'Luján de Cuyo' UNION
SELECT '12', 'Tunuyán' UNION
SELECT '12', 'Rivadavia' UNION
SELECT '12', 'San Martín' UNION
SELECT '12', 'Malargüe' UNION
SELECT '12', 'General Alvear' UNION
SELECT '12', 'Las Heras' UNION
SELECT '12', 'Lavalle' UNION
SELECT '12', 'Tupungato' UNION
SELECT '12', 'Santa Rosa'
GO

--MISIONES--
INSERT INTO Localidades(IdProvincia_lo, NombreLocalidad)
SELECT '13', 'Posadas' UNION
SELECT '13', 'Oberá' UNION
SELECT '13', 'Eldorado' UNION
SELECT '13', 'Puerto Iguazú' UNION
SELECT '13', 'Leandro N. Alem' UNION
SELECT '13', 'San Vicente' UNION
SELECT '13', 'Jardín América' UNION
SELECT '13', 'Apóstoles' UNION
SELECT '13', 'Montecarlo' UNION
SELECT '13', 'Puerto Rico' UNION
SELECT '13', 'Aristóbulo del Valle' UNION
SELECT '13', 'San Pedro' UNION
SELECT '13', 'Capioví' UNION
SELECT '13', 'Campo Grande' UNION
SELECT '13', 'Garupá'
GO

--NEUQUÉN--
INSERT INTO Localidades(IdProvincia_lo, NombreLocalidad)
SELECT '14', 'Neuquén' UNION
SELECT '14', 'San Martín de los Andes' UNION
SELECT '14', 'Centenario' UNION
SELECT '14', 'Zapala' UNION
SELECT '14', 'Plottier' UNION
SELECT '14', 'Cutral Có' UNION
SELECT '14', 'Plaza Huincul' UNION
SELECT '14', 'Villa La Angostura' UNION
SELECT '14', 'Rincón de los Sauces' UNION
SELECT '14', 'Chos Malal' UNION
SELECT '14', 'Junín de los Andes' UNION
SELECT '14', 'Añelo' UNION
SELECT '14', 'San Patricio del Chañar' UNION
SELECT '14', 'Aluminé' UNION
SELECT '14', 'Loncopué'
GO

--RÍO NEGRO--
INSERT INTO Localidades(IdProvincia_lo, NombreLocalidad)
SELECT '15', 'Viedma' UNION
SELECT '15', 'San Carlos de Bariloche' UNION
SELECT '15', 'General Roca' UNION
SELECT '15', 'Cipolletti' UNION
SELECT '15', 'Villa Regina' UNION
SELECT '15', 'Río Colorado' UNION
SELECT '15', 'Allen' UNION
SELECT '15', 'Catriel' UNION
SELECT '15', 'Choele Choel' UNION
SELECT '15', 'Ingeniero Jacobacci' UNION
SELECT '15', 'El Bolsón' UNION
SELECT '15', 'Roca' UNION
SELECT '15', 'Mainqué' UNION
SELECT '15', 'General Conesa' UNION
SELECT '15', 'Cinco Saltos'
GO

--SALTA--
INSERT INTO Localidades(IdProvincia_lo, NombreLocalidad)
SELECT '16', 'Salta' UNION
SELECT '16', 'San Ramón de la Nueva Orán' UNION
SELECT '16', 'Tartagal' UNION
SELECT '16', 'Metán' UNION
SELECT '16', 'Rosario de la Frontera' UNION
SELECT '16', 'General Güemes' UNION
SELECT '16', 'Cafayate' UNION
SELECT '16', 'Joaquín V. González' UNION
SELECT '16', 'Aguaray' UNION
SELECT '16', 'Campo Quijano' UNION
SELECT '16', 'El Carril' UNION
SELECT '16', 'Animaná' UNION
SELECT '16', 'San Antonio de los Cobres' UNION
SELECT '16', 'Coronel Moldes' UNION
SELECT '16', 'La Viña'
GO

--SAN JUAN--
INSERT INTO Localidades(IdProvincia_lo, NombreLocalidad)
SELECT '17', 'San Juan' UNION
SELECT '17', 'Rivadavia' UNION
SELECT '17', 'Rawson' UNION
SELECT '17', 'Chimbas' UNION
SELECT '17', 'Santa Lucía' UNION
SELECT '17', 'Pocito' UNION
SELECT '17', 'Albardón' UNION
SELECT '17', 'Caucete' UNION
SELECT '17', 'Angaco' UNION
SELECT '17', 'San Martín' UNION
SELECT '17', 'Jáchal' UNION
SELECT '17', 'Iglesia' UNION
SELECT '17', 'Calingasta' UNION
SELECT '17', '9 de Julio' UNION
SELECT '17', 'Sarmiento'
GO

--SAN LUIS--
INSERT INTO Localidades(IdProvincia_lo, NombreLocalidad)
SELECT '18', 'San Luis' UNION
SELECT '18', 'Villa Mercedes' UNION
SELECT '18', 'Merlo' UNION
SELECT '18', 'La Punta' UNION
SELECT '18', 'Justo Daract' UNION
SELECT '18', 'Santa Rosa del Conlara' UNION
SELECT '18', 'Concarán' UNION
SELECT '18', 'Candelaria' UNION
SELECT '18', 'Quines' UNION
SELECT '18', 'Buena Esperanza' UNION
SELECT '18', 'La Toma' UNION
SELECT '18', 'Tilisarao' UNION
SELECT '18', 'Luján' UNION
SELECT '18', 'El Trapiche' UNION
SELECT '18', 'Los Molles'
GO

--SANTA CRUZ--
INSERT INTO Localidades(IdProvincia_lo, NombreLocalidad)
SELECT '19', 'Río Gallegos' UNION
SELECT '19', 'Caleta Olivia' UNION
SELECT '19', 'El Calafate' UNION
SELECT '19', 'Puerto Deseado' UNION
SELECT '19', 'Las Heras' UNION
SELECT '19', 'Pico Truncado' UNION
SELECT '19', 'Puerto San Julián' UNION
SELECT '19', 'Perito Moreno' UNION
SELECT '19', 'Gobernador Gregores' UNION
SELECT '19', 'El Chaltén' UNION
SELECT '19', 'Los Antiguos' UNION
SELECT '19', 'Comandante Luis Piedra Buena' UNION
SELECT '19', 'Río Turbio' UNION
SELECT '19', 'Puerto Santa Cruz' UNION
SELECT '19', 'Tres Lagos'
GO

--SANTA FE--
INSERT INTO Localidades(IdProvincia_lo, NombreLocalidad)
SELECT '20', 'Santa Fe' UNION
SELECT '20', 'Rosario' UNION
SELECT '20', 'Venado Tuerto' UNION
SELECT '20', 'Rafaela' UNION
SELECT '20', 'Villa Gobernador Gálvez' UNION
SELECT '20', 'Reconquista' UNION
SELECT '20', 'Sunchales' UNION
SELECT '20', 'San Lorenzo' UNION
SELECT '20', 'Esperanza' UNION
SELECT '20', 'Cañada de Gómez' UNION
SELECT '20', 'Villa Constitución' UNION
SELECT '20', 'Casilda' UNION
SELECT '20', 'San Justo' UNION
SELECT '20', 'Coronda' UNION
SELECT '20', 'El Trébol'
GO

--SANTIAGO DEL ESTERO--
INSERT INTO Localidades(IdProvincia_lo, NombreLocalidad)
SELECT '21', 'Santiago del Estero' UNION
SELECT '21', 'La Banda' UNION
SELECT '21', 'Termas de Río Hondo' UNION
SELECT '21', 'Añatuya' UNION
SELECT '21', 'Frías' UNION
SELECT '21', 'Quimilí' UNION
SELECT '21', 'Loreto' UNION
SELECT '21', 'Fernández' UNION
SELECT '21', 'Monte Quemado' UNION
SELECT '21', 'Clodomira' UNION
SELECT '21', 'Bandera' UNION
SELECT '21', 'Los Juríes' UNION
SELECT '21', 'Forres' UNION
SELECT '21', 'Campo Gallo' UNION
SELECT '21', 'Suncho Corral'
GO

--TIERRA DEL FUEGO--
INSERT INTO Localidades(IdProvincia_lo, NombreLocalidad)
SELECT '22', 'Ushuaia' UNION
SELECT '22', 'Río Grande' UNION
SELECT '22', 'Tolhuin' UNION
SELECT '22', 'San Sebastián' UNION
SELECT '22', 'Cameron' UNION
SELECT '22', 'Estancia Harberton' UNION
SELECT '22', 'Lago Escondido' UNION
SELECT '22', 'Almanza' UNION
SELECT '22', 'Rancho Hambre' UNION
SELECT '22', 'Puerto Almanza' UNION
SELECT '22', 'Punta Paraná' UNION
SELECT '22', 'Monte Aymond' UNION
SELECT '22', 'Puerto Parry' UNION
SELECT '22', 'Puerto Mc Kinley' UNION
SELECT '22', 'Puerto Haberton'
GO

--TUCUMÁN--
INSERT INTO Localidades(IdProvincia_lo, NombreLocalidad)
SELECT '23', 'San Miguel de Tucumán' UNION
SELECT '23', 'Tafí Viejo' UNION
SELECT '23', 'Yerba Buena' UNION
SELECT '23', 'Concepción' UNION
SELECT '23', 'Banda del Río Salí' UNION
SELECT '23', 'Monteros' UNION
SELECT '23', 'Aguilares' UNION
SELECT '23', 'Famaillá' UNION
SELECT '23', 'Lules' UNION
SELECT '23', 'Bella Vista' UNION
SELECT '23', 'Simoca' UNION
SELECT '23', 'Juan Bautista Alberdi' UNION
SELECT '23', 'Las Talitas' UNION
SELECT '23', 'Tafí del Valle' UNION
SELECT '23', 'Amaicha del Valle'
GO

--INSERT ESPECIALIDADES--
INSERT INTO Especialidades (IdEspecialidad_esp, NombreEspecialidad_esp)
SELECT '01', 'Cardiología' UNION
SELECT '02', 'Dermatología' UNION
SELECT '03', 'Endocrinología' UNION
SELECT '04', 'Gastroenterología' UNION
SELECT '05', 'Geriatría' UNION
SELECT '06', 'Ginecología' UNION
SELECT '07', 'Hematología' UNION
SELECT '08', 'Infectología' UNION
SELECT '09', 'Nefrología' UNION
SELECT '10', 'Neurología' UNION
SELECT '11', 'Oncología' UNION
SELECT '12', 'Oftalmología' UNION
SELECT '13', 'Pediatría' UNION
SELECT '14', 'Psiquiatría' UNION
SELECT '15', 'Reumatología'
GO

--INSERT SEXO--
INSERT INTO Sexo (IdSexo_se, descripcion_se)
SELECT 'M', 'Masculino' UNION
SELECT 'F', 'Femenino' UNION
SELECT 'O', 'Otro'
GO

--INSERT DIAS ATENCION--
INSERT INTO DiasAtencion (IdDia_di, NombreDia_di)
SELECT '1', 'Lunes' UNION
SELECT '2', 'Martes' UNION
SELECT '3', 'Miercoles' UNION
SELECT '4', 'Juebes' UNION
SELECT '5', 'Viernes' UNION
SELECT '6', 'Sabado'
GO

CREATE DATABASE data_base;
USE data_base;

CREATE TABLE provincias (
    id_provincia INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    iva DECIMAL(5,2)
);

CREATE TABLE localidades_barrios (
    id_localidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    poblacion INT,
    codigo_postal VARCHAR(20),
    id_provincia INT,
    FOREIGN KEY (id_provincia) REFERENCES provincias(id_provincia)
);

CREATE TABLE calle (
    id_calle INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    altura INT,
    descripcion VARCHAR(255),
    id_localidad INT,
    FOREIGN KEY (id_localidad) REFERENCES localidades_barrios(id_localidad)
);

CREATE TABLE sucursales (
    id_sucursal INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    id_calle INT,
    usuario VARCHAR(50),
    contrasenia VARCHAR(255),
    cude VARCHAR(50),
    correo VARCHAR(100),
    telefono VARCHAR(50),
    FOREIGN KEY (id_calle) REFERENCES calle(id_calle)
);

CREATE TABLE proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    id_calle INT,
    correo VARCHAR(100),
    FOREIGN KEY (id_calle) REFERENCES calle(id_calle)
);

INSERT INTO proveedores (id_proveedor, nombre, id_calle, correo) VALUES
(1, 'Yamaha Argentina', NULL, 'ventas@proveedor1.com'),
(2, 'Fender LatAm', NULL, 'ventas@proveedor2.com'),
(3, 'Ibanez Import', NULL, 'ventas@proveedor3.com'),
(4, 'Gibson Dist', NULL, 'ventas@proveedor4.com'),
(5, 'Roland Sudamerica', NULL, 'ventas@proveedor5.com'),
(6, 'Korg General Music', NULL, 'ventas@proveedor6.com'),
(7, 'Distribuidora Musical SA', NULL, 'ventas@proveedor7.com');

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    dni VARCHAR(20),
    id_calle INT,
    correo VARCHAR(100),
    FOREIGN KEY (id_calle) REFERENCES calle(id_calle)
);

CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY,
    nombre VARCHAR(100),
    cant_subcategorias INT
);

INSERT INTO categoria (id_categoria, nombre, cant_subcategorias) VALUES
(1, 'Guitarras', 4),
(2, 'Pianos', 4),
(3, 'Reproductores', 3),
(4, 'Bajos', 3),
(5, 'Baterias', 5),
(6, 'Otros Instrumentos', 9),
(7, 'Audio', 4),
(8, 'Accesorios', 3);


CREATE TABLE subcategoria (
    id_subcategoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);

INSERT INTO subcategoria (nombre, id_categoria) VALUES
('Criollas', 1),
('Acusticas', 1),
('Electroacusticas', 1),
('Electricas', 1),
('Teclados', 2),
('Pianos Digitales', 2),
('Sintetizadores', 2),
('Pianos de Cola', 2),
('Vinilos', 3),
('CDs', 3),
('Cassettes', 3),
('Electricos', 4),
('Acusticos', 4),
('Pedales', 4),
('Acusticas', 5),
('Electroacusticas', 5),
('Banquetas', 5),
('Platillos', 5),
('Percucion', 5),
('Acordeones', 6),
('Clarinetes', 6),
('Flautas Traversas', 6),
('Flautas Dulces', 6),
('Saxos', 6),
('Trombones', 6),
('Trompetas', 6),
('Ukeleles', 6),
('Violines', 6),
('Auriculares', 7),
('Parlantes', 7),
('Microfonos', 7),
('Placas de Audio', 7),
('Fundas', 8),
('Cuerdas', 8),
('Estuches', 8);


CREATE TABLE marcas (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

INSERT INTO marcas (id_marca, nombre) VALUES
(1, 'Yamaha'),
(2, 'Fender'),
(3, 'Ibanez'),
(4, 'Gibson'),
(5, 'Roland'),
(6, 'Korg'),
(7, 'Casio'),
(8, 'Kawai'),
(9, 'Steinway & Sons'),
(10, 'Music Man'),
(11, 'Warwick'),
(12, 'EBS'),
(13, 'BOSS'),
(14, 'MXR'),
(15, 'Pearl'),
(16, 'TAMA'),
(17, 'DW Drums'),
(18, 'Zildjian'),
(19, 'Sabian'),
(20, 'LP Percussion'),
(21, 'Hohner'),
(22, 'Buffet Crampon'),
(23, 'Selmer'),
(24, 'Bach'),
(25, 'Kala'),
(26, 'Stentor'),
(27, 'Sennheiser'),
(28, 'Audio-Technica'),
(29, 'Shure'),
(30, 'JBL'),
(31, 'KRK Systems'),
(32, 'Focusrite'),
(33, 'Universal Audio'),
(34, 'Gator'),
(35, 'D Addario'),
(36, 'Ernie Ball'),
(37, 'Alesis'),
(38, 'Takamine'),
(39, 'Martin'),
(40, 'Jupiter'),
(41, 'AKG');


CREATE TABLE artista (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    genero_principal VARCHAR(50),
    ruam VARCHAR(50)
);

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(100),
    codigo VARCHAR(50),
    descripcion VARCHAR(255),
    precio_venta DECIMAL(10,2),
    id_subcategoria INT,
    id_marca INT,
    id_artista INT,
    id_proveedor INT,
    imagen_url VARCHAR(500),
    imagen_directorio VARCHAR(255),
    FOREIGN KEY (id_subcategoria) REFERENCES subcategoria(id_subcategoria),
    FOREIGN KEY (id_marca) REFERENCES marcas(id_marca),
    FOREIGN KEY (id_artista) REFERENCES artista(id_artista),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor)
);

INSERT INTO productos (modelo, codigo, descripcion, precio_venta, id_subcategoria, id_marca, id_artista, id_proveedor, imagen_url, imagen_directorio) VALUES
('C40II Classical Guitar', 'YAM-C40II', 'Guitarra clasica de escala completa con tapa de abeto laminado, aros y fondo de meranti, diapason de palo de rosa y clavijeros cromados. Ideal para estudiantes por su comodidad y afinacion estable.', 159.99, 1, 1, NULL, 1, 'https://images.guitarguitar.co.uk/cdn/large/170/09071411013328-11268691f.jpg?h=500&w=770&bg=ffffff&quality=60&anchor=center&mode=crop', '/imagenes/productos/yamaha_c40ii_classical_guitar.jpg'),
('FC-1 Classical Natural', 'FEN-FC1-NAT', 'Guitarra clasica tradicional de cuerdas de nylon con tapa de abeto abombada, bracing en abanico y mastil de caoba suave al tacto. Tono calido y equilibrado.', 189.00, 1, 2, NULL, 3, 'https://lzd-img-global.slatic.net/g/p/28bdb18ae5566bc531014d687caf2d1d.jpg_720x720q80.jpg', '/imagenes/productos/fender_fc_1_classical_natural.jpg'),
('GA3ECE Classical Cutaway', 'IBN-GA3ECE', 'Guitarra criolla clasica electroacustica con corte cutaway, cuerpo de pino abeto y caoba, microfono piezoelectrico Under Saddle y preamplificador con afinador.', 249.50, 1, 3, NULL, 5, 'https://www.ibanez.com/common/product_artist_file/file/p_region_GA3ECE_OAM_5T_02.png', '/imagenes/productos/ibanez_ga3ece_classical_cutaway.png'),
('D-28 Dreadnought Standard', 'MRT-D28-STD', 'La guitarra acustica dreadnought por excelencia. Tapa armonica de abeto Sitka macizo, aros y fondo de palisandro del este de India, con patron de varetaje para graves profundos.', 3199.00, 2, 39, NULL, 2, 'https://media.sweetwater.com/m/products/image/7dcc9ce4cbD8Ls1YsHTC073BMoqwBqpe46kVPefL.png?quality=1&ha=7dcc9ce4cbf1b21f', '/imagenes/productos/martin_d_28_dreadnought_standard.webp'),
('GD11M-NS Mahogany Dreadnought', 'TAK-GD11M-NS', 'Guitarra acustica construida integramente en madera de caoba seleccionada con acabado natural satinado. Destaca por sus frecuencias medias calidas y buena proyeccion.', 279.00, 2, 38, NULL, 4, 'https://www.lisbonmusicshop.com/13493-superlarge_default/acoustic-guitar-takamine-gd11m-ns-dreadnought-mahogany.jpg', '/imagenes/productos/takamine_gd11m_ns_mahogany_dreadnought.jpg'),
('FG800 Solid Top Acoustic', 'YAM-FG800-NT', 'Guitarra acustica dreadnought de entrada con tapa maciza de abeto de Sitka, varetaje escalopado para mayor resonancia de graves y acabado natural brillante.', 229.99, 2, 1, NULL, 6, 'https://d2j6dbq0eux0bg.cloudfront.net/images/105869808/4964881197.jpg', '/imagenes/productos/yamaha_fg800_solid_top_acoustic.jpg'),
('Newporter Player Sunburst', 'FEN-NW-PLY-SB', 'Guitarra electroacustica de formato mediano Newporter con tapa de abeto macizo, pala Stratocaster de 6 clavijas en linea y preamplificacion Fishman.', 449.99, 3, 2, NULL, 1, 'https://media.sweetwater.com/m/products/image/ec053d8f8csX7jwBn50C1HYhlI3fc7IM1W8Yz1Ia.wm-dh.jpg?v=ec053d8f8c1ad71c', '/imagenes/productos/fender_newporter_player_sunburst.webp'),
('AEG50 Black High Gloss', 'IBN-AEG50-BK', 'Cuerpo delgado electroacustico con tapa de abeto, aros y fondo de sapele, puente de palisandro y preamplificador Ibanez AEQ-TTS con pantalla LCD.', 329.99, 3, 3, NULL, 7, 'https://media.sweetwater.com/m/products/image/34c47ffb08SQXHCrA8W75OowCrnCBZYSMHk2G2r8.wm-dh.png?v=34c47ffb08e47225', '/imagenes/productos/ibanez_aeg50_black_high_gloss.webp'),
('APX600 Thin Body Natural', 'YAM-APX600-NT', 'Cuerpo delgado con cutaway ergonomico, boca ovalada caracteristica APX, pastilla piezoelectrica System65 y ecualizador de 3 bandas activo.', 349.00, 3, 1, NULL, 3, 'https://poppasmusic.com/cdn/shop/files/apx600_nt-body.jpg?v=1754933229&width=1946', '/imagenes/productos/yamaha_apx600_thin_body_natural.webp'),
('Player II Stratocaster HSS Birch Green', 'FEN-PL2-STRAT-BG', 'Guitarra electrica de 6 cuerdas equipada con pastilla humbucker Player Series en puente y dos single-coils. Cuerpo de aliso, diapason de palisandro de radio 9.5 pulg y tremolo de 2 puntos.', 849.99, 4, 2, NULL, 2, 'https://media.sweetwater.com/m/products/image/487b59bd80UeAOKvPLIGypbezKX3Ig2qhIwFjgr5.wm-lh.jpg?v=487b59bd801f1a2b', '/imagenes/productos/fender_player_ii_stratocaster_hss_birch_green.webp'),
('Les Paul Standard 60s Bourbon Burst', 'GIB-LPS60-BBB', 'Guitarra electrica clasica con cuerpo de caoba maciza, tapa de arce figurado AA, mastil de caoba con perfil fino de los 60 y pastillas Humbucker dobles.', 2799.00, 4, 4, NULL, 4, 'https://r2.gear4music.com/media/146/1463156/1200/preview.jpg', '/imagenes/productos/gibson_les_paul_standard_60s_bourbon_burst.jpg'),
('RG550 Genesis Collection White', 'IBN-RG550-WH', 'Fabricada en Japon. Modelo superstrat legendario con cuerpo de tilo, mastil Super Wizard de 5 piezas de arce/nogal, pastillas Ibanez V7/S1/V8 y puente tremolo Edge.', 999.99, 4, 3, NULL, 1, 'https://images.guitarguitar.co.uk/cdn/large/170/260608458977027f4.jpg?h=500&maxwidth=770&scale=canvas&bg=ffffff&quality=70', '/imagenes/productos/ibanez_rg550_genesis_collection_white.jpg'),
('American Ultra Telecaster Butterscotch', 'FEN-ULTRA-TELE-BS', 'Guitarra de gama alta con contornos de cuerpo esculpidos, mastil en D moderno, pastillas Ultra Noiseless Vintage Tele y conmutador S-1 en la perilla de volumen.', 2199.99, 4, 2, NULL, 6, 'https://media.sweetwater.com/m/products/image/61bcdb4056kuIKmxD82KLxy7duP7klizuaLF04vN.png?quality=1&ha=61bcdb405645dc6e', '/imagenes/productos/fender_american_ultra_telecaster_butterscotch.webp'),
('SG Standard Heritage Cherry', 'GIB-SGS-HC', 'Iconico dise??o de doble cutaway de caoba ligera con golpeador negro de 5 capas, mastil de caoba de perfil redondeado y pastillas humbucker dobles.', 1799.00, 4, 4, NULL, 5, 'https://www.themusiczoo.com/cdn/shop/files/64085_Gibson_SG_Standard_Heritage_Cherry_230240230_1_25c41155-e927-4d78-9baf-aebf4e2f7005_720x720.jpg?v=1732133676', '/imagenes/productos/gibson_sg_standard_heritage_cherry.webp'),
('Revstar Standard RSS20 Flash Green', 'YAM-RSS20-FGR', 'Guitarra inspirada en motocicletas Cafe Racer. Cuerpo de caoba ahuecado con refuerzos de carbono, pastillas humbucker Alnico V y selector Focus Switch pasivo.', 799.99, 4, 1, NULL, 7, 'https://media.sweetwater.com/m/products/image/2d3d26ed53KHlBIKdov2ypVZpGHofBUKeenWSY18.webp?quality=1&ha=2d3d26ed5357ef7d', '/imagenes/productos/yamaha_revstar_standard_rss20_flash_green.webp'),
('Casiotone CT-S300 Portable Keyboard', 'CAS-CTS300-BK', 'Teclado sensitivo de 61 teclas estilo piano con rueda de pitch bend, 400 tonos integrados, 77 ritmos de acompa??amiento y conexion USB MIDI. Dise??o portatil con asa.', 159.00, 5, 7, NULL, 3, 'https://dagnamusic.com/wp-content/uploads/2024/06/CT-S300-4-860x1184.jpg', '/imagenes/productos/casio_casiotone_ct_s300_portable_keyboard.webp'),
('PSR-E373 61-Key Touch Sensitive', 'YAM-PSRE373', 'Teclado organizador dinamico equipado con el generador de tonos LSI de Yamaha, 622 voces de alta calidad, efectos DSP avanzados y lecciones integradas Y.E.S.', 219.99, 5, 1, NULL, 1, 'https://www.gopandy.com/wp-content/uploads/2021/03/yamaha-psr-373-01.jpg', '/imagenes/productos/yamaha_psr_e373_61_key_touch_sensitive.jpg'),
('GO KEYS 61 Music Creation Keyboard', 'ROL-GOKEYS-61', 'Teclado creativo con funcion Loop Mix que permite componer canciones completas tocando notas individuales. Incluye conectividad Bluetooth Audio/MIDI y 500 sonidos.', 329.00, 5, 5, NULL, 5, 'https://cdn.roland.com/products/gokeys/features/gallery_gokeys_02.jpg', '/imagenes/productos/roland_go_keys_61_music_creation_keyboard.jpg'),
('P-225B Digital Piano Black', 'YAM-P225B', 'Piano digital compacto de 88 teclas contrapesadas con mecanismo Graded Hammer Compact (GHC), muestras del piano de cola Yamaha CFX y altavoces estereo.', 749.99, 6, 1, NULL, 2, 'https://media.sweetwater.com/m/products/image/a425eeb24daJ06qVUFuTyO9RuihWFwqohzDTANdN.jpg?quality=82&ha=a425eeb24d2d1a04', '/imagenes/productos/yamaha_p_225b_digital_piano_black.webp'),
('FP-30X Digital Piano Black', 'ROL-FP30X-BK', 'Piano portatil galardonado con motor de sonido SuperNATURAL Piano de Roland, teclado PHA-4 Standard de 88 teclas con tacto de marfil y conexion Bluetooth.', 749.00, 6, 5, NULL, 4, 'https://images.guitarguitar.co.uk/cdn/large/170/210108365820025f.jpg?h=500&maxwidth=770&scale=canvas&bg=ffffff&quality=70', '/imagenes/productos/roland_fp_30x_digital_piano_black.jpg'),
('ES120 Portable Digital Piano', 'KAW-ES120-BK', 'Piano digital ligero con accion de teclado Responsive Hammer Compact (RHC), sonidos del piano de cola Shigeru Kawai SK-EX y amplificacion desarrollada con Onkyo.', 899.00, 6, 8, NULL, 6, 'https://ca.kawaius.com/_next/image?url=https:%2F%2Fcdn.shopify.com%2Fs%2Ffiles%2F1%2F0740%2F4670%2F1723%2Ffiles%2FES120B_above_panel.png%3Fv%3D1776114229&w=3840&q=75', '/imagenes/productos/kawai_es120_portable_digital_piano.avif'),
('Privia PX-S1100 BK', 'CAS-PXS1100-BK', 'El piano digital de 88 teclas contrapesadas mas delgado del mundo. Panel superior tactil brillante con sensores capacitivos y motor de sonido AiR.', 699.95, 6, 7, NULL, 7, 'https://www.casio.com/content/dam/casio/product-info/locales/us/en/emi/product/P/PX/PXS/px-s1100bk/assets/PX-S1100BK_main01.png', '/imagenes/productos/casio_privia_px_s1100_bk.avif'),
('Minilogue XD Hybrid Synthesizer', 'KRG-MINILOG-XD', 'Sintetizador polifonico analogico de 4 voces con motor multiefectos digital de 32 bits, secuenciador de pasos de 16 pasos, arpegiador y 3er oscilador digital programable.', 649.99, 7, 6, NULL, 1, 'https://cdn.korg.com/tw/products/upload/2336a7cecc342daa31e24e24d9c9a39f_pc.png', '/imagenes/productos/korg_minilogue_xd_hybrid_synthesizer.png'),
('JU-06A Sound Module Boutique', 'ROL-JU06A', 'Sintetizador compacto en formato modulo que recrea fielmente el sonido clasico de los legendarios Juno-60 y Juno-106 en un solo equipo con filtro anal??gico.', 399.00, 7, 5, NULL, 3, 'https://media.sweetwater.com/m/products/image/6aa51e7230VWcmQgLqoa0rTuCpymKmkieZCTW28f.jpg?quality=82&ha=6aa51e72309dac60', '/imagenes/productos/roland_ju_06a_sound_module_boutique.webp'),
('wavestate Wave Sequencing Synth', 'KRG-WAVESTATE', 'Sintetizador de secuenciacion de ondas Wave Sequencing 2.0 que ofrece transformaciones organicas complejas de sonido en tiempo real con 64 voces de polifonia.', 799.00, 7, 6, NULL, 5, 'https://cdn.korg.com/us/products/upload/4968c9fbc1f1a29e1779e82808460554_pc.png', '/imagenes/productos/korg_wavestate_wave_sequencing_synth.png'),
('GC1 SH2 Silent Grand Piano', 'YAM-GC1-SH2', 'Piano de cola completo de 161 cm de longitud que combina el tono resonante de la serie C de Yamaha con el sistema Silent SH2 para tocar en silencio con auriculares.', 24990.00, 8, 1, NULL, 2, 'https://greenemusic.com/app/uploads/2025/03/IMG_0633.jpg', '/imagenes/productos/yamaha_gc1_sh2_silent_grand_piano.webp'),
('Model S Baby Grand Piano', 'STN-MODEL-S', 'El piano de cola mas compacto de Steinway (155 cm). Construido artesanalmente con armaz??n de hierro fundido, tapa armonica de abeto macizo y accion patente Steinway.', 69500.00, 8, 9, NULL, 4, 'https://cdn11.bigcommerce.com/s-1d6ehl9rzp/images/stencil/1280x1280/products/392/4192/IMG_0520__74251.1709659706.jpg?c=2', '/imagenes/productos/steinway_sons_model_s_baby_grand_piano.webp'),
('Vinilo Prog Rock Dark Side Edition 180g', 'VIN-PROG-DS', 'Edicion en disco de vinilo de 180 gramos remasterizado de album conceptual clasico de rock progresivo mundial. Incluye arte impreso de coleccionista.', 38.50, 9, NULL, NULL, 1, 'https://eskisehirplak.com/4860-large_default/various-artists-progressive-rock-limited-edition-transparet-vinyl-2lp.jpg', '/imagenes/productos/vinilo_prog_rock_dark_side_edition_180g.jpg'),
('Vinilo Jazz Classics Kind Blue 180g', 'VIN-JAZZ-KB', 'Disco de vinilo audiofilo de 180 gramos prensado directamente desde las cintas analogicas originales de estudio. Clasico indiscutible del jazz modal.', 32.00, 9, NULL, NULL, 6, 'https://discosega.es/10022-large_default/miles-davis-kind-of-blue-lp-vinilo-blue-transparente-180-gr.jpg', '/imagenes/productos/vinilo_jazz_classics_kind_blue_180g.jpg'),
('CD Audio Abbey Remastered Edition', 'CD-ABBEY-RM', 'Edicion especial en disco compacto con la mezcla estereo remasterizada digitalmente a partir de las cintas de sesion originales de estudio.', 19.99, 10, NULL, NULL, 2, 'https://auctions.c.yimg.jp/images.auctions.yahoo.co.jp/image/dr000/auc0311/users/f71b17b0a6ae47e635f2d302dc346174e90f9fa6/i-img1200x900-1668311749ku9ogg115370.jpg', '/imagenes/productos/cd_audio_abbey_remastered_edition.jpg'),
('CD Audio Pop Album Edition', 'CD-POP-ALBUM', 'Disco compacto original remasterizado del album pop mas vendido de la historia con sonido de alta fidelidad digital y libreto explicativo de canciones.', 14.99, 10, NULL, NULL, 5, 'https://media1.jpc.de/image/w1155/front/0/0196588366123.jpg', '/imagenes/productos/cd_audio_pop_album_edition.jpg'),
('Cassette Tape Rock Hits 90s Limited', 'CAS-ROCK-90', 'Edicion en cinta de cassette de audio de color transparente de album rock clasico de los a??os 90. Presentacion limitada en caja de metacrilato.', 18.00, 11, NULL, NULL, 3, 'https://i.etsystatic.com/39253266/r/il/c303e1/4874785158/il_fullxfull.4874785158_7nxq.jpg', '/imagenes/productos/cassette_tape_rock_hits_90s_limited.webp'),
('Cassette Tape Classic Hits Anthology', 'CAS-CLASSIC-HITS', 'Cassette clasico de alta calidad de cinta de cromo tipo II con grandes exitos de rock clasico en formato analogico retro.', 16.50, 11, NULL, NULL, 7, 'https://retrospekt.com/cdn/shop/files/CS-VR-5569_1.jpg?v=1718026464&width=3000', '/imagenes/productos/cassette_tape_classic_hits_anthology.webp'),
('Player Precision Bass 3-Color Sunburst', 'FEN-PL-PBASS-3TS', 'Bajo electrico de 4 cuerdas clasico con cuerpo de aliso, pastilla split-coil Player Series de alnico V, mastil de arce con perfil C moderno y diapason de palisandro.', 849.99, 12, 2, NULL, 1, 'https://www.themusiczoo.com/cdn/shop/products/38183__1_720x720.jpg?v=1662356808', '/imagenes/productos/fender_player_precision_bass_3_color_sunburst.webp'),
('StingRay Special 4 H Jet Black', 'MM-STINGRAY4-BLK', 'Bajo electrico activo iconico con cuerpo ligero de fresno, pastilla humbucker de alnico neodimio, previo activo de 18 voltios con EQ de 3 bandas.', 2499.00, 12, 10, NULL, 4, 'http://www.chicagomusicexchange.com/cdn/shop/products/music-man-bass-guitars-4-string-music-man-stingray-special-4-h-black-2018-u3992264704-29422396833927_grande.jpg?v=1658896335', '/imagenes/productos/music_man_stingray_special_4_h_jet_black.webp'),
('SR300EDX Soundgear Velvet Red', 'IBN-SR300EDX-VRD', 'Bajo ultra ergon??mico de 4 cuerdas con mastil delgado de 5 piezas de arce/nogal, pastillas duales PowerSpan Dual Coil y electronica de 3 bandas Ibanez Custom.', 399.99, 12, 3, NULL, 6, 'https://www.ibanez.com/common/product_artist_file/file/p_region_SR300EDX_WZM_1P_04.png', '/imagenes/productos/ibanez_sr300edx_soundgear_velvet_red.png'),
('RockBass Corvette Basic 4 Nirvana Black', 'WRW-RBC-BASIC4', 'Bajo electrico activo de 4 cuerdas construido con cuerpo de aliso macizo, mastil atornillado de arce, pastillas pasivas MEC J/J y circuito activo MEC de 2 vias.', 799.00, 12, 11, NULL, 2, 'http://shop.warwick.de/media/b3/b7/18/1753178562/26368503bdad4887_WRB1504_03AA_ALD_FL_04.webp?ts=1753178562', '/imagenes/productos/warwick_rockbass_corvette_basic_4_nirvana_black.webp'),
('Kingman Bass SCE Black V2', 'FEN-KINGMAN-BASS', 'Bajo electroacustico estilo dreadnought de caja profunda con pala estilo Jazz Bass, escala corta de 30 pulgadas, tapa de abeto macizo y previo Fishman.', 599.99, 13, 2, NULL, 3, 'https://media.sweetwater.com/m/products/image/fe52b9af8cJreeTJq6xGHCq2iwHjgTyxWThsVY4h.wm-dh.jpg?v=fe52b9af8c64517c', '/imagenes/productos/fender_kingman_bass_sce_black_v2.webp'),
('PCBE12MH Acoustic Bass Open Pore', 'IBN-PCBE12MH-OPN', 'Bajo acustico de escala corta (32 pulg) de cuerpo de caoba Grand Concert con acabado de poro abierto natural, pastilla bajo puente Ibanez y previo AEQ-2T.', 299.99, 13, 3, NULL, 5, 'https://www.ibanez.com/common/product_artist_file/file/p_region_PCBE12MH_OPN_1P_06.png', '/imagenes/productos/ibanez_pcbe12mh_acoustic_bass_open_pore.png'),
('Bass Multiple Effects GT-1B', 'BSS-GT1B', 'Pedalera multiefectos para bajo equipada con el motor de sonido de gama alta de BOSS, 90 tipos de efectos optimizados para bajo y pedal de expresion.', 229.00, 14, 13, NULL, 7, 'https://evolutionmusicstore.com/cdn/shop/files/f7i1ji0zxejxfvthiwzz_b5d7307e-854e-4777-a8b9-8ed05aed3612_2000x.jpg?v=1775263756', '/imagenes/productos/boss_bass_multiple_effects_gt_1b.jpg'),
('M80 Bass D.I. Distortion Pedal', 'MXR-M80-BASS', 'Caja directa y preamplificador anal??gico para bajo en formato pedal de aluminio. Cuenta con canales Clean y Distortion, Noise Gate y EQ de 3 bandas.', 169.99, 14, 14, NULL, 1, 'https://media.sweetwater.com/m/products/image/1c3a1f9a66KBbROtnHoLhRVuDwRjcg5HMKx0QwDU.jpg?quality=82&ha=1c3a1f9a666ddf82', '/imagenes/productos/mxr_m80_bass_d_i_distortion_pedal.webp'),
('MultiComp Studio Edition Bass Pedal', 'EBS-MULTICOMP', 'Pedal compresor analogico de doble banda de calidad de estudio dise??ado exclusivamente para guitarra baja con modos Tubesim, MultiBand y Normal.', 199.00, 14, 12, NULL, 4, 'https://ebssweden.com/wp-content/uploads/MC_bigmenu.png', '/imagenes/productos/ebs_multicomp_studio_edition_bass_pedal.png'),
('Export EXX 5-Piece Drum Set Jet Black', 'PRL-EXX725S-JB', 'La bateria acustica mas vendida de la historia. Cascos de 6 capas de 7.5mm de alamo y caoba asiatica, sistema Opti-Loc y paquete de herrajes serie 830.', 899.00, 15, 15, NULL, 2, 'https://pearldrum.com/sites/default/files/image_folder/PRODUCTS/DRUMSETS/EXPORT_EXX/GALLERY/EXX725SC31-Export-Series-31-Jet-Black-with-Add-On-Componentsw745h429.jpg', '/imagenes/productos/pearl_export_exx_5_piece_drum_set_jet_black.jpg'),
('Imperialstar 22 5-Piece Complete Kit', 'TMA-IP52H6W-HBK', 'Bateria acustica completa construida con cascos de ??lamo 100% de 8mm y 6 capas, aros Accu-Tone y conjunto completo de platillos Meinl BCS incluidos.', 799.00, 15, 16, NULL, 5, 'https://r2.gear4music.com/media/90/904751/1200/preview_1.jpg', '/imagenes/productos/tama_imperialstar_22_5_piece_complete_kit.jpg'),
('Design Series 4-Piece Shell Pack Gloss', 'DW-DDLG2204-CL', 'Set de cascos profesionales de bateria fabricados con arce americano North American Hard Rock 100% con afinadores True-Pitch y parches Remo USA.', 1699.00, 15, 17, NULL, 6, 'https://media.sweetwater.com/m/products/image/b2de800fe3AUDhPkOc5rFLw8nXQSE5JULQpD1vfh.jpg?quality=82&ha=b2de800fe38a0304', '/imagenes/productos/dw_drums_design_series_4_piece_shell_pack_gloss.webp'),
('V-Drums TD-17KVX2 Electronic Set', 'ROL-TD17KVX2', 'Bateria electronica avanzada con pad de caja de malla PDX-12 de 12 pulgadas, platillo hi-hat flotante VH-10 y motor de sonido TD-17 V2 actualizado.', 1799.00, 16, 5, NULL, 3, 'https://cdn.shopaccino.com/azad-music/products/roland-v-drums-td-17kvx2-electronic-drum-set-with-mds-compact-stand-83931643370908_l.jpg?v=651?param=2', '/imagenes/productos/roland_v_drums_td_17kvx2_electronic_set.jpg'),
('Strike Pro Special Edition E-Drum', 'ALE-STRIKEPRO-SE', 'Bateria electronica de tama??o completo acustico con cascos de madera reales de 5 piezas, parche de bombo de 20 pulgadas y modulo Strike con 136 kits.', 2499.00, 16, 37, NULL, 7, 'https://d1aeri3ty3izns.cloudfront.net/media/52/525186/1200/preview.jpg', '/imagenes/productos/alesis_strike_pro_special_edition_e_drum.jpg'),
('D-790 Drum Throne Round', 'PRL-D790', 'Banqueta para baterista ajustable en altura mediante pasador deslizante con asiento redondo acolchado de vinilo y patas de doble perfil antideslizantes.', 79.99, 17, 15, NULL, 1, 'https://www.sweetwater.com/images/closeup/750-D790_detail2.jpg', '/imagenes/productos/pearl_d_790_drum_throne_round.jpg'),
('1st Chair Ergo-Rider Drum Throne', 'TMA-HT730B', 'Banqueta ergonomica hibrida de perfil tipo montura redonda que ofrece maxima libertad de movimiento para los muslos con ajuste de altura por rosca.', 189.99, 17, 16, NULL, 4, 'https://www.tama.com/common/product_artist_file/file/pen_Drum_Throne_con_sp.jpg', '/imagenes/productos/tama_1st_chair_ergo_rider_drum_throne.jpg'),
('K Custom Dark Crash 18 Inch', 'ZIL-K0953', 'Platillo crash de 18 pulgadas fundido en aleacion B20 con martillado profundo K. Ofrece un sonido oscuro, seco y complejo con atenuacion rapida.', 369.95, 18, 18, NULL, 2, 'https://media.sweetwater.com/api/i/ha-cbf9573dba066fc7__hmac-9607c8a77de07d36a3e98266348ed2865c175838/images/items/750/KC18DC-large.jpg', '/imagenes/productos/zildjian_k_custom_dark_crash_18_inch.jpg'),
('HHX Complex Promotional Cymbal Set', 'SAB-15005XCN', 'Set de platillos de bronce B20 martillados a mano que incluye Hi-Hats de 14 pulg, Crash de 16 y 18 pulg y Ride de 20 pulg.', 1099.00, 18, 19, NULL, 5, 'https://sabian.com/wp-content/uploads/cymbals/SABIAN-HHX-ComplexPromo-Set-15005XCNP-BoxCymbals.png', '/imagenes/productos/sabian_hhx_complex_promotional_cymbal_set.png'),
('A Custom Hi-Hats 14 Inch Pair', 'ZIL-A20510', 'Pareja de hi-hats de 14 pulgadas fabricados con acabado brillante. Entregan un sonido de chick limpio, brillante y cortante con gran articulacion.', 399.95, 18, 18, NULL, 3, 'https://media.sweetwater.com/m/products/image/7974e80fa4s1zvjh3m5TTL0MnAcBNoOoSRdJdlav.wm-lw.jpg?quality=82&width=750&ha=7974e80fa49d7909', '/imagenes/productos/zildjian_a_custom_hi_hats_14_inch_pair.webp'),
('AAX Medium Ride 20 Inch Brilliant', 'SAB-22012XB', 'Platillo ride de 20 pulgadas de bronce B20 de peso medio. Proporciona una respuesta de baqueta clara y brillante con una campana potente.', 339.00, 18, 19, NULL, 6, 'https://media.sweetwater.com/m/products/image/682f64aecdJnRXuFvBwRf0pBzq05JL3scTGTtFLr.jpg?quality=82&ha=682f64aecd548b61', '/imagenes/productos/sabian_aax_medium_ride_20_inch_brilliant.webp'),
('Classic Model Conga 11 3/4 Oak', 'LP-LP559X-AW', 'Conga clasica de madera de roble de Siam de 30 pulgadas de altura con aros Comfort Curve II, parche de cuero natural y tensores de 5/16 pulgadas.', 549.00, 19, 20, NULL, 1, 'https://www.lpmusic.com/_next/image/?url=https:%2F%2Fcdn.shopify.com%2Fs%2Ffiles%2F1%2F0621%2F5027%2F9317%2Ffiles%2FLP559T-VSB_ALT1.jpg%3Fv%3D1773082751&w=5120&q=90', '/imagenes/productos/lp_percussion_classic_model_conga_11_3_4_oak.avif'),
('Matador Wood Bongo Set Natural', 'LP-M201-AW', 'Juego de bongos tradicional de 7-1/4 y 8-5/8 pulgadas construido en roble de Siam con herrajes dorados/cromados recubiertos en polvo.', 229.00, 19, 20, NULL, 4, 'https://electroeshop.com/cdn/shop/files/9123TVy4U8L.jpg?v=1762022894&width={width}', '/imagenes/productos/lp_percussion_matador_wood_bongo_set_natural.webp'),
('Cajon Primero Box Acoustic Wood', 'PRL-PBC507', 'Cajon flamenco/peruano construido en MDF resistente con placa frontal de pino asiatico resonante y bordones de caja internos dobles.', 129.00, 19, 15, NULL, 7, 'https://media.sweetwater.com/m/products/image/d83a38a855LLxUU97qbJjkmjcZTIZX9jiVqKnfOt.jpg?quality=82&ha=d83a38a855629a1a', '/imagenes/productos/pearl_cajon_primero_box_acoustic_wood.webp'),
('Compadre GCF Diatonic Accordion Black', 'HOH-COMPADRE-BLK', 'Acordeon diatonico de 3 hileras con 31 botones agudos, 12 botones de bajo y parrilla de resonancia abierta. Incluye correas textiles y funda gigante.', 799.00, 20, 21, NULL, 2, 'https://www.yandasmusic.com/cdn/shop/products/hohner-compadre-diatonic-black-accordion-gcf-28405642690753.jpg?v=1696178564&width=1096', '/imagenes/productos/hohner_compadre_gcf_diatonic_accordion_black.webp'),
('Panther GCF Diatonic Accordion', 'HOH-PANTHER-GCF', 'Acordeon diatonico economico de 31 botones agudos y 12 botones de bajos con acabado negro mate y ca??as de afinacion tradicional norte??a.', 599.00, 20, 21, NULL, 5, 'https://media.sweetwater.com/m/products/image/3a050dd2ceQGHrXVF4wvUrEB4IqK7MZz54FTyjpN.wm-dw.jpg?quality=82&width=750&ha=3a050dd2ce5dfcb1', '/imagenes/productos/hohner_panther_gcf_diatonic_accordion.webp'),
('Prodige Bb Clarinet ABS Body', 'BUF-BC2541-5-0', 'Clarinete en Si bemol con cuerpo de resina ABS de alta durabilidad acabado efecto madera, zapatillas de cuero sint??tico y llaves niqueladas.', 690.00, 21, 22, NULL, 3, 'https://thumbs.static-thomann.de/thumb/padthumb600x600/pics/bdb/_58/580931/18749331_800.jpg', '/imagenes/productos/buffet_crampon_prodige_bb_clarinet_abs_body.jpg'),
('YCL-255 Standard Bb Clarinet', 'YAM-YCL255', 'Clarinete de resina ABS mate con dise??o de campana sin anillo de metal para menor peso, tudel de alpaca y mecanismo niquelado.', 769.00, 21, 1, NULL, 6, 'https://usa.yamaha.com/files/YCL-255-PC_e5674cabe00f4671e145f5ecce60efa0.jpg?impolicy=resize&imwid=2000&imhei=800', '/imagenes/productos/yamaha_ycl_255_standard_bb_clarinet.jpg'),
('YFL-222 Student Flute Offset G', 'YAM-YFL222', 'Flauta travesera de llaves cerradas con mecanica de Sol desalineado (Offset G), cuerpo y cabeza de niquel-plata con ba??o de plata.', 849.00, 22, 1, NULL, 1, 'https://media.sweetwater.com/m/products/image/23eac5f14arLkcVwMd1eCQOwk9F1FxQXJzNvPpuA.jpg?quality=1&ha=23eac5f14a859a6b', '/imagenes/productos/yamaha_yfl_222_student_flute_offset_g.webp'),
('JFL700E Student Flute Split E', 'JUP-JFL700E', 'Flauta travesera con plato cerrado de plata alemana con mecanismo de Mi mecanico (Split E), bisel de plata de ley 925 y muelles de acero.', 729.00, 22, 40, NULL, 4, 'https://todomusica.com.ar/21015-large_default/jfl700e-jfl700e.jpg', '/imagenes/productos/jupiter_jfl700e_student_flute_split_e.jpg'),
('YRS-24B Soprano Recorder Baroque', 'YAM-YRS24B', 'Flauta dulce soprano en Do con digitacion barroca fabricada en resina ABS de 3 piezas lavable. Instrumento escolar clasico.', 10.99, 23, 1, NULL, 7, 'https://thumbs.static-thomann.de/thumb/padthumb600x600/pics/bdb/_14/140092/10298773_800.jpg', '/imagenes/productos/yamaha_yrs_24b_soprano_recorder_baroque.jpg'),
('Allegro 9508 Wood Soprano Recorder', 'HOH-9508', 'Flauta dulce soprano escolar de madera de peral seleccionada de una sola pieza con digitacion alemana que ofrece un timbre dulce y calido.', 34.50, 23, 21, NULL, 2, 'https://www.musicaltommy.com/23179-large_default/flauta-hohner-9508.jpg', '/imagenes/productos/hohner_allegro_9508_wood_soprano_recorder.jpg'),
('YAS-280 Student Alto Saxophone', 'YAM-YAS280', 'Saxof??n alto en Mi bemol dise??ado con tudel estilo 280 de respuesta facil, receptor de tudel mejorado y apoyo del pulgar ajustable.', 1499.00, 24, 1, NULL, 3, 'https://chucklevins.com/cdn/shop/files/2de005a6-aaed-47d4-9b46-3d7ae39b7477.jpg?v=1769060666&width=2000', '/imagenes/productos/yamaha_yas_280_student_alto_saxophone.webp'),
('SAS280 La Voix II Alto Saxophone', 'SLM-SAS280-GY', 'Saxo alto profesional con cuerpo de lat??n amarillo lacado en oro, campana grande ac??stica acampanada artesanalmente y zapatillas sinteticas estancas.', 2199.00, 24, 23, NULL, 5, 'https://millerssaxshop.com/wp-content/uploads/2019/02/SAS280R_High-Res_758-768x1500.jpg', '/imagenes/productos/selmer_sas280_la_voix_ii_alto_saxophone.jpg'),
('JTS700 Tenor Saxophone Gold Lacquer', 'JUP-JTS700', 'Saxof??n tenor en Si bemol con cuerpo y llaves de lat??n lacado dorado, llave de Fa# agudo y muelles de aguja de acero azul.', 1749.00, 24, 40, NULL, 1, 'https://media.sweetwater.com/m/products/image/75e4e09f57wgcYMNB4L9t7qGOPQDA5R9b1nNJBzB.jpg?quality=1&ha=75e4e09f57123238', '/imagenes/productos/jupiter_jts700_tenor_saxophone_gold_lacquer.webp'),
('TB301 Student Tenor Trombone', 'BCH-TB301', 'Trombon tenor en Si bemol con tuber??a de .500 pulgadas, campana de lat??n amarillo de 8 pulgadas y vara exterior de alpaca cromada.', 1189.00, 25, 24, NULL, 6, 'https://media.sweetwater.com/api/i/q-85__ha-011fa83266f0d9b7__hmac-ea5535a46949527670045188ab8cadb792da38c4/images/closeup/750-BATB301_detail1.jpg', '/imagenes/productos/bach_tb301_student_tenor_trombone.jpg'),
('YSL-354 Standard Tenor Trombone', 'YAM-YSL354', 'Trombon tenor de vara ligera y balance de peso excelente. Posee campana de 8 pulg de laton amarillo y vara interior de alpaca niquelada.', 1299.00, 25, 1, NULL, 4, 'https://usa.yamaha.com/files/YSL354_square_735x735_59023a1dee28e3112f51b6d7d3d9c6a8.jpg?impolicy=resize&imwid=735&imhei=735', '/imagenes/productos/yamaha_ysl_354_standard_tenor_trombone.jpg'),
('180S37 Stradivarius Bb Trumpet Silver', 'BCH-180S37-SLV', 'La trompeta profesional de referencia en orquestas. Campana #37 de una pieza martillada a mano, tuberia .459 pulg y acabado en plata pura.', 3395.00, 26, 24, NULL, 2, 'https://thumbs.static-thomann.de/thumb/padthumb600x600/pics/bdb/_10/100206/14190162_800.jpg', '/imagenes/productos/bach_180s37_stradivarius_bb_trumpet_silver.jpg'),
('YTR-2330 Standard Bb Trumpet', 'YAM-YTR2330', 'Trompeta en Si bemol con campana de lat??n amarillo de dos piezas de peso equilibrado, pistones de monel y gatillo de afinacion en la 3ra bomba.', 699.00, 26, 1, NULL, 7, 'https://usa.yamaha.com/files/ytr-2330_540x540_bb007ef757120951e09626aca13386e1.jpg', '/imagenes/productos/yamaha_ytr_2330_standard_bb_trumpet.jpg'),
('KA-15S Satin Mahogany Soprano Ukulele', 'KAL-KA15S', 'Ukelele soprano tradicional construido integramente en madera de caoba seleccionada con acabado satinado natural y cuerdas Aquila Super Nylgut.', 69.00, 27, 25, NULL, 1, 'https://kalabrand.com/cdn/shop/files/KA15SBNDL2006_1_1024x.jpg?v=1684779890', '/imagenes/productos/kala_ka_15s_satin_mahogany_soprano_ukulele.webp'),
('KA-C Concert Mahogany Ukulele', 'KAL-KAC-NAT', 'Ukelele tama??o concierto de cuerpo mas amplio de caoba que produce mas volumen y sonoridad grave que el soprano. Diapason de nogal indio.', 89.00, 27, 25, NULL, 5, 'https://shop.warwick.de/media/84/1b/f6/1750079767/965685019174eba5_KA_KA_CG_RW_01.jpg.jpg?ts=1770672943', '/imagenes/productos/kala_ka_c_concert_mahogany_ukulele.jpg'),
('Fullerton Telecaster Ukulele Butterscotch', 'FEN-FULL-TELE-UKE', 'Ukelele electroacustico formato concierto que recrea el cuerpo y la pala de una guitarra Fender Telecaster con preamplificador y afinador.', 219.99, 27, 2, NULL, 3, 'https://stangguitars.com/cdn/shop/products/FenderFullertonTeleUkuleleButterscotchBlonde1_grande.jpg?v=1592260527', '/imagenes/productos/fender_fullerton_telecaster_ukulele_butterscotch.webp'),
('Student II Violin Outfit 4/4', 'STE-1500-44', 'Violin de tama??o completo 4/4 tallado a mano en maderas macizas de abeto y arce con diapason de ebano autentico, arco de palo brasil y estuche duro.', 249.00, 28, 26, NULL, 4, 'https://r2.gear4music.com/media/11/115754/1200/preview.jpg', '/imagenes/productos/stentor_student_ii_violin_outfit_4_4.jpg'),
('V5SC Student Violin Outfit 4/4', 'YAM-V5SC44', 'Violin de iniciacion artesanal con tapa de abeto tallada, fondo y aros de arce, tirantes Wittner con 4 afinadores micro y acabado a mano.', 599.00, 28, 1, NULL, 2, 'https://media.sweetwater.com/m/products/image/a59fa47e4dVniOLHBhPGBHRlhXzcrvTvwOORQzSf.wm-dw.jpg?quality=82&width=750&ha=a59fa47e4d803083', '/imagenes/productos/yamaha_v5sc_student_violin_outfit_4_4.webp'),
('YSV104 Silent Violin Black', 'YAM-YSV104-BK', 'Violin silencioso de practica electronico que utiliza la tecnologia SRT Powered para simular la resonancia de un violin acustico real en auriculares.', 899.00, 28, 1, NULL, 6, 'https://eljuri.store/12146-large_default/violin-silent-ysv104-negro.jpg', '/imagenes/productos/yamaha_ysv104_silent_violin_black.jpg'),
('ATH-M50x Professional Studio Monitor', 'AT-ATH-M50X', 'Auriculares de monitoreo profesional cerrados con transductores de gran apertura de 45 mm, imanes de neodimio, aislamiento acustico superior.', 149.00, 29, 28, NULL, 1, 'https://www.audio-technica.com/en-us/media/catalog/product/cache/177161fc218aa2dd413f2b73f6832b88/a/t/ath-m50x_lab_02.png', '/imagenes/productos/audio_technica_ath_m50x_professional_studio_monitor.png'),
('HD 280 Pro Closed Back Headphones', 'SEN-HD280PRO', 'Auriculares de monitoreo para DJ y estudio de alta atenuacion pasiva del ruido exterior (hasta 32dB), respuesta plana lineal y almohadillas reemplazables.', 99.95, 29, 27, NULL, 4, 'https://c1.neweggimages.com/ProductImageCompressAll1280/A6ZP_1_20200409933649056.jpg', '/imagenes/productos/sennheiser_hd_280_pro_closed_back_headphones.jpg'),
('K240 Studio Semi-Open Headphones', 'AKG-K240-STD', 'Auriculares de dise??o semiabierto clasico para mezcla y masterizacion con transductores XXL con diafragma Varimotion patentado y conector XLR mini.', 79.00, 29, 41, NULL, 7, 'https://media.sweetwater.com/m/products/image/b3bfbb7934mlgnG2lRbZbFN6mFmzyQ7uEZuOmpMb.jpg?quality=1&ha=b3bfbb7934e9cf3e', '/imagenes/productos/akg_k240_studio_semi_open_headphones.webp'),
('SRH840A Professional Studio Headphones', 'SHR-SRH840A', 'Auriculares circumaurales cerrados optimizados para escucha critica en estudio con diafragmas de neodimio de 40 mm de respuesta adaptada.', 149.00, 29, 29, NULL, 3, 'https://shop.shure.com.sg/cdn/shop/products/SRH840A_2_1024x1024.jpg?v=1645518587', '/imagenes/productos/shure_srh840a_professional_studio_headphones.webp'),
('Rokit 5 G4 5-Inch Studio Monitor', 'KRK-RP5G4-NA', 'Monitor de estudio activo de 5 pulgadas con altavoces de Kevlar a juego en woofer y tweeter, pantalla LCD posterior con EQ DSP y guia de onda.', 179.00, 30, 31, NULL, 2, 'https://media.sweetwater.com/m/products/image/f605b0f309AS7nqxpS0N7gZgxV39ne1fFBqMZAE4.jpg', '/imagenes/productos/krk_systems_rokit_5_g4_5_inch_studio_monitor.webp'),
('LSD 305P MkII 5-Inch Powered Monitor', 'JBL-305PMKII', 'Monitor de estudio biamplificado activo de 82 vatios con guia de onda Image Control Waveguide patentada por JBL para una imagen estereo detallada.', 149.00, 30, 30, NULL, 5, 'https://media.sweetwater.com/m/products/image/b8660168d41fpdQcIWMJlJMAWSn6Z1EFhyojIvMH.png?quality=1&ha=b8660168d42fc4c0', '/imagenes/productos/jbl_lsd_305p_mkii_5_inch_powered_monitor.webp'),
('HS5 Powered Studio Monitor Black', 'YAM-HS5-BK', 'Monitor de referencia de estudio activo de campo cercano biamplificado de 70 vatios con el caracteristico woofer blanco de 5 pulgadas.', 199.99, 30, 1, NULL, 6, 'https://media.sweetwater.com/m/products/image/09ca7b39bcWaAvQThZZHiezPLXM98dVS6WF4j5uW.png?quality=1&ha=09ca7b39bc3b1002', '/imagenes/productos/yamaha_hs5_powered_studio_monitor_black.webp'),
('SM58 Dynamic Vocal Microphone', 'SHR-SM58-LC', 'El microfono vocal dinamico cardioide legendario para directo. Filtro esf??rico antipop integrado, suspension pneumatica y respuesta calida.', 99.00, 31, 29, NULL, 1, 'https://shop.shure.com.sg/cdn/shop/products/SM58-LC_Cardioid_Dynamic_Vocal_Microphone_3_1137c20f-bc2d-41d6-a1ba-22401252a65a_1200x1200.png?v=1664862856', '/imagenes/productos/shure_sm58_dynamic_vocal_microphone.webp'),
('SM7B Vocal Dynamic Studio Microphone', 'SHR-SM7B', 'Microfono dinamico de cardioide con respuesta de frecuencia suave para musica, locucion y podcasting. Aislamiento contra zumbidos electromagn??ticos.', 399.00, 31, 29, NULL, 4, 'https://media.sweetwater.com/m/products/image/6d2c512a92Rov0eryrfK2jdkFSLhFkOUiy3nNCLK.jpg?quality=1&ha=6d2c512a928017f5', '/imagenes/productos/shure_sm7b_vocal_dynamic_studio_microphone.webp'),
('SM57 Cardioid Dynamic Instrument Mic', 'SHR-SM57-LC', 'Microfono de instrumento versatil e imprescindible en estudios. Ideal para amplificadores de guitarra electrica, cajas de bateria y vientos.', 99.00, 31, 29, NULL, 2, 'https://guitarhaus.ca/cdn/shop/files/shure-sm57.jpg?v=1703794749&width=1946', '/imagenes/productos/shure_sm57_cardioid_dynamic_instrument_mic.webp'),
('AT2020 Cardioid Condenser Mic', 'AT-AT2020', 'Microfono de condensador de estudio cardioide de diafragma de reducida masa de 16 mm de sonido transparente. Excelente nivel de presion sonora.', 99.00, 31, 28, NULL, 6, 'https://www.audio-technica.com/en-eu/media/catalog/product/cache/177161fc218aa2dd413f2b73f6832b88/a/t/at2020usb_plus_01.png', '/imagenes/productos/audio_technica_at2020_cardioid_condenser_mic.png'),
('e 835 Handheld Dynamic Cardioid Mic', 'SEN-E835', 'Microfono dinamico de voz cardioide para escenarios con elevado rechazo a la realimentacion acustica (feedback) y cuerpo de metal pesado.', 99.95, 31, 27, NULL, 3, 'https://cdn11.bigcommerce.com/s-dd19b/images/stencil/1280x1280/products/34042/135745/Sennheiser_E835S_E835S_Cardioid_Handheld_1576662054_149270__02281.1724175398.jpg?c=2', '/imagenes/productos/sennheiser_e_835_handheld_dynamic_cardioid_mic.webp'),
('Scarlett 2i2 4th Gen Audio Interface', 'FOC-SCARLETT-2I2-4G', 'Interfaz de audio USB-C de 2 entradas y 2 salidas con preamplificadores de ruido ultra bajo, conversores de rango dinamico de 120dB y modo Air.', 199.99, 32, 32, NULL, 1, 'https://cdn11.bigcommerce.com/s-31108/images/stencil/1280x1280/products/2219/28960/Focusrite_Scarlett_2i2_Studio_4G_2__51412.1708086519.jpg?c=2', '/imagenes/productos/focusrite_scarlett_2i2_4th_gen_audio_interface.jpg'),
('Scarlett Solo 4th Gen USB Interface', 'FOC-SOLO-4G', 'Interfaz de audio compacta de 1 entrada de microfono XLR y 1 entrada de instrumento Hi-Z con amplificador de auriculares de alta fidelidad.', 139.99, 32, 32, NULL, 5, 'https://www.skuguitar.com/wp-content/uploads/2026/1/1769568201/focusrite-scarlett-solo-4th-gen-usb-audio-interface.webp', '/imagenes/productos/focusrite_scarlett_solo_4th_gen_usb_interface.webp'),
('Volt 276 USB Audio Interface', 'UA-VOLT-276', 'Interfaz de audio USB de 2 entradas con circuito de emulacion de preamplificador a tubos Vintage y compresor analogico integrado derivado del 1176.', 299.00, 32, 33, NULL, 3, 'https://media.uaudio.com/assetlibrary/v/o/volt_276_feature_6_@2x.jpg', '/imagenes/productos/universal_audio_volt_276_usb_audio_interface.jpg'),
('Apollo Twin X DUO Heritage Edition', 'UA-APOLLO-TWIN-X', 'Interfaz Thunderbolt 3 de procesamiento DSP en tiempo real en formato sobremesa con 2 previos Unison y conversores A/D y D/A de alta gama.', 999.00, 32, 33, NULL, 7, 'https://www.stars-music.com/medias/universal-audio/apollo-twin-x-duo-heritage-edition-hd-4-174108.jpg', '/imagenes/productos/universal_audio_apollo_twin_x_duo_heritage_edition.jpg'),
('Transit Series Electric Gig Bag Grey', 'GAT-GT-ELECTRIC-GRY', 'Funda acolchada tipo gig bag de alta proteccion para guitarra electrica con exterior de tela de nylon resistente al agua y acolchado de espuma de 20 mm.', 129.99, 33, 34, NULL, 2, 'https://gatorco.com/wp-content/uploads/2017/04/GT-ELECTRIC-GRY_FRONT_LT.jpg', '/imagenes/productos/gator_transit_series_electric_gig_bag_grey.jpg'),
('GB-4G-BASS 4G Series Bass Gig Bag', 'GAT-GB4G-BASS', 'Funda acolchada para bajo electrico con acolchado de 20 mm en todos los lados, proteccion adicional de puente y pala y asas mochila.', 79.99, 33, 34, NULL, 6, 'https://media.sweetwater.com/m/products/image/2dc6c71729ROKDaMXy149ki2821WBsfaknwfJm3z.jpg?quality=1&ha=2dc6c7172974f867', '/imagenes/productos/gator_gb_4g_bass_4g_series_bass_gig_bag.webp'),
('EXL110 Nickel Wound Regular Light 10-46', 'DAD-EXL110', 'Juego de 6 cuerdas para guitarra electrica entorchadas en niquel de calibre 10-46. Ofrecen un tono brillante caracteristico de larga duracion.', 7.49, 34, 35, NULL, 1, 'http://www.windmillguitars.com/cdn/shop/products/large_47_1200x1200.png?v=1584552107', '/imagenes/productos/d_addario_exl110_nickel_wound_regular_light_10_46.webp'),
('Regular Slinky Nickel Wound 10-46', 'EB-2221', 'Las cuerdas de guitarra electrica mas famosas del mundo entorchadas con alambre de acero niquelado sobre nucleo de acero hexagonal.', 6.99, 34, 36, NULL, 4, 'http://soundcentre.com.au/cdn/shop/products/ernie-ball-10-46-regular-slinky-nickel-wound_187f6356-f052-49a5-9a13-80a364f0eb48_grande.jpg?v=1652844451', '/imagenes/productos/ernie_ball_regular_slinky_nickel_wound_10_46.webp'),
('EJ16 Phosphor Bronze Light 12-53', 'DAD-EJ16', 'Juego de cuerdas para guitarra acustica en bronce fosforoso de calibre 12-53. Destacan por su calidez tonal equilibrada y timbre acustico rico.', 8.99, 34, 35, NULL, 3, 'https://jakesmainstreetmusic.com/cdn/shop/products/EJ16-xlarge_530x@2x.jpg?v=1571438974', '/imagenes/productos/d_addario_ej16_phosphor_bronze_light_12_53.webp'),
('GC-DREAD ABS Dreadnought Guitar Case', 'GAT-GC-DREAD', 'Estuche rigido de plastico ABS de lujo moldeado exteriormente para guitarra acustica dreadnought con cenefa de aluminio de alta resistencia.', 149.99, 35, 34, NULL, 5, 'https://gatorco.com/wp-content/uploads/2017/04/GC-DREAD_NECK_CU.jpg', '/imagenes/productos/gator_gc_dread_abs_dreadnought_guitar_case.jpg'),
('Deluxe Molded Strat Tele Case Butterscotch', 'FEN-DLX-MOLDED-CASE', 'Estuche rigido oficial de viaje moldeado militarmente con pestillos TSA para guitarras Fender Stratocaster o Telecaster con interior de felpa.', 219.99, 35, 2, NULL, 7, 'https://intl.fender.com/cdn/shop/files/0996102306_fen_acc_fal_1_nr.png?v=1746785956&width=1445', '/imagenes/productos/fender_deluxe_molded_strat_tele_case_butterscotch.webp');


CREATE TABLE inventario (
    id_inventario INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    cantidad INT,
    id_sucursal INT,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);

CREATE TABLE historial_precios (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    precio_anterior DECIMAL(10,2),
    fecha_cambio DATE,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

CREATE TABLE formas_pago (
    id_forma INT AUTO_INCREMENT PRIMARY KEY,
    forma VARCHAR(50),
    proveedora VARCHAR(100)
);

CREATE TABLE puestos (
    id_puesto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    sueldo DECIMAL(10,2)
);

CREATE TABLE empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    id_sucursal INT,
    id_puesto INT,
    FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal),
    FOREIGN KEY (id_puesto) REFERENCES puestos(id_puesto)
);

CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_sucursal INT,
    id_cliente INT,
    id_forma INT,
    fecha DATE,
    tipo VARCHAR(20),
    id_empleado INT,
    id_producto INT,
    cantidad INT,
    precio_total DECIMAL(10,2),
    FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_forma) REFERENCES formas_pago(id_forma),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25-Out-2023 às 14:44
-- Versão do servidor: 8.0.21
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sabombeiro`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacao_cinematica`
--

CREATE TABLE `avaliacao_cinematica` (
  `id_avaliacao_cinematica` int NOT NULL,
  `disturbido_comportamento` tinyint(1) DEFAULT NULL,
  `encontrado_capacete` tinyint(1) DEFAULT NULL,
  `encontrado_cinto` tinyint(1) DEFAULT NULL,
  `para_brisas_avariado` tinyint(1) DEFAULT NULL,
  `caminhando_cena` tinyint(1) DEFAULT NULL,
  `painel_avariado` tinyint(1) DEFAULT NULL,
  `volante_torcido` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `emergencia_medica`
--

CREATE TABLE `emergencia_medica` (
  `id_emergencia_medica` int NOT NULL,
  `oq_aconteceu` varchar(200) DEFAULT NULL,
  `aconteceu_vzs` varchar(100) DEFAULT NULL,
  `problema_saude` varchar(100) DEFAULT NULL,
  `hora_medicacao` time DEFAULT NULL,
  `medicacao` varchar(100) DEFAULT NULL,
  `alergia` varchar(100) DEFAULT NULL,
  `hora_alimento` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ferimentos_queimaduras`
--

CREATE TABLE `ferimentos_queimaduras` (
  `id_ferimentos_queimaduras` int NOT NULL,
  `tipo` enum('ferimentos','fraturas','entorses','luxacao','contusao') DEFAULT NULL,
  `lado` enum('direita','esquerda') DEFAULT NULL,
  `face` enum('frontal','posterior') DEFAULT NULL,
  `local` enum('cabeca','pescoco','ombro','braco','antebraco','mao','dedos','torax','abdomen','costa','quadril','perna','joelho','tornozelo','pe') DEFAULT NULL,
  `1grau` enum('cabeca','pescoco','t.ant','t.pos','genit.','m.i.d','m.i.e','m.s.d','m.s.e') DEFAULT NULL,
  `2grau` enum('cabeca','pescoco','t.ant','t.pos','genit.','m.i.d','m.i.e','m.s.d','m.s.e') DEFAULT NULL,
  `3grau` enum('cabeca','pescoco','t.ant','t.pos','genit.','m.i.d','m.i.e','m.s.d','m.s.e') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `final_info_paciente`
--

CREATE TABLE `final_info_paciente` (
  `id_final_info_paciente` int NOT NULL,
  `numero_usb` varchar(255) DEFAULT NULL,
  `numero_ocorr` varchar(255) DEFAULT NULL,
  `desp` varchar(255) DEFAULT NULL,
  `h_ch` varchar(255) DEFAULT NULL,
  `km_final` varchar(255) DEFAULT NULL,
  `cod_ir` tinyint(1) DEFAULT NULL,
  `cod_ps` tinyint(1) DEFAULT NULL,
  `cod_sia_sus` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `gestacional`
--

CREATE TABLE `gestacional` (
  `id_gestacional` int NOT NULL,
  `periodo` varchar(100) DEFAULT NULL,
  `medico` varchar(60) DEFAULT NULL,
  `complicacao` tinyint(1) DEFAULT NULL,
  `primeiro` tinyint(1) DEFAULT NULL,
  `filhos` int DEFAULT NULL,
  `contracoes` time DEFAULT NULL,
  `duracao` varchar(30) DEFAULT NULL,
  `intervalo` varchar(30) DEFAULT NULL,
  `pressao` tinyint(1) DEFAULT NULL,
  `ruptura` tinyint(1) DEFAULT NULL,
  `inspecao` tinyint(1) DEFAULT NULL,
  `hora_nasc` time DEFAULT NULL,
  `sexo_bebe` tinyint(1) DEFAULT NULL,
  `nome_bebe` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `info_paciente`
--

CREATE TABLE `info_paciente` (
  `id_info_paciente` int NOT NULL,
  `data` date DEFAULT NULL,
  `sexo` tinyint(1) DEFAULT NULL,
  `nome_do_hospital` varchar(255) DEFAULT NULL,
  `nome_do_paciente` varchar(255) DEFAULT NULL,
  `idade_paciente` int DEFAULT NULL,
  `rg_cpf_paciente` varchar(255) NOT NULL,
  `telefone_paciente` varchar(255) DEFAULT NULL,
  `acompanhante` varchar(255) DEFAULT NULL,
  `idade_acompanhante` int DEFAULT NULL,
  `local_da_ocorrencia` varchar(255) DEFAULT NULL,
  `responsavel_preenchimento` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `login`
--

CREATE TABLE `login` (
  `id_login` int NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `administrador` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `materiais_uti_descart`
--

CREATE TABLE `materiais_uti_descart` (
  `id_materiais_descart` int NOT NULL,
  `ataduras_8` int DEFAULT NULL,
  `ataduras_12` int DEFAULT NULL,
  `ataduras_20` int DEFAULT NULL,
  `cateter_tp_oculso` int DEFAULT NULL,
  `comprenssa_comum` int DEFAULT NULL,
  `kit_h` int DEFAULT NULL,
  `kit_p` int DEFAULT NULL,
  `kit_q` int DEFAULT NULL,
  `luvas_descar_pares` int DEFAULT NULL,
  `mascara_desc` int DEFAULT NULL,
  `manta_aluminizada` int DEFAULT NULL,
  `pas_dea` int DEFAULT NULL,
  `sonda_aspiracao` int DEFAULT NULL,
  `soro_fisiologico` int DEFAULT NULL,
  `talas_pap_p` int DEFAULT NULL,
  `talas_pap_g` int DEFAULT NULL,
  `outros` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `materias_uti_deixados_hosp`
--

CREATE TABLE `materias_uti_deixados_hosp` (
  `id_materiais_uti_deixados_hosp` int NOT NULL,
  `base_do_estabiliza` int DEFAULT NULL,
  `colar_n` int DEFAULT NULL,
  `colar_pp` int DEFAULT NULL,
  `colar_p` int DEFAULT NULL,
  `colar_m` int DEFAULT NULL,
  `colar_g` int DEFAULT NULL,
  `colar_outros` varchar(255) DEFAULT NULL,
  `coxin_estabiliza` int DEFAULT NULL,
  `ked_adul` int DEFAULT NULL,
  `ked_infa` int DEFAULT NULL,
  `marca_rigida` int DEFAULT NULL,
  `ttf_adul` int DEFAULT NULL,
  `ttf_infa` int DEFAULT NULL,
  `tirante_aranha` int DEFAULT NULL,
  `tirante_de_cabeca` int DEFAULT NULL,
  `canula` int DEFAULT NULL,
  `outros` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `objetos_recolhido_observacao`
--

CREATE TABLE `objetos_recolhido_observacao` (
  `id_objetos_observacao` int NOT NULL,
  `objetos` varchar(255) NOT NULL,
  `observacoes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ocorrencia_verificacao`
--

CREATE TABLE `ocorrencia_verificacao` (
  `id_ocorre_verifi` int NOT NULL,
  `fk_avaliacao_cinematica` int DEFAULT NULL,
  `fk_emergencia_medica` int DEFAULT NULL,
  `fk_ferimentos_queimaduras` int DEFAULT NULL,
  `fk_final_info_paciente` int DEFAULT NULL,
  `fk_gestacional` int DEFAULT NULL,
  `fk_info_paciente` int DEFAULT NULL,
  `fk_login` int DEFAULT NULL,
  `fk_materiais_uti_descart` int DEFAULT NULL,
  `fk_materiais_uti_deixados_hosp` int DEFAULT NULL,
  `fk_objetos_recolhido_observacao` int DEFAULT NULL,
  `fk_pes` int DEFAULT NULL,
  `fk_procedimentos_efetuados` int DEFAULT NULL,
  `fk_sinais_e_sintomas` int DEFAULT NULL,
  `fk_sinais_vitais` int DEFAULT NULL,
  `fk_situacao_paciente` int DEFAULT NULL,
  `fk_tabelaglasgow` int DEFAULT NULL,
  `fk_termo_recusa` int DEFAULT NULL,
  `fk_tipo_ocorrencia_pre_hospitalar` int DEFAULT NULL,
  `fk_traumas` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pes`
--

CREATE TABLE `pes` (
  `id_pes` int NOT NULL,
  `psiquiatrico` tinyint(1) DEFAULT NULL,
  `respiratorio_dpoc` tinyint(1) DEFAULT NULL,
  `respiratorio_inalacao_fumaca` tinyint(1) DEFAULT NULL,
  `diabetes_hiperglicemia` tinyint(1) DEFAULT NULL,
  `diabetes_hipoglicemia` tinyint(1) DEFAULT NULL,
  `outros` varchar(255) DEFAULT NULL,
  `obstetrico_parto_emergencial` tinyint(1) DEFAULT NULL,
  `obstetrico_gestante` tinyint(1) DEFAULT NULL,
  `obstetrico_hemor_excessiva` tinyint(1) DEFAULT NULL,
  `transporte_aereo` tinyint(1) DEFAULT NULL,
  `transporte_clinico` tinyint(1) DEFAULT NULL,
  `transporte_emergencial` tinyint(1) DEFAULT NULL,
  `transporte_pos_trauma` tinyint(1) DEFAULT NULL,
  `transporte_samu` tinyint(1) DEFAULT NULL,
  `transporte_outros` varchar(255) DEFAULT NULL,
  `transporte_sem_remocao` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `procedimentos_efetuados`
--

CREATE TABLE `procedimentos_efetuados` (
  `aspiracao` tinyint(1) DEFAULT NULL,
  `avaliacao_inicial` tinyint(1) DEFAULT NULL,
  `avaliacao_continuada` tinyint(1) DEFAULT NULL,
  `chave_rautek` tinyint(1) DEFAULT NULL,
  `canula_de_guedel` tinyint(1) DEFAULT NULL,
  `desobstrucao_va` tinyint(1) DEFAULT NULL,
  `emprego_dea` tinyint(1) DEFAULT NULL,
  `gerenciamento_riscos` tinyint(1) DEFAULT NULL,
  `limpeza_ferimento` tinyint(1) DEFAULT NULL,
  `curativos` tinyint(1) DEFAULT NULL,
  `compressivo` tinyint(1) DEFAULT NULL,
  `encravamento` tinyint(1) DEFAULT NULL,
  `ocular` tinyint(1) DEFAULT NULL,
  `queimadura` tinyint(1) DEFAULT NULL,
  `simples` tinyint(1) DEFAULT NULL,
  `3_pontas` tinyint(1) DEFAULT NULL,
  `imobilizacoes` tinyint(1) DEFAULT NULL,
  `membro_inf_dir` tinyint(1) DEFAULT NULL,
  `membro_inf_esq` tinyint(1) DEFAULT NULL,
  `membro_sup_dir` tinyint(1) DEFAULT NULL,
  `membro_sup_esq` tinyint(1) DEFAULT NULL,
  `quadril` tinyint(1) DEFAULT NULL,
  `cervical` tinyint(1) DEFAULT NULL,
  `maca_sobre_rodas` tinyint(1) DEFAULT NULL,
  `maca_rigida` tinyint(1) DEFAULT NULL,
  `ponte` tinyint(1) DEFAULT NULL,
  `retirado_capacete` tinyint(1) DEFAULT NULL,
  `rcp` tinyint(1) DEFAULT NULL,
  `rolamento_90` tinyint(1) DEFAULT NULL,
  `rolamento_180` tinyint(1) DEFAULT NULL,
  `tomada_decisao` tinyint(1) DEFAULT NULL,
  `tratado_choque` tinyint(1) DEFAULT NULL,
  `uso_canula` tinyint(1) DEFAULT NULL,
  `uso_colar` varchar(255) DEFAULT NULL,
  `uso_ked` tinyint(1) DEFAULT NULL,
  `uso_ttf` tinyint(1) DEFAULT NULL,
  `ventilacao_suporte` tinyint(1) DEFAULT NULL,
  `oxigenioterapia_lpm` int DEFAULT NULL,
  `reanimador_lpm` int DEFAULT NULL,
  `meios_auxiliares` tinyint(1) DEFAULT NULL,
  `celesc` tinyint(1) DEFAULT NULL,
  `policia_civil` tinyint(1) DEFAULT NULL,
  `policia_militar` tinyint(1) DEFAULT NULL,
  `policia_pre` tinyint(1) DEFAULT NULL,
  `policia_prf` tinyint(1) DEFAULT NULL,
  `def_civil` tinyint(1) DEFAULT NULL,
  `igp_pc` tinyint(1) DEFAULT NULL,
  `samu` tinyint(1) DEFAULT NULL,
  `outros` varchar(255) DEFAULT NULL,
  `cit` tinyint(1) DEFAULT NULL,
  `usa` tinyint(1) DEFAULT NULL,
  `usb` tinyint(1) DEFAULT NULL,
  `id_procedi_efetuados` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sinais_e_sintomas`
--

CREATE TABLE `sinais_e_sintomas` (
  `id_sinais_e_sintomas` int NOT NULL,
  `abdomem_sensisvel_ou_rigido` tinyint(1) DEFAULT NULL,
  `afundamento_de_cranio` tinyint(1) DEFAULT NULL,
  `agitacao` tinyint(1) DEFAULT NULL,
  `amnesia` tinyint(1) DEFAULT NULL,
  `angina_de_peito` tinyint(1) DEFAULT NULL,
  `apineia` tinyint(1) DEFAULT NULL,
  `bradicardia` tinyint(1) DEFAULT NULL,
  `bradipneia` tinyint(1) DEFAULT NULL,
  `bronco_aspirando` tinyint(1) DEFAULT NULL,
  `cefaleia` tinyint(1) DEFAULT NULL,
  `cianose_labios` tinyint(1) DEFAULT NULL,
  `cianose_extremidade` tinyint(1) DEFAULT NULL,
  `convulsao` tinyint(1) DEFAULT NULL,
  `decorticacao` tinyint(1) DEFAULT NULL,
  `deformidade` tinyint(1) DEFAULT NULL,
  `descerebracao` tinyint(1) DEFAULT NULL,
  `desmaio` tinyint(1) DEFAULT NULL,
  `desvio_de_traqueia` tinyint(1) DEFAULT NULL,
  `dispneia` tinyint(1) DEFAULT NULL,
  `dor_local` tinyint(1) DEFAULT NULL,
  `edema_generalizado` tinyint(1) DEFAULT NULL,
  `edema_localizado` tinyint(1) DEFAULT NULL,
  `enfisema_subcutaneo` tinyint(1) DEFAULT NULL,
  `estase_de_jugular` tinyint(1) DEFAULT NULL,
  `face_palida` tinyint(1) DEFAULT NULL,
  `hemorragia_interna` tinyint(1) DEFAULT NULL,
  `hemorragia_externa` tinyint(1) DEFAULT NULL,
  `hipertensao` tinyint(1) DEFAULT NULL,
  `hipotensao` tinyint(1) DEFAULT NULL,
  `nauseas_e_vomitos` tinyint(1) DEFAULT NULL,
  `nasoragia` tinyint(1) DEFAULT NULL,
  `obito` tinyint(1) DEFAULT NULL,
  `otorreia` tinyint(1) DEFAULT NULL,
  `otorragia` tinyint(1) DEFAULT NULL,
  `o_v_a_c_e` tinyint(1) DEFAULT NULL,
  `parada_cardiaca` tinyint(1) DEFAULT NULL,
  `parada_respiratoria` tinyint(1) DEFAULT NULL,
  `priaprismo` tinyint(1) DEFAULT NULL,
  `prurido_na_pele` tinyint(1) DEFAULT NULL,
  `pupilas_reagente` tinyint(1) DEFAULT NULL,
  `pupilas_n_reagente` tinyint(1) DEFAULT NULL,
  `pupilas_anisocoria` tinyint(1) DEFAULT NULL,
  `pupilas_isocoria` tinyint(1) DEFAULT NULL,
  `pupilas_midriase` tinyint(1) DEFAULT NULL,
  `pupilas_miose` tinyint(1) DEFAULT NULL,
  `sede` tinyint(1) DEFAULT NULL,
  `sinal_de_battle` tinyint(1) DEFAULT NULL,
  `sinal_de_guaxinim` tinyint(1) DEFAULT NULL,
  `sudorese` tinyint(1) DEFAULT NULL,
  `taquipneia` tinyint(1) DEFAULT NULL,
  `taquicardia` tinyint(1) DEFAULT NULL,
  `tontura` tinyint(1) DEFAULT NULL,
  `outros` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sinais_vitais`
--

CREATE TABLE `sinais_vitais` (
  `id_sinalvital` int NOT NULL,
  `pressao_arterial_si` int DEFAULT NULL,
  `pressao_arterial_di` int DEFAULT NULL,
  `pulso_bpm` int DEFAULT NULL,
  `respiracao_mrm` int DEFAULT NULL,
  `saturacao` int DEFAULT NULL,
  `temperatura` decimal(4,2) DEFAULT NULL,
  `perfusao_menor2` tinyint(1) DEFAULT NULL,
  `glicemia_hgt` decimal(5,2) DEFAULT NULL,
  `normal` tinyint(1) DEFAULT NULL,
  `anormal` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `situacao_paciente`
--

CREATE TABLE `situacao_paciente` (
  `id_situacao_paciente` int NOT NULL,
  `deitada` tinyint(1) DEFAULT NULL,
  `semi_deitada` tinyint(1) DEFAULT NULL,
  `sentada` tinyint(1) DEFAULT NULL,
  `critico` tinyint(1) DEFAULT NULL,
  `instavel` tinyint(1) DEFAULT NULL,
  `potencialmente_instavel` tinyint(1) DEFAULT NULL,
  `estavel` tinyint(1) DEFAULT NULL,
  `ciclista` tinyint(1) DEFAULT NULL,
  `condutor_moto` tinyint(1) DEFAULT NULL,
  `gestante` tinyint(1) DEFAULT NULL,
  `pass_ban_frente` tinyint(1) DEFAULT NULL,
  `pas_moto` tinyint(1) DEFAULT NULL,
  `condutor_carro` tinyint(1) DEFAULT NULL,
  `clinico` tinyint(1) DEFAULT NULL,
  `trauma` tinyint(1) DEFAULT NULL,
  `pas_bco_tras` tinyint(1) DEFAULT NULL,
  `pedestre` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tabelaglasgow`
--

CREATE TABLE `tabelaglasgow` (
  `espontanea_1` tinyint(1) DEFAULT NULL,
  `comando_verbal_1` tinyint(1) DEFAULT NULL,
  `estimulo_doloroso_1` tinyint(1) DEFAULT NULL,
  `nenhuma_ocular` tinyint(1) DEFAULT NULL,
  `orientado` tinyint(1) DEFAULT NULL,
  `confuso` tinyint(1) DEFAULT NULL,
  `palavras_inapropriadas` tinyint(1) DEFAULT NULL,
  `palavras_incompreensiveis` tinyint(1) DEFAULT NULL,
  `nenhuma_verbal` tinyint(1) DEFAULT NULL,
  `obedece_comandos` tinyint(1) DEFAULT NULL,
  `localiza_dor` tinyint(1) DEFAULT NULL,
  `movimento_retirada` tinyint(1) DEFAULT NULL,
  `flexao_anormal` tinyint(1) DEFAULT NULL,
  `extensao_anormal` tinyint(1) DEFAULT NULL,
  `nenhuma_motora` tinyint(1) DEFAULT NULL,
  `espontanea_2` tinyint(1) DEFAULT NULL,
  `comando_verbal_2` tinyint(1) DEFAULT NULL,
  `estimulo_doloroso_2` tinyint(1) DEFAULT NULL,
  `nenhuma` tinyint(1) DEFAULT NULL,
  `palavras_e_frase_apropriadas` tinyint(1) DEFAULT NULL,
  `palaras_inapropriadas` tinyint(1) DEFAULT NULL,
  `choro_persistete_ou_gritos` tinyint(1) DEFAULT NULL,
  `sons_incompreensiveis` tinyint(1) DEFAULT NULL,
  `nenhuma_resposta_verbal` tinyint(1) DEFAULT NULL,
  `obdece_prontamente` tinyint(1) DEFAULT NULL,
  `localiza_dor_ou_estimulo_tatil` tinyint(1) DEFAULT NULL,
  `retirada_do_segmento_estimulado` tinyint(1) DEFAULT NULL,
  `flexao_anormal_decorticacao` tinyint(1) DEFAULT NULL,
  `extensao_anormal_decerebracao` tinyint(1) DEFAULT NULL,
  `ausencia_paralisia_flacida_hipotonia` tinyint(1) DEFAULT NULL,
  `total` int DEFAULT NULL,
  `id_glasgow` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `termo_recusa`
--

CREATE TABLE `termo_recusa` (
  `id_termo_recusa` int NOT NULL,
  `imagem` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_ocorrencia_pre_hospitalar`
--

CREATE TABLE `tipo_ocorrencia_pre_hospitalar` (
  `id_tipo_ocorrencia_pre_hospitalar` int NOT NULL,
  `causado_por_animais` tinyint(1) DEFAULT NULL,
  `com_meio_de_transporte` tinyint(1) DEFAULT NULL,
  `desmoronamento_deslizamento` tinyint(1) DEFAULT NULL,
  `emergencia_medica` tinyint(1) DEFAULT NULL,
  `queda_de_altura_2m` tinyint(1) DEFAULT NULL,
  `tentativa_de_suicidio` tinyint(1) DEFAULT NULL,
  `queda_propria_altura` tinyint(1) DEFAULT NULL,
  `afogamento` tinyint(1) DEFAULT NULL,
  `agressao` tinyint(1) DEFAULT NULL,
  `atropelamento` tinyint(1) DEFAULT NULL,
  `choque_eletrico` tinyint(1) DEFAULT NULL,
  `desabamento` tinyint(1) DEFAULT NULL,
  `domestico` tinyint(1) DEFAULT NULL,
  `esportivo` tinyint(1) DEFAULT NULL,
  `intoxicacao` tinyint(1) DEFAULT NULL,
  `queda_bicicleta` tinyint(1) DEFAULT NULL,
  `queda_moto` tinyint(1) DEFAULT NULL,
  `queda_nivel_menor_2m` tinyint(1) DEFAULT NULL,
  `trabalho` tinyint(1) DEFAULT NULL,
  `transferencia` tinyint(1) DEFAULT NULL,
  `outros` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `traumas`
--

CREATE TABLE `traumas` (
  `id_trauma` int NOT NULL,
  `trauma` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `avaliacao_cinematica`
--
ALTER TABLE `avaliacao_cinematica`
  ADD PRIMARY KEY (`id_avaliacao_cinematica`);

--
-- Índices para tabela `emergencia_medica`
--
ALTER TABLE `emergencia_medica`
  ADD PRIMARY KEY (`id_emergencia_medica`);

--
-- Índices para tabela `ferimentos_queimaduras`
--
ALTER TABLE `ferimentos_queimaduras`
  ADD PRIMARY KEY (`id_ferimentos_queimaduras`);

--
-- Índices para tabela `final_info_paciente`
--
ALTER TABLE `final_info_paciente`
  ADD PRIMARY KEY (`id_final_info_paciente`);

--
-- Índices para tabela `gestacional`
--
ALTER TABLE `gestacional`
  ADD PRIMARY KEY (`id_gestacional`);

--
-- Índices para tabela `info_paciente`
--
ALTER TABLE `info_paciente`
  ADD PRIMARY KEY (`id_info_paciente`);

--
-- Índices para tabela `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`);

--
-- Índices para tabela `materiais_uti_descart`
--
ALTER TABLE `materiais_uti_descart`
  ADD PRIMARY KEY (`id_materiais_descart`);

--
-- Índices para tabela `materias_uti_deixados_hosp`
--
ALTER TABLE `materias_uti_deixados_hosp`
  ADD PRIMARY KEY (`id_materiais_uti_deixados_hosp`);

--
-- Índices para tabela `objetos_recolhido_observacao`
--
ALTER TABLE `objetos_recolhido_observacao`
  ADD PRIMARY KEY (`id_objetos_observacao`);

--
-- Índices para tabela `ocorrencia_verificacao`
--
ALTER TABLE `ocorrencia_verificacao`
  ADD PRIMARY KEY (`id_ocorre_verifi`),
  ADD KEY `fk_avaliacao_cinematica` (`fk_avaliacao_cinematica`);

--
-- Índices para tabela `pes`
--
ALTER TABLE `pes`
  ADD PRIMARY KEY (`id_pes`);

--
-- Índices para tabela `procedimentos_efetuados`
--
ALTER TABLE `procedimentos_efetuados`
  ADD PRIMARY KEY (`id_procedi_efetuados`);

--
-- Índices para tabela `sinais_e_sintomas`
--
ALTER TABLE `sinais_e_sintomas`
  ADD PRIMARY KEY (`id_sinais_e_sintomas`);

--
-- Índices para tabela `sinais_vitais`
--
ALTER TABLE `sinais_vitais`
  ADD PRIMARY KEY (`id_sinalvital`);

--
-- Índices para tabela `situacao_paciente`
--
ALTER TABLE `situacao_paciente`
  ADD PRIMARY KEY (`id_situacao_paciente`);

--
-- Índices para tabela `tabelaglasgow`
--
ALTER TABLE `tabelaglasgow`
  ADD PRIMARY KEY (`id_glasgow`);

--
-- Índices para tabela `termo_recusa`
--
ALTER TABLE `termo_recusa`
  ADD PRIMARY KEY (`id_termo_recusa`);

--
-- Índices para tabela `tipo_ocorrencia_pre_hospitalar`
--
ALTER TABLE `tipo_ocorrencia_pre_hospitalar`
  ADD PRIMARY KEY (`id_tipo_ocorrencia_pre_hospitalar`);

--
-- Índices para tabela `traumas`
--
ALTER TABLE `traumas`
  ADD PRIMARY KEY (`id_trauma`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `avaliacao_cinematica`
--
ALTER TABLE `avaliacao_cinematica`
  MODIFY `id_avaliacao_cinematica` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `emergencia_medica`
--
ALTER TABLE `emergencia_medica`
  MODIFY `id_emergencia_medica` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `final_info_paciente`
--
ALTER TABLE `final_info_paciente`
  MODIFY `id_final_info_paciente` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `gestacional`
--
ALTER TABLE `gestacional`
  MODIFY `id_gestacional` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `info_paciente`
--
ALTER TABLE `info_paciente`
  MODIFY `id_info_paciente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `objetos_recolhido_observacao`
--
ALTER TABLE `objetos_recolhido_observacao`
  MODIFY `id_objetos_observacao` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ocorrencia_verificacao`
--
ALTER TABLE `ocorrencia_verificacao`
  MODIFY `id_ocorre_verifi` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pes`
--
ALTER TABLE `pes`
  MODIFY `id_pes` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `procedimentos_efetuados`
--
ALTER TABLE `procedimentos_efetuados`
  MODIFY `id_procedi_efetuados` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sinais_e_sintomas`
--
ALTER TABLE `sinais_e_sintomas`
  MODIFY `id_sinais_e_sintomas` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sinais_vitais`
--
ALTER TABLE `sinais_vitais`
  MODIFY `id_sinalvital` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `situacao_paciente`
--
ALTER TABLE `situacao_paciente`
  MODIFY `id_situacao_paciente` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tabelaglasgow`
--
ALTER TABLE `tabelaglasgow`
  MODIFY `id_glasgow` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo_ocorrencia_pre_hospitalar`
--
ALTER TABLE `tipo_ocorrencia_pre_hospitalar`
  MODIFY `id_tipo_ocorrencia_pre_hospitalar` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `traumas`
--
ALTER TABLE `traumas`
  MODIFY `id_trauma` int NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `ocorrencia_verificacao`
--
ALTER TABLE `ocorrencia_verificacao`
  ADD CONSTRAINT `fk_avaliacao_cinematica` FOREIGN KEY (`fk_avaliacao_cinematica`) REFERENCES `avaliacao_cinematica` (`id_avaliacao_cinematica`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

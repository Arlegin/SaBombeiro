-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Out-2023 às 12:39
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `login`
--

CREATE TABLE `login` (
  `id_login` int NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `sinais_e_sintomas`
--

CREATE TABLE `sinais_e_sintomas` (
  `id_sinais_e_sintomas` int NOT NULL,
  `abdomem_sensisvelou_rigido` tinyint(1) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `tranferencia` tinyint(1) DEFAULT NULL,
  `outros` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `final_info_paciente`
--
ALTER TABLE `final_info_paciente`
  ADD PRIMARY KEY (`id_final_info_paciente`);

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
-- Índices para tabela `pes`
--
ALTER TABLE `pes`
  ADD PRIMARY KEY (`id_pes`);

--
-- Índices para tabela `sinais_e_sintomas`
--
ALTER TABLE `sinais_e_sintomas`
  ADD PRIMARY KEY (`id_sinais_e_sintomas`);

--
-- Índices para tabela `tipo_ocorrencia_pre_hospitalar`
--
ALTER TABLE `tipo_ocorrencia_pre_hospitalar`
  ADD PRIMARY KEY (`id_tipo_ocorrencia_pre_hospitalar`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `final_info_paciente`
--
ALTER TABLE `final_info_paciente`
  MODIFY `id_final_info_paciente` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `info_paciente`
--
ALTER TABLE `info_paciente`
  MODIFY `id_info_paciente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pes`
--
ALTER TABLE `pes`
  MODIFY `id_pes` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sinais_e_sintomas`
--
ALTER TABLE `sinais_e_sintomas`
  MODIFY `id_sinais_e_sintomas` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

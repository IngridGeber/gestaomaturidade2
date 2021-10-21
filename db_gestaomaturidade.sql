-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21-Out-2021 às 16:17
-- Versão do servidor: 10.4.19-MariaDB
-- versão do PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_gestaomaturidade`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_09_20_150428_create_tb_atividades_table', 1),
(5, '2021_09_20_150532_create_tb_areas_table', 1),
(6, '2021_09_20_154000_create_tb_diagnostico_bodies_table', 1),
(7, '2021_09_20_160123_create_tb_diagnostico_headers_table', 1),
(8, '2021_09_20_161355_create_tb_modelo_bodies_table', 1),
(9, '2021_09_20_162928_create_tb_modelo_headers_table', 1),
(10, '2021_09_20_165052_create_tb_nivel_areas_table', 1),
(11, '2021_09_20_172256_create_tb_nivel_maturidades_table', 1),
(12, '2021_09_20_173241_create_tb_nivel_unidades_table', 1),
(13, '2021_09_20_174151_create_tb_parametros_table', 1),
(14, '2021_09_20_174656_create_tb_perguntas_table', 1),
(15, '2021_09_20_175945_create_tb_permissaos_table', 1),
(16, '2021_09_20_180400_create_tb_plano_acaos_table', 1),
(17, '2021_09_20_180917_create_tb_responsaveis_table', 1),
(18, '2021_09_20_181332_create_tb_respostas_table', 1),
(19, '2021_09_20_182520_create_tb_subareas_table', 1),
(20, '2021_09_20_183031_create_tb_tipounidades_table', 1),
(21, '2021_09_20_183422_create_tb_unidades_table', 1),
(22, '2021_09_20_183943_create_tb_unidadesareas_table', 1),
(23, '2021_09_20_184407_create_tb_usuarios_table', 1),
(24, '2021_09_22_133049_create_tb_usuario_funcaos_table', 1),
(25, '2021_09_22_134011_create_tb_funcao_permisaos_table', 1),
(26, '2021_09_22_134140_create_tb_programas_table', 1),
(27, '2021_09_22_142056_create_permission_tables', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'user_create', 'web', '2021-10-19 00:27:27', '2021-10-19 00:27:27'),
(2, 'user_edit', 'web', '2021-10-19 00:27:28', '2021-10-19 00:27:28'),
(3, 'user_read', 'web', '2021-10-19 00:27:28', '2021-10-19 00:27:28'),
(4, 'user_delete', 'web', '2021-10-19 00:27:28', '2021-10-19 00:27:28');

-- --------------------------------------------------------

--
-- Estrutura da tabela `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2021-10-19 00:27:26', '2021-10-19 00:27:26'),
(2, 'Gestor_Unidade', 'web', '2021-10-19 00:27:26', '2021-10-19 00:27:26'),
(3, 'Gestor_Area', 'web', '2021-10-19 00:27:27', '2021-10-19 00:27:27'),
(4, 'Gestor_Subarea', 'web', '2021-10-19 00:27:27', '2021-10-19 00:27:27'),
(5, 'Usuario', 'web', '2021-10-19 00:27:27', '2021-10-19 00:27:27');

-- --------------------------------------------------------

--
-- Estrutura da tabela `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_areas`
--

CREATE TABLE `tb_areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tb_areas`
--

INSERT INTO `tb_areas` (`id`, `nome`) VALUES
(1, 'RECURSOS HUMANOS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_atividades`
--

CREATE TABLE `tb_atividades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descricao` varchar(2000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ativo` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_resposta_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tb_atividades`
--

INSERT INTO `tb_atividades` (`id`, `descricao`, `ativo`, `id_resposta_fk`, `created_at`, `updated_at`) VALUES
(4, 'Faça avaliações do desempenho dos servidores. Tão importante é saber como ele está desempenhando seu papel dentro da organização. Se um servidor está indo mal, você deve orientá-lo para que melhore e volte a contribuir para o crescimento da organização.', 'Sim', 1, NULL, NULL),
(5, 'Torne a avaliação de desempenho um processo formal, com critérios e periodicidade definida, dando feedbacks construtivos à sua força de trabalho após sua realização. A formalização da avaliação dos servidores contribui para o desenvolvimento da organização e do próprio funcionário avaliado.', 'Sim', 2, NULL, NULL),
(6, 'Ótimo! A unidade está completa no quesito de Avaliação de Desempenho.', 'Sim', 3, NULL, NULL),
(7, 'Realize reuniões periódicas de equipe para promover a troca de informações. Muitos gestores mudam as regras e esquecem de comunicar as mudanças aos mais interessados, os servidores. Esse tipo de erro aumenta as chances das mudanças realizadas não trazerem os resultados esperados, pois se os servidores não sabem das mudanças ocorridas, porque elas ocorreram e como elas devem agir, não podem contribuir para o sucesso das ações. Uma boa maneira de comunicar aos seus funcionários a estratégia da empresa é realizar reuniões periódicas e promover nestas reuniões um diálogo aberto e a troca de informações. ', 'Sim', 4, NULL, NULL),
(8, 'Crie um quadro/mural para postar comunicados e reforçar as diretrizes estratégicas. Um quadro ou mural é uma ótima ferramenta de comunicação. Nele você pode colocar as metas, diretrizes, definição da cultura da empresa, resultados apurados no último período, ou seja, tudo que você deseja comunicar aos seus colaboradores. Mas, se decidir por usar esta ferramenta não deixe de atualizá-la e trabalhe as informações de forma criativa, para que seus funcionários tenham interesse em olhar as informações ali colocadas.', 'Sim', 5, NULL, NULL),
(9, 'Ótimo! A unidade está completa no quesito de comunicação Interna.', 'Sim', 6, NULL, NULL),
(10, 'Defina e distribua responsabilidades e funções pelos cargos. A gestão do recurso humano é um ponto chave para que você obtenha os resultados esperados em seu negócio. Uma das questões mais importantes na gestão deste recurso e a definição das responsabilidades para cada cargo da empresa. Quando seus funcionários sabem exatamente quais são suas responsabilidades fica mais fácil controlar o que está e o que não está sendo feito e o que precisa ser melhorado.  Portanto, sente com cada funcionário e detalhe com ele o que se espera do seu desempenho na empresa.', 'Sim', 7, NULL, NULL),
(11, 'Atualize a descrição de cargos e compatibilize-o com as atividades realizadas na sua empresa. As mudanças do mercado se refletem na sua empresa e essas mudanças podem refletir nas atividades que seus funcionários realizam. Um cargo pode passar a realizar mais ou menos funções do que o que está descrito no manual de cargos da sua empresa. Se isto ocorrer você precisa atualizar o manual e apresentar aos seus funcionários quais mudanças ocorreram na divisão de tarefas.', 'Sim', 8, NULL, NULL),
(12, 'Ótimo! A unidade está completa no requisito Plano de Cargos e Salários.', 'Sim', 9, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_diagnostico_bodies`
--

CREATE TABLE `tb_diagnostico_bodies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_diagnostico_header_fk` bigint(20) UNSIGNED NOT NULL,
  `id_pergunta_fk` bigint(20) UNSIGNED NOT NULL,
  `id_resposta_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tb_diagnostico_bodies`
--

INSERT INTO `tb_diagnostico_bodies` (`id`, `id_diagnostico_header_fk`, `id_pergunta_fk`, `id_resposta_fk`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 5, '2021-10-19 18:25:07', '2021-10-19 18:25:07'),
(2, 1, 3, 8, '2021-10-19 18:25:08', '2021-10-19 18:25:08'),
(3, 1, 2, 2, '2021-10-19 18:25:08', '2021-10-19 18:25:08'),
(4, 2, 1, 6, '2021-10-19 18:41:55', '2021-10-19 18:41:55'),
(5, 2, 3, 9, '2021-10-19 18:41:56', '2021-10-19 18:41:56'),
(6, 2, 2, 3, '2021-10-19 18:41:56', '2021-10-19 18:41:56'),
(7, 3, 1, 5, '2021-10-19 18:45:55', '2021-10-19 18:45:55'),
(8, 3, 3, 8, '2021-10-19 18:45:55', '2021-10-19 18:45:55'),
(9, 3, 2, 2, '2021-10-19 18:45:55', '2021-10-19 18:45:55'),
(10, 4, 1, 5, '2021-10-19 18:48:31', '2021-10-19 18:48:31'),
(11, 4, 3, 8, '2021-10-19 18:48:31', '2021-10-19 18:48:31'),
(12, 4, 2, 2, '2021-10-19 18:48:31', '2021-10-19 18:48:31'),
(13, 5, 1, 6, '2021-10-19 18:52:41', '2021-10-19 18:52:41'),
(14, 5, 3, 9, '2021-10-19 18:52:41', '2021-10-19 18:52:41'),
(15, 5, 2, 3, '2021-10-19 18:52:41', '2021-10-19 18:52:41'),
(16, 6, 1, 4, '2021-10-19 18:58:10', '2021-10-19 18:58:10'),
(17, 6, 3, 7, '2021-10-19 18:58:10', '2021-10-19 18:58:10'),
(18, 6, 2, 1, '2021-10-19 18:58:10', '2021-10-19 18:58:10'),
(19, 7, 1, 5, '2021-10-19 19:03:44', '2021-10-19 19:03:44'),
(20, 7, 3, 9, '2021-10-19 19:03:44', '2021-10-19 19:03:44'),
(21, 7, 2, 1, '2021-10-19 19:03:44', '2021-10-19 19:03:44'),
(22, 8, 1, 5, '2021-10-19 19:23:59', '2021-10-19 19:23:59'),
(23, 8, 3, 7, '2021-10-19 19:23:59', '2021-10-19 19:23:59'),
(24, 8, 2, 1, '2021-10-19 19:23:59', '2021-10-19 19:23:59'),
(25, 9, 1, 6, '2021-10-19 19:46:29', '2021-10-19 19:46:29'),
(26, 9, 3, 9, '2021-10-19 19:46:29', '2021-10-19 19:46:29'),
(27, 9, 2, 1, '2021-10-19 19:46:29', '2021-10-19 19:46:29'),
(28, 10, 1, 5, '2021-10-21 18:10:14', '2021-10-21 18:10:14'),
(29, 10, 3, 8, '2021-10-21 18:10:14', '2021-10-21 18:10:14'),
(30, 10, 2, 2, '2021-10-21 18:10:14', '2021-10-21 18:10:14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_diagnostico_headers`
--

CREATE TABLE `tb_diagnostico_headers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_unidade_fk` bigint(20) UNSIGNED NOT NULL,
  `id_modelo_header_fk` bigint(20) UNSIGNED NOT NULL,
  `total_pontos` int(11) DEFAULT NULL,
  `nivel_maturidade` decimal(10,2) DEFAULT NULL,
  `id_usuario_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tb_diagnostico_headers`
--

INSERT INTO `tb_diagnostico_headers` (`id`, `id_unidade_fk`, `id_modelo_header_fk`, `total_pontos`, `nivel_maturidade`, `id_usuario_fk`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, '50.00', 1, '2021-10-19 18:25:02', '2021-10-19 18:25:09'),
(2, 1, 1, 6, '100.00', 1, '2021-10-19 18:41:55', '2021-10-19 18:41:56'),
(3, 1, 1, 3, '50.00', 1, '2021-10-19 18:45:55', '2021-10-19 18:45:55'),
(4, 1, 1, 3, '50.00', 1, '2021-10-19 18:48:31', '2021-10-19 18:48:31'),
(5, 1, 1, 6, '100.00', 1, '2021-10-19 18:52:41', '2021-10-19 18:52:41'),
(6, 1, 1, 0, '0.00', 1, '2021-10-19 18:58:10', '2021-10-19 18:58:10'),
(7, 1, 1, 3, '50.00', 1, '2021-10-19 19:03:44', '2021-10-19 19:03:44'),
(8, 1, 1, 1, '16.67', 1, '2021-10-19 19:23:59', '2021-10-19 19:23:59'),
(9, 1, 1, 4, '66.67', 2, '2021-10-19 19:46:29', '2021-10-19 19:46:29'),
(10, 1, 1, 3, '50.00', 2, '2021-10-21 18:10:14', '2021-10-21 18:10:14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_modelo_bodies`
--

CREATE TABLE `tb_modelo_bodies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_modelo_header_fk` bigint(20) UNSIGNED NOT NULL,
  `id_pergunta_fk` bigint(20) UNSIGNED NOT NULL,
  `id_resposta_fk` bigint(20) UNSIGNED NOT NULL,
  `id_atividade_fk` bigint(20) UNSIGNED NOT NULL,
  `id_usuario_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tb_modelo_bodies`
--

INSERT INTO `tb_modelo_bodies` (`id`, `id_modelo_header_fk`, `id_pergunta_fk`, `id_resposta_fk`, `id_atividade_fk`, `id_usuario_fk`, `created_at`, `updated_at`) VALUES
(4, 1, 2, 1, 4, 1, NULL, NULL),
(5, 1, 2, 2, 5, 1, NULL, NULL),
(6, 1, 2, 3, 6, 1, NULL, NULL),
(10, 1, 1, 4, 7, 1, NULL, NULL),
(11, 1, 1, 5, 8, 1, NULL, NULL),
(12, 1, 1, 6, 9, 1, NULL, NULL),
(16, 1, 3, 7, 10, 1, NULL, NULL),
(17, 1, 3, 8, 11, 1, NULL, NULL),
(18, 1, 3, 9, 12, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_modelo_headers`
--

CREATE TABLE `tb_modelo_headers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_area_fk` bigint(20) UNSIGNED NOT NULL,
  `id_subarea_fk` bigint(20) UNSIGNED NOT NULL,
  `id_parametro_fk` bigint(20) UNSIGNED NOT NULL,
  `ativo` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_usuario_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tb_modelo_headers`
--

INSERT INTO `tb_modelo_headers` (`id`, `id_area_fk`, `id_subarea_fk`, `id_parametro_fk`, `ativo`, `id_usuario_fk`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Sim', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_nivel_areas`
--

CREATE TABLE `tb_nivel_areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_unidade_fk` bigint(20) UNSIGNED NOT NULL,
  `id_area_fk` bigint(20) UNSIGNED NOT NULL,
  `valor_nivel_area` decimal(12,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tb_nivel_areas`
--

INSERT INTO `tb_nivel_areas` (`id`, `id_unidade_fk`, `id_area_fk`, `valor_nivel_area`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '16.67', '2021-10-19 18:25:09', '2021-10-19 18:25:09'),
(2, 1, 1, '33.33', '2021-10-19 18:41:56', '2021-10-19 18:41:56'),
(3, 1, 1, '16.67', '2021-10-19 18:45:55', '2021-10-19 18:45:55'),
(4, 1, 1, '16.67', '2021-10-19 18:48:31', '2021-10-19 18:48:31'),
(5, 1, 1, '33.33', '2021-10-19 18:52:41', '2021-10-19 18:52:41'),
(6, 1, 1, '0.00', '2021-10-19 18:58:10', '2021-10-19 18:58:10'),
(7, 1, 1, '16.67', '2021-10-19 19:03:44', '2021-10-19 19:03:44'),
(8, 1, 1, '5.56', '2021-10-19 19:23:59', '2021-10-19 19:23:59'),
(9, 1, 1, '22.22', '2021-10-19 19:46:29', '2021-10-19 19:46:29'),
(10, 1, 1, '16.67', '2021-10-21 18:10:14', '2021-10-21 18:10:14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_nivel_maturidades`
--

CREATE TABLE `tb_nivel_maturidades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `intervalo_ini` decimal(10,3) DEFAULT NULL,
  `intervalo_fim` decimal(10,3) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tb_nivel_maturidades`
--

INSERT INTO `tb_nivel_maturidades` (`id`, `descricao`, `intervalo_ini`, `intervalo_fim`, `created_at`, `updated_at`) VALUES
(1, 'Nível 1 - Não existem processos gerenciais aplicados ao negócio e os resultados  são obtidos através de iniciativas desestruturadas. Cada funcionário desempenha  sua tarefa de diferentes formas, não existe um fluxo de trabalho padronizado.', '0.000', '20.000', '2021-09-20 12:25:37', NULL),
(2, 'Nível 2- Não existem processos gerenciais formais, mas algumas áreas de gestão já  possuem rotinas para gerar os resultados esperados.', '20.100', '40.000', '2021-09-20 12:25:42', NULL),
(3, 'Nível 3- Existem processos gerenciais formais, no entanto eles são aplicados de  maneira descoordenada para gerar os resultados esperados. O acompanhamento  e a revisão dos processos ainda é uma dificuldade', '40.100', '60.000', '2021-09-20 12:25:48', NULL),
(4, 'Nível 4 - Existem processos gerenciais formais e eles são aplicados de maneira  coordenada para atingir os resultados esperados. Já consegue monitorar as  tarefas, propor melhorias, identificar gargalos e atrasos, uso de uma ferramenta de  gestão.', '60.100', '80.000', '2021-09-20 12:25:53', NULL),
(5, 'Nível 5 - Os processos gerenciais são práticas padrão da empresa, o fluxo de trabalho segue o caminho desejado. Eles são monitorados, afetam o negócio e são melhorados continuamente.', '80.100', '100.000', '2021-09-20 12:26:01', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_nivel_unidades`
--

CREATE TABLE `tb_nivel_unidades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_unidade_fk` bigint(20) UNSIGNED NOT NULL,
  `valor_nivel_unidade` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_parametros`
--

CREATE TABLE `tb_parametros` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `qtd_perguntas` int(11) NOT NULL,
  `qtd_respostas` int(11) NOT NULL,
  `maximo_pontos` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tb_parametros`
--

INSERT INTO `tb_parametros` (`id`, `qtd_perguntas`, `qtd_respostas`, `maximo_pontos`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_perguntas`
--

CREATE TABLE `tb_perguntas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ativo` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tb_perguntas`
--

INSERT INTO `tb_perguntas` (`id`, `descricao`, `ativo`, `created_at`, `updated_at`) VALUES
(1, 'Como é feita a comunicação interna da unidade?', 'Sim', NULL, NULL),
(2, 'Como são feitas as avaliações de desempenho dos servidores?', 'Sim', NULL, NULL),
(3, 'Como é feita a definição dos cargos e a avaliação dos salários distribuídos?', 'Sim', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_permissoes`
--

CREATE TABLE `tb_permissoes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tb_permissoes`
--

INSERT INTO `tb_permissoes` (`id`, `nome`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, NULL),
(2, 'Gestor Unidade', NULL, NULL),
(3, 'Gestor Área', NULL, NULL),
(4, 'Gestor Sub Área', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_plano_acaos`
--

CREATE TABLE `tb_plano_acaos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_atividade_fk` bigint(20) UNSIGNED NOT NULL,
  `id_diagnostico_body_fk` bigint(20) UNSIGNED NOT NULL,
  `id_responsavel_fk` bigint(20) UNSIGNED NOT NULL,
  `data_realizada` date NOT NULL,
  `data_prevista` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_programas`
--

CREATE TABLE `tb_programas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_responsaveis`
--

CREATE TABLE `tb_responsaveis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_unidade_fk` bigint(20) UNSIGNED NOT NULL,
  `id_subarea_fk` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_respostas`
--

CREATE TABLE `tb_respostas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nota` tinyint(4) NOT NULL,
  `id_pergunta_fk` bigint(20) UNSIGNED NOT NULL,
  `ativo` char(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tb_respostas`
--

INSERT INTO `tb_respostas` (`id`, `descricao`, `nota`, `id_pergunta_fk`, `ativo`, `created_at`, `updated_at`) VALUES
(1, 'A unidade não avalia o desempenho de seus servidores.', 0, 2, 'Sim', NULL, NULL),
(2, 'Há avaliação de desempenho, subjetiva, sem critérios, ou periodicidade definitiva.', 1, 2, 'Sim', NULL, NULL),
(3, 'Há avaliação de desempenho formal, feedbacks e cruzamento de dados com a satisfação.', 2, 2, 'Sim', NULL, NULL),
(4, 'A unidade não tem um procedimento de comunicação interna.', 0, 1, 'Sim', NULL, NULL),
(5, 'A unidade realiza reuniões periódicas de equipe para promover a troca de informações.', 1, 1, 'Sim', NULL, NULL),
(6, 'Há reuniões, quadro de comunicados e ferramenta de gestão do conhecimento.', 2, 1, 'Sim', NULL, NULL),
(7, 'A unidade não possui plano de cargos e salários.', 0, 3, 'Sim', NULL, NULL),
(8, 'A unidade possui um manual com a descrição de cargos e salários, mas está desatualizado.', 1, 3, 'Sim', NULL, NULL),
(9, 'Há um plano de cargos e salários bem definidos e ferramenta de gestão.', 2, 3, 'Sim', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_subareas`
--

CREATE TABLE `tb_subareas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_area_fk` bigint(20) UNSIGNED NOT NULL,
  `imagem` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tb_subareas`
--

INSERT INTO `tb_subareas` (`id`, `nome`, `id_area_fk`, `imagem`) VALUES
(1, 'SERVIDOR', 1, '1_16082021090820.png'),
(2, 'FÉRIAS', 1, '1_16082021090845.png'),
(3, 'FOLHA DE PAGAMENTO', 1, '1_16082021090852.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tipounidades`
--

CREATE TABLE `tb_tipounidades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tb_tipounidades`
--

INSERT INTO `tb_tipounidades` (`id`, `nome`) VALUES
(1, 'UNIDADE ADMINISTRATIVA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_unidades`
--

CREATE TABLE `tb_unidades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_tipounidade_fk` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tb_unidades`
--

INSERT INTO `tb_unidades` (`id`, `nome`, `id_tipounidade_fk`) VALUES
(1, 'SECRETARIA DE ESTADO DE SAÚDE - SES', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_unidadesareas`
--

CREATE TABLE `tb_unidadesareas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_unidade_fk` bigint(20) UNSIGNED NOT NULL,
  `id_area_fk` bigint(20) UNSIGNED NOT NULL,
  `id_subarea_fk` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tb_unidadesareas`
--

INSERT INTO `tb_unidadesareas` (`id`, `id_unidade_fk`, `id_area_fk`, `id_subarea_fk`) VALUES
(3, 1, 1, 1),
(6, 1, 1, 2),
(7, 1, 1, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('actived','inactived','pre_registred') COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile` enum('administrator','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_unidade_fk` bigint(20) UNSIGNED DEFAULT NULL,
  `id_area_fk` bigint(20) UNSIGNED DEFAULT NULL,
  `id_subarea_fk` bigint(20) UNSIGNED DEFAULT NULL,
  `id_permissao_fk` bigint(20) UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `status`, `gender`, `profile`, `id_unidade_fk`, `id_area_fk`, `id_subarea_fk`, `id_permissao_fk`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'actived', 'male', 'administrator', NULL, NULL, NULL, 1, NULL, '2021-10-19 00:27:29', '2021-10-19 00:27:29'),
(2, 'Usuario 1', 'user@gmail.com', NULL, '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'actived', 'male', 'administrator', 1, 1, NULL, 3, NULL, '2021-10-19 00:27:30', '2021-10-19 00:27:30');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Índices para tabela `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Índices para tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices para tabela `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Índices para tabela `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Índices para tabela `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Índices para tabela `tb_areas`
--
ALTER TABLE `tb_areas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_atividades`
--
ALTER TABLE `tb_atividades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_resposta_fk` (`id_resposta_fk`);

--
-- Índices para tabela `tb_diagnostico_bodies`
--
ALTER TABLE `tb_diagnostico_bodies`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_diagnostico_headers`
--
ALTER TABLE `tb_diagnostico_headers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_modelo_header_fk` (`id_modelo_header_fk`),
  ADD KEY `id_unidade_fk` (`id_unidade_fk`),
  ADD KEY `id_usuario_fk` (`id_usuario_fk`);

--
-- Índices para tabela `tb_modelo_bodies`
--
ALTER TABLE `tb_modelo_bodies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_atividade_fk` (`id_atividade_fk`),
  ADD KEY `id_pergunta_fk` (`id_pergunta_fk`),
  ADD KEY `id_resposta_fk` (`id_resposta_fk`),
  ADD KEY `id_usuario_fk` (`id_usuario_fk`);

--
-- Índices para tabela `tb_modelo_headers`
--
ALTER TABLE `tb_modelo_headers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_area_fk` (`id_area_fk`),
  ADD KEY `id_parametro_fk` (`id_parametro_fk`),
  ADD KEY `id_subarea_fk` (`id_subarea_fk`),
  ADD KEY `id_usuario_fk` (`id_usuario_fk`);

--
-- Índices para tabela `tb_nivel_areas`
--
ALTER TABLE `tb_nivel_areas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_nivel_maturidades`
--
ALTER TABLE `tb_nivel_maturidades`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_nivel_unidades`
--
ALTER TABLE `tb_nivel_unidades`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_parametros`
--
ALTER TABLE `tb_parametros`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_perguntas`
--
ALTER TABLE `tb_perguntas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_permissoes`
--
ALTER TABLE `tb_permissoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_plano_acaos`
--
ALTER TABLE `tb_plano_acaos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_programas`
--
ALTER TABLE `tb_programas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_responsaveis`
--
ALTER TABLE `tb_responsaveis`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_respostas`
--
ALTER TABLE `tb_respostas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pergunta_fk` (`id_pergunta_fk`);

--
-- Índices para tabela `tb_subareas`
--
ALTER TABLE `tb_subareas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_tipounidades`
--
ALTER TABLE `tb_tipounidades`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_unidades`
--
ALTER TABLE `tb_unidades`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tb_unidadesareas`
--
ALTER TABLE `tb_unidadesareas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `id_unidades_fk` (`id_unidade_fk`),
  ADD KEY `id_permissao_fk` (`id_permissao_fk`),
  ADD KEY `id_area_fk` (`id_area_fk`),
  ADD KEY `id_subarea_fk` (`id_subarea_fk`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tb_areas`
--
ALTER TABLE `tb_areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_atividades`
--
ALTER TABLE `tb_atividades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `tb_diagnostico_bodies`
--
ALTER TABLE `tb_diagnostico_bodies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `tb_diagnostico_headers`
--
ALTER TABLE `tb_diagnostico_headers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `tb_modelo_bodies`
--
ALTER TABLE `tb_modelo_bodies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `tb_modelo_headers`
--
ALTER TABLE `tb_modelo_headers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_nivel_areas`
--
ALTER TABLE `tb_nivel_areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `tb_nivel_maturidades`
--
ALTER TABLE `tb_nivel_maturidades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tb_nivel_unidades`
--
ALTER TABLE `tb_nivel_unidades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_parametros`
--
ALTER TABLE `tb_parametros`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_perguntas`
--
ALTER TABLE `tb_perguntas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_permissoes`
--
ALTER TABLE `tb_permissoes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_plano_acaos`
--
ALTER TABLE `tb_plano_acaos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_programas`
--
ALTER TABLE `tb_programas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_responsaveis`
--
ALTER TABLE `tb_responsaveis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_respostas`
--
ALTER TABLE `tb_respostas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `tb_subareas`
--
ALTER TABLE `tb_subareas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_tipounidades`
--
ALTER TABLE `tb_tipounidades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_unidades`
--
ALTER TABLE `tb_unidades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tb_unidadesareas`
--
ALTER TABLE `tb_unidadesareas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `tb_atividades`
--
ALTER TABLE `tb_atividades`
  ADD CONSTRAINT `tb_atividades_ibfk_1` FOREIGN KEY (`id_resposta_fk`) REFERENCES `tb_respostas` (`id`);

--
-- Limitadores para a tabela `tb_diagnostico_headers`
--
ALTER TABLE `tb_diagnostico_headers`
  ADD CONSTRAINT `tb_diagnostico_headers_ibfk_1` FOREIGN KEY (`id_modelo_header_fk`) REFERENCES `tb_modelo_headers` (`id`),
  ADD CONSTRAINT `tb_diagnostico_headers_ibfk_2` FOREIGN KEY (`id_unidade_fk`) REFERENCES `tb_unidades` (`id`),
  ADD CONSTRAINT `tb_diagnostico_headers_ibfk_3` FOREIGN KEY (`id_usuario_fk`) REFERENCES `users` (`id`);

--
-- Limitadores para a tabela `tb_modelo_bodies`
--
ALTER TABLE `tb_modelo_bodies`
  ADD CONSTRAINT `tb_modelo_bodies_ibfk_1` FOREIGN KEY (`id_atividade_fk`) REFERENCES `tb_atividades` (`id`),
  ADD CONSTRAINT `tb_modelo_bodies_ibfk_2` FOREIGN KEY (`id_modelo_header_fk`) REFERENCES `tb_modelo_headers` (`id`),
  ADD CONSTRAINT `tb_modelo_bodies_ibfk_3` FOREIGN KEY (`id_pergunta_fk`) REFERENCES `tb_perguntas` (`id`),
  ADD CONSTRAINT `tb_modelo_bodies_ibfk_4` FOREIGN KEY (`id_resposta_fk`) REFERENCES `tb_respostas` (`id`),
  ADD CONSTRAINT `tb_modelo_bodies_ibfk_5` FOREIGN KEY (`id_usuario_fk`) REFERENCES `users` (`id`);

--
-- Limitadores para a tabela `tb_modelo_headers`
--
ALTER TABLE `tb_modelo_headers`
  ADD CONSTRAINT `tb_modelo_headers_ibfk_1` FOREIGN KEY (`id_area_fk`) REFERENCES `tb_areas` (`id`),
  ADD CONSTRAINT `tb_modelo_headers_ibfk_2` FOREIGN KEY (`id_parametro_fk`) REFERENCES `tb_parametros` (`id`),
  ADD CONSTRAINT `tb_modelo_headers_ibfk_3` FOREIGN KEY (`id_subarea_fk`) REFERENCES `tb_subareas` (`id`),
  ADD CONSTRAINT `tb_modelo_headers_ibfk_4` FOREIGN KEY (`id_usuario_fk`) REFERENCES `users` (`id`);

--
-- Limitadores para a tabela `tb_respostas`
--
ALTER TABLE `tb_respostas`
  ADD CONSTRAINT `tb_respostas_ibfk_1` FOREIGN KEY (`id_pergunta_fk`) REFERENCES `tb_perguntas` (`id`);

--
-- Limitadores para a tabela `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_permissao_fk`) REFERENCES `tb_permissoes` (`id`),
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`id_unidade_fk`) REFERENCES `tb_unidades` (`id`),
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`id_area_fk`) REFERENCES `tb_areas` (`id`),
  ADD CONSTRAINT `users_ibfk_4` FOREIGN KEY (`id_subarea_fk`) REFERENCES `tb_subareas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

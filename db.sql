-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2023 at 10:00 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sacco`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `account_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_status_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closed_on` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `organization_id`, `branch_id`, `account_code`, `account_number`, `account_name`, `account_type_id`, `account_status_id`, `other_details`, `closed_on`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '700', 'AC32532857092', '1', '6', NULL, NULL, NULL, '2', NULL, NULL, NULL, '2023-01-19 06:09:13', '2023-01-19 06:09:13'),
(2, 1, 1, '500', 'LN0001', '6', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-08 16:06:59', '2023-02-08 16:06:59'),
(4, 1, 1, '700', 'AC36285443779', '2', '6', NULL, NULL, NULL, '2', NULL, NULL, NULL, '2023-03-20 17:24:04', '2023-03-20 17:24:04'),
(6, 1, 1, '500', 'LN0002', '2', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:02:40', '2023-05-08 17:02:40'),
(7, 1, 1, '700', 'AC48788384229', '3', '6', NULL, NULL, NULL, '2', NULL, NULL, NULL, '2023-05-23 17:07:39', '2023-05-23 17:07:39'),
(8, 1, 1, '700', 'AC25506058529', '4', '6', NULL, NULL, NULL, '2', NULL, NULL, NULL, '2023-05-25 16:02:05', '2023-05-25 16:02:05'),
(9, 1, 1, '500', 'LN0003', '3', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-25 16:21:03', '2023-05-25 16:21:03'),
(10, 1, 1, '700', 'AC87557342278', '5', '6', NULL, NULL, NULL, '2', NULL, NULL, NULL, '2023-05-27 14:25:01', '2023-05-27 14:25:01');

-- --------------------------------------------------------

--
-- Table structure for table `account_classes`
--

CREATE TABLE `account_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `closed_on` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_classes`
--

INSERT INTO `account_classes` (`id`, `organization_id`, `name`, `category`, `closed_on`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 0, 'LIABILITY', 'CR', NULL, NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54'),
(2, 0, 'ASSET', 'DR', NULL, NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54'),
(3, 0, 'EXPENDITURE', 'DR', NULL, NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54'),
(4, 0, 'INCOME', 'CR', NULL, NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54');

-- --------------------------------------------------------

--
-- Table structure for table `account_ledgers`
--

CREATE TABLE `account_ledgers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `account_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `journal_id` int(11) NOT NULL,
  `created_at` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_members`
--

CREATE TABLE `account_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `account_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_statuses`
--

CREATE TABLE `account_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `account_class_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_types`
--

INSERT INTO `account_types` (`id`, `organization_id`, `account_class_id`, `name`, `code`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 0, '2', 'FIXED ASSET', '200', 'FIXED ASSET', NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54'),
(2, 0, '2', 'LOAN RECEIVABLE', '500', 'LOAN RECEIVABLE', NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54'),
(3, 0, '1', 'CAPITAL', '100', 'CAPITAL', NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54'),
(4, 0, '3', 'EXPENSE', '600', 'EXPENSE', NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54'),
(5, 0, '4', 'LENDING ACTIVITY', '400', 'LENDING ACTIVITY', NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54'),
(6, 0, '1', 'MEMBER DEPOSIT', '700', 'MEMBER DEPOSIT', NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54'),
(7, 0, '2', 'CURRENT ASSET', '300', 'CURRENT ASSET', NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54');

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `asset_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valuation_date` date NOT NULL,
  `valued_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valuer_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valuation_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `registration_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registered_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condition` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `assets`
--

INSERT INTO `assets` (`id`, `organization_id`, `branch_id`, `member_id`, `asset_number`, `title`, `description`, `valuation_date`, `valued_by`, `valuer_phone`, `valuation_amount`, `location`, `registration_number`, `registered_to`, `condition`, `notes`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 1, '1212', 'Car', 'New', '2023-01-14', 'James', '123456', '23456', 'Nairobi', '2321', '202313058', '202313058', '202313058', NULL, NULL, NULL, NULL, '2023-01-30 16:20:30', '2023-02-01 15:40:30'),
(4, 1, 1, 1, '20232691', 'House', 'Learn laravel', '2023-02-23', 'James', '+254743282283', '23456', 'Nairobi', '132', 'eqw3', 'eqew', 'Notes', NULL, NULL, NULL, NULL, '2023-02-06 14:36:44', '2023-02-06 14:36:44'),
(5, 1, 1, 2, '202351936', 'House', 'Mayfair Building', '2023-05-03', 'JK  Investments', '+254743282283', '10000000', 'Nairobi', NULL, 'Joseph', NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-19 15:15:35', '2023-05-19 15:15:35'),
(6, 1, 1, 4, '202352546', 'Land', 'Land', '2023-04-30', 'JK  Investments', '+254743282283', '10000000', 'Nairobi', 'a1271SX', 'Lilian', 'Prime Plot', 'Prime Plot', NULL, NULL, NULL, NULL, '2023-05-25 16:19:44', '2023-05-25 16:19:44');

-- --------------------------------------------------------

--
-- Table structure for table `asset_loan_applications`
--

CREATE TABLE `asset_loan_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `asset_id` int(36) NOT NULL,
  `loan_application_id` int(36) NOT NULL,
  `member_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `asset_loan_applications`
--

INSERT INTO `asset_loan_applications` (`id`, `organization_id`, `asset_id`, `loan_application_id`, `member_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 1, 1, '2023-02-06 17:23:36', '2023-02-06 17:54:57'),
(2, 1, 2, 2, 1, '2023-02-26 16:04:08', '2023-02-26 16:04:08'),
(3, 1, 6, 3, 4, '2023-05-25 19:20:08', '2023-05-25 19:20:08');

-- --------------------------------------------------------

--
-- Table structure for table `asset_photos`
--

CREATE TABLE `asset_photos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `asset_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_taken` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `borrowers`
--

CREATE TABLE `borrowers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `credit_score` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `borrower_status_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_type_id` int(11) NOT NULL,
  `witness_first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_national_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_postal_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_residential_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `borrower_statuses`
--

CREATE TABLE `borrower_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `county` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `organization_id`, `name`, `location`, `description`, `country`, `county`, `town`, `address`, `branch_code`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Main Branch', 'Nairobi', 'Main Branch', 'USA', 'Nairobi', NULL, 'Nairobi', '1', NULL, '2023-01-19 05:54:30', '2023-01-19 05:54:30'),
(2, 1, 'Nairobi Branch', NULL, 'Short Description', 'USA', NULL, 'Nairobi', 'Nairobi', '2', NULL, '2023-01-19 05:57:52', '2023-01-19 05:57:52'),
(3, 1, 'Mombasa', NULL, 'Short Description', 'USA', NULL, 'Mombasa', 'Nairobi', '3', NULL, '2023-01-20 08:44:03', '2023-01-20 08:44:03');

-- --------------------------------------------------------

--
-- Table structure for table `capitals`
--

CREATE TABLE `capitals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `method_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fiscal_year_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capital_date` date NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `communication_settings`
--

CREATE TABLE `communication_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_template` tinyint(1) NOT NULL DEFAULT 0,
  `sms_template` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_settings`
--

CREATE TABLE `email_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `protocol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smpt_host` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smpt_username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smpt_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smpt_port` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_gun_domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_gun_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mandrill_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `employee_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salutation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `national_id_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `county` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nhif_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nssf_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kra_pin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `national_id_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birth_day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `category_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expense_date` date DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `account_type_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_logins`
--

CREATE TABLE `failed_logins` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finance_statements`
--

CREATE TABLE `finance_statements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fiscal_periods`
--

CREATE TABLE `fiscal_periods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `start_on` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_on` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `closed_on` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guarantors`
--

CREATE TABLE `guarantors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `loan_application_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guarantee_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `guarantors`
--

INSERT INTO `guarantors` (`id`, `organization_id`, `branch_id`, `member_id`, `loan_application_id`, `notes`, `guarantee_amount`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, '1', 'Approved', '200000', NULL, NULL, NULL, NULL, '2023-03-21 13:58:29', '2023-03-21 13:58:29'),
(2, 1, 1, 2, '2', 'n/a', '780000', NULL, NULL, NULL, NULL, '2023-05-08 16:58:52', '2023-05-08 16:58:52'),
(3, 1, 1, 2, '3', 'Description', '455000', NULL, NULL, NULL, NULL, '2023-05-25 16:17:52', '2023-05-25 16:17:52'),
(4, 1, 1, 2, '4', 'This Is The Amount', '200000', NULL, NULL, NULL, NULL, '2023-05-27 14:27:00', '2023-05-27 14:27:00'),
(5, 1, 1, 3, '4', 'Dan', '10090', NULL, NULL, NULL, NULL, '2023-05-27 14:49:09', '2023-05-27 14:49:51');

-- --------------------------------------------------------

--
-- Table structure for table `interest_types`
--

CREATE TABLE `interest_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `interest_types`
--

INSERT INTO `interest_types` (`id`, `organization_id`, `name`, `display_name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 0, 'fixed', 'Fixed Rate', 'Fixed Rate', NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54'),
(2, 0, 'reducing_balance', 'Reducing Balance', 'Reducing Balance', NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE `journals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `transaction_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `debit_account_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit_account_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `narration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `assigned_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `county` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `passport_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `residential_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_images` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `membership_form` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `organization_id`, `branch_id`, `first_name`, `middle_name`, `last_name`, `date_of_birth`, `assigned_to`, `nationality`, `county`, `city`, `id_number`, `passport_number`, `phone`, `email`, `postal_address`, `residential_address`, `status_id`, `passport_photo`, `extra_images`, `membership_form`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Brian', NULL, 'Sang', NULL, '2', 'USA', NULL, 'Nairobi', '3123232', NULL, '0712345676', 'joseph@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-19 06:10:28', '2023-02-08 13:34:40'),
(2, 1, 1, 'Lilian', NULL, 'Muema', NULL, '2', 'Africa', NULL, 'Nairobi', '12121214', NULL, '+254743282283', 'lilian@gmail.com', '3464', '925 molo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-08 13:38:38', '2023-02-08 13:38:38');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `loan_reference_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loan_application_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `loan_officer_id` int(11) NOT NULL,
  `loan_type_id` int(11) DEFAULT NULL,
  `interest_rate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interest_type_id` int(11) NOT NULL,
  `repayment_period` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loan_status_id` int(11) DEFAULT NULL,
  `approved_by_user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount_approved` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disburse_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_fee` double NOT NULL DEFAULT 0,
  `penalty_type_id` int(11) DEFAULT NULL,
  `penalty_value` double NOT NULL DEFAULT 0,
  `penalty_frequency_id` int(11) DEFAULT NULL,
  `loan_disbursed` tinyint(1) NOT NULL DEFAULT 0,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `payment_frequency_id` int(11) NOT NULL,
  `reduce_principal_early` tinyint(1) NOT NULL DEFAULT 0,
  `next_repayment_date` date DEFAULT NULL,
  `disburse_method_id` int(11) NOT NULL,
  `mpesa_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `other_banking_details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closed_on` timestamp NULL DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `organization_id`, `branch_id`, `loan_reference_number`, `loan_application_id`, `member_id`, `loan_officer_id`, `loan_type_id`, `interest_rate`, `interest_type_id`, `repayment_period`, `loan_status_id`, `approved_by_user_id`, `amount_approved`, `disburse_amount`, `service_fee`, `penalty_type_id`, `penalty_value`, `penalty_frequency_id`, `loan_disbursed`, `start_date`, `end_date`, `payment_frequency_id`, `reduce_principal_early`, `next_repayment_date`, `disburse_method_id`, `mpesa_number`, `mpesa_first_name`, `mpesa_middle_name`, `mpesa_last_name`, `bank_name`, `bank_branch`, `bank_account`, `other_banking_details`, `closed_on`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'LN0001', 1, 2, 2, 3, '10', 2, '30', NULL, NULL, '450000', '397000', 3000, 1, 12, 1, 0, '2023-04-08', NULL, 2, 0, '2023-04-08', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-21 14:03:34', '2023-03-21 14:03:34'),
(2, 1, 1, 'LN0002', 2, 2, 2, 5, '10', 2, '72', NULL, NULL, '780000', '780000', 3000, 1, 10, 3, 0, '2016-07-31', NULL, 2, 0, '2023-05-31', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:02:40', '2023-05-08 17:02:40'),
(3, 1, 1, 'LN0003', 3, 4, 2, 5, '10', 2, '72', NULL, NULL, '455000', '452000', 3000, 1, 10, 3, 0, '2023-06-01', NULL, 2, 0, '2023-06-01', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-25 16:21:03', '2023-05-25 16:21:03');

-- --------------------------------------------------------

--
-- Table structure for table `loan_applications`
--

CREATE TABLE `loan_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `loan_officer_id` int(11) NOT NULL,
  `loan_type_id` int(11) NOT NULL,
  `interest_type_id` int(11) DEFAULT NULL,
  `interest_rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_fee` double NOT NULL DEFAULT 0,
  `penalty_type_id` int(11) DEFAULT NULL,
  `penalty_value` double NOT NULL DEFAULT 0,
  `penalty_frequency_id` int(11) DEFAULT NULL,
  `reduce_principal_early` tinyint(1) NOT NULL DEFAULT 0,
  `amount_applied` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `repayment_period` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_frequency_id` int(11) DEFAULT NULL,
  `periodic_payment_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `application_date` date NOT NULL,
  `witness_type_id` int(11) DEFAULT NULL,
  `witness_first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_county` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_national_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_postal_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `witness_residential_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disburse_method_id` int(11) NOT NULL,
  `mpesa_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_number` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `disburse_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disbursement_date` date DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `witnessed_by_user_id` int(11) DEFAULT NULL,
  `reviewed_by_user_id` int(11) DEFAULT NULL,
  `reviewed_on` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_on` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rejected_on` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rejection_notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attach_application_form` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loan_applications`
--

INSERT INTO `loan_applications` (`id`, `organization_id`, `branch_id`, `member_id`, `loan_officer_id`, `loan_type_id`, `interest_type_id`, `interest_rate`, `service_fee`, `penalty_type_id`, `penalty_value`, `penalty_frequency_id`, `reduce_principal_early`, `amount_applied`, `repayment_period`, `payment_frequency_id`, `periodic_payment_amount`, `application_date`, `witness_type_id`, `witness_first_name`, `witness_last_name`, `witness_country`, `witness_county`, `witness_city`, `witness_national_id`, `witness_phone`, `witness_email`, `witness_postal_address`, `witness_residential_address`, `disburse_method_id`, `mpesa_number`, `mpesa_first_name`, `mpesa_middle_name`, `mpesa_last_name`, `cheque_number`, `bank_name`, `bank_branch`, `account_number`, `cheque_date`, `disburse_note`, `disbursement_date`, `status_id`, `witnessed_by_user_id`, `reviewed_by_user_id`, `reviewed_on`, `approved_on`, `rejected_on`, `rejection_notes`, `attach_application_form`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 2, 3, 2, '10', 3000, 1, 12, 1, 0, '400000', '30', 2, NULL, '2023-03-24', 1, 'Joseph', NULL, 'Africa', NULL, 'MOLO', '1212100', '+254743282283', 'josephmwangi.jgm@gmail.com', '925 molo', 'Nairobi', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1970-01-01', 'Approved', '2023-03-23', NULL, NULL, 2, '2023-03-30', '2023-03-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-21 13:51:48', '2023-03-21 14:03:34'),
(2, 1, 1, 2, 2, 5, 2, '10', 3000, 1, 10, 3, 0, '780,000', '72', 2, NULL, '2016-07-01', 1, 'James', NULL, 'Africa', NULL, 'Mumbai', '12345678', '0712345678', 'james@gmail.com', '12212', 'Dakar', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1970-01-01', 'n/a', '2023-05-01', NULL, NULL, 2, '2023-05-01', '2023-05-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 16:56:14', '2023-05-08 17:02:40'),
(3, 1, 1, 4, 2, 5, 2, '10', 3000, 1, 10, 3, 0, '455000', '72', 2, NULL, '2023-05-03', 1, 'Joseph', NULL, 'Kenya', NULL, 'MOLO', '1212100', '+254743282283', 'mbuvi@gmail.com', '925 molo', 'Nairobi', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1970-01-01', 'Description', '2023-04-30', NULL, NULL, 2, '2023-05-27', '2023-06-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-25 16:02:57', '2023-05-25 16:21:03'),
(4, 1, 1, 5, 2, 6, 1, '2', 3000, 1, 20000, 1, 0, '300000', '24', 2, NULL, '2023-05-07', 1, 'Joseph', NULL, 'Kenya', NULL, 'MOLO', '14356', '+254743282283', 'josephmwangi.jgm@gmail.com', '925 molo', '345', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-07', 'You don\'t qualify for this application', NULL, NULL, NULL, NULL, NULL, '2023-05-27 14:25:41', '2023-06-07 15:12:12'),
(5, 1, 1, 4, 2, 5, 2, '10', 3000, 1, 10, 3, 0, '455000', '72', 2, NULL, '2023-06-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-07 16:47:34', '2023-06-07 16:47:34');

-- --------------------------------------------------------

--
-- Table structure for table `loan_application_statuses`
--

CREATE TABLE `loan_application_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_approvers`
--

CREATE TABLE `loan_approvers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `loap_application_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_payments`
--

CREATE TABLE `loan_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `member_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_date` date NOT NULL,
  `receipt_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `is_mpesa` tinyint(1) DEFAULT NULL,
  `transaction_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trans_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trans_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_short_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_ref_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `org_account_balance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `third_party_trans_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loan_payments`
--

INSERT INTO `loan_payments` (`id`, `organization_id`, `loan_id`, `branch_id`, `member_id`, `amount`, `method_id`, `transaction_id`, `payment_date`, `receipt_number`, `attachment`, `notes`, `cheque_number`, `bank_name`, `bank_branch`, `cheque_date`, `is_mpesa`, `transaction_type`, `trans_id`, `trans_time`, `business_short_code`, `bill_ref_number`, `invoice_number`, `mpesa_number`, `mpesa_first_name`, `mpesa_middle_name`, `mpesa_last_name`, `org_account_balance`, `third_party_trans_id`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2', '85000', 'CASH', NULL, '2023-03-23', 'RTL0001', NULL, 'Paid', NULL, NULL, NULL, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-21 14:21:11', '2023-03-21 14:21:11'),
(2, 1, 1, 1, '2', '30000', 'CASH', NULL, '2023-05-10', 'RTL0002', NULL, NULL, NULL, NULL, NULL, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 14:15:15', '2023-05-08 14:15:15'),
(75, 1, 2, 1, '2', '11000', '1', NULL, '2016-08-31', 'RTL0003', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(76, 1, 2, 1, '2', '11000', '1', NULL, '2016-10-31', 'RTL0004', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(77, 1, 2, 1, '2', '11000', '1', NULL, '2017-01-31', 'RTL0004', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(78, 1, 2, 1, '2', '11000', '1', NULL, '2017-05-31', 'RTL0004', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(79, 1, 2, 1, '2', '11000', '1', NULL, '2017-10-31', 'RTL0004', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(80, 1, 2, 1, '2', '11000', '1', NULL, '2018-05-01', 'RTL0004', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(81, 1, 2, 1, '2', '11000', '1', NULL, '2018-12-01', 'RTL0004', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(82, 1, 2, 1, '2', '11000', '1', NULL, '2019-08-01', 'RTL0004', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(83, 1, 2, 1, '2', '11000', '1', NULL, '2020-05-01', 'RTL0004', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(84, 1, 2, 1, '2', '11000', '1', NULL, '2021-03-01', 'RTL0004', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(85, 1, 2, 1, '2', '11000', '1', NULL, '2022-02-01', 'RTL0004', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(86, 1, 2, 1, '2', '11000', '1', NULL, '2023-02-01', 'RTL0004', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(87, 1, 2, 1, '2', '11000', '1', NULL, '2024-03-01', 'RTL0004', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(88, 1, 2, 1, '2', '11000', '1', NULL, '2025-05-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(89, 1, 2, 1, '2', '11000', '1', NULL, '2026-08-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(90, 1, 2, 1, '2', '11000', '1', NULL, '2027-12-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(91, 1, 2, 1, '2', '11000', '1', NULL, '2029-05-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(92, 1, 2, 1, '2', '11000', '1', NULL, '2030-11-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(93, 1, 2, 1, '2', '11000', '1', NULL, '2032-06-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(94, 1, 2, 1, '2', '11000', '1', NULL, '2034-02-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(95, 1, 2, 1, '2', '11000', '1', NULL, '2035-11-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(96, 1, 2, 1, '2', '11000', '1', NULL, '2037-09-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(97, 1, 2, 1, '2', '11000', '1', NULL, '2039-08-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(98, 1, 2, 1, '2', '11000', '1', NULL, '2041-08-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(99, 1, 2, 1, '2', '11000', '1', NULL, '2043-09-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(100, 1, 2, 1, '2', '11000', '1', NULL, '2045-11-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(101, 1, 2, 1, '2', '11000', '1', NULL, '2048-02-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(102, 1, 2, 1, '2', '11000', '1', NULL, '2050-06-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(103, 1, 2, 1, '2', '11000', '1', NULL, '2052-11-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(104, 1, 2, 1, '2', '11000', '1', NULL, '2055-05-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(105, 1, 2, 1, '2', '11000', '1', NULL, '2057-12-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(106, 1, 2, 1, '2', '11000', '1', NULL, '2060-08-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(107, 1, 2, 1, '2', '11000', '1', NULL, '2063-05-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(108, 1, 2, 1, '2', '11000', '1', NULL, '2066-03-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(109, 1, 2, 1, '2', '11000', '1', NULL, '2069-02-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(110, 1, 2, 1, '2', '11000', '1', NULL, '2072-02-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(111, 1, 2, 1, '2', '11000', '1', NULL, '2075-03-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(112, 1, 2, 1, '2', '11000', '1', NULL, '2078-05-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(113, 1, 2, 1, '2', '11000', '1', NULL, '2081-08-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(114, 1, 2, 1, '2', '11000', '1', NULL, '2084-12-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(115, 1, 2, 1, '2', '11000', '1', NULL, '2088-05-01', 'RTL0005', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(116, 1, 2, 1, '2', '11000', '1', NULL, '2091-11-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(117, 1, 2, 1, '2', '11000', '1', NULL, '2095-06-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(118, 1, 2, 1, '2', '11000', '1', NULL, '2099-02-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(119, 1, 2, 1, '2', '11000', '1', NULL, '2102-11-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(120, 1, 2, 1, '2', '11000', '1', NULL, '2106-09-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(121, 1, 2, 1, '2', '11000', '1', NULL, '2110-08-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(122, 1, 2, 1, '2', '11000', '1', NULL, '2114-08-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(123, 1, 2, 1, '2', '11000', '1', NULL, '2118-09-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(124, 1, 2, 1, '2', '11000', '1', NULL, '2122-11-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(125, 1, 2, 1, '2', '11000', '1', NULL, '2127-02-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(126, 1, 2, 1, '2', '11000', '1', NULL, '2131-06-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(127, 1, 2, 1, '2', '11000', '1', NULL, '2135-11-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(128, 1, 2, 1, '2', '11000', '1', NULL, '2140-05-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(129, 1, 2, 1, '2', '11000', '1', NULL, '2144-12-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(130, 1, 2, 1, '2', '11000', '1', NULL, '2149-08-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(131, 1, 2, 1, '2', '11000', '1', NULL, '2154-05-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(132, 1, 2, 1, '2', '11000', '1', NULL, '2159-03-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(133, 1, 2, 1, '2', '11000', '1', NULL, '2164-02-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(134, 1, 2, 1, '2', '11000', '1', NULL, '2169-02-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(135, 1, 2, 1, '2', '11000', '1', NULL, '2174-03-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(136, 1, 2, 1, '2', '11000', '1', NULL, '2179-05-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(137, 1, 2, 1, '2', '11000', '1', NULL, '2184-08-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(138, 1, 2, 1, '2', '11000', '1', NULL, '2189-12-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(139, 1, 2, 1, '2', '11000', '1', NULL, '2195-05-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(140, 1, 2, 1, '2', '11000', '1', NULL, '2200-11-01', 'RTL0006', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(141, 1, 2, 1, '2', '11000', '1', NULL, '2206-06-01', 'RTL0007', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(142, 1, 2, 1, '2', '11000', '1', NULL, '2212-02-01', 'RTL0007', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(143, 1, 2, 1, '2', '11000', '1', NULL, '2217-11-01', 'RTL0007', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(144, 1, 2, 1, '2', '11000', '1', NULL, '2223-09-01', 'RTL0007', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(145, 1, 2, 1, '2', '11000', '1', NULL, '2229-08-01', 'RTL0007', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(146, 1, 2, 1, '2', '11000', '1', NULL, '2235-08-01', 'RTL0007', NULL, 'Description', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(147, 1, 3, 1, '4', '10000', 'CASH', NULL, '2023-05-11', 'RTL0007', NULL, 'Paid AMount', NULL, NULL, NULL, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-25 16:55:31', '2023-05-25 16:55:31');

-- --------------------------------------------------------

--
-- Table structure for table `loan_penalties`
--

CREATE TABLE `loan_penalties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `period_count` int(11) DEFAULT NULL,
  `due_date` date NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_on` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_statements`
--

CREATE TABLE `loan_statements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `loan_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `posting_date` date NOT NULL,
  `document_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `debit_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loan_balance` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loan_statements`
--

INSERT INTO `loan_statements` (`id`, `loan_id`, `member_id`, `posting_date`, `document_number`, `description`, `debit_amount`, `credit_amount`, `loan_balance`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '2023-05-31', 'Open Loan', 'Loan', '780000', '0.00', '780000', '2023-05-08 17:02:40', '2023-05-08 17:02:40'),
(2, 2, 2, '2023-05-31', 'Open Bal', 'Int Due', '6500', '0.00', '786500', '2023-05-08 17:02:40', '2023-05-08 17:02:40'),
(219, 2, 2, '2016-08-31', 'Open Bal', 'Int Due', '6500', '0.00', '786500', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(220, 2, 2, '2016-08-31', 'Int Paid', 'Int Due', '0.00', '6500', '780000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(221, 2, 2, '2016-08-31', 'RTL0003', 'Repayment', '0.00', '11000', '769000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(222, 2, 2, '2016-10-31', 'Open Bal', 'Int Due', '6500', '0.00', '775500', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(223, 2, 2, '2016-10-31', 'Int Paid', 'Int Due', '0.00', '6500', '769000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(224, 2, 2, '2016-10-31', 'RTL0004', 'Repayment', '0.00', '11000', '758000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(225, 2, 2, '2017-01-31', 'Open Bal', 'Int Due', '6500', '0.00', '764500', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(226, 2, 2, '2017-01-31', 'Int Paid', 'Int Due', '0.00', '6500', '758000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(227, 2, 2, '2017-01-31', 'RTL0004', 'Repayment', '0.00', '11000', '747000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(228, 2, 2, '2017-05-31', 'Open Bal', 'Int Due', '6500', '0.00', '753500', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(229, 2, 2, '2017-05-31', 'Int Paid', 'Int Due', '0.00', '6500', '747000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(230, 2, 2, '2017-05-31', 'RTL0004', 'Repayment', '0.00', '11000', '736000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(231, 2, 2, '2017-10-31', 'Open Bal', 'Int Due', '6500', '0.00', '742500', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(232, 2, 2, '2017-10-31', 'Int Paid', 'Int Due', '0.00', '6500', '736000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(233, 2, 2, '2017-10-31', 'RTL0004', 'Repayment', '0.00', '11000', '725000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(234, 2, 2, '2018-05-01', 'Open Bal', 'Int Due', '6500', '0.00', '731500', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(235, 2, 2, '2018-05-01', 'Int Paid', 'Int Due', '0.00', '6500', '725000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(236, 2, 2, '2018-05-01', 'RTL0004', 'Repayment', '0.00', '11000', '714000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(237, 2, 2, '2018-12-01', 'Open Bal', 'Int Due', '6500', '0.00', '720500', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(238, 2, 2, '2018-12-01', 'Int Paid', 'Int Due', '0.00', '6500', '714000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(239, 2, 2, '2018-12-01', 'RTL0004', 'Repayment', '0.00', '11000', '703000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(240, 2, 2, '2019-08-01', 'Open Bal', 'Int Due', '6500', '0.00', '709500', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(241, 2, 2, '2019-08-01', 'Int Paid', 'Int Due', '0.00', '6500', '703000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(242, 2, 2, '2019-08-01', 'RTL0004', 'Repayment', '0.00', '11000', '692000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(243, 2, 2, '2020-05-01', 'Open Bal', 'Int Due', '6500', '0.00', '698500', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(244, 2, 2, '2020-05-01', 'Int Paid', 'Int Due', '0.00', '6500', '692000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(245, 2, 2, '2020-05-01', 'RTL0004', 'Repayment', '0.00', '11000', '681000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(246, 2, 2, '2021-03-01', 'Open Bal', 'Int Due', '6500', '0.00', '687500', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(247, 2, 2, '2021-03-01', 'Int Paid', 'Int Due', '0.00', '6500', '681000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(248, 2, 2, '2021-03-01', 'RTL0004', 'Repayment', '0.00', '11000', '670000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(249, 2, 2, '2022-02-01', 'Open Bal', 'Int Due', '6500', '0.00', '676500', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(250, 2, 2, '2022-02-01', 'Int Paid', 'Int Due', '0.00', '6500', '670000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(251, 2, 2, '2022-02-01', 'RTL0004', 'Repayment', '0.00', '11000', '659000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(252, 2, 2, '2023-02-01', 'Open Bal', 'Int Due', '6500', '0.00', '665500', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(253, 2, 2, '2023-02-01', 'Int Paid', 'Int Due', '0.00', '6500', '659000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(254, 2, 2, '2023-02-01', 'RTL0004', 'Repayment', '0.00', '11000', '648000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(255, 2, 2, '2024-03-01', 'Open Bal', 'Int Due', '6500', '0.00', '654500', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(256, 2, 2, '2024-03-01', 'Int Paid', 'Int Due', '0.00', '6500', '648000', '2023-05-08 17:59:28', '2023-05-08 17:59:28'),
(257, 2, 2, '2024-03-01', 'RTL0004', 'Repayment', '0.00', '11000', '637000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(258, 2, 2, '2025-05-01', 'Open Bal', 'Int Due', '6500', '0.00', '643500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(259, 2, 2, '2025-05-01', 'Int Paid', 'Int Due', '0.00', '6500', '637000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(260, 2, 2, '2025-05-01', 'RTL0005', 'Repayment', '0.00', '11000', '626000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(261, 2, 2, '2026-08-01', 'Open Bal', 'Int Due', '6500', '0.00', '632500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(262, 2, 2, '2026-08-01', 'Int Paid', 'Int Due', '0.00', '6500', '626000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(263, 2, 2, '2026-08-01', 'RTL0005', 'Repayment', '0.00', '11000', '615000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(264, 2, 2, '2027-12-01', 'Open Bal', 'Int Due', '6500', '0.00', '621500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(265, 2, 2, '2027-12-01', 'Int Paid', 'Int Due', '0.00', '6500', '615000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(266, 2, 2, '2027-12-01', 'RTL0005', 'Repayment', '0.00', '11000', '604000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(267, 2, 2, '2029-05-01', 'Open Bal', 'Int Due', '6500', '0.00', '610500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(268, 2, 2, '2029-05-01', 'Int Paid', 'Int Due', '0.00', '6500', '604000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(269, 2, 2, '2029-05-01', 'RTL0005', 'Repayment', '0.00', '11000', '593000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(270, 2, 2, '2030-11-01', 'Open Bal', 'Int Due', '6500', '0.00', '599500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(271, 2, 2, '2030-11-01', 'Int Paid', 'Int Due', '0.00', '6500', '593000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(272, 2, 2, '2030-11-01', 'RTL0005', 'Repayment', '0.00', '11000', '582000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(273, 2, 2, '2032-06-01', 'Open Bal', 'Int Due', '6500', '0.00', '588500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(274, 2, 2, '2032-06-01', 'Int Paid', 'Int Due', '0.00', '6500', '582000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(275, 2, 2, '2032-06-01', 'RTL0005', 'Repayment', '0.00', '11000', '571000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(276, 2, 2, '2034-02-01', 'Open Bal', 'Int Due', '6500', '0.00', '577500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(277, 2, 2, '2034-02-01', 'Int Paid', 'Int Due', '0.00', '6500', '571000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(278, 2, 2, '2034-02-01', 'RTL0005', 'Repayment', '0.00', '11000', '560000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(279, 2, 2, '2035-11-01', 'Open Bal', 'Int Due', '6500', '0.00', '566500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(280, 2, 2, '2035-11-01', 'Int Paid', 'Int Due', '0.00', '6500', '560000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(281, 2, 2, '2035-11-01', 'RTL0005', 'Repayment', '0.00', '11000', '549000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(282, 2, 2, '2037-09-01', 'Open Bal', 'Int Due', '6500', '0.00', '555500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(283, 2, 2, '2037-09-01', 'Int Paid', 'Int Due', '0.00', '6500', '549000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(284, 2, 2, '2037-09-01', 'RTL0005', 'Repayment', '0.00', '11000', '538000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(285, 2, 2, '2039-08-01', 'Open Bal', 'Int Due', '6500', '0.00', '544500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(286, 2, 2, '2039-08-01', 'Int Paid', 'Int Due', '0.00', '6500', '538000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(287, 2, 2, '2039-08-01', 'RTL0005', 'Repayment', '0.00', '11000', '527000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(288, 2, 2, '2041-08-01', 'Open Bal', 'Int Due', '6500', '0.00', '533500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(289, 2, 2, '2041-08-01', 'Int Paid', 'Int Due', '0.00', '6500', '527000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(290, 2, 2, '2041-08-01', 'RTL0005', 'Repayment', '0.00', '11000', '516000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(291, 2, 2, '2043-09-01', 'Open Bal', 'Int Due', '6500', '0.00', '522500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(292, 2, 2, '2043-09-01', 'Int Paid', 'Int Due', '0.00', '6500', '516000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(293, 2, 2, '2043-09-01', 'RTL0005', 'Repayment', '0.00', '11000', '505000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(294, 2, 2, '2045-11-01', 'Open Bal', 'Int Due', '6500', '0.00', '511500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(295, 2, 2, '2045-11-01', 'Int Paid', 'Int Due', '0.00', '6500', '505000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(296, 2, 2, '2045-11-01', 'RTL0005', 'Repayment', '0.00', '11000', '494000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(297, 2, 2, '2048-02-01', 'Open Bal', 'Int Due', '6500', '0.00', '500500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(298, 2, 2, '2048-02-01', 'Int Paid', 'Int Due', '0.00', '6500', '494000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(299, 2, 2, '2048-02-01', 'RTL0005', 'Repayment', '0.00', '11000', '483000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(300, 2, 2, '2050-06-01', 'Open Bal', 'Int Due', '6500', '0.00', '489500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(301, 2, 2, '2050-06-01', 'Int Paid', 'Int Due', '0.00', '6500', '483000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(302, 2, 2, '2050-06-01', 'RTL0005', 'Repayment', '0.00', '11000', '472000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(303, 2, 2, '2052-11-01', 'Open Bal', 'Int Due', '6500', '0.00', '478500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(304, 2, 2, '2052-11-01', 'Int Paid', 'Int Due', '0.00', '6500', '472000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(305, 2, 2, '2052-11-01', 'RTL0005', 'Repayment', '0.00', '11000', '461000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(306, 2, 2, '2055-05-01', 'Open Bal', 'Int Due', '6500', '0.00', '467500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(307, 2, 2, '2055-05-01', 'Int Paid', 'Int Due', '0.00', '6500', '461000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(308, 2, 2, '2055-05-01', 'RTL0005', 'Repayment', '0.00', '11000', '450000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(309, 2, 2, '2057-12-01', 'Open Bal', 'Int Due', '6500', '0.00', '456500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(310, 2, 2, '2057-12-01', 'Int Paid', 'Int Due', '0.00', '6500', '450000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(311, 2, 2, '2057-12-01', 'RTL0005', 'Repayment', '0.00', '11000', '439000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(312, 2, 2, '2060-08-01', 'Open Bal', 'Int Due', '6500', '0.00', '445500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(313, 2, 2, '2060-08-01', 'Int Paid', 'Int Due', '0.00', '6500', '439000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(314, 2, 2, '2060-08-01', 'RTL0005', 'Repayment', '0.00', '11000', '428000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(315, 2, 2, '2063-05-01', 'Open Bal', 'Int Due', '6500', '0.00', '434500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(316, 2, 2, '2063-05-01', 'Int Paid', 'Int Due', '0.00', '6500', '428000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(317, 2, 2, '2063-05-01', 'RTL0005', 'Repayment', '0.00', '11000', '417000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(318, 2, 2, '2066-03-01', 'Open Bal', 'Int Due', '6500', '0.00', '423500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(319, 2, 2, '2066-03-01', 'Int Paid', 'Int Due', '0.00', '6500', '417000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(320, 2, 2, '2066-03-01', 'RTL0005', 'Repayment', '0.00', '11000', '406000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(321, 2, 2, '2069-02-01', 'Open Bal', 'Int Due', '6500', '0.00', '412500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(322, 2, 2, '2069-02-01', 'Int Paid', 'Int Due', '0.00', '6500', '406000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(323, 2, 2, '2069-02-01', 'RTL0005', 'Repayment', '0.00', '11000', '395000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(324, 2, 2, '2072-02-01', 'Open Bal', 'Int Due', '6500', '0.00', '401500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(325, 2, 2, '2072-02-01', 'Int Paid', 'Int Due', '0.00', '6500', '395000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(326, 2, 2, '2072-02-01', 'RTL0005', 'Repayment', '0.00', '11000', '384000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(327, 2, 2, '2075-03-01', 'Open Bal', 'Int Due', '6500', '0.00', '390500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(328, 2, 2, '2075-03-01', 'Int Paid', 'Int Due', '0.00', '6500', '384000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(329, 2, 2, '2075-03-01', 'RTL0005', 'Repayment', '0.00', '11000', '373000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(330, 2, 2, '2078-05-01', 'Open Bal', 'Int Due', '6500', '0.00', '379500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(331, 2, 2, '2078-05-01', 'Int Paid', 'Int Due', '0.00', '6500', '373000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(332, 2, 2, '2078-05-01', 'RTL0005', 'Repayment', '0.00', '11000', '362000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(333, 2, 2, '2081-08-01', 'Open Bal', 'Int Due', '6500', '0.00', '368500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(334, 2, 2, '2081-08-01', 'Int Paid', 'Int Due', '0.00', '6500', '362000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(335, 2, 2, '2081-08-01', 'RTL0005', 'Repayment', '0.00', '11000', '351000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(336, 2, 2, '2084-12-01', 'Open Bal', 'Int Due', '6500', '0.00', '357500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(337, 2, 2, '2084-12-01', 'Int Paid', 'Int Due', '0.00', '6500', '351000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(338, 2, 2, '2084-12-01', 'RTL0005', 'Repayment', '0.00', '11000', '340000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(339, 2, 2, '2088-05-01', 'Open Bal', 'Int Due', '6500', '0.00', '346500', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(340, 2, 2, '2088-05-01', 'Int Paid', 'Int Due', '0.00', '6500', '340000', '2023-05-08 17:59:29', '2023-05-08 17:59:29'),
(341, 2, 2, '2088-05-01', 'RTL0005', 'Repayment', '0.00', '11000', '329000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(342, 2, 2, '2091-11-01', 'Open Bal', 'Int Due', '6500', '0.00', '335500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(343, 2, 2, '2091-11-01', 'Int Paid', 'Int Due', '0.00', '6500', '329000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(344, 2, 2, '2091-11-01', 'RTL0006', 'Repayment', '0.00', '11000', '318000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(345, 2, 2, '2095-06-01', 'Open Bal', 'Int Due', '6500', '0.00', '324500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(346, 2, 2, '2095-06-01', 'Int Paid', 'Int Due', '0.00', '6500', '318000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(347, 2, 2, '2095-06-01', 'RTL0006', 'Repayment', '0.00', '11000', '307000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(348, 2, 2, '2099-02-01', 'Open Bal', 'Int Due', '6500', '0.00', '313500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(349, 2, 2, '2099-02-01', 'Int Paid', 'Int Due', '0.00', '6500', '307000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(350, 2, 2, '2099-02-01', 'RTL0006', 'Repayment', '0.00', '11000', '296000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(351, 2, 2, '2102-11-01', 'Open Bal', 'Int Due', '6500', '0.00', '302500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(352, 2, 2, '2102-11-01', 'Int Paid', 'Int Due', '0.00', '6500', '296000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(353, 2, 2, '2102-11-01', 'RTL0006', 'Repayment', '0.00', '11000', '285000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(354, 2, 2, '2106-09-01', 'Open Bal', 'Int Due', '6500', '0.00', '291500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(355, 2, 2, '2106-09-01', 'Int Paid', 'Int Due', '0.00', '6500', '285000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(356, 2, 2, '2106-09-01', 'RTL0006', 'Repayment', '0.00', '11000', '274000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(357, 2, 2, '2110-08-01', 'Open Bal', 'Int Due', '6500', '0.00', '280500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(358, 2, 2, '2110-08-01', 'Int Paid', 'Int Due', '0.00', '6500', '274000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(359, 2, 2, '2110-08-01', 'RTL0006', 'Repayment', '0.00', '11000', '263000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(360, 2, 2, '2114-08-01', 'Open Bal', 'Int Due', '6500', '0.00', '269500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(361, 2, 2, '2114-08-01', 'Int Paid', 'Int Due', '0.00', '6500', '263000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(362, 2, 2, '2114-08-01', 'RTL0006', 'Repayment', '0.00', '11000', '252000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(363, 2, 2, '2118-09-01', 'Open Bal', 'Int Due', '6500', '0.00', '258500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(364, 2, 2, '2118-09-01', 'Int Paid', 'Int Due', '0.00', '6500', '252000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(365, 2, 2, '2118-09-01', 'RTL0006', 'Repayment', '0.00', '11000', '241000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(366, 2, 2, '2122-11-01', 'Open Bal', 'Int Due', '6500', '0.00', '247500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(367, 2, 2, '2122-11-01', 'Int Paid', 'Int Due', '0.00', '6500', '241000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(368, 2, 2, '2122-11-01', 'RTL0006', 'Repayment', '0.00', '11000', '230000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(369, 2, 2, '2127-02-01', 'Open Bal', 'Int Due', '6500', '0.00', '236500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(370, 2, 2, '2127-02-01', 'Int Paid', 'Int Due', '0.00', '6500', '230000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(371, 2, 2, '2127-02-01', 'RTL0006', 'Repayment', '0.00', '11000', '219000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(372, 2, 2, '2131-06-01', 'Open Bal', 'Int Due', '6500', '0.00', '225500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(373, 2, 2, '2131-06-01', 'Int Paid', 'Int Due', '0.00', '6500', '219000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(374, 2, 2, '2131-06-01', 'RTL0006', 'Repayment', '0.00', '11000', '208000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(375, 2, 2, '2135-11-01', 'Open Bal', 'Int Due', '6500', '0.00', '214500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(376, 2, 2, '2135-11-01', 'Int Paid', 'Int Due', '0.00', '6500', '208000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(377, 2, 2, '2135-11-01', 'RTL0006', 'Repayment', '0.00', '11000', '197000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(378, 2, 2, '2140-05-01', 'Open Bal', 'Int Due', '6500', '0.00', '203500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(379, 2, 2, '2140-05-01', 'Int Paid', 'Int Due', '0.00', '6500', '197000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(380, 2, 2, '2140-05-01', 'RTL0006', 'Repayment', '0.00', '11000', '186000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(381, 2, 2, '2144-12-01', 'Open Bal', 'Int Due', '6500', '0.00', '192500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(382, 2, 2, '2144-12-01', 'Int Paid', 'Int Due', '0.00', '6500', '186000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(383, 2, 2, '2144-12-01', 'RTL0006', 'Repayment', '0.00', '11000', '175000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(384, 2, 2, '2149-08-01', 'Open Bal', 'Int Due', '6500', '0.00', '181500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(385, 2, 2, '2149-08-01', 'Int Paid', 'Int Due', '0.00', '6500', '175000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(386, 2, 2, '2149-08-01', 'RTL0006', 'Repayment', '0.00', '11000', '164000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(387, 2, 2, '2154-05-01', 'Open Bal', 'Int Due', '6500', '0.00', '170500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(388, 2, 2, '2154-05-01', 'Int Paid', 'Int Due', '0.00', '6500', '164000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(389, 2, 2, '2154-05-01', 'RTL0006', 'Repayment', '0.00', '11000', '153000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(390, 2, 2, '2159-03-01', 'Open Bal', 'Int Due', '6500', '0.00', '159500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(391, 2, 2, '2159-03-01', 'Int Paid', 'Int Due', '0.00', '6500', '153000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(392, 2, 2, '2159-03-01', 'RTL0006', 'Repayment', '0.00', '11000', '142000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(393, 2, 2, '2164-02-01', 'Open Bal', 'Int Due', '6500', '0.00', '148500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(394, 2, 2, '2164-02-01', 'Int Paid', 'Int Due', '0.00', '6500', '142000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(395, 2, 2, '2164-02-01', 'RTL0006', 'Repayment', '0.00', '11000', '131000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(396, 2, 2, '2169-02-01', 'Open Bal', 'Int Due', '6500', '0.00', '137500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(397, 2, 2, '2169-02-01', 'Int Paid', 'Int Due', '0.00', '6500', '131000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(398, 2, 2, '2169-02-01', 'RTL0006', 'Repayment', '0.00', '11000', '120000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(399, 2, 2, '2174-03-01', 'Open Bal', 'Int Due', '6500', '0.00', '126500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(400, 2, 2, '2174-03-01', 'Int Paid', 'Int Due', '0.00', '6500', '120000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(401, 2, 2, '2174-03-01', 'RTL0006', 'Repayment', '0.00', '11000', '109000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(402, 2, 2, '2179-05-01', 'Open Bal', 'Int Due', '6500', '0.00', '115500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(403, 2, 2, '2179-05-01', 'Int Paid', 'Int Due', '0.00', '6500', '109000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(404, 2, 2, '2179-05-01', 'RTL0006', 'Repayment', '0.00', '11000', '98000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(405, 2, 2, '2184-08-01', 'Open Bal', 'Int Due', '6500', '0.00', '104500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(406, 2, 2, '2184-08-01', 'Int Paid', 'Int Due', '0.00', '6500', '98000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(407, 2, 2, '2184-08-01', 'RTL0006', 'Repayment', '0.00', '11000', '87000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(408, 2, 2, '2189-12-01', 'Open Bal', 'Int Due', '6500', '0.00', '93500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(409, 2, 2, '2189-12-01', 'Int Paid', 'Int Due', '0.00', '6500', '87000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(410, 2, 2, '2189-12-01', 'RTL0006', 'Repayment', '0.00', '11000', '76000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(411, 2, 2, '2195-05-01', 'Open Bal', 'Int Due', '6500', '0.00', '82500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(412, 2, 2, '2195-05-01', 'Int Paid', 'Int Due', '0.00', '6500', '76000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(413, 2, 2, '2195-05-01', 'RTL0006', 'Repayment', '0.00', '11000', '65000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(414, 2, 2, '2200-11-01', 'Open Bal', 'Int Due', '6500', '0.00', '71500', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(415, 2, 2, '2200-11-01', 'Int Paid', 'Int Due', '0.00', '6500', '65000', '2023-05-08 17:59:30', '2023-05-08 17:59:30'),
(416, 2, 2, '2200-11-01', 'RTL0006', 'Repayment', '0.00', '11000', '54000', '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(417, 2, 2, '2206-06-01', 'Open Bal', 'Int Due', '6500', '0.00', '60500', '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(418, 2, 2, '2206-06-01', 'Int Paid', 'Int Due', '0.00', '6500', '54000', '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(419, 2, 2, '2206-06-01', 'RTL0007', 'Repayment', '0.00', '11000', '43000', '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(420, 2, 2, '2212-02-01', 'Open Bal', 'Int Due', '6500', '0.00', '49500', '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(421, 2, 2, '2212-02-01', 'Int Paid', 'Int Due', '0.00', '6500', '43000', '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(422, 2, 2, '2212-02-01', 'RTL0007', 'Repayment', '0.00', '11000', '32000', '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(423, 2, 2, '2217-11-01', 'Open Bal', 'Int Due', '6500', '0.00', '38500', '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(424, 2, 2, '2217-11-01', 'Int Paid', 'Int Due', '0.00', '6500', '32000', '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(425, 2, 2, '2217-11-01', 'RTL0007', 'Repayment', '0.00', '11000', '21000', '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(426, 2, 2, '2223-09-01', 'Open Bal', 'Int Due', '6500', '0.00', '27500', '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(427, 2, 2, '2223-09-01', 'Int Paid', 'Int Due', '0.00', '6500', '21000', '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(428, 2, 2, '2223-09-01', 'RTL0007', 'Repayment', '0.00', '11000', '10000', '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(429, 2, 2, '2229-08-01', 'Open Bal', 'Int Due', '6500', '0.00', '16500', '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(430, 2, 2, '2229-08-01', 'Int Paid', 'Int Due', '0.00', '6500', '10000', '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(431, 2, 2, '2229-08-01', 'RTL0007', 'Repayment', '0.00', '11000', '-1000', '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(432, 2, 2, '2235-08-01', 'Open Bal', 'Int Due', '6500', '0.00', '5500', '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(433, 2, 2, '2235-08-01', 'Int Paid', 'Int Due', '0.00', '6500', '-1000', '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(434, 2, 2, '2235-08-01', 'RTL0007', 'Repayment', '0.00', '11000', '-12000', '2023-05-08 17:59:31', '2023-05-08 17:59:31'),
(435, 3, 4, '2023-06-01', 'Open Loan', 'Loan', '455000', '0.00', '455000', '2023-05-25 16:21:03', '2023-05-25 16:21:03'),
(436, 3, 4, '2023-06-01', 'Open Bal', 'Int Due', '3791.6666666667', '0.00', '458791.66666667', '2023-05-25 16:21:03', '2023-05-25 16:21:03');

-- --------------------------------------------------------

--
-- Table structure for table `loan_statuses`
--

CREATE TABLE `loan_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_types`
--

CREATE TABLE `loan_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interest_rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interest_duration` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interest_type_id` int(11) NOT NULL,
  `payment_frequency_id` int(11) NOT NULL,
  `repayment_period` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_fee` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `reduce_principal_early` tinyint(1) NOT NULL DEFAULT 0,
  `penalty_type_id` int(11) DEFAULT NULL,
  `penalty_value` double NOT NULL DEFAULT 0,
  `penalty_frequency_id` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loan_types`
--

INSERT INTO `loan_types` (`id`, `organization_id`, `name`, `description`, `active_status`, `interest_rate`, `interest_duration`, `interest_type_id`, `payment_frequency_id`, `repayment_period`, `service_fee`, `reduce_principal_early`, `penalty_type_id`, `penalty_value`, `penalty_frequency_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(3, 1, 'Car Loan', 'Short Description', NULL, '10', 'Year', 2, 2, '30', '3000', 0, 1, 12, 1, NULL, '2023-01-23 14:28:17', '2023-02-15 16:56:18'),
(4, 1, 'Housing', 'Short Desc', NULL, '10', 'Year', 1, 2, '30', '3000', 0, 1, 20000, 3, NULL, '2023-02-26 07:47:15', '2023-02-26 07:47:15'),
(5, 1, 'Premier Loan', 'Premier Promotion Loan', NULL, '10', 'Year', 2, 2, '72', '3000', 0, 1, 10, 3, NULL, '2023-05-08 16:53:45', '2023-05-25 17:27:25'),
(6, 1, 'Short Loan', 'Short Loan', NULL, '2', 'Month', 1, 2, '24', '3000', 0, 1, 20000, 1, NULL, '2023-05-25 17:30:01', '2023-05-25 17:30:01');

-- --------------------------------------------------------

--
-- Table structure for table `login_events`
--

CREATE TABLE `login_events` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_of_birth` date NOT NULL,
  `date_became_member` date NOT NULL,
  `nationality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `passport_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_images` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `membership_form` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kra_pin` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `employer_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `residence` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `income_bracket` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_of_kin` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_of_kin_relationship` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_of_kin_postal_address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_of_kin_phone_number` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `next_of_kin_email` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `user_id`, `date_of_birth`, `date_became_member`, `nationality`, `id_number`, `passport_number`, `status_id`, `passport_photo`, `extra_images`, `membership_form`, `kra_pin`, `employer_name`, `residence`, `income_bracket`, `bank_name`, `bank_branch`, `bank_account_number`, `next_of_kin`, `next_of_kin_relationship`, `next_of_kin_postal_address`, `next_of_kin_phone_number`, `next_of_kin_email`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`, `organization_id`, `branch_id`) VALUES
(2, 4, '2023-03-28', '2023-04-07', 'Africa', '1212121', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-20 17:24:04', '2023-03-20 17:24:04', 1, 1),
(3, 5, '1970-01-01', '2023-06-09', 'USA', '1212121w', NULL, NULL, NULL, NULL, NULL, 'A001122233V', 'Greck', 'Own', '0 - 50, 000', 'Equity', 'Nairobi', '1273283284632784', 'Dan Moore', 'son', NULL, '+254743282283', 'jrmoore@gmail.com', NULL, NULL, NULL, NULL, '2023-05-23 17:07:39', '2023-05-23 17:22:56', 1, 1),
(4, 6, '2023-05-27', '2023-05-01', 'Kenya', '12121213', NULL, NULL, NULL, NULL, NULL, 'A001122233V', 'Greck Corporation', 'Own', '50, 001 - 100, 000', 'Equity', 'Nairobi', '1273283284632784', 'Cecilia K', 'Mother', NULL, '+254743282283', 'cess@gmail.com', NULL, NULL, NULL, NULL, '2023-05-25 16:02:05', '2023-05-25 16:02:05', 1, 1),
(5, 10, '2023-06-10', '2023-06-08', 'Uganda', '121212133', NULL, NULL, NULL, NULL, NULL, 'A001122233V', 'Greck', 'Own', '0 - 50, 000', 'Equity', 'Nairobi', '1273283284632784', 'Dan Moore', 'son', NULL, '21635123', 'maaa@gmail.com', NULL, NULL, NULL, NULL, '2023-05-27 14:25:01', '2023-05-27 14:25:01', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_100000_create_password_resets_table', 1),
(2, '2016_01_28_203842_create_roles_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2017_10_12_000000_create_users_table', 1),
(9, '2018_01_28_203941_create_permissions_table', 1),
(10, '2018_01_28_205009_create_permission_role_table', 1),
(11, '2018_10_20_083334_create_borrowers_table', 1),
(12, '2018_10_20_084510_create_loans_table', 1),
(13, '2018_10_20_084547_create_loan_types_table', 1),
(14, '2018_10_20_084612_create_loan_applications_table', 1),
(15, '2018_10_20_084658_create_loan_statuses_table', 1),
(16, '2018_10_26_183101_create_branches_table', 1),
(17, '2018_10_27_063728_create_employees_table', 1),
(18, '2018_10_27_074325_create_members_table', 1),
(19, '2018_10_27_075145_create_guarantors_table', 1),
(20, '2018_10_27_093105_create_loan_application_statuses', 1),
(21, '2018_10_27_093311_create_borrower_statuses', 1),
(22, '2018_12_16_080354_create_payments_table', 1),
(23, '2018_12_16_080924_create_payment_methods_table', 1),
(24, '2019_06_03_075434_create_organizations_table', 1),
(25, '2019_07_11_043622_create_witness_types_table', 1),
(26, '2019_07_11_172040_create_assets_table', 1),
(27, '2019_07_11_172126_create_asset_photos_table', 1),
(28, '2019_08_02_071815_create_accounts_table', 1),
(29, '2019_08_02_073517_create_account_types_table', 1),
(30, '2019_08_02_073538_create_account_statuses_table', 1),
(31, '2019_08_02_080108_create_account_members_table', 1),
(32, '2019_08_02_084559_create_email_settings_table', 1),
(33, '2019_08_07_054817_create_interest_types_table', 1),
(34, '2019_08_19_000000_create_failed_jobs_table', 1),
(35, '2019_08_27_125333_create_expenses_table', 1),
(36, '2019_08_27_125430_create_expense_categories_table', 1),
(37, '2019_08_27_135912_create_fiscal_periods_table', 1),
(38, '2019_08_28_114622_create_account_classes_table', 1),
(39, '2019_08_28_114921_create_transaction_types_table', 1),
(40, '2019_08_28_115129_create_transactions_table', 1),
(41, '2019_08_28_115417_create_journals_table', 1),
(42, '2019_09_01_131452_create_asset_loan_applications', 1),
(43, '2019_09_08_223026_create_payment_frequencies_table', 1),
(44, '2019_09_21_104607_create_loan_penalties_table', 1),
(45, '2019_09_26_141020_create_login_events_table', 1),
(46, '2019_09_27_011135_create_failed_logins_table', 1),
(47, '2019_10_11_232646_create_report_types_table', 1),
(48, '2019_10_15_122250_create_finance_statements_table', 1),
(49, '2019_10_20_211845_create_account_ledgers_table', 1),
(50, '2019_10_27_134345_create_sms_settings_table', 1),
(51, '2019_11_02_202439_create_capitals_table', 1),
(52, '2019_11_02_212357_create_email_templates_table', 1),
(53, '2019_11_02_212427_create_sms_templates_table', 1),
(54, '2019_11_10_152623_create_penalty_types_table', 1),
(55, '2019_11_10_152724_create_penalty_frequencies_table', 1),
(56, '2019_11_22_022334_create_notifications_table', 1),
(57, '2019_11_24_173404_create_communication_settings_table', 1),
(58, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(59, '2019_12_15_120648_create_jobs_table', 1),
(60, '2020_01_22_180950_create_table_withdrawals', 1),
(61, '2020_01_24_090056_create_table_mpesa_bulk_payments', 1),
(62, '2020_01_24_231725_create_mpesa_custom_sends_table', 1),
(63, '2020_01_31_101250_create_mpesa_scheduled_disbursements_table', 1),
(64, '2022_09_19_131105_create_leads_table', 1),
(65, '2023_02_09_182746_create_loan_payments_table', 2),
(66, '2023_05_08_192128_create_loan_statements_table', 3),
(67, '2023_05_26_191928_create_role_permissions_table', 4),
(68, '2023_05_27_181621_create_loan_approvers_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `mpesa_bulk_payments`
--

CREATE TABLE `mpesa_bulk_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `transaction_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_receipt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `b2C_recipientIs_registered_customer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `b2C_charges_paid_account_available_funds` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver_party_public_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_completed_date_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `b2C_utility_account_available_funds` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `b2C_working_account_available_funds` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mpesa_custom_sends`
--

CREATE TABLE `mpesa_custom_sends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` date DEFAULT NULL,
  `trans_id` date DEFAULT NULL,
  `trans_time` date DEFAULT NULL,
  `business_short_code` date DEFAULT NULL,
  `bill_ref_number` date DEFAULT NULL,
  `invoice_number` date DEFAULT NULL,
  `phone_number` date DEFAULT NULL,
  `first_name` date DEFAULT NULL,
  `middle_name` date DEFAULT NULL,
  `last_name` date DEFAULT NULL,
  `org_account_balance` date DEFAULT NULL,
  `third_party_trans_id` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mpesa_scheduled_disbursements`
--

CREATE TABLE `mpesa_scheduled_disbursements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `business_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `physical_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `county` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount_thousand_separator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount_decimal_separator` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount_decimal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `business_name`, `business_type`, `email`, `currency`, `phone`, `alternate_phone`, `physical_address`, `postal_address`, `postal_code`, `logo`, `county`, `country`, `city`, `favicon`, `date_format`, `about`, `amount_thousand_separator`, `amount_decimal_separator`, `amount_decimal`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Smart Sacco', 'Sacco', 'smart@gmail.com', NULL, '0712345678', NULL, 'Nairobi', '925', NULL, NULL, 'Nairobi', 'USA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-19 05:54:30', '2023-01-19 05:54:30');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `member_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_date` date NOT NULL,
  `receipt_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `is_mpesa` tinyint(1) DEFAULT NULL,
  `transaction_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trans_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trans_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_short_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bill_ref_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `org_account_balance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `third_party_trans_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `organization_id`, `branch_id`, `member_id`, `amount`, `method_id`, `transaction_id`, `payment_date`, `receipt_number`, `attachment`, `notes`, `cheque_number`, `bank_name`, `bank_branch`, `cheque_date`, `is_mpesa`, `transaction_type`, `trans_id`, `trans_time`, `business_short_code`, `bill_ref_number`, `invoice_number`, `mpesa_number`, `mpesa_first_name`, `mpesa_middle_name`, `mpesa_last_name`, `org_account_balance`, `third_party_trans_id`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2', '12000', 'CASH', NULL, '2023-03-24', 'RT0001', NULL, 'Paid', NULL, NULL, NULL, '1970-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-21 13:39:43', '2023-03-21 13:39:43');

-- --------------------------------------------------------

--
-- Table structure for table `payment_frequencies`
--

CREATE TABLE `payment_frequencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_frequencies`
--

INSERT INTO `payment_frequencies` (`id`, `organization_id`, `name`, `display_name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 0, 'weekly', 'Weekly', 'Weekly Repayment', NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54'),
(2, 0, 'monthly', 'Monthly', 'Monthly Repayment', NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54'),
(3, 0, 'daily', 'Daily', 'Everyday Repayment', NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54'),
(4, 0, 'one_time', 'One Time', 'Single Fixed Repayment', NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `organization_id`, `name`, `display_name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 0, 'BANK', 'BANK', 'BANK Payment system.', NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54'),
(2, 0, 'CASH', 'CASH', 'CASH Payment system.', NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54');

-- --------------------------------------------------------

--
-- Table structure for table `penalty_frequencies`
--

CREATE TABLE `penalty_frequencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penalty_frequencies`
--

INSERT INTO `penalty_frequencies` (`id`, `organization_id`, `name`, `display_name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 0, 'daily', 'Daily', 'Everyday Repayment', NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54'),
(2, 0, 'weekly', 'Weekly', 'Weekly Repayment', NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54'),
(3, 0, 'monthly', 'Monthly', 'Monthly Repayment', NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54'),
(4, 0, 'one_time', 'One Time', 'Single Fixed Repayment', NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54');

-- --------------------------------------------------------

--
-- Table structure for table `penalty_types`
--

CREATE TABLE `penalty_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `penalty_types`
--

INSERT INTO `penalty_types` (`id`, `organization_id`, `name`, `display_name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 0, 'principal_due_percentage', '% on Due Principal', 'Due Principal Percentage', NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54'),
(2, 0, 'principal_plus_interest_due_percentage', '% on Due Principal + Due Interest', 'Percentage on due principal plus due interest', NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54'),
(3, 0, 'fixed_value', 'Fixed Value', 'Fixed Value', NULL, '2022-06-09 22:06:54', '2022-06-09 22:06:54');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `organization_id`, `name`, `display_name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 0, 'Expense-View', 'Expense View', 'Expense View', NULL, NULL, NULL),
(2, 0, 'Expense-Add', 'Expense Add', 'Expense Add', NULL, NULL, NULL),
(3, 0, 'Expense-Edit', 'Expense Edit', 'Expense Edit', NULL, NULL, NULL),
(4, 0, 'Expense-Delete', 'Expense Delete', 'Expense Delete', NULL, NULL, NULL),
(5, 0, 'Users-View', 'Users View', 'Users View', NULL, NULL, NULL),
(6, 0, 'Users-Add', 'Users Add', 'Users Add', NULL, NULL, NULL),
(7, 0, 'Users-Edit', 'Users Edit', 'Users Edit', NULL, NULL, NULL),
(8, 0, 'Users-Delete', 'Users Delete', 'Users Delete', NULL, NULL, NULL),
(9, 0, 'Roles-View', 'Roles View', 'Roles View', NULL, NULL, NULL),
(10, 0, 'Roles-Add', 'Roles Add', 'Roles Add', NULL, NULL, NULL),
(11, 0, 'Roles-Edit', 'Roles Edit', 'Roles Edit', NULL, NULL, NULL),
(12, 0, 'Roles-Delete', 'Roles Delete', 'Roles Delete', NULL, NULL, NULL),
(13, 0, 'Branches-View', 'Branches View', 'Branches View', NULL, NULL, NULL),
(14, 0, 'Branches-Add', 'Branches Add', 'Branches Add', NULL, NULL, NULL),
(15, 0, 'Branches-Edit', 'Branches Edit', 'Branches Edit', NULL, NULL, NULL),
(16, 0, 'Branches-Delete', 'Branches Delete', 'Branches Delete', NULL, NULL, NULL),
(17, 0, 'Members-View', 'Members View', 'Members View', NULL, NULL, NULL),
(18, 0, 'Members-Add', 'Members Add', 'Members Add', NULL, NULL, NULL),
(19, 0, 'Members-Edit', 'Members Edit', 'Members Edit', NULL, NULL, NULL),
(20, 0, 'Members-Delete', 'Members Delete', 'Members Delete', NULL, NULL, NULL),
(21, 0, 'Leads-View', 'Leads View', 'Leads View', NULL, NULL, NULL),
(22, 0, 'Leads-Add', 'Leads Add', 'Leads Add', NULL, NULL, NULL),
(23, 0, 'Leads-Edit', 'Leads Edit', 'Leads Edit', NULL, NULL, NULL),
(24, 0, 'Leads-Delete', 'Leads Delete', 'Leads Delete', NULL, NULL, NULL),
(25, 0, 'Applications-View', 'Applications View', 'Applications View', NULL, NULL, NULL),
(26, 0, 'Applications-Add', 'Applications Add', 'Applications Add', NULL, NULL, NULL),
(27, 0, 'Applications-Edit', 'Applications Edit', 'Applications Edit', NULL, NULL, NULL),
(28, 0, 'Applications-Delete', 'Applications Delete', 'Applications Delete', NULL, NULL, NULL),
(29, 0, 'Loans-View', 'Loans View', 'Loans View', NULL, NULL, NULL),
(30, 0, 'Loans-Add', 'Loans Add', 'Loans Add', NULL, NULL, NULL),
(31, 0, 'Loans-Edit', 'Loans Edit', 'Loans Edit', NULL, NULL, NULL),
(32, 0, 'Loans-Delete', 'Loans Delete', 'Loans Delete', NULL, NULL, NULL),
(33, 0, 'Deposits-View', 'Deposits View', 'Deposits View', NULL, NULL, NULL),
(34, 0, 'Deposits-Add', 'Deposits Add', 'Deposits Add', NULL, NULL, NULL),
(35, 0, 'Deposits-Edit', 'Deposits Edit', 'Deposits Edit', NULL, NULL, NULL),
(36, 0, 'Deposits-Delete', 'Deposits Delete', 'Deposits Delete', NULL, NULL, NULL),
(37, 0, 'LoanTypes-View', 'LoanTypes View', 'LoanTypes View', NULL, NULL, NULL),
(38, 0, 'LoanTypes-Add', 'LoanTypes Add', 'LoanTypes Add', NULL, NULL, NULL),
(39, 0, 'LoanTypes-Edit', 'LoanTypes Edit', 'LoanTypes Edit', NULL, NULL, NULL),
(40, 0, 'LoanTypes-Delete', 'LoanTypes Delete', 'LoanTypes Delete', NULL, NULL, NULL),
(41, 0, 'Accounts-View', 'Accounts View', 'Accounts View', NULL, NULL, NULL),
(42, 0, 'Accounts-Add', 'Accounts Add', 'Accounts Add', NULL, NULL, NULL),
(43, 0, 'Accounts-Edit', 'Accounts Edit', 'Accounts Edit', NULL, NULL, NULL),
(44, 0, 'Accounts-Delete', 'Accounts Delete', 'Accounts Delete', NULL, NULL, NULL),
(45, 0, 'WitnessTypes-View', 'WitnessTypes View', 'WitnessTypes View', NULL, NULL, NULL),
(46, 0, 'WitnessTypes-Add', 'WitnessTypes Add', 'WitnessTypes Add', NULL, NULL, NULL),
(47, 0, 'WitnessTypes-Edit', 'WitnessTypes Edit', 'WitnessTypes Edit', NULL, NULL, NULL),
(48, 0, 'WitnessTypes-Delete', 'WitnessTypes Delete', 'WitnessTypes Delete', NULL, NULL, NULL),
(49, 0, 'LoansSettings-View', 'LoansSettings View', 'LoansSettings View', NULL, NULL, NULL),
(50, 0, 'LoansSettings-Add', 'LoansSettings Add', 'LoansSettings Add', NULL, NULL, NULL),
(51, 0, 'LoansSettings-Edit', 'LoansSettings Edit', 'LoansSettings Edit', NULL, NULL, NULL),
(52, 0, 'LoansSettings-Delete', 'LoansSettings Delete', 'LoansSettings Delete', NULL, NULL, NULL),
(53, 0, 'Capital-View', 'Capital View', 'Capital View', NULL, NULL, NULL),
(54, 0, 'Capital-Add', 'Capital Add', 'Capital Add', NULL, NULL, NULL),
(55, 0, 'Capital-Edit', 'Capital Edit', 'Capital Edit', NULL, NULL, NULL),
(56, 0, 'Capital-Delete', 'Capital Delete', 'Capital Delete', NULL, NULL, NULL),
(57, 0, 'Reports-View', 'Reports View', 'Reports View', NULL, NULL, NULL),
(58, 0, 'Approve-Loans', 'Approve Loans', 'Approve Loans', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_types`
--

CREATE TABLE `report_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `organization_id`, `name`, `display_name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 0, 'SuperAdmin', 'Admin', 'site admin', NULL, NULL, NULL),
(2, 1, 'Admin', 'Admin', 'Admin', NULL, '2023-01-19 05:54:30', '2023-01-19 05:54:30'),
(3, 1, 'Staff', 'New Role', NULL, NULL, '2023-05-26 16:31:38', '2023-06-07 16:49:22');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '2023-05-26 16:29:27', '2023-05-26 16:29:27'),
(2, 2, 6, '2023-05-26 16:29:27', '2023-05-26 16:29:27'),
(3, 2, 10, '2023-05-26 16:29:27', '2023-05-26 16:29:27'),
(4, 2, 18, '2023-05-26 16:29:27', '2023-05-26 16:29:27'),
(5, 3, 2, '2023-05-26 16:31:38', '2023-05-26 16:31:38'),
(6, 3, 6, '2023-05-26 16:31:38', '2023-05-26 16:31:38'),
(7, 3, 5, '2023-05-26 16:31:53', '2023-05-26 16:31:53'),
(8, 3, 6, '2023-05-26 16:31:53', '2023-05-26 16:31:53'),
(9, 3, 58, '2023-05-26 16:31:53', '2023-05-26 16:31:53'),
(10, 2, 1, '2023-05-27 14:22:55', '2023-05-27 14:22:55'),
(11, 2, 2, '2023-05-27 14:22:55', '2023-05-27 14:22:55'),
(12, 2, 3, '2023-05-27 14:22:55', '2023-05-27 14:22:55'),
(13, 2, 4, '2023-05-27 14:22:56', '2023-05-27 14:22:56'),
(14, 2, 58, '2023-05-27 14:22:56', '2023-05-27 14:22:56'),
(15, 3, 5, '2023-06-07 16:49:22', '2023-06-07 16:49:22'),
(16, 3, 6, '2023-06-07 16:49:22', '2023-06-07 16:49:22'),
(17, 3, 7, '2023-06-07 16:49:22', '2023-06-07 16:49:22'),
(18, 3, 8, '2023-06-07 16:49:22', '2023-06-07 16:49:22'),
(19, 3, 9, '2023-06-07 16:49:22', '2023-06-07 16:49:22');

-- --------------------------------------------------------

--
-- Table structure for table `sms_settings`
--

CREATE TABLE `sms_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `fiscal_period_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loan_id` int(11) NOT NULL,
  `payment_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_date` date NOT NULL,
  `loan_interest_repayments_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loan_principal_repayments_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `loan_penalties_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_type` enum('interest_payment','principal_payment','penalty_payment','penalty_waiver','balance_reduction') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_types`
--

CREATE TABLE `transaction_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL DEFAULT 0,
  `branch_id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `physical_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(11) NOT NULL DEFAULT 0,
  `user_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'member',
  `employee_id` int(11) DEFAULT NULL,
  `phone` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `confirmation_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `organization_id`, `branch_id`, `first_name`, `middle_name`, `last_name`, `photo`, `postal_code`, `postal_address`, `physical_address`, `city`, `country`, `role_id`, `user_type`, `employee_id`, `phone`, `email`, `password`, `confirmed`, `confirmation_code`, `created_by`, `updated_by`, `deleted_by`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 0, 0, 'Admin', NULL, 'Admin', NULL, NULL, NULL, NULL, NULL, 'Kenya', 1, 'admin', NULL, NULL, 'admin@admin.com', '$2y$10$qrGxMtESxURS3NZoDd9Y9eNpb0nOeK/oLNqdn0AbjgIaK.xJTBKmO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 1, 'System', 'Admin', 'Admin', NULL, NULL, '925', 'Nairobi', NULL, 'Kenya', 2, 'admin', 1, '0712345678', 'smart@gmail.com', '$2y$10$oBm/XWPCa9GjxxbJFcB7r.Y/QbnDzzLy71krYui/jMGkOSIH.WP62', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-19 05:54:30', '2023-05-26 17:18:46'),
(4, 1, 1, 'Joseph', NULL, 'Mwangi', NULL, NULL, '2345', NULL, 'Nairobi', 'Kenya', 0, 'member', NULL, '+254743282283', 'josephmwangi.jgm@gmail.com', '$2y$10$A4a0KKcKdbHT6ebz0IJeD.hqq2YmBxwOrqgYLARdzjJqfOD4IskgO', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-20 17:24:04', '2023-03-20 17:24:04'),
(5, 1, 1, 'Joseph', NULL, 'Moore', NULL, NULL, '20106', NULL, 'Nakuru', 'Kenya', 0, 'member', NULL, '+2547432822833', 'moore@gmail.com', '$2y$10$Sk.qbE7rOIuvGDu7VmlcI.TqOx54pBzDQjrfrNVENkLKRaI832eKW', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-23 17:07:39', '2023-05-23 17:07:39'),
(6, 1, 1, 'Lilian', NULL, 'Maina', NULL, NULL, '20106', NULL, 'Eldoret', 'Kenya', 0, 'member', NULL, '+254743282286', 'maina@gmail.com', '$2y$10$xu9HsLlkvUMPybdM.LtQQezb1wCeP9OaGJHRdxrh.LuabQ60oeADe', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-25 16:02:05', '2023-05-25 16:02:05'),
(8, 1, 1, 'Joe', NULL, 'Mwangi', NULL, NULL, NULL, NULL, NULL, NULL, 3, 'user', NULL, '+254743282285', 'jmwangig10@gmail.com', '$2y$10$FbV5YLoHfHo/G28zr3kEvesIRUJadls2/nXgEUgQ7FVXURuGksVTC', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-26 17:21:31', '2023-05-26 17:24:16'),
(9, 1, 1, 'Jack', NULL, 'Maa', NULL, NULL, NULL, NULL, NULL, NULL, 3, 'user', NULL, '+2547432822833', 'maa@gmail.com', '$2y$10$J/u9uQUb3RJ1SnJ08QJ/Wu5vXKfkLxwevItozA68TTr70TkdG10um', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-27 14:22:27', '2023-05-27 14:22:27'),
(10, 1, 1, 'Davvy', NULL, 'Mains', NULL, NULL, '20106', NULL, '925 molo', NULL, 0, 'member', NULL, '+254743282280', 'main@gmail.com', '$2y$10$BoUnYM1Icmr8dEIWGJHfs.RgxeH0hRO4YkRiUy3VIwgMUnAPSgY6a', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-05-27 14:25:01', '2023-05-27 14:25:01'),
(11, 1, 1, 'Dan', NULL, 'DV', NULL, NULL, NULL, NULL, NULL, NULL, 3, 'user', NULL, '+254743282285', 'dv@gmail.com', '$2y$10$UdHp2aUWfWuCJ89kWqc45eIujzvf4nW06S7F3UPMd/B.6H/Aer3UO', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-07 16:48:56', '2023-06-07 16:48:56');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `withdrawal_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `withdrawal_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `withdrawal_charges` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance_before_withdrawal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance_after_withdrawal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mpesa_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_branch` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_date` date DEFAULT NULL,
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdrawals`
--

INSERT INTO `withdrawals` (`id`, `organization_id`, `branch_id`, `member_id`, `amount`, `withdrawal_date`, `method_id`, `withdrawal_number`, `withdrawal_charges`, `balance_before_withdrawal`, `balance_after_withdrawal`, `status`, `mpesa_number`, `first_name`, `last_name`, `cheque_number`, `bank_name`, `bank_branch`, `cheque_date`, `created_by`, `updated_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, '85000', '2023-03-24 00:00:00', 'CASH', 'WT0001', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-21 13:44:51', '2023-03-21 13:44:51');

-- --------------------------------------------------------

--
-- Table structure for table `witness_types`
--

CREATE TABLE `witness_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `witness_types`
--

INSERT INTO `witness_types` (`id`, `organization_id`, `name`, `display_name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Parent', 'Parent', 'Parent witness type', NULL, '2023-01-25 15:06:34', '2023-01-25 15:06:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_account_number_unique` (`account_number`);

--
-- Indexes for table `account_classes`
--
ALTER TABLE `account_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_ledgers`
--
ALTER TABLE `account_ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_members`
--
ALTER TABLE `account_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `account_statuses`
--
ALTER TABLE `account_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_statuses_name_unique` (`name`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_types_name_unique` (`name`),
  ADD UNIQUE KEY `account_types_code_unique` (`code`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `assets_asset_number_unique` (`asset_number`);

--
-- Indexes for table `asset_loan_applications`
--
ALTER TABLE `asset_loan_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asset_photos`
--
ALTER TABLE `asset_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `borrowers`
--
ALTER TABLE `borrowers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `borrower_statuses`
--
ALTER TABLE `borrower_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `borrower_statuses_name_unique` (`name`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `capitals`
--
ALTER TABLE `capitals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `communication_settings`
--
ALTER TABLE `communication_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_settings`
--
ALTER TABLE `email_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employees_employee_number_unique` (`employee_number`),
  ADD UNIQUE KEY `employees_email_unique` (`email`),
  ADD UNIQUE KEY `employees_birth_day_unique` (`birth_day`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `failed_logins`
--
ALTER TABLE `failed_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `failed_logins_id_index` (`id`);

--
-- Indexes for table `finance_statements`
--
ALTER TABLE `finance_statements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `finance_statements_name_unique` (`name`),
  ADD UNIQUE KEY `finance_statements_display_name_unique` (`display_name`);

--
-- Indexes for table `fiscal_periods`
--
ALTER TABLE `fiscal_periods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guarantors`
--
ALTER TABLE `guarantors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interest_types`
--
ALTER TABLE `interest_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `interest_types_name_unique` (`name`),
  ADD UNIQUE KEY `interest_types_display_name_unique` (`display_name`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `journals`
--
ALTER TABLE `journals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `leads_id_number_unique` (`id_number`),
  ADD UNIQUE KEY `leads_passport_number_unique` (`passport_number`),
  ADD UNIQUE KEY `leads_phone_unique` (`phone`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `loans_loan_application_id_unique` (`loan_application_id`);

--
-- Indexes for table `loan_applications`
--
ALTER TABLE `loan_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_application_statuses`
--
ALTER TABLE `loan_application_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `loan_application_statuses_name_unique` (`name`);

--
-- Indexes for table `loan_approvers`
--
ALTER TABLE `loan_approvers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_payments`
--
ALTER TABLE `loan_payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `loan_payments_trans_id_unique` (`trans_id`);

--
-- Indexes for table `loan_penalties`
--
ALTER TABLE `loan_penalties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_statements`
--
ALTER TABLE `loan_statements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_statuses`
--
ALTER TABLE `loan_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `loan_statuses_name_unique` (`name`);

--
-- Indexes for table `loan_types`
--
ALTER TABLE `loan_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_events`
--
ALTER TABLE `login_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `login_events_id_index` (`id`),
  ADD KEY `login_events_user_id_index` (`user_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `members_id_number_unique` (`id_number`),
  ADD UNIQUE KEY `members_passport_number_unique` (`passport_number`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mpesa_bulk_payments`
--
ALTER TABLE `mpesa_bulk_payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mpesa_bulk_payments_transaction_receipt_unique` (`transaction_receipt`);

--
-- Indexes for table `mpesa_custom_sends`
--
ALTER TABLE `mpesa_custom_sends`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mpesa_custom_sends_amount_unique` (`amount`),
  ADD UNIQUE KEY `mpesa_custom_sends_description_unique` (`description`),
  ADD UNIQUE KEY `mpesa_custom_sends_trans_id_unique` (`trans_id`);

--
-- Indexes for table `mpesa_scheduled_disbursements`
--
ALTER TABLE `mpesa_scheduled_disbursements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `organizations_email_unique` (`email`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payments_trans_id_unique` (`trans_id`);

--
-- Indexes for table `payment_frequencies`
--
ALTER TABLE `payment_frequencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_frequencies_name_unique` (`name`),
  ADD UNIQUE KEY `payment_frequencies_display_name_unique` (`display_name`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payment_methods_name_unique` (`name`),
  ADD UNIQUE KEY `payment_methods_display_name_unique` (`display_name`);

--
-- Indexes for table `penalty_frequencies`
--
ALTER TABLE `penalty_frequencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `penalty_frequencies_name_unique` (`name`),
  ADD UNIQUE KEY `penalty_frequencies_display_name_unique` (`display_name`);

--
-- Indexes for table `penalty_types`
--
ALTER TABLE `penalty_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `penalty_types_name_unique` (`name`),
  ADD UNIQUE KEY `penalty_types_display_name_unique` (`display_name`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`),
  ADD UNIQUE KEY `permissions_display_name_unique` (`display_name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `report_types`
--
ALTER TABLE `report_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `report_types_name_unique` (`name`),
  ADD UNIQUE KEY `report_types_display_name_unique` (`display_name`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_settings`
--
ALTER TABLE `sms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_types`
--
ALTER TABLE `transaction_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `witness_types`
--
ALTER TABLE `witness_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `account_classes`
--
ALTER TABLE `account_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `account_ledgers`
--
ALTER TABLE `account_ledgers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_members`
--
ALTER TABLE `account_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_statuses`
--
ALTER TABLE `account_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `asset_loan_applications`
--
ALTER TABLE `asset_loan_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `asset_photos`
--
ALTER TABLE `asset_photos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `borrowers`
--
ALTER TABLE `borrowers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `borrower_statuses`
--
ALTER TABLE `borrower_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `capitals`
--
ALTER TABLE `capitals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `communication_settings`
--
ALTER TABLE `communication_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_settings`
--
ALTER TABLE `email_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_logins`
--
ALTER TABLE `failed_logins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `finance_statements`
--
ALTER TABLE `finance_statements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fiscal_periods`
--
ALTER TABLE `fiscal_periods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guarantors`
--
ALTER TABLE `guarantors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `interest_types`
--
ALTER TABLE `interest_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journals`
--
ALTER TABLE `journals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `loan_applications`
--
ALTER TABLE `loan_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `loan_application_statuses`
--
ALTER TABLE `loan_application_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_approvers`
--
ALTER TABLE `loan_approvers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_payments`
--
ALTER TABLE `loan_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `loan_penalties`
--
ALTER TABLE `loan_penalties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_statements`
--
ALTER TABLE `loan_statements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=437;

--
-- AUTO_INCREMENT for table `loan_statuses`
--
ALTER TABLE `loan_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_types`
--
ALTER TABLE `loan_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `login_events`
--
ALTER TABLE `login_events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `mpesa_bulk_payments`
--
ALTER TABLE `mpesa_bulk_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mpesa_custom_sends`
--
ALTER TABLE `mpesa_custom_sends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mpesa_scheduled_disbursements`
--
ALTER TABLE `mpesa_scheduled_disbursements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_frequencies`
--
ALTER TABLE `payment_frequencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `penalty_frequencies`
--
ALTER TABLE `penalty_frequencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `penalty_types`
--
ALTER TABLE `penalty_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_types`
--
ALTER TABLE `report_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `sms_settings`
--
ALTER TABLE `sms_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_templates`
--
ALTER TABLE `sms_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_types`
--
ALTER TABLE `transaction_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `witness_types`
--
ALTER TABLE `witness_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 07, 2022 at 06:48 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `adminname` varchar(255) NOT NULL,
  `adminpassword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`adminname`, `adminpassword`) VALUES
('sammi', 'sammi');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_id` int(10) UNSIGNED NOT NULL,
  `commentable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `parent_id`, `body`, `commentable_id`, `commentable_type`, `created_at`, `updated_at`) VALUES
(4, 1, 3, 'Very Nice', 32, 'App\\Models\\Post', '2022-06-19 13:46:46', '2022-06-19 13:46:46'),
(11, 6, 6, 'OK', 32, 'App\\Models\\Post', '2022-06-21 06:17:06', '2022-06-21 06:17:06'),
(17, 1, 16, 'Good Comment', 32, 'App\\Models\\Post', '2022-06-23 02:55:29', '2022-06-23 02:55:29'),
(18, 1, 16, 'Accha', 32, 'App\\Models\\Post', '2022-06-23 03:08:23', '2022-06-23 03:08:23'),
(19, 1, 16, 'asda', 32, 'App\\Models\\Post', '2022-06-23 03:09:55', '2022-06-23 03:09:55'),
(20, 1, NULL, 'Another Comment', 32, 'App\\Models\\Post', '2022-06-23 03:26:03', '2022-06-23 03:26:03'),
(21, 1, 20, 'Nice Comment', 32, 'App\\Models\\Post', '2022-06-23 05:02:14', '2022-06-23 05:02:14'),
(23, 1, NULL, 'Nice Post', 27, 'App\\Models\\Post', '2022-06-23 22:48:18', '2022-06-23 22:48:18'),
(26, 7, NULL, 'ASBdakls', 22, 'App\\Models\\Post', '2022-06-24 06:29:16', '2022-06-24 06:29:16'),
(27, 7, 26, 'jvdwad', 22, 'App\\Models\\Post', '2022-06-24 06:29:33', '2022-06-24 06:29:33'),
(28, 8, NULL, 'Thanks for sharing such information :)', 34, 'App\\Models\\Post', '2022-07-07 11:45:11', '2022-07-07 11:45:11');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `contactname` varchar(255) NOT NULL,
  `contactemail` varchar(255) NOT NULL,
  `contactsubject` varchar(255) NOT NULL,
  `contactmessage` varchar(255) NOT NULL,
  `updated_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `created_at` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`contactname`, `contactemail`, `contactsubject`, `contactmessage`, `updated_at`, `created_at`) VALUES
('Ghulam Mohiuddin', 'gmd2171@gmail.com', 'Do you love Pakistan?', 'Yes, I love Pakistan', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
('Hadi', 'ghulammohiuddin2171@gmail.com', 'aaaaaa', 'aaaaaaaa', '2022-06-23 19:16:57.000000', '2022-06-23 19:16:57.000000'),
('GMD', 'gmd026@gmail.com', 'Welcome to Pakistan', 'Hey, I wanna say that we are Muslims.', '2022-06-23 19:19:46.000000', '2022-06-23 19:19:46.000000'),
('Danyal', 'danyal20@gmail.com', 'room 207', 'Welcome to the room', '2022-06-23 19:21:58.000000', '2022-06-23 19:21:58.000000'),
('Asfand Waqar Ali', 'asfand15@gmail.com', 'Hi', 'I am Asfand', '2022-06-23 19:36:35.000000', '2022-06-23 19:36:35.000000'),
('abc', 'abc@gmail.com', 'aa', 'a', '2022-06-23 19:40:42.000000', '2022-06-23 19:40:42.000000'),
('Hadi', 'ghulammohiuddin2171@gmail.com', 'aaa', 'a', '2022-06-23 19:41:33.000000', '2022-06-23 19:41:33.000000'),
('Asfand Waqar Ali', 'ghulammohiuddin2171@gmail.com', 'Pain', 'de', '2022-06-23 19:42:48.000000', '2022-06-23 19:42:48.000000'),
('Asfand Waqar Ali', 'ghulammohiuddin2171@gmail.com', 'pain', 'by seeing this, my eyes got cancer..', '2022-06-23 19:43:27.000000', '2022-06-23 19:43:27.000000'),
('abc', 'ghulammohiuddin2171@gmail.com', 'aaaa', 'nn', '2022-06-23 19:47:52.000000', '2022-06-23 19:47:52.000000'),
('Hadi', 'ghulammohiuddin2171@gmail.com', 'Pain', 'd', '2022-06-23 19:53:32.000000', '2022-06-23 19:53:32.000000'),
('Hadi', 'ghulammohiuddin2171@gmail.com', 'ss', 's', '2022-06-23 19:56:08.000000', '2022-06-23 19:56:08.000000'),
('Hadi', 'ghulammohiuddin2171@gmail.com', 'd', 'd', '2022-06-23 19:59:39.000000', '2022-06-23 19:59:39.000000'),
('aa', 'ghulammohiuddin2171@gmail.com', 's', 's', '2022-06-23 20:01:48.000000', '2022-06-23 20:01:48.000000'),
('aa', 'ghulammohiuddin2171@gmail.com', 'a', 'a', '2022-06-23 20:02:39.000000', '2022-06-23 20:02:39.000000'),
('dmaslk', 'sami@gmail.com', 'akls', 'sakkf', '2022-06-24 02:16:01.000000', '2022-06-24 02:16:01.000000'),
('sada', 'test@gmail.com', 'sad', 'sadd', '2022-06-24 02:21:11.000000', '2022-06-24 02:21:11.000000'),
('Ghulam Mohiuddin', 'gmd@gmail.com', 'asdf', 'dsffsdf', '2022-06-24 02:24:30.000000', '2022-06-24 02:24:30.000000'),
('Ghulam Mohiuddin', 'gmd@gmail.com', 'asdf', 'dsffsdf', '2022-06-24 02:25:13.000000', '2022-06-24 02:25:13.000000'),
('Ghulam Mohiuddin', 'gmd@gmail.com', 'asdf', 'dsffsdf', '2022-06-24 02:25:45.000000', '2022-06-24 02:25:45.000000'),
('Ghulam Mohiuddin', 'gmd@gmail.com', 'asdf', 'dsffsdf', '2022-06-24 02:26:40.000000', '2022-06-24 02:26:40.000000'),
('Ghulam Mohiuddin', 'gmd@gmail.com', 'asdf', 'dsffsdf', '2022-06-24 02:27:16.000000', '2022-06-24 02:27:16.000000'),
('Ghulam Mohiuddin', 'gmd@gmail.com', 'asdf', 'dsffsdf', '2022-06-24 02:27:30.000000', '2022-06-24 02:27:30.000000'),
('Sammi', 's@gm.com', 'asd', 'fas', '2022-06-24 02:29:03.000000', '2022-06-24 02:29:03.000000');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `like_dislikes`
--

CREATE TABLE `like_dislikes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` int(11) NOT NULL,
  `like` smallint(6) NOT NULL DEFAULT 0,
  `dislike` smallint(6) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `like_dislikes`
--

INSERT INTO `like_dislikes` (`id`, `post_id`, `like`, `dislike`, `created_at`, `updated_at`) VALUES
(1, 27, 1, 0, '2022-06-23 22:43:30', '2022-06-23 22:43:30'),
(2, 27, 0, 1, '2022-06-23 22:43:37', '2022-06-23 22:43:37'),
(3, 27, 0, 1, '2022-06-23 22:47:47', '2022-06-23 22:47:47'),
(4, 27, 1, 0, '2022-06-23 22:47:50', '2022-06-23 22:47:50'),
(5, 27, 1, 0, '2022-06-24 00:42:08', '2022-06-24 00:42:08'),
(6, 27, 1, 0, '2022-06-24 01:43:04', '2022-06-24 01:43:04'),
(7, 27, 1, 0, '2022-06-24 02:44:23', '2022-06-24 02:44:23'),
(8, 22, 1, 0, '2022-06-24 06:29:10', '2022-06-24 06:29:10'),
(9, 34, 1, 0, '2022-07-07 11:44:52', '2022-07-07 11:44:52');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_06_12_133631_create_posts_table', 1),
(6, '2022_06_13_103447_add_user_id_to_posts', 2),
(7, '2022_06_14_024137_add_cover_image_to_posts', 3),
(8, '2022_06_19_174057_create_comments_table', 4),
(9, '2022_06_24_025353_create_like_dislikes_table', 5),
(10, '2022_06_24_030853_create_like_dislike_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('sammigul11005@gmail.com', '$2y$10$68usIYHbcE/9Z/hKOt.BZegqXchI27/SKE6fA5dGcde5B4RdblBBy', '2022-06-17 02:24:31');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `cover_image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `body`, `created_at`, `updated_at`, `user_id`, `cover_image`) VALUES
(22, 'How to escape procrastination', '<p>This article is about TIme management. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Harum sint hic unde est voluptate officia, magnam ipsam nostrum enim. Reiciendis repudiandae nam est modi aliquam ipsa, similique facilis magni ratione quisquam accusamus, non perferendis a ab! Aspernatur, odio nemo perferendis reiciendis amet, beatae, fugit dolorum porro fugiat eaque iste sapiente?</p>', '2022-06-15 00:24:23', '2022-06-15 00:24:23', 1, 'bg-mid_1655270663.png'),
(23, 'What is Lorem Ipsum?', '<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '2022-06-15 01:03:46', '2022-06-15 01:03:46', 2, 'bg-mid -2_1655273026.png'),
(24, 'Why do we use Lorem Ipsum?', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', '2022-06-15 01:04:43', '2022-06-15 01:04:43', 2, 'home-person_1655273083.jpg'),
(25, 'Where does it come from?', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', '2022-06-15 01:05:26', '2022-06-15 01:05:26', 2, 'bg-mid-3_1655273126.png'),
(26, 'How To Manage A Project From Start To Finish?', '<p><strong>Stage 1: Project Initiation</strong></p>\r\n\r\n<p>This is the start of the project. This is the phase where the project manager defines the project at a broad level. He/she performs detailed analysis of the project in order to determine whether the project is feasible or not.</p>\r\n\r\n<p><strong>Stage 2: Project Planning</strong></p>\r\n\r\n<p>Once the project manager is sure that the project is feasible, he/she develops a roadmap that everyone will follow. The roadmap is basically a well-laid project plan with S.M.A.R.T (<em>Specific, Measurable, Attainable, Realistic, </em>and<em> Timely</em>) and C.L.E.A.R (<em>Collaborative, Limited, Emotional, Appreciable, </em>and <em>Refinable</em>) goals.</p>\r\n\r\n<p><strong><em>Also read: </em></strong><a href=\"https://www.proofhub.com/articles/project-planning-with-a-project-management-tool\"><strong><em>Smart project planning with a project management tool</em></strong></a></p>\r\n\r\n<p><strong>Stage 3: Project Execution</strong></p>\r\n\r\n<p>Once the project is planned and scheduled, it&rsquo;s time to develop and complete deliverables. the stage usually begins with a &ldquo;kick-off&rdquo; meeting where the teams involved are informed of their role and associated responsibilities.</p>\r\n\r\n<p><strong>Stage 4: Project Monitoring And Control</strong></p>\r\n\r\n<p>This stage is all about measuring progression and performance to ensure that everything that happens in the project is in alignment with the initial plan. Also, it helps to ensure that the BEST outcome is delivered at the end of the project.&nbsp;</p>\r\n\r\n<p><strong>Stage 5: Project Closure</strong></p>\r\n\r\n<p>This is the final stage of the <a href=\"https://www.proofhub.com/articles/project-management-life-cycle-5-phases\">project management lifecycle</a>. This is where the project is marked complete (after finishing all the necessary modifications/improvements) and the valuable team members are recognized.</p>\r\n\r\n<h2><strong>How To Effectively Manage A Project?</strong></h2>\r\n\r\n<p>There are several internal and external factors that may cause a project to derail. By taking a few precautions, it will be a lot easier to lead your project to success. Here are 3 simple tips to help you manage projects more effectively and ensure <a href=\"https://blog.proofhub.com/project-managemment-tips-and-tools-a5a3941804fa\">project management success</a>.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<h3><strong>Ensure proactiveness</strong></h3>\r\n	</li>\r\n</ul>\r\n\r\n<p>No project ever progresses exactly as it was planned. Now, in order to reduce the chances of surprises, it&rsquo;s necessary that everyone in the project is as proactive as possible. From being adaptive to change to identifying project risks at first sight, proactiveness is a must.<strong>&nbsp;</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<h3><strong>Keep communicate fluid</strong></h3>\r\n	</li>\r\n</ul>\r\n\r\n<p><em>More than 90% of a project manager&rsquo;s job is communication</em>. Helping everyone to stay on the same page, keeping goals and expectations aligned, eliminating risks, keeping conflicts under check throughout the project is all part of that job. So, as a manager or leader, make sure that there is a smooth, streamlined flow of information all the way to project closure.&nbsp;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<h3><strong>Get tech-savvy</strong></h3>\r\n	</li>\r\n</ul>\r\n\r\n<p>Using a cloud-based software solution is the easiest way to successfully make it through the life of the project. Luckily, there is no shortage of such software. There are, in fact, several hundreds of project management solutions and <a href=\"https://www.proofhub.com/articles/best-productivity-tools\">business productivity tools</a> that can make getting work done and delivering projects 5X easier, faster.&nbsp;</p>\r\n\r\n<blockquote>\r\n<p><strong><em>&ldquo;Bring a new way to manage work. <a href=\"https://www.proofhub.com/try?utm_source=ProofHub.com%2Farticles&amp;utm_medium=referral&amp;utm_campaign=Project%20management&amp;utm_term=CTA&amp;utm_content=How%20to%20manage%20projects\">Try ProofHub</a>!&rdquo;&nbsp;</em></strong></p>\r\n</blockquote>\r\n\r\n<h2><strong>What Project Management Tools Do You Use?</strong></h2>\r\n\r\n<p>No matter how detail-oriented your project plan is, you&rsquo;re going to face a lot of obstacles. Thankfully, there is technology specifically designed to make the life of a project manager and a team easier. We now have access to project management software solutions that makes managing everything from project planning to on-going communication, to final project delivery effective and convenient.</p>\r\n\r\n<p><strong>Further Reading:</strong></p>\r\n\r\n<ul>\r\n	<li><strong><em><a href=\"https://www.proofhub.com/articles/what-is-project-management\">What is Project Management &ndash; Definition, Best Practices, Benefits and Features</a></em></strong></li>\r\n	<li><strong><em><a href=\"https://www.proofhub.com/articles/project-portfolio-management\">What is Project Portfolio Management? [A Complete Guide]</a></em></strong></li>\r\n	<li><strong><a href=\"https://www.proofhub.com/articles/project-management-challenges\">10 Common Challenges in Project Management (and How to Solve Them)</a></strong></li>\r\n	<li><strong><a href=\"https://www.proofhub.com/articles/project-management-startups\">Project Management for Startups &amp; Entrepreneurs: A Quick Reference Guide</a></strong></li>\r\n	<li><strong><a href=\"https://www.proofhub.com/articles/project-management-app-comparison\">21 Best Project Management Apps Comparison and Reviews of 2019</a></strong></li>\r\n</ul>\r\n\r\n<h3><strong>How To Manage A Project Effectively With ProofHub?</strong></h3>\r\n\r\n<p>ProofHub has everything you need (or may need) to manage a project effectively from start to finish. Whether you&rsquo;re a project manager or a team member&mdash;ProofHub helps you across all 5 project management steps (initiation, planning, execution, monitoring, and closure), and here&rsquo;s how it does that.&nbsp;</p>\r\n\r\n<p><strong>1. It puts an end to those unnecessary email threads</strong></p>\r\n\r\n<p><img alt=\"create a task list, How to manage a project\" src=\"https://www.proofhub.com/wp-content/uploads/2018/01/create-a-task-list.png\" style=\"height:238px; width:530px\" /></p>\r\n\r\n<p><a href=\"https://www.washingtonpost.com/news/the-intersect/wp/2016/10/03/how-many-hours-of-your-life-have-you-wasted-on-work-email-try-our-depressing-calculator/?utm_term=.40529682472b\"><strong>Did you know that a regular employee wastes</strong> </a>more than 20.5 hours a week reading and responding to emails? This accounts for more than 1,000 hours each year, which comes out to be 47,000 hours over the entire career. Just think of the time you could save if you had something simpler to manage your projects.</p>\r\n\r\n<p>With ProofHub, instead of shooting emails to assign work, you can simply <a href=\"https://help.proofhub.com/plus/tasks/task-lists-and-tasks/\"><strong>create task lists</strong></a> for team members and add their tasks to them. This way everyone knows what they are supposed to do and can begin working without any limitation of acknowledging and responding to emails.</p>', '2022-06-15 01:39:51', '2022-06-15 01:41:16', 1, 'bg-mid-1_1655275191.png'),
(27, 'How to make a Project', '<p><strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit officia neque beatae at inventore excepturi numquam sint commodi alias, quam consequuntur corporis ex, distinctio eaque sapiente pariatur iure ad necessitatibus in quod obcaecati natus consequatur. Sed dicta maiores, eos culpa.</strong></p>\r\n\r\n<p><strong>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit officia neque beatae at inventore excepturi numquam sint commodi alias, quam consequuntur corporis ex, distinctio eaque sapiente pariatur iure ad necessitatibus in quod obcaecati natus consequatur. Sed dicta maiores, eos culpa.</strong></p>\r\n\r\n<p>Nulla nesciunt eligendi ratione, atque, hic, ullam suscipit quos enim vitae fugiat ducimus, dolore delectus iste id culpa. Ducimus, iste magnam sed reprehenderit architecto perferendis odio voluptas molestiae quidem ab numquam debitis, dolorem incidunt, tempore a quod qui nobis. Voluptates!</p>\r\n\r\n<p>Suscipit, officiis, vero! Perferendis accusamus quos voluptatum culpa, provident maiores! Illo itaque ullam fugit molestiae, eaque accusamus impedit autem numquam. Placeat molestias tempore eaque ipsam vel voluptatum velit enim quam iusto maxime delectus, sint sapiente ea, quo excepturi nisi! Quia.</p>\r\n\r\n<p>Cupiditate ut, aspernatur labore obcaecati, eveniet aut velit nulla facere suscipit est recusandae vel error itaque earum doloremque hic necessitatibus dignissimos dolores libero laudantium ducimus! Rem dolorem ratione officia et, fugit non, fuga suscipit eos veritatis enim perspiciatis, magni sit!</p>', '2022-06-15 10:56:17', '2022-06-15 10:57:37', 1, 'bg-mid-1_1655308577.png'),
(34, 'The Best Time To Exercise To Stay Alive Longer', '<h1>A new study suggests that &ldquo;Weekend Warriors&rdquo; do just as well as more regular exercisers.</h1>\r\n\r\n<p><img alt=\"\" src=\"https://miro.medium.com/max/1170/1*qVj481s0UJDkB8QKneqACg.jpeg\" style=\"height:465px; width:585px\" /></p>\r\n\r\n<p>150 minutes a week. That&rsquo;s the minimum recommended amount of moderate-intensity exercise the federal government advises the American people to do to optimize their health.</p>\r\n\r\n<p>150 minutes a week. That number wasn&rsquo;t pulled out of thin air. There is a <a href=\"https://bjsm.bmj.com/content/53/6/370.abstract\" target=\"_blank\">bunch of observational data</a> that shows that people who are more physically active have better health outcomes. Those who hit that 150 minute-a-week mark have around a <a href=\"https://www.ahajournals.org/doi/full/10.1161/JAHA.114.000802\" target=\"_blank\">30% reduction in overall mortality rates</a>, even when you control for health status at baseline.</p>\r\n\r\n<p>But only about half of Americans actually get that much exercise, <a href=\"https://public.tableau.com/views/FIGURE7_2/Dashboard7_2?:showVizHome=no&amp;:embed=true\" target=\"_blank\">as you can see here</a>, with younger people doing better than older people, and men getting a bit more exercise than women.</p>\r\n\r\n<p>How do you get more people to exercise? Maybe you need to make it easier.</p>\r\n\r\n<p>Part of the reason a lot of people miss the exercise target is that 150 minutes just seems daunting. The physical activity guidelines suggest that these 150 minutes be &ldquo;spread throughout the week&rdquo;. But not all of us have 30 minutes a day, Monday through Friday to take a brisk walk on a treadmill, or a jog around the block.</p>\r\n\r\n<p>Could it be good enough to hit the weekly target all at once?</p>\r\n\r\n<p>The agreed-upon scientific term for this behavior &mdash; doing all your weekly exercise in one or two big sessions &mdash; is the &ldquo;Weekend Warrior&rdquo; pattern. And, in this week&rsquo;s <em>JAMA Internal Medicine</em>, <a href=\"https://jamanetwork.com/journals/jamainternalmedicine/fullarticle/2794038\" target=\"_blank\">a large study asks</a> whether Weekend Warriors are as protected from death as people who spread their exercise more evenly.</p>\r\n\r\n<p><img alt=\"\" src=\"https://miro.medium.com/max/1400/1*LEQB_eHpjbG8ZF6q75l3hg.png\" style=\"height:193px; width:700px\" /></p>\r\n\r\n<p>The study leverages more than 350,000 responses to the US National Health Interview Survey &mdash; which is representative of the population at large. The researchers, led by Yafeng Wang, merged that survey data with the National Death Index, which captures date and cause of death for all deaths in the US.</p>\r\n\r\n<p>What do weekend warriors look like?</p>\r\n\r\n<p>In the JAMA-IM study, compared to those who exercise regularly throughout the week, weekend warriors were younger, more likely to be male, less likely to be white, have a lower level of education and a lower overall income level. I think this speaks a bit to the idea that the ability to have 30 minutes a day to exercise is a marker of privilege. Not everyone has jobs with that kind of schedule, or the childcare to allow 30 minutes of &ldquo;me time&rdquo;.</p>\r\n\r\n<p><img alt=\"\" src=\"https://miro.medium.com/max/1400/1*r73w0Vt_Jd-SaC1HcMSNIw.png\" style=\"height:394px; width:700px\" /></p>\r\n\r\n<p>So &mdash; topline results.</p>\r\n\r\n<p>Overall, the researchers found that, compared to people who do not hit those 150 minutes a week of physical activity, those who do are significantly less likely to die &mdash; about 15% less likely. They had 23% less cardiovascular death and 12% less cancer death as well.</p>', '2022-07-07 11:44:23', '2022-07-07 11:46:36', 8, 'bg-mid-1_1657212396.png');

-- --------------------------------------------------------

--
-- Table structure for table `registerusers`
--

CREATE TABLE `registerusers` (
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `comfirmpassword` varchar(255) NOT NULL,
  `updated_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `created_at` timestamp(6) NOT NULL DEFAULT '0000-00-00 00:00:00.000000'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registerusers`
--

INSERT INTO `registerusers` (`name`, `email`, `password`, `comfirmpassword`, `updated_at`, `created_at`) VALUES
('Ghulam Mohiuddin', 'gmd2171@gmail.com', 'Pakistan0_$)', 'Pakistan0_$)', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000'),
('Abdullah Butt', 'abdullahbutt007@gmail.com', 'updated_at', 'updated_at', '2022-06-23 02:45:39.000000', '2022-06-23 02:45:39.000000'),
('Hesham', 'Hi2171@gmail.com', 'abcd_0%&A', 'abcd_0%&A', '2022-06-23 06:54:16.000000', '2022-06-23 06:54:16.000000'),
('Ali Hussain', 'alihussainlovelyboy786@gmail.com', 'Alicutoo011_*', 'Alicutoo011_*', '2022-06-23 09:49:16.000000', '2022-06-23 09:49:16.000000'),
('kumail Bhi', 'kumailmerijan045@gmail.com', 'Kumail786_%', 'Kumail786_%', '2022-06-23 09:50:55.000000', '2022-06-23 09:50:55.000000'),
('Ali Qalandri', 'alihussainpid@gmail.com', 'Password025^_', 'Password025^_', '2022-06-23 11:53:47.000000', '2022-06-23 11:53:47.000000'),
('Hasnat Khalid', 'hasnatkhalid034@gmail.com', 'Pakistan5_$', 'Pakistan5_$', '2022-06-23 12:06:04.000000', '2022-06-23 12:06:04.000000'),
('Abdullah Jani', 'abc@gmail.com', 'Abdullah67_*$', 'Abdullah67_*$', '2022-06-23 15:45:17.000000', '2022-06-23 15:45:17.000000'),
('Sami', 'sami006@gmail.com', 'Sami006&_*', 'Sami006&_*', '2022-06-24 00:39:02.000000', '2022-06-24 00:39:02.000000');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Abdul Sammi', 'Sami@gmail.com', NULL, '$2y$10$CIRoO7WSdekbllL0Pf73FeU7EEo0VlZDLp1uAbDiBMXICD/WnC7f.', 'c0ulWY9w3HlB0B55qZ2ieYclRsXNPjovqcPlEEWq3XA05P4h6wB9HujKmixa', '2022-06-13 04:57:42', '2022-06-13 04:57:42'),
(2, 'test', 'test@gmail.com', NULL, '$2y$10$jssq.5v9OMlVXjoQ9R0rHOlZmivs3zg4p.xHiHfPxRLOwbu3aJqvK', NULL, '2022-06-13 21:02:09', '2022-06-13 21:02:09'),
(3, 'Ghulam Mohiuddin', 'gmd@gmail.com', NULL, '$2y$10$5i1pdvAX2.aRbqG4C2OzSOa67eDzM17Tpew3pa/ARdWI49nMfAZEa', NULL, '2022-06-16 02:56:40', '2022-06-16 02:56:40'),
(4, 'Baseer', 'baser@yahoo.com', NULL, '$2y$10$TP8rr9ygm3q4mLyWR.rJK.GbowvPm0fSzzAx/pGFV24SlBTgRHTzW', NULL, '2022-06-16 11:18:04', '2022-06-16 11:18:04'),
(5, 'Gul', 'sammigul11005@gmail.com', NULL, '$2y$10$NhCTyOe0ABgQavbBCHw8FetGTWVQt18iBWxXhl9RH0XksRQ7BsPwe', 'GhxymbNHGNcxLCQGCc6PHxixh8yFPSXcu4uz0JzAtKfPUqpD3iuGdVa3oUWc', '2022-06-17 02:24:15', '2022-06-17 02:24:15'),
(6, 'test1', 'test1@gmail.com', NULL, '$2y$10$tslEzTFE2NYgDAWSppdAueJDhewiGRX1RU38eIK/Ivkgo5hgHYk7u', NULL, '2022-06-21 06:12:30', '2022-06-21 06:12:30'),
(7, 'gmd', 'gmd2171@gmail.com', NULL, '$2y$10$y8W..vNTaS4O53/D.u/wgut1LJbLaRK0HFVvqYAfgptpZgl8oIzlS', NULL, '2022-06-24 02:46:49', '2022-06-24 02:46:49'),
(8, 'test', 'test@hotmail.com', NULL, '$2y$10$n9a1d9iuFhAxdl85Gts4Cu67kmOEabiKujZgwTYZI5NlNUHJNuAXi', NULL, '2022-07-07 11:40:09', '2022-07-07 11:40:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`adminpassword`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `like_dislikes`
--
ALTER TABLE `like_dislikes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registerusers`
--
ALTER TABLE `registerusers`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `like_dislikes`
--
ALTER TABLE `like_dislikes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

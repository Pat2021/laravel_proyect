-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 24, 2025 at 03:55 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_proyect`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_09_22_061344_create_posts_table', 1),
(5, '2025_09_23_231426_add_avatar_to_users_table', 2),
(7, '2025_09_24_024512_add_role_to_users_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `content`, `image`, `created_at`, `updated_at`) VALUES
(6, 1, 'Layout: Using Flexbox', 'Before we move further, we shall look at several more examples of using the flexbox. Let us attempt this in our project.\r\n\r\nYou will need to wrap each <picture> element in a .picture class and every four pictures in a .picture_wrapper class. This arrangement places our portfolio into two rows of four images each, enabling us to apply display:flex and display the four pictures inside as a row of evenly sized images.\r\n\r\nCompare the code before, to the code after:\r\n\r\n<section id=\"portfolio\">\r\n      <picture id=\"portfolio1\">\r\n        <source media=\"(max-width: 480px)\" srcset=\"img/portfolio1_480.png\">\r\n        <source media=\"(max-width: 785px)\" srcset=\"img/portfolio1_785.png\">\r\n        <img src=\"img/portfolio1_785.png\" alt=\"A website\">\r\n      </picture>\r\n      <picture id=\"portfolio2\">\r\n        <source media=\"(max-width: 480px)\" srcset=\"img/portfolio2_480.png\">\r\n        <source media=\"(max-width: 797px)\" srcset=\"img/portfolio2_797.png\">\r\n        <img src=\"img/portfolio2_797.png\" alt=\"A website\">\r\n      </picture>\r\n      <picture id=\"portfolio3\">\r\n        <source media=\"(max-width: 480px)\" srcset=\"img/portfolio3_480.png\">\r\n        <source media=\"(max-width: 835px)\" srcset=\"img/portfolio3_835.png\">\r\n        <img src=\"img/portfolio3_835.png\" alt=\"A website\">\r\n      </picture>\r\n      <picture id=\"portfolio4\">\r\n        <source media=\"(max-width: 480px)\" srcset=\"img/portfolio4_480.png\">\r\n        <source media=\"(max-width: 833px)\" srcset=\"img/portfolio4_833.png\">\r\n        <img src=\"img/portfolio4_833.png\" alt=\"A website\">\r\n      </picture>\r\n      <picture id=\"portfolio5\">\r\n        <source media=\"(max-width: 480px)\" srcset=\"img/portfolio5_480.png\">\r\n        <source media=\"(max-width: 785px)\" srcset=\"img/portfolio5_785.png\">\r\n        <img src=\"img/portfolio5_785.png\" alt=\"A website\">\r\n      </picture>\r\n</section>\r\n<section id=\"portfolio\">\r\n    <div class=\"picture_wrapper\">\r\n      <div class=\"picture\">\r\n        <picture id=\"portfolio1\">\r\n          <source media=\"(max-width: 480px)\" srcset=\"img/portfolio1_480.png\">\r\n          <source media=\"(max-width: 785px)\" srcset=\"img/portfolio1_785.png\">\r\n          <img src=\"img/portfolio1_785.png\" alt=\"A website\">\r\n        </picture>\r\n      </div>\r\n      <div class=\"picture\">\r\n        <picture id=\"portfolio2\">\r\n          <source media=\"(max-width: 480px)\" srcset=\"img/portfolio2_480.png\">\r\n          <source media=\"(max-width: 797px)\" srcset=\"img/portfolio2_797.png\">\r\n          <img src=\"img/portfolio2_797.png\" alt=\"A website\">\r\n        </picture>\r\n      </div>\r\n      <div class=\"picture\">\r\n        <picture id=\"portfolio3\">\r\n          <source media=\"(max-width: 480px)\" srcset=\"img/portfolio3_480.png\">\r\n          <source media=\"(max-width: 835px)\" srcset=\"img/portfolio3_835.png\">\r\n          <img src=\"img/portfolio3_835.png\" alt=\"A website\">\r\n        </picture>\r\n      </div>\r\n      <div class=\"picture\">\r\n        <picture id=\"portfolio4\">\r\n          <source media=\"(max-width: 480px)\" srcset=\"img/portfolio4_480.png\">\r\n          <source media=\"(max-width: 833px)\" srcset=\"img/portfolio4_833.png\">\r\n          <img src=\"img/portfolio4_833.png\" alt=\"A website\">\r\n        </picture>\r\n      </div>\r\n    </div>\r\n    <div class=\"picture_wrapper\">\r\n      <div class=\"picture\">\r\n        <picture id=\"portfolio5\">\r\n          <source media=\"(max-width: 480px)\" srcset=\"img/portfolio5_480.png\">', 'images/kd64ZjKKcewxLskd2RjEqvj7hyzkSWnTmPocObF3.png', '2025-09-23 09:40:02', '2025-09-23 20:30:49'),
(7, 1, 'Organising CSS with Sass Partials', 'We are now going to go through this page from top to bottom, styling the design. Along the way we shall learn about some of the latest tools and techniques used in CSS to achieve a stunning design. Let us start with the hero image and title. Before we begin, we are going to be adding a great deal of CSS; therefore, it is important to organise our style sheets.\r\nOne way to organise CSS is to break down stylesheets into smaller files. By using the include functionality in Sass (partials) these can then all be compiled together into one, or a small number of stylesheets to link into your website.\r\n\r\nFor example, with partials you could have several style files inside a directory, for instance foundation/_code.scss, foundation/_lists.scss, foundation/_footer.scss and foundation/_links.scss. You would then use the Sass @use rule to load them into other stylesheets.', 'images/JLDjPkXJU7pdW9MO6HSmZwd30efNqPNjJ386AAQq.jpg', '2025-09-23 09:50:38', '2025-09-23 20:35:35'),
(8, 2, 'Reliability and Performance', 'We have built a relatively appealing website. But that is only part of the story. In addition to the fact that this now has to be maintained – usually by other people – you need to consider performance. We have failed to consider many issues:\r\n\r\nWill it work on older browsers?\r\nWill it work on mobile touch?\r\nWhat happens when tablets change orientation?\r\nWhat is the bandwidth like on mobile?\r\nWhile we have tried to consider mobile and graceful degradation, there are issues. The key is to go through two key development phases – cross-browser testing and performance testing.\r\n\r\nCross-Browser Testing\r\nPerhaps no subject fills a developer with more despair than this, but it should never be ignored. The danger is that developers use good PCs with modern browsers and fast connection speeds. Your site needs to be tested without these benefits.\r\n\r\nThe problem is that cross-browser testing is difficult to do accurately. Emulators such as BrowserStack are unreliable, and no-one can afford every device. There are a few tricks to help navigate this minefield.\r\n\r\nOne is content-first design. Use media queries to control the content you have. If the menu breaks onto another line, you need to address that because it will occur on many devices. Can you identify any content issues with our design? Navigate through the slideshow below to see a few examples.', 'images/wzAM9ERayScQoLEiR3a7ahOU5F2NnYuy9vJKBZNL.jpg', '2025-09-23 13:44:27', '2025-09-23 20:40:57'),
(13, 3, 'Browsers Read HTML', 'We will start by examining how browsers interpret HTML, which leads us directly to the Document Object Model (DOM).\r\n\r\nWhat is the DOM? According to the Web Hypertext Application Technology Working Group (WHATWG, 2018):\r\n\r\n\"DOM defines a platform-neutral model for events, aborting activities, and node trees.\"\r\n\r\nThe DOM is the Document Object Model. It is an agreed-upon convention for any browser to construct a page from HTML, CSS, and JavaScript. Browsers take the HTML tags and their nested structure to build a logical representation of the page,', 'images/pYejaz1AiNdAGm4NP2TOEYIsAcvQCYlMFJ0YhDqj.jpg', '2025-09-23 20:14:49', '2025-09-24 00:04:27'),
(14, 3, 'Bootstrap Usage', 'We will discuss the rationale behind using Bootstrap in more detail in the Advanced CSS section of this module. For now, let us briefly examine the remainder of the web document.\r\n\r\nWe have one <p> element providing actual content, and all JavaScript is included at the end of the document. Browsers pause rendering when downloading JavaScript, as explained by Yahoo Developer Network (Yahoo, n.d.). Thus, we load images, text, and CSS first, ensuring the page starts to appear visually cohesive as soon as possible, and then load the scripts to avoid interrupting the user experience. This approach mitigates the Flash of Unstyled Content (FOUC).', NULL, '2025-09-23 20:17:01', '2025-09-23 20:17:01'),
(15, 3, 'Working with Images', 'For this section we will be creating our portfolio images. Ensure that you include the section#portfolio div after section#technical_skills, and add a link in your navigation menu.\r\n\r\nFor demonstration purposes, we will use the following Creative Commons licensed images:\r\n\r\n1. Abstract Photo Modern Links to an external site. by Scott Webb from Pexels.\r\n2. Smile Profile Face Links to an external site. by Radek Maleček from Pexels.\r\n\r\nWe will be placing the image of the abstract building from Scott Webb as the hero background in the Advanced CSS section.\r\n\r\nWe have chosen an image that will allow anything placed over it to be highly visible. Avoid complex, detailed images for this task. Our profile picture will sit above our name.', 'images/YVY1LCAsjQflfb3scgYtbE1D1u8N9Hh1SPfwcsIQ.png', '2025-09-23 20:20:01', '2025-09-23 20:20:01'),
(16, 3, 'What is an SVG?', 'An SVG is a Scalable Vector Graphic. This format allows for the creation of vector-based images. These images are not pixel-based, but rather based on curves, lines, rectangles, and other geometric forms. As they describe mathematical vectors, browsers are able to render them at any size without pixelation. Browsers are also able to animate many SVG features such as colour, size, and position.\r\n\r\nSVGs can be created in vector-based editors like Adobe Illustrator and Sketch. These can then be used to great effect by developers. The following CodePens demonstrate a range of complex shapes and animations that can be created using SVG. Please take a moment to look at each:', 'images/cm0nHms6fhieiqM5baJZxSz7vYmS5EHWRM9UZwpc.png', '2025-09-23 20:22:00', '2025-09-23 20:22:00'),
(17, 1, 'What is a preprocessor?', 'A preprocessor takes input and creates output for another language. In this case, it is CSS. It allows developers to use variables and create functions. It is so useful that it would be hard to find any front-end development taking place in this day and age without a preprocessor. There are two main CSS preprocessors: SASS and LESS. SASS has effectively won the contest to be the most broadly adopted, and for good reason – it is very powerful. We are going to use SASS in our projects.\r\n\r\nLet us clarify one key term. You will see we are using .scss files to write our SASS. SCSS stands for Sassy CSS and is a more CSS-like version of the original .sass syntax.', 'images/n41bVBz7MlgFWCIKy7sAfXNKiuZKzdnWSNkXF1Vg.png', '2025-09-23 20:26:36', '2025-09-23 20:26:36'),
(18, 1, 'Styling Our Hero: Typography', 'e shall be working in the _header.scss partial; however, first we will add some code to _typography.scss to establish the typography for this project. To achieve this, we are going to utilise Google Fonts as an easy and effective solution. In order to add Google Fonts, you need to include a link to Google’s font API (Application Programming Interface). This API processes the URL you supply and returns the requested font files for your browser.\r\n\r\nWe will be using two typefaces: Oswald for our headings and PT Sans Narrow for the body text.\r\nNext, add CSS code to make use of the fonts. You will note that we are employing a font stack whereby the desired font is specified first, followed by fallbacks. The final fallback is either serif or sans-serif, which are universally available.\r\n\r\nIn your scss/_typography.scss file, add the following code:\r\n\r\nbody {\r\n    font-family: \'PT Sans Narrow\', Arial, sans-serif;\r\n    color: #46525b;\r\n    font-weight: 400;\r\n}\r\nh1, h2, h3, h4, h5, h6 {\r\n    font-family: \'Oswald\', Arial, sans-serif;\r\n    color: #2b303b;\r\n}', 'images/9HMJgyUT1X7NR43Q91RPBpG067I0R3f9N2SmocxJ.png', '2025-09-23 20:37:14', '2025-09-23 20:37:14'),
(19, 2, 'Modern PHP Workflow', 'Our workflow will be quite different to that of the previous module. We will be following best practices in server-side development. In actuality these practices, and the reasoning behind them, apply to most programming problems. Here, we will take a look at using dependency managers, version control and test driven development.\r\nUsing dependency managers\r\nWe will be using a dependency manager to handle third party libraries. A dependency manager will fetch libraries of code that we can use to add functionality. It tracks the code library for us, so we do not need to add it to our version control, which means less code duplication. It will save us from having to track and update someone else’s code. For this we will be using Composer, a PHP dependency manager.\r\n\r\nWith Composer, you tell its configuration file everything you require from a huge array of code libraries that are available on Packagist Links to an external site.. Packagist is Composer’s store of code libraries for PHP. A bit like NPM for JavaScript, if developers want others to share their code, they simply add their Git repository for their code library to Packagist, and anyone can include this code using Composer.\r\n\r\nUseful, secure utilities are Swiftmailer Links to an external site., a free, feature-rich PHP mailer, or Faker Links to an external site., a PHP library that generates fake data for you. All you need to tell Composer is which library you wish to use, and what version you would prefer, and it will fetch the code for you and store it in your vendor folder. It will also update these libraries for you. And if, somehow, you lost this code, a simple command will fetch it again.\r\nUsing version control\r\nWe will also track changes to our code base to ensure we do not lose vital code. We will be using Git. There are other options, but Git is the most widely used, and therefore it is useful for new developers looking for work to have some working knowledge of Git.\r\n\r\nGit allows us to change code as we work. There are times when you start making changes, and realise it is not working. Version control is like a remote control for your code. You can pause, rewind, fast forward, save, delete, and even change channels which, in this case, are termed branches. Any changes stored in Git can never be lost, provided they sit in at least two places in a distributed network.', 'images/VmxPrRiBBQ4MBL5zQdJDBalxEaKoGXFltNhlFAr8.png', '2025-09-23 20:43:07', '2025-09-24 01:40:07'),
(23, 4, 'Where is AI heading?', 'Since the days when computers ran on punch cards and vacuum tubes, humans have been preoccupied with questions of what those computers could do when they became even more advanced — and what that would mean for humanity. Would they be able to help us solve our biggest challenges, from climate change to world hunger? Or would they turn on us and become our greatest threat? As artificial intelligence (AI) has started to hit the mainstream, those questions have become much more tangible.\r\n\r\nThe path AI takes will depend greatly on what happens in the next few years. While it’s clear that AI offers massive potential, achieving it in a way that will benefit humanity, avoiding the catastrophic outcomes depicted in movies like Minority Report, requires doing the hard work today to ensure AI is developed and used ethically and responsibly.\r\nThe state of AI today\r\nAI has been making significant headlines since the 2022 launch of OpenAI’s ChatGPT. It’s a chatbot tool that uses generative AI to produce new content based on inputs from many sources of existing text — giving businesses a simple way to speed up writing tasks, support brainstorming and improve customer service. Feliz Fuentes Montpellier, General Manager, Industry Software Partners at Microsoft, says it’s also democratizing access to AI’s capabilities.\r\n“You don’t have to have specialized knowledge to leverage the power and insights from massive amounts of data anymore,” she says. “Now anyone can use basic language prompts to tap into those insights.”\r\nWhile generative AI has been getting most of the attention lately, AI researchers like Sanaz Mostaghim, a professor of computer science at Otto von Guericke University Magdeburg in Germany, are quick to point out that generative AI is only one branch of a much wider field.\r\n“It’s really great that so many people are talking about AI,” she says. “It gets people asking questions and thinking about what else it can do. And that gives me the opportunity to showcase other types of AI and the possibilities they offer for a better life for everyone.”\r\nAI becomes invisible\r\nSome of the ways organizations are already using various forms of AI include sentiment analysis to get a sense of how people feel about a company or product, chatbots that can provide automated customer service in natural-sounding language, and recommendation engines that suggest additional products based on a customer’s purchase or search history. These have become so common that it’s easy to forget that most of these systems are powered by AI. \r\nIn more specialized cases, AI is being used to support research by “knowledge mining” vast reference sets, such as court filings or medical data. It’s improving operations with predictive maintenance based on correlations among data from multiple sensors and other sources. It’s enabling metaverse applications such as digital twins. And it’s even being used to manage and reduce the energy consumption of telecommunications network equipment — without sacrificing performance or reliability.\r\nOne thing is certain: companies in nearly every industry are always on the lookout for ways to become more productive and are now increasingly looking to AI to help them do that by automating or even eliminating some routine processes.\r\n“Companies are hearing about how disruptive AI will be, and they’re very interested to find out more,” says Anne Lee, a Senior Technology Advisor in the Technology Leadership Office. “They want to know how AI will impact the work and work processes of their employees as well as how AI will impact the kind of products they’ll be able to offer – what effects will AI have on the competitive landscape.” \r\nFive AI use cases on the horizon\r\nThe field of AI is advancing so quickly that many experts are hesitant to even speculate about potential future use cases, noting that literally anything could be on the table. But, some applications are currently in preliminary or piloting phases of development and could start to see more widespread uptake in the coming years. These include:\r\nSelf-driving labs: Scientific research involves a lot of precise, repetitive tasks that robots could easily accomplish. The Argonne National Laboratory’s Rapid Prototyping Lab is working on integrating robotics into lab work, but that’s only the beginning. With further development of AI, it could conduct initial literature reviews to summarize the current state of research in a given area and propose new topics for study and methods to try. Looking even further ahead, the AI could be given leeway to examine existing research, decide – on its own – the next steps and carry out the research with minimal human oversight — which could significantly increase the speed to new discoveries.\r\nHighly effective decision-support algorithms: Human existence is full of decisions, and many of them are highly complex. Mostaghim’s research is primarily devoted to developing decision-support AI that can examine a vast array of possible options and narrow them down to a more manageable shortlist based on specified criteria.\r\n“These tools help balance the human need to look at enough options to feel confident they’ve made the best decision with the human inability to effectively choose between more than about seven options,” says Mostaghim.\r\nThey can be applied to purchasing decisions, healthcare treatment options or even industrial processes, with AI able to propose options that balance many competing criteria, such as cost-effectiveness vs. environmental sustainability.\r\nPharmaceutical discovery: AI could be used to accelerate the process of discovering new drugs for specific medical conditions – whether for pandemic events or conditions that affect only a small number of people and, therefore, today, would receive minimal research funding and little interest from for-profit drug companies. It could ultimately even help create truly individualized medications, leading to personalized medicine.\r\nPersonalized education: AI can already be used to supplement conventional education with individual tutoring. But, the addition of machine learning could enable an AI tutor to adapt based on a student’s learning style to provide more effective instruction tailored to each student it works with.\r\nAutonomous creation and design: AI-generated art is just the beginning. Future AI could take a set of requirements and then create entirely new designs for existing products. Pushed to its limits, this could be one of the most innovative applications of AI. For example, with broad enough criteria, an AI might opt not to create a better car but to propose a completely new solution to transportation.\r\n\r\n“It’s hard to overstate how disruptive AI could be,” says Sean Kennedy, who leads the AI Research Lab at Nokia Bell Labs. “We’re so used to making changes incrementally based on rigid standards, and AI has the potential for something else entirely.”\r\nGiven the speed at which the technology is developing, there will undoubtedly be many more use cases to come that have yet to be conceived of.\r\n“In 10 years, anything is possible,” says Lee. “We might see AI superintelligence that outperforms humans in everything it does.”Responsible AI is critical to getting there\r\nBut there is work to do to achieve the promise of AI, and it must be done the right way to ensure its advances come with more benefits to humanity than risks. That will require organizations across all industries to have a certain level of maturity in their tools, data and people.\r\nFirst, they need to recognize the importance of having the right AI technologies, models and platforms for their needs and goals — and invest accordingly to drive value for their business.\r\nNext, AI tools rely on massive amounts of data to be effective, so organizations need to understand the data they have at their disposal. They also need to implement systems to collect, control, store, organize and access that data effectively. Depending on the data set, this could also include controls to exclude objectionable material or other data an organization doesn’t want AI tools to use.\r\nFinally, organizations need to recognize the value of their people. That means ensuring they have the proper training and skills to work effectively with AI.\r\n“Having the right level of maturity in these areas is critical to understanding the scope of what’s coming next and getting ready for it,” says Kennedy.\r\nBut even with the right tools, data and people in place, some fundamental issues with how AI is developed still have yet to be overcome. If not appropriately trained, AI can provide inaccurate information, plagiarize other content or reinforce existing biases. \r\nGovernments and enterprises have vital roles to play\r\nTo drive the positive outcomes we hope will come, governments and enterprises will need to spend the next few years focusing on building solid ethical and legal foundations for AI development. To that end, in May 2023, US President Joe Biden convened some of the biggest players in global AI development to ask for their commitment to managing AI appropriately. Some organizations, including Nokia and Microsoft, are already working in this area – and are strong advocates for appropriate AI safeguards and regulations.\r\nFor several years, Nokia Bell Labs has been researching how AI affects humans and how humans interact with AI. This work informed Nokia’s responsible AI framework (including its six pillars of responsible AI: fairness, reliability, privacy, transparency, sustainability and accountability). Nokia’s approach is to ensure these pillars are applied from the moment a new AI solution is conceived and enforced throughout the solution’s life.\r\nSimilarly, six principles inform the development and use of AI at Microsoft: fairness, reliability and safety, privacy and security, inclusiveness, transparency, and accountability.\r\n“What happens to your data should be a top consideration whenever you’re thinking about using an AI tool,” says Microsoft’s Fuentes Montpellier. “Always ask about privacy and data use policies before you allow access to your data for any purpose.”\r\nFrameworks like these are critical to determining when and how to use AI and ensure that those who use AI can trust its output. This is necessary to move forward with many of AI’s most promising use cases.\r\n“I strongly believe that AI will lead to unbelievable value and good for humanity,” says Kennedy. “But the only way to get there is through a deep, ingrained focus on responsibility.”', 'images/EDpfAhbtOHO7bswlpMAWRyFxHXu7B5KHh8VmPmex.png', '2025-09-24 00:08:11', '2025-09-24 00:08:11');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('JRodYZdOQ7PmjpFMBKn7X3lc3W1U74iqAktlPDxP', 4, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.4 Safari/605.1.15', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMkxKWW5jR2JIOFMwUVJMTlZ2NUNtYWpKTUNyUkRoazJ6WHN4YzMyNiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9kYXNoYm9hcmQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo0O30=', 1758721290);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`, `avatar`) VALUES
(1, 'Patricia Lara', 'pl@gmail.com', NULL, '$2y$12$2.UNSb8RsD35PeEhjrAQ4esaddY708fOv5MZ3IcuLxYvwV3AhIwES', 'admin', 'wOGPMLuNX3gVc2Ll2moNXz69gm5ds7oGIrsVhJQ2M2uZ6XKnWU5lhk7ergRQ', '2025-09-22 23:18:44', '2025-09-24 01:36:55', 'avatars/uuSx3whWT9XwNYw9FZmcW5NK9Ls2I4R3Dvp9LRya.png'),
(2, 'Kora Ricatti', 'kora@example.com', NULL, '$2y$12$6zIRmg.Brvp63AeIUZuGYeDZHcVF9ikXOZI7yJy0e5HJPo04kkALe', 'user', '5tNuZ4fX5hM7PAWRBBCYMPy3L2nCgeON7l1PtYzVa1Haec6UQGFsMNn3dGQd', '2025-09-23 13:29:03', '2025-09-23 23:43:18', 'avatars/ci3NCXA6Uwxrv0g3IOCOGkPf9HKzoY2a3KMMCQVe.png'),
(3, 'Admin', 'admin@example.com', NULL, '$2y$12$x81zMY2QzWxCeF74H4dclO5.R3W9pRmacnWtHHpOuQ4MRpNkvzVOe', 'user', NULL, '2025-09-23 20:08:00', '2025-09-23 20:12:09', 'avatars/3ARGPZNg896bt99JdVpJRd5OhsWMxq5BYd5Oo9CX.png'),
(4, 'Giulio', 'giu.ricatti@gmail.com', NULL, '$2y$12$TQB4eNHh6tNF9c2fYWmEmunQnhLhQtg5bRnA3m8GA81Byjy/QMm/S', 'user', '5J7H24K7zCvFtMmGkhwLJCCnKJwrFGCyM5y5WmTRSYhgGHnV37XkIxJw3rWp', '2025-09-23 22:54:35', '2025-09-23 22:55:03', 'avatars/xE5nR2DkY0mPuOF1NcIPxZu6aOlmAcYde7S6mnLf.png'),
(5, 'Violeta Ricatti', 'violeta@example.com', NULL, '$2y$12$UiQKBFIP4B7zH.pBr7ys..ZhpGc5KwIcd03rXcC3zGWMjFY6lh6f.', 'admin', NULL, '2025-09-23 23:44:41', '2025-09-23 23:44:41', 'avatars/aRx1PaLEPzwbOCNreSqpLiOud8TYxFFF4B2COjSe.png'),
(8, 'Luna Ricatti', 'luna@example.com', NULL, '$2y$12$pWZehxyfErllvaF1QXrna.neJ.5j6FGqFs0r1cgzsk5wQSKODIuIe', 'user', NULL, '2025-09-24 01:36:36', '2025-09-24 01:36:36', 'avatars/coltbJ9bw7cukVw0E2jkIZep7GHiqSZvPsP9OxCO.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

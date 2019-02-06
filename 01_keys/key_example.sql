#
# TABLE STRUCTURE FOR: authors
#

CREATE DATABASE databasesample;
use databasesample;

DROP TABLE IF EXISTS `authors`;

CREATE TABLE `authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `authors` (`id`, `first_name`, `last_name`, `email`, `birthdate`) VALUES (1, 'Violet', 'Lebsack', 'htillman@example.org', '2006-08-06');
INSERT INTO `authors` (`id`, `first_name`, `last_name`, `email`, `birthdate`) VALUES (2, 'Kip', 'Russel', 'paucek.sebastian@example.org', '2013-12-12');
INSERT INTO `authors` (`id`, `first_name`, `last_name`, `email`, `birthdate`) VALUES (3, 'Benedict', 'Schuster', 'doyle.ardith@example.net', '1981-11-01');
INSERT INTO `authors` (`id`, `first_name`, `last_name`, `email`, `birthdate`) VALUES (4, 'Rowena', 'Halvorson', 'alvera68@example.net', '2000-11-05');
INSERT INTO `authors` (`id`, `first_name`, `last_name`, `email`, `birthdate`) VALUES (5, 'Marcella', 'Goodwin', 'mosciski.keven@example.com', '1983-07-14');
INSERT INTO `authors` (`id`, `first_name`, `last_name`, `email`, `birthdate`) VALUES (6, 'Verdie', 'Larkin', 'cparker@example.net', '2017-05-09');
INSERT INTO `authors` (`id`, `first_name`, `last_name`, `email`, `birthdate`) VALUES (7, 'Eloy', 'Weimann', 'rosa84@example.net', '1998-04-18');
INSERT INTO `authors` (`id`, `first_name`, `last_name`, `email`, `birthdate`) VALUES (8, 'Hallie', 'Schowalter', 'polly.will@example.com', '2007-06-17');


#
# TABLE STRUCTURE FOR: posts
#

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `posts` (`id`, `author_id`, `title`, `description`, `content`, `date`) VALUES (1, 1, 'Dolorem quia laudantium optio.', 'Earum ab deleniti sequi officia. Saepe consequatur sunt sed ipsam et sint aut. Modi cum nihil totam rerum est reprehenderit blanditiis. Saepe sequi maxime quibusdam accusantium saepe provident suscipit.', 'Exercitationem sit similique ea officia est. Nam voluptatem eius omnis. Cumque est sed dolores itaque.', '2009-05-18');
INSERT INTO `posts` (`id`, `author_id`, `title`, `description`, `content`, `date`) VALUES (2, 2, 'Sint qui necessitatibus voluptas corporis perspiciatis enim quo.', 'Vel quod sed excepturi exercitationem quia omnis ratione. Minus vel debitis qui in veritatis quisquam nam. Ut magnam rerum quas et sit aut accusantium. Accusantium placeat voluptatem suscipit hic.', 'Architecto aut id illum minus. Rerum quia sed neque dolores sed excepturi officia. Alias in id quia iusto. Neque labore quo impedit ea optio aliquam.', '1977-12-15');
INSERT INTO `posts` (`id`, `author_id`, `title`, `description`, `content`, `date`) VALUES (3, 3, 'Dolor hic reiciendis veritatis culpa ut provident eligendi sed.', 'Est nam provident nostrum modi est itaque. Enim eveniet est id aut. Veniam minus atque numquam modi consequuntur. Veniam quos incidunt dolorem qui mollitia.', 'Beatae nihil ut blanditiis. A eaque mollitia tempora eligendi tempora nostrum. Eos suscipit reiciendis quis.', '2013-06-13');
INSERT INTO `posts` (`id`, `author_id`, `title`, `description`, `content`, `date`) VALUES (4, 4, 'Culpa commodi nihil quidem in.', 'Quo repellendus tempora distinctio id aut consequatur dolores. Id nihil id omnis fugiat voluptates quos praesentium. Explicabo quia aut sint quasi. Provident possimus dolorem debitis quia.', 'Repudiandae maxime est occaecati. Nam saepe rerum est voluptates. Porro voluptates quae quia consequatur et. Recusandae rerum officia rem et illo.', '1971-11-06');
INSERT INTO `posts` (`id`, `author_id`, `title`, `description`, `content`, `date`) VALUES (5, 5, 'Quia optio dolor hic numquam voluptatibus nihil eveniet.', 'Et fugit quisquam omnis ex fugiat. Eius nam veritatis doloribus saepe. Nam sint non voluptates consectetur voluptate beatae.', 'Natus sit reprehenderit omnis aut incidunt. Culpa corrupti quisquam dicta ut omnis doloribus non. Et ut eos rem eveniet.', '2003-11-10');
INSERT INTO `posts` (`id`, `author_id`, `title`, `description`, `content`, `date`) VALUES (6, 6, 'Voluptatem eaque non asperiores.', 'Nisi doloremque nam est eius doloribus. Sunt dolorem deserunt illo provident quidem. Et sed nesciunt molestias architecto. Distinctio et possimus molestias est.', 'Assumenda maiores vel rerum aspernatur fuga consequatur aut. Officia facere nam beatae non omnis repellendus et. Quod nesciunt tempore ut veniam ea.', '1986-05-03');
INSERT INTO `posts` (`id`, `author_id`, `title`, `description`, `content`, `date`) VALUES (7, 7, 'Id sint vero eum dolorem sed est.', 'Iure et ullam harum soluta est maiores accusamus. A eveniet ad odit nulla molestiae sit. Facilis et fuga recusandae quisquam natus veritatis dolorem ducimus.', 'At dolor exercitationem vel consectetur. Dolores qui eos laudantium unde beatae quam. Similique reprehenderit quisquam odio expedita molestias. Sint repudiandae aliquam saepe doloribus.', '1978-05-21');
INSERT INTO `posts` (`id`, `author_id`, `title`, `description`, `content`, `date`) VALUES (8, 8, 'Vitae dolores repellat architecto non sequi.', 'Perferendis molestiae quis dolore error doloribus enim. Necessitatibus cupiditate laborum laborum corporis iste est consequatur. Nihil praesentium mollitia dolores fugiat. Dolores unde ut necessitatibus dolorem.', 'Ex natus non unde minima sint consequatur. Ut eum quas nesciunt impedit. Ipsum non iusto provident beatae. Facilis sit ipsa quibusdam eos facere.', '2002-03-05');



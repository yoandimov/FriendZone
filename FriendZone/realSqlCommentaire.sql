create table [dbo].[commentaire] (
	[post_id] INT NOT NULL,
	[user_id] INT NOT NULL,
	[commentaire_id] INT IDENTITY (1, 1) NOT NULL,
	[tagged_user_id] INT,
	[message] VARCHAR(50) NOT NULL,
	[date_created] DATE NOT NULL,
	PRIMARY KEY CLUSTERED ([commentaire_id] ASC),
	CONSTRAINT [FK_user_id] FOREIGN KEY ([user_id])
	 REFERENCES [dbo].[user]([user_id])
	);
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (1, 1, 1, 1, 'Expanded demand-driven software', '6/11/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (2, 2, 2, 2, 'Visionary logistical leverage', '7/7/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (3, 3, 3, 3, 'Cloned regional product', '6/13/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (4, 4, 4, 4, 'Mandatory secondary migration', '5/30/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (5, 5, 5, 5, 'Multi-tiered disintermediate application', '5/18/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (6, 6, 6, 6, 'Upgradable incremental contingency', '6/20/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (7, 7, 7, 7, 'Quality-focused system-worthy intranet', '11/27/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (8, 8, 8, 8, 'Stand-alone system-worthy initiative', '11/19/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (9, 9, 9, 9, 'Future-proofed radical knowledge user', '4/22/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (10, 10, 10, 10, 'Cross-group radical core', '8/22/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (11, 11, 11, 11, 'Mandatory full-range conglomeration', '5/31/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (12, 12, 12, 12, 'Business-focused 24 hour attitude', '6/12/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (13, 13, 13, 13, 'Sharable cohesive analyzer', '12/4/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (14, 14, 14, 14, 'Integrated reciprocal ability', '4/1/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (15, 15, 15, 15, 'Realigned interactive methodology', '11/7/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (16, 16, 16, 16, 'Object-based responsive alliance', '7/2/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (17, 17, 17, 17, 'Upgradable real-time analyzer', '8/4/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (18, 18, 18, 18, 'Centralized asymmetric interface', '9/16/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (19, 19, 19, 19, 'Programmable 5th generation encoding', '7/1/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (20, 20, 20, 20, 'Digitized human-resource system engine', '6/27/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (21, 21, 21, 21, 'Team-oriented responsive application', '4/4/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (22, 22, 22, 22, 'Compatible neutral matrices', '12/5/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (23, 23, 23, 23, 'Synergized bi-directional benchmark', '7/17/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (24, 24, 24, 24, 'Grass-roots optimal function', '5/14/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (25, 25, 25, 25, 'Open-source transitional success', '8/14/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (26, 26, 26, 26, 'Down-sized tangible collaboration', '12/8/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (27, 27, 27, 27, 'Team-oriented value-added emulation', '7/27/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (28, 28, 28, 28, 'Re-engineered hybrid frame', '9/12/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (29, 29, 29, 29, 'Front-line fault-tolerant workforce', '10/31/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (30, 30, 30, 30, 'Optional high-level utilisation', '7/29/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (31, 31, 31, 31, 'Networked impactful open architecture', '1/24/2020');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (32, 32, 32, 32, 'Fundamental 24 hour access', '12/18/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (33, 33, 33, 33, 'Digitized coherent software', '5/24/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (34, 34, 34, 34, 'Organized dynamic attitude', '5/15/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (35, 35, 35, 35, 'Persevering leading edge moderator', '12/20/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (36, 36, 36, 36, 'Synchronised well-modulated throughput', '2/17/2020');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (37, 37, 37, 37, 'Innovative coherent workforce', '1/6/2020');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (38, 38, 38, 38, 'Cross-platform empowering access', '2/24/2020');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (39, 39, 39, 39, 'Object-based explicit hardware', '6/14/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (40, 40, 40, 40, 'Sharable dedicated methodology', '8/1/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (41, 41, 41, 41, 'Persistent full-range success', '8/13/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (42, 42, 42, 42, 'Automated intermediate implementation', '6/21/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (43, 43, 43, 43, 'Reverse-engineered mission-critical approach', '9/29/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (44, 44, 44, 44, 'Enterprise-wide 4th generation utilisation', '4/8/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (45, 45, 45, 45, 'Horizontal human-resource groupware', '9/9/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (46, 46, 46, 46, 'Organic heuristic system engine', '9/8/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (47, 47, 47, 47, 'Reverse-engineered reciprocal portal', '2/7/2020');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (48, 48, 48, 48, 'Ameliorated explicit ability', '10/25/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (49, 49, 49, 49, 'Visionary background array', '9/13/2019');
insert into [dbo].[commentaire] (post_id, user_id, commentaire_id, tagged_user_id, message, date_created) values (50, 50, 50, 50, 'Organized multi-tasking middleware', '9/8/2019');

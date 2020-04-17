

create table [dbo].[user] (
	[user_id] INT  IDENTITY (1, 1) NOT NULL,
	[first_name] VARCHAR(50),
	[last_name] VARCHAR(50),
	[city] VARCHAR(50),
	[gender] VARCHAR(50),
	[country] VARCHAR(50),
	[description] VARCHAR(50),
	[profile_image] VARCHAR(255),
	[username] VARCHAR(50)  NOT NULL,
	[password] VARCHAR(50)  NOT NULL,
	[email] VARCHAR(50)  NOT NULL,
	[permission] VARCHAR(15) NOT NULL CHECK ([permission] IN('ADMIN', 'USER')) DEFAULT 'USER',
	PRIMARY KEY CLUSTERED ([user_id] ASC)
);

create table [dbo].[post] (
	[post_id] INT  IDENTITY (1, 1) NOT NULL,
	[user_id] INT NOT NULL,
	[post_url] VARCHAR(255) NOT NULL,
	[caption] TEXT NOT NULL,
	[image]   TEXT NULL,
	[date_created] DATE NOT NULL DEFAULT GETDATE(),
	PRIMARY KEY CLUSTERED ([post_id] ASC),
	CONSTRAINT [FK_user_id_post] FOREIGN KEY ([user_id]) REFERENCES [dbo].[user] ([user_id])
);

create table [dbo].[commentaire] (
	[post_id] INT NOT NULL,
	[user_id] INT NOT NULL,
	[commentaire_id] INT IDENTITY (1, 1) NOT NULL,
	[tagged_user_id] INT,
	[message] VARCHAR(50) NOT NULL,
	[date_created] DATE NOT NULL,
	PRIMARY KEY CLUSTERED ([commentaire_id] ASC),
	CONSTRAINT [FK_user_id_commentaire] FOREIGN KEY ([user_id]) REFERENCES [dbo].[user] ([user_id]) ,
	CONSTRAINT [FK_post_id_commentaire] FOREIGN KEY ([post_id]) REFERENCES [dbo].[post] ([post_id])
);

create table [dbo].[like] (
	[user_id] INT NOT NULL,
	[post_id] INT NOT NULL,
	primary key (user_id, post_id),
	CONSTRAINT [FK_user_id_like] FOREIGN KEY ([user_id]) REFERENCES [dbo].[user] ([user_id]),
	CONSTRAINT [FK_post_id_like] FOREIGN KEY ([post_id]) REFERENCES [dbo].[post] ([post_id])
);



ALTER TABLE  [commentaire] NOCHECK CONSTRAINT ALL
ALTER TABLE  [like] NOCHECK CONSTRAINT ALL
ALTER TABLE  [post] NOCHECK CONSTRAINT ALL
SET IDENTITY_INSERT [user] ON 

INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (1, N'Ingmar', N'Ciobotaro', N'Qozonketkan', N'Male', N'Uzbekistan', N'Persevering directional access', N'https://robohash.org/etestplaceat.bmp?size=50x50&set=set1', N'iciobotaro0', N'Zd1yLy9X3', N'iciobotaro0@usatoday.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (2, N'Rudolph', N'Jennins', N'Na Thawi', N'Male', N'Thailand', N'Decentralized mobile software', N'https://robohash.org/delenitiodittempora.bmp?size=50x50&set=set1', N'rjennins1', N'sxBvLhN', N'rjennins1@meetup.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (3, N'Luke', N'Luffman', N'???????', N'Male', N'Macedonia', N'Synergized discrete portal', N'https://robohash.org/explicaboconsequunturdolore.bmp?size=50x50&set=set1', N'lluffman2', N'Uok1NMJs', N'lluffman2@google.co.jp')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (4, N'Bailie', N'Lorincz', N'Artémida', N'Male', N'Greece', N'Business-focused maximized circuit', N'https://robohash.org/doloremsintnulla.png?size=50x50&set=set1', N'blorincz3', N'ixwxN347cSqb', N'blorincz3@ow.ly')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (5, N'Leoine', N'Kingdom', N'Gempolan Wetan', N'Female', N'Indonesia', N'Inverse foreground archive', N'https://robohash.org/etabenim.png?size=50x50&set=set1', N'lkingdom4', N'R4MpBP', N'lkingdom4@wunderground.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (6, N'Con', N'Darville', N'Shuangxiqiao', N'Male', N'China', N'Horizontal 3rd generation hub', N'https://robohash.org/velitdoloremaliquid.png?size=50x50&set=set1', N'cdarville5', N'O4OwyO5O6', N'cdarville5@instagram.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (7, N'Griffin', N'Phair', N'Erfangping', N'Male', N'China', N'Open-architected didactic system engine', N'https://robohash.org/quidemutporro.bmp?size=50x50&set=set1', N'gphair6', N'rMRCKZr', N'gphair6@netlog.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (8, N'Jude', N'Ivens', N'Ponta Grossa', N'Male', N'Brazil', N'Centralized heuristic firmware', N'https://robohash.org/adipisciremut.png?size=50x50&set=set1', N'jivens7', N'sF5IZ4Y', N'jivens7@google.es')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (9, N'Madelena', N'Sawford', N'Jabinyanah', N'Female', N'Tunisia', N'Innovative reciprocal focus group', N'https://robohash.org/omnisrepellendussit.jpg?size=50x50&set=set1', N'msawford8', N'R9jKryGLgo', N'msawford8@geocities.jp')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (10, N'Chester', N'Woffinden', N'Jijiga', N'Male', N'Ethiopia', N'Stand-alone zero tolerance capacity', N'https://robohash.org/eaqueconsecteturid.png?size=50x50&set=set1', N'cwoffinden9', N'JIQRteBUvyR', N'cwoffinden9@slideshare.net')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (11, N'Anny', N'Zaple', N'Bayaguana', N'Female', N'Dominican Republic', N'Versatile web-enabled concept', N'https://robohash.org/estquisvoluptatem.jpg?size=50x50&set=set1', N'azaplea', N'QGSYwYv', N'azaplea@pinterest.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (12, N'Hube', N'Digle', N'Dachang', N'Male', N'China', N'Multi-tiered actuating initiative', N'https://robohash.org/exercitationemvoluptatemdolor.bmp?size=50x50&set=set1', N'hdigleb', N'e5XsNiy', N'hdigleb@whitehouse.gov')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (13, N'Roxine', N'Diemer', N'Il’inskiy', N'Female', N'Russia', N'Upgradable needs-based encryption', N'https://robohash.org/estdolorquis.png?size=50x50&set=set1', N'rdiemerc', N'j112tNe6o', N'rdiemerc@about.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (14, N'Jessie', N'Stappard', N'Cái D?u', N'Female', N'Vietnam', N'Pre-emptive maximized portal', N'https://robohash.org/verovoluptatesquod.png?size=50x50&set=set1', N'jstappardd', N'aJwoqLCl', N'jstappardd@fotki.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (15, N'Bendicty', N'Tapner', N'Beihe', N'Male', N'China', N'Phased maximized throughput', N'https://robohash.org/ipsamlaboriosamut.jpg?size=50x50&set=set1', N'btapnere', N'hJIsDU', N'btapnere@booking.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (16, N'Cecil', N'Parrington', N'La Libertad', N'Male', N'Philippines', N'Phased transitional framework', N'https://robohash.org/ametsitquia.jpg?size=50x50&set=set1', N'cparringtonf', N'LM8QSVQeUz', N'cparringtonf@com.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (17, N'Ethelda', N'Bloxland', N'Ourense', N'Female', N'Spain', N'Fundamental grid-enabled moratorium', N'https://robohash.org/sedveritatisdistinctio.jpg?size=50x50&set=set1', N'ebloxlandg', N'RtVCii', N'ebloxlandg@wiley.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (18, N'Aimee', N'Kinnie', N'Barrancabermeja', N'Female', N'Colombia', N'Enterprise-wide user-facing productivity', N'https://robohash.org/itaquenumquamducimus.bmp?size=50x50&set=set1', N'akinnieh', N'M9D4CG5VG', N'akinnieh@photobucket.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (19, N'Nobie', N'Deinhard', N'Helsingborg', N'Male', N'Sweden', N'Total contextually-based internet solution', N'https://robohash.org/delenitiutvoluptatem.png?size=50x50&set=set1', N'ndeinhardi', N'zTAni81P', N'ndeinhardi@nifty.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (20, N'Olav', N'Butts', N'Basey', N'Male', N'Philippines', N'Networked multi-tasking analyzer', N'https://robohash.org/idreprehenderitex.png?size=50x50&set=set1', N'obuttsj', N'LAe1IG8BSqwv', N'obuttsj@newyorker.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (21, N'Anica', N'Abelson', N'Tiraspol', N'Female', N'Moldova', N'Extended secondary concept', N'https://robohash.org/maximesintsaepe.jpg?size=50x50&set=set1', N'aabelsonk', N'pqbmDizxr6', N'aabelsonk@typepad.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (22, N'Boot', N'Grane', N'Duma', N'Male', N'China', N'Adaptive scalable help-desk', N'https://robohash.org/errorquodet.png?size=50x50&set=set1', N'bgranel', N'afrSvEJZEDu', N'bgranel@360.cn')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (23, N'Dagny', N'Sea', N'Menuma', N'Male', N'Japan', N'Customizable disintermediate secured line', N'https://robohash.org/consequaturtotamipsam.png?size=50x50&set=set1', N'dseam', N'RjHs4Ohp', N'dseam@vimeo.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (24, N'Bevin', N'Espinosa', N'Gio Linh', N'Male', N'Vietnam', N'Organic full-range toolset', N'https://robohash.org/quifacereperspiciatis.png?size=50x50&set=set1', N'bespinosan', N'p1w51SvmjG', N'bespinosan@naver.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (25, N'Kathye', N'McKinna', N'Gložan', N'Female', N'Serbia', N'Exclusive empowering challenge', N'https://robohash.org/estimpeditaliquid.bmp?size=50x50&set=set1', N'kmckinnao', N'N0Iu69', N'kmckinnao@harvard.edu')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (26, N'Riane', N'Slaight', N'Negotin', N'Female', N'Serbia', N'Multi-channelled background open architecture', N'https://robohash.org/estvoluptatempraesentium.jpg?size=50x50&set=set1', N'rslaightp', N'rLlH8yBYy7a', N'rslaightp@netvibes.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (27, N'Kiri', N'Dufton', N'Letsheng', N'Female', N'Botswana', N'Versatile clear-thinking moratorium', N'https://robohash.org/excepturirationevitae.png?size=50x50&set=set1', N'kduftonq', N'U4DHcElDc2', N'kduftonq@phoca.cz')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (28, N'Brunhilde', N'Shakshaft', N'Preobrazhenka', N'Female', N'Ukraine', N'Inverse tertiary forecast', N'https://robohash.org/quimolestiasquasi.jpg?size=50x50&set=set1', N'bshakshaftr', N'Ru7ZBf8uy', N'bshakshaftr@pinterest.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (29, N'Garvin', N'Thorbon', N'Wola Rebkowska', N'Male', N'Poland', N'Multi-channelled explicit array', N'https://robohash.org/perspiciatisanimidolor.png?size=50x50&set=set1', N'gthorbons', N'3iE6m4mBI6K', N'gthorbons@phpbb.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (30, N'Arnie', N'Elvey', N'Dianbu', N'Male', N'China', N'Stand-alone asymmetric synergy', N'https://robohash.org/autemmollitiaest.jpg?size=50x50&set=set1', N'aelveyt', N'x1ce7YaZUP', N'aelveyt@gmpg.org')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (31, N'Deeanne', N'Loxston', N'Seogeom-ri', N'Female', N'South Korea', N'Operative empowering productivity', N'https://robohash.org/eosautsunt.jpg?size=50x50&set=set1', N'dloxstonu', N'zHsDcXCwO', N'dloxstonu@histats.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (32, N'Vail', N'Dunmore', N'Hufang', N'Male', N'China', N'Phased value-added utilisation', N'https://robohash.org/deseruntrecusandaemagnam.bmp?size=50x50&set=set1', N'vdunmorev', N'aV34Tpd', N'vdunmorev@hc360.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (33, N'Tate', N'Proud', N'Cisantri', N'Female', N'Indonesia', N'Organized asymmetric initiative', N'https://robohash.org/molestiaeexercitationemautem.bmp?size=50x50&set=set1', N'tproudw', N'OcZVxraS', N'tproudw@slashdot.org')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (34, N'De witt', N'Skrine', N'Samphanthawong', N'Male', N'Thailand', N'Team-oriented heuristic open architecture', N'https://robohash.org/sitquibusdamex.png?size=50x50&set=set1', N'dskrinex', N'hEaLJTkVoRe', N'dskrinex@ihg.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (35, N'Ailina', N'Spreull', N'Puerto Francisco de Orellana', N'Female', N'Ecuador', N'Persistent cohesive interface', N'https://robohash.org/ipsasedducimus.png?size=50x50&set=set1', N'aspreully', N'PyEZePeLkO', N'aspreully@archive.org')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (36, N'Karin', N'Couronne', N'Melchor Ocampo', N'Female', N'Mexico', N'Open-source exuding functionalities', N'https://robohash.org/porrosapienteeius.png?size=50x50&set=set1', N'kcouronnez', N'5qRrmPrnHrD', N'kcouronnez@blogtalkradio.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (37, N'Zorine', N'Beel', N'Algueirão', N'Female', N'Portugal', N'Reactive solution-oriented open system', N'https://robohash.org/utquameaque.png?size=50x50&set=set1', N'zbeel10', N'l2biLJkL43r', N'zbeel10@studiopress.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (38, N'Bruno', N'Fairpool', N'Banjar Dauhpura', N'Male', N'Indonesia', N'Implemented 24/7 hierarchy', N'https://robohash.org/placeatnostrumet.jpg?size=50x50&set=set1', N'bfairpool11', N'OFcX7eOtBtvi', N'bfairpool11@privacy.gov.au')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (39, N'Ellene', N'Quinane', N'Machalí', N'Female', N'Chile', N'Triple-buffered value-added encoding', N'https://robohash.org/nonmagnamut.jpg?size=50x50&set=set1', N'equinane12', N'D9I4mdS', N'equinane12@adobe.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (40, N'Sol', N'Martinyuk', N'Shangfang', N'Male', N'China', N'Horizontal 6th generation adapter', N'https://robohash.org/culpafacerereprehenderit.jpg?size=50x50&set=set1', N'smartinyuk13', N'y0ohN62lw3h', N'smartinyuk13@mac.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (41, N'Maia', N'McIlwrath', N'Áno Merá', N'Female', N'Greece', N'Cross-platform secondary standardization', N'https://robohash.org/quisquamconsequaturodio.png?size=50x50&set=set1', N'mmcilwrath14', N'bmrLh6BQM0K', N'mmcilwrath14@buzzfeed.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (42, N'Silvio', N'McMurthy', N'Ciudad Guayana', N'Male', N'Venezuela', N'Integrated explicit concept', N'https://robohash.org/oditvelitnumquam.bmp?size=50x50&set=set1', N'smcmurthy15', N'6Ezr3KYUtjv', N'smcmurthy15@vk.com')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (43, N'Fanchon', N'Kempshall', N'Carenang Lor', N'Female', N'Indonesia', N'Diverse motivating task-force', N'https://robohash.org/culpaoditdoloremque.bmp?size=50x50&set=set1', N'fkempshall16', N'd45mNQ', N'fkempshall16@simplemachines.org')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (44, N'Gilberta', N'Webley', N'Vlissingen', N'Female', N'Netherlands', N'Triple-buffered mission-critical methodology', N'https://robohash.org/nonatqueet.jpg?size=50x50&set=set1', N'gwebley17', N'Z7wYLTYYLJ', N'gwebley17@amazon.co.uk')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (45, N'Alta', N'Hardeman', N'Padangpanjang', N'Female', N'Indonesia', N'Front-line dedicated pricing structure', N'https://robohash.org/nobissuntmagni.bmp?size=50x50&set=set1', N'ahardeman18', N'bovwSPc', N'ahardeman18@google.nl')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (46, N'Fredericka', N'Rosario', N'El Zapote', N'Female', N'Mexico', N'Pre-emptive directional complexity', N'https://robohash.org/optiominusea.png?size=50x50&set=set1', N'frosario19', N'Toi9MX9', N'frosario19@stanford.edu')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (47, N'Jdavie', N'Melarkey', N'Tebingtinggi', N'Male', N'Indonesia', N'Ameliorated executive algorithm', N'https://robohash.org/sequiofficiamodi.bmp?size=50x50&set=set1', N'jmelarkey1a', N'gMSnpa', N'jmelarkey1a@who.int')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (48, N'Cassi', N'Hagley', N'Barta‘ah ash Sharqiyah', N'Female', N'Palestinian Territory', N'Face to face exuding framework', N'https://robohash.org/totamrepellataliquid.jpg?size=50x50&set=set1', N'chagley1b', N'AuXbdgA', N'chagley1b@msu.edu')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (49, N'Zilvia', N'Drust', N'Räpina', N'Female', N'Estonia', N'Inverse zero defect hub', N'https://robohash.org/autemdolorsed.bmp?size=50x50&set=set1', N'zdrust1c', N'Pg8I1Np', N'zdrust1c@toplist.cz')
INSERT [user] ([user_id], [first_name], [last_name], [city], [gender], [country], [description], [profile_image], [username], [password], [email]) VALUES (50, N'Bernard', N'Pothecary', N'Bandar ‘Abbas', N'Male', N'Iran', N'Versatile tertiary functionalities', N'https://robohash.org/quodetdeserunt.png?size=50x50&set=set1', N'bpothecary1d', N'gYEedzi', N'bpothecary1d@newsvine.com')
SET IDENTITY_INSERT [user] OFF
SET IDENTITY_INSERT [post] ON 

INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (1, 1, N'/post/91d7556d1dc3c234d5d8abc8fc855aa105afb400', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (2, 2, N'/post/77d42243f45b3e2f5ff3bf6092b1ac29aa089cfa', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.

Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (3, 3, N'/post/4d581de0710ae4bcfb0503eb17ba0dc9d7d467b1', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (4, 4, N'/post/cb97cbfb2c6fda655b93050b7d3141faf8659134', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (5, 5, N'/post/7a0848f86df98357b2b82aa9283793a81ef59553', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (6, 6, N'/post/b12c75edec69d489d06789605a8a92ce92bd6e8c', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (7, 7, N'/post/ea6eeee5191fdb29a3b5a79cb802e733ad64f832', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (8, 8, N'/post/fb10461afcf6bdde835a0ebe1a21320c08a4c901', N'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (9, 9, N'/post/39b98d182ccfd5de641380ec8e055d0d3c363a06', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (10, 10, N'/post/66ebcce47aca4daccfbf82d29577641d630e288a', N'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.

Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (11, 11, N'/post/8f78e54505a0eb22ac6fbb6fe22fd10f6a3accab', N'Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (12, 12, N'/post/23530e531913214b57f6da644717e4a8700da56c', N'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (13, 13, N'/post/87a3291fa3d9920f7ceb1788b748e536b1a12756', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (14, 14, N'/post/bf037f478b2f09ab5750023422bdd5b7b45e7f6d', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.

Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (15, 15, N'/post/1e809aa02fb69643e03a3407a354121aeba50101', N'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.

Phasellus in felis. Donec semper sapien a libero. Nam dui.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (16, 16, N'/post/82a8c8b6666b561fbf6d8ad4d06cd00b3d664d92', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (17, 17, N'/post/c597f7ddf332d539ddd10bbe6435c68f05963fdd', N'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.

Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (18, 18, N'/post/ee365d2dba2b5b8f1947ccce65c88cf39a929f9d', N'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.

Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (19, 19, N'/post/f79b447dc371a923aab388f00f4f742ff0ddb833', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (20, 20, N'/post/cfa39ed405d8e7a7f4ebd9bf61e072678e0baedf', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (21, 21, N'/post/80ccad50b2d1805e1fbd54cb87583805e0147a4e', N'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.

Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.

Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (22, 22, N'/post/81f4a3e9eed56d79cf0cb76e4229e7edb4a0c256', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (23, 23, N'/post/be65207a4a901cb8a5a3769aacc4de4062c5b2d1', N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (24, 24, N'/post/47216707c2d92367f3e9480385f19103ebcc26f4', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (25, 25, N'/post/d2b4151730d9e3e3551012636a6561c4d4a8aa3e', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (26, 26, N'/post/4d786f7eeb409d10df236ae76d7e59622729695f', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (27, 27, N'/post/1bcf9ab7e2fbb647fb36b5ad4251e6a43fd9927e', N'Phasellus in felis. Donec semper sapien a libero. Nam dui.

Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.

Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (28, 28, N'/post/105ce9ed723c025f8dd5f470b0668c0dac1597f5', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (29, 29, N'/post/5b366f1ddf2d4325590678304e764e25a36299f4', N'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (30, 30, N'/post/55159c7547b8be4c5ae630d78b881e11ce9ccf19', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (31, 31, N'/post/b71b1508a25c74ff480bee1639ab4764cd8b9d30', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (32, 32, N'/post/ffb8ee4e8b7919ff2da6ae97ff11ed12ef139674', N'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (33, 33, N'/post/47ccd039edf075f180b2652603ec1d4107d30f88', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.stibulum sed magna at nunc commodo placerat.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (34, 34, N'/post/eca74b273782edb70599c51005b95968b103b3ef', N'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (35, 35, N'/post/624b776a12a1c661f8738da84b25a8b5486ab6bb', N'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (36, 36, N'/post/099307283d8d2c83ac749e9c71a98bbe189fbd91', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (37, 37, N'/post/9cbada1daf1c1fcd96dd04f0a3516e983128b7ac', N'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.

Fusce consequat. Nulla nisl. Nunc nisl.

Duis bibendum, felis sed interdum venenatis, turpis enim blandit, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (38, 38, N'/post/b5e071adf0b7ec506b959e38546ab87182f83b14', N'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.

In congue. Etiam justo. Etiam pretium iaculis justo.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (39, 39, N'/post/fff16eec0369510453c64c6d7688ecab9b54a84b', N'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.

Nullam sit amet turpis elementum ligula vehicula consequat. Morb ipsum. Integer a nibh.

In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor nulla ultrices aliquet.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (40, 40, N'/post/d4f12d1d9cda6217f5c7e426536fb792c4c5e1e3', N'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.

Morbi non lectus. Aliquam sit amet diam in magna bibendum imperd. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (41, 41, N'/post/fcd9467e08e1c9a0bccc7cda7680af4a4d01b890', N'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.

Quisque porta volutpat erat. Quisque erat eros, viverra eget, coe eget, semper rutrum, nulla. Nunc purus.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (42, 42, N'/post/f69e2ef7b38d3baad78093a480255b39001c99f1', N'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.

Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.stibulum sed magna at nunc commodo placerat.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (43, 43, N'/post/5ff13e05375e51b727d85cfaba0a0635eae54487', N'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.

Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerue, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.

Duis aliquam convallis nunc. Proin at turpis a pede posuere nonu. Integer non velit.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (44, 44, N'/post/3c77ac754723f562985166e76dcf3e8b613ea7f7', N'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (45, 45, N'/post/58142793325da5f486954919381ac54ad5a3f806', N'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (46, 46, N'/post/162bf8727647aff975f918f622b48f4674552e56', N'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nullacilisi.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (47, 47, N'/post/abf6fbfdc64b784a8fb78f0d8999cbe344713c53', N'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.

Maecenas leo odio, condimentum id, luctus nec, molestie sed, jus Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (48, 48, N'/post/bc970ec5d0b8d9794b36b05025c0b859ce28fcc0', N'In congue. Etiam justo. Etiam pretium iaculis justo.

In hac habitasse platea dictumst. Etiam faucibus cursus urna. Utllus.

Nulla ut erat id mauris vulputate elementum. Nullam varius. Nullacilisi.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (49, 49, N'/post/fe6b411a14909c38d46608487933dfe4e689aa1a', N'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.

Curabitur in libero ut massa volutpat convallis. Morbi odio odiolementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.')
INSERT [post] ([post_id], [user_id], [post_url], [caption]) VALUES (50, 50, N'/post/a713f2ba149a090f982ad866cd90b0035a412ed0', N'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.

Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.

Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.')
SET IDENTITY_INSERT [post] OFF
SET IDENTITY_INSERT [commentaire] ON 

INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (1, 1, 1, 1, N'Expanded demand-driven software', CAST(N'2019-06-11' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (2, 2, 2, 2, N'Visionary logistical leverage', CAST(N'2019-07-07' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (3, 3, 3, 3, N'Cloned regional product', CAST(N'2019-06-13' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (4, 4, 4, 4, N'Mandatory secondary migration', CAST(N'2019-05-30' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (5, 5, 5, 5, N'Multi-tiered disintermediate application', CAST(N'2019-05-18' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (6, 6, 6, 6, N'Upgradable incremental contingency', CAST(N'2019-06-20' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (7, 7, 7, 7, N'Quality-focused system-worthy intranet', CAST(N'2019-11-27' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (8, 8, 8, 8, N'Stand-alone system-worthy initiative', CAST(N'2019-11-19' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (9, 9, 9, 9, N'Future-proofed radical knowledge user', CAST(N'2019-04-22' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (10, 10, 10, 10, N'Cross-group radical core', CAST(N'2019-08-22' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (11, 11, 11, 11, N'Mandatory full-range conglomeration', CAST(N'2019-05-31' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (12, 12, 12, 12, N'Business-focused 24 hour attitude', CAST(N'2019-06-12' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (13, 13, 13, 13, N'Sharable cohesive analyzer', CAST(N'2019-12-04' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (14, 14, 14, 14, N'Integrated reciprocal ability', CAST(N'2019-04-01' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (15, 15, 15, 15, N'Realigned interactive methodology', CAST(N'2019-11-07' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (16, 16, 16, 16, N'Object-based responsive alliance', CAST(N'2019-07-02' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (17, 17, 17, 17, N'Upgradable real-time analyzer', CAST(N'2019-08-04' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (18, 18, 18, 18, N'Centralized asymmetric interface', CAST(N'2019-09-16' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (19, 19, 19, 19, N'Programmable 5th generation encoding', CAST(N'2019-07-01' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (20, 20, 20, 20, N'Digitized human-resource system engine', CAST(N'2019-06-27' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (21, 21, 21, 21, N'Team-oriented responsive application', CAST(N'2019-04-04' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (22, 22, 22, 22, N'Compatible neutral matrices', CAST(N'2019-12-05' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (23, 23, 23, 23, N'Synergized bi-directional benchmark', CAST(N'2019-07-17' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (24, 24, 24, 24, N'Grass-roots optimal function', CAST(N'2019-05-14' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (25, 25, 25, 25, N'Open-source transitional success', CAST(N'2019-08-14' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (26, 26, 26, 26, N'Down-sized tangible collaboration', CAST(N'2019-12-08' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (27, 27, 27, 27, N'Team-oriented value-added emulation', CAST(N'2019-07-27' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (28, 28, 28, 28, N'Re-engineered hybrid frame', CAST(N'2019-09-12' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (29, 29, 29, 29, N'Front-line fault-tolerant workforce', CAST(N'2019-10-31' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (30, 30, 30, 30, N'Optional high-level utilisation', CAST(N'2019-07-29' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (31, 31, 31, 31, N'Networked impactful open architecture', CAST(N'2020-01-24' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (32, 32, 32, 32, N'Fundamental 24 hour access', CAST(N'2019-12-18' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (33, 33, 33, 33, N'Digitized coherent software', CAST(N'2019-05-24' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (34, 34, 34, 34, N'Organized dynamic attitude', CAST(N'2019-05-15' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (35, 35, 35, 35, N'Persevering leading edge moderator', CAST(N'2019-12-20' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (36, 36, 36, 36, N'Synchronised well-modulated throughput', CAST(N'2020-02-17' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (37, 37, 37, 37, N'Innovative coherent workforce', CAST(N'2020-01-06' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (38, 38, 38, 38, N'Cross-platform empowering access', CAST(N'2020-02-24' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (39, 39, 39, 39, N'Object-based explicit hardware', CAST(N'2019-06-14' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (40, 40, 40, 40, N'Sharable dedicated methodology', CAST(N'2019-08-01' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (41, 41, 41, 41, N'Persistent full-range success', CAST(N'2019-08-13' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (42, 42, 42, 42, N'Automated intermediate implementation', CAST(N'2019-06-21' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (43, 43, 43, 43, N'Reverse-engineered mission-critical approach', CAST(N'2019-09-29' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (44, 44, 44, 44, N'Enterprise-wide 4th generation utilisation', CAST(N'2019-04-08' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (45, 45, 45, 45, N'Horizontal human-resource groupware', CAST(N'2019-09-09' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (46, 46, 46, 46, N'Organic heuristic system engine', CAST(N'2019-09-08' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (47, 47, 47, 47, N'Reverse-engineered reciprocal portal', CAST(N'2020-02-07' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (48, 48, 48, 48, N'Ameliorated explicit ability', CAST(N'2019-10-25' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (49, 49, 49, 49, N'Visionary background array', CAST(N'2019-09-13' AS Date))
INSERT [commentaire] ([post_id], [user_id], [commentaire_id], [tagged_user_id], [message], [date_created]) VALUES (50, 50, 50, 50, N'Organized multi-tasking middleware', CAST(N'2019-09-08' AS Date))
SET IDENTITY_INSERT [commentaire] OFF
INSERT [like] ([user_id], [post_id]) VALUES (1, 1)
INSERT [like] ([user_id], [post_id]) VALUES (2, 2)
INSERT [like] ([user_id], [post_id]) VALUES (3, 3)
INSERT [like] ([user_id], [post_id]) VALUES (4, 4)
INSERT [like] ([user_id], [post_id]) VALUES (5, 5)
INSERT [like] ([user_id], [post_id]) VALUES (6, 6)
INSERT [like] ([user_id], [post_id]) VALUES (7, 7)
INSERT [like] ([user_id], [post_id]) VALUES (8, 8)
INSERT [like] ([user_id], [post_id]) VALUES (9, 9)
INSERT [like] ([user_id], [post_id]) VALUES (10, 10)
INSERT [like] ([user_id], [post_id]) VALUES (11, 11)
INSERT [like] ([user_id], [post_id]) VALUES (12, 12)
INSERT [like] ([user_id], [post_id]) VALUES (13, 13)
INSERT [like] ([user_id], [post_id]) VALUES (14, 14)
INSERT [like] ([user_id], [post_id]) VALUES (15, 15)
INSERT [like] ([user_id], [post_id]) VALUES (16, 16)
INSERT [like] ([user_id], [post_id]) VALUES (17, 17)
INSERT [like] ([user_id], [post_id]) VALUES (18, 18)
INSERT [like] ([user_id], [post_id]) VALUES (19, 19)
INSERT [like] ([user_id], [post_id]) VALUES (20, 20)
INSERT [like] ([user_id], [post_id]) VALUES (21, 21)
INSERT [like] ([user_id], [post_id]) VALUES (22, 22)
INSERT [like] ([user_id], [post_id]) VALUES (23, 23)
INSERT [like] ([user_id], [post_id]) VALUES (24, 24)
INSERT [like] ([user_id], [post_id]) VALUES (25, 25)
INSERT [like] ([user_id], [post_id]) VALUES (26, 26)
INSERT [like] ([user_id], [post_id]) VALUES (27, 27)
INSERT [like] ([user_id], [post_id]) VALUES (28, 28)
INSERT [like] ([user_id], [post_id]) VALUES (29, 29)
INSERT [like] ([user_id], [post_id]) VALUES (30, 30)
INSERT [like] ([user_id], [post_id]) VALUES (31, 31)
INSERT [like] ([user_id], [post_id]) VALUES (32, 32)
INSERT [like] ([user_id], [post_id]) VALUES (33, 33)
INSERT [like] ([user_id], [post_id]) VALUES (34, 34)
INSERT [like] ([user_id], [post_id]) VALUES (35, 35)
INSERT [like] ([user_id], [post_id]) VALUES (36, 36)
INSERT [like] ([user_id], [post_id]) VALUES (37, 37)
INSERT [like] ([user_id], [post_id]) VALUES (38, 38)
INSERT [like] ([user_id], [post_id]) VALUES (39, 39)
INSERT [like] ([user_id], [post_id]) VALUES (40, 40)
INSERT [like] ([user_id], [post_id]) VALUES (41, 41)
INSERT [like] ([user_id], [post_id]) VALUES (42, 42)
INSERT [like] ([user_id], [post_id]) VALUES (43, 43)
INSERT [like] ([user_id], [post_id]) VALUES (44, 44)
INSERT [like] ([user_id], [post_id]) VALUES (45, 45)
INSERT [like] ([user_id], [post_id]) VALUES (46, 46)
INSERT [like] ([user_id], [post_id]) VALUES (47, 47)
INSERT [like] ([user_id], [post_id]) VALUES (48, 48)
INSERT [like] ([user_id], [post_id]) VALUES (49, 49)
INSERT [like] ([user_id], [post_id]) VALUES (50, 50)


ALTER DATABASE [FriendZone] SET  READ_WRITE 
GO
ALTER TABLE  [commentaire] WITH CHECK CHECK CONSTRAINT ALL
ALTER TABLE  [like] WITH CHECK CHECK CONSTRAINT ALL
ALTER TABLE  [post] WITH CHECK CHECK CONSTRAINT ALL


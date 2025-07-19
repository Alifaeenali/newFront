create database newFront; 
use newFront; 

create table navSection(
id int primary key, 
navLogo blob(1000), 
anchor1 varchar(200),
anchor2 varchar(200),
anchor3 varchar(200),
dropdown1 varchar(200),
dropdown2 varchar(200),
navbtn varchar(200)
);

alter table navSection
modify column navLogo varchar(1000); 
insert into navSection values(1,'NEWTECH' ,'Solutions', 'FAQs','Connect', 'Match Making(Live Now', 'Upcomming Solutions (Comming Soon)', 'Book Demo'); 

create table heroSection(
id int primary key, 
heroImg varchar(500),
heroHead1 varchar(200), 
heroHead2 varchar(200), 
heroPara varchar(1000)
);

update heroSection
set heroImg = 'static/assets/images/hero.png'
where id = 1; 

insert into heroSection values(1, 'static\assets\images\hero.png', 'De-Risking', 'Human Progress', 'With elite insurance expertise empowered by breakthrough technology, Newfront is the modern insurance brokerage for the 21st century.');

create table clientTrust(
id int primary key, 
clientHead varchar(200), 
clientDscp varchar(200), 
clImg1 varchar(500), 
clImg2 varchar(500), 
clImg3 varchar(500), 
clImg4 varchar(500), 
clImg5 varchar(500), 
clImg6 varchar(500), 
clImg7 varchar(500), 
clImg8 varchar(500), 
clImg9 varchar(500)
);
update clientTrust
set clImg2 = 'static/assets/images/client3.webp',
    clImg4 = 'static/assets/images/client4.webp',
    clImg7 = 'static/assets/images/client7.webp'
where id = 1; 

insert into clientTrust values(1, 'Clients Trust Newfront', 'Our experts consult with companies across all growth stages on strategies that align with their benefits philosophy.', 'static\assets\images\client1.png', 'static\assets\images\client2.webp', 'static\assets\images\client3.png', 'static\assets\images\client4.webp', 'static\assets\images\client5.png', 'static\assets\images\client6.png', 'static\assets\images\client7.webp', 'static\assets\images\client8.png', 'static\assets\images\client9.webp');

create table innovationSection(
id int primary key, 
innovationh5 varchar(100),
innovationh1 varchar(100),
innoavtionh2 varchar(100), 
innovationPara varchar(500), 
innovationl1 varchar(500),
innovationl2 varchar(500),  
innovationl3 varchar(500),  
innovationl4 varchar(500),  
innovationVideo varchar(500)
);
update innovationSection
set innovationVideo = 'static/assets/videos/a_new_course.webm'
where id = 1; 

insert into innovationSection values(1, 'IMPACTFUL INNOVATION', 'Charting ', 'New Course', 'We are bringing advanced technology to an antiquated industry, fostering transparency, convenience, and optimized client outcomes.', 'Business insurance clients can have 24/7 access to their entire insurance program including policies, losses, COIs, and billing, on any device through Newfront is connected dashboard', 'Total rewards clients can access benefit plans, compliance information, and secure documents in our centralized platform', 'Predictive analytics and proprietary benchmarking enable better carrier negotiations and informed decision-making', 'Multiple AI-enabled technology solutions continue to be developed, saving clients time and improving their experiences', 'static\assets\videos\a_new_course.webm'); 

create table ExperienceSection(
id int primary key, 
exph1 varchar(200), 
exph2 varchar(200), 
exph3 varchar(200), 
exppara varchar(500), 
expVideo varchar(500)
);

update ExperienceSection
set expVideo = 'static/assets/videos/improve-experience.webm'
where id = 1; 

insert into ExperienceSection values(1, 'Using AI to', 'Improve the', 'Client Experience', 'Newfront is building breakthrough AI to drive client insights and free our teams to do the strategic work they were built to do.', 'static\assets\videos\improve-experience.webm');

create table StatsSection(
id int primary key, 
statHead varchar(100), 
statPara varchar(100), 
cardLogo1 varchar(100), 
cardLogo2 varchar(100), 
cardLogo3 varchar(100), 
cardHead1 varchar(100), 
cardHead2 varchar(100), 
cardHead3 varchar(100), 
cardPara1 varchar(100), 
cardPara2 varchar(100), 
cardPara3 varchar(100)
);

update StatsSection
set cardLogo1 = 'static/assets/images/stats1.png', 
	cardLogo2  = 'static/assets/images/stats2.png', 
    cardLogo3 = 'static/assets/images/stats3.png'
where id = 1; 

alter table StatsSection
modify column statPara varchar(1000),
modify column cardPara1 varchar(1000), 
modify column cardPara2 varchar(1000), 
modify column cardPara3 varchar(1000);
 
 insert into StatsSection values(1, 'By the Numbers', 'The data speaks for itself. From our large roster of established and growing clients to our stellar client retention rate—we build relationships that last.', 'static\assets\images\stats1.png', 'static\assets\images\stats2.png', 'static\assets\images\stats3.png', '$3.1B', '~20%', '500+', 'in annual premiums placed', 'U.S. unicorns represented', 'public company experience'); 
 
create table knowSection(
id int primary key, 
knowh1 varchar(100), 
know2 varchar(100), 
knowVideo varchar(200)
);

update knowSection
set knowVideo = 'static/assets/videos/get-to-know.webm'
where id = 1; 

insert into knowSection values(1, 'Get to Know', 'Newfront', 'static\assets\videos\get-to-know.webm');

create table ExploreSection(
id int primary key, 
exploreh1 varchar(200),
exploreh2 varchar(200),
exploreImg1 varchar(200),
exploreImg2 varchar(200),
exploreImg3 varchar(200),
exploreImg4 varchar(200),
exploreImg5 varchar(200),
exploreImg6 varchar(200),
exploreImg7 varchar(200),
exploreImg8 varchar(200),
exploreImg9 varchar(200)
);

update ExploreSection
set exploreImg1 = 'static/assets/images/explore1.webp', 
	exploreImg2 = 'static/assets/images/explore2.webp',
    exploreImg3 = 'static/assets/images/explore3.webp',
    exploreImg4 = 'static/assets/images/explore4.webp',
    exploreImg5 = 'static/assets/images/explore5.webp',
    exploreImg6 = 'static/assets/images/explore6.webp',
    exploreImg7 = 'static/assets/images/explore7.webp',
    exploreImg8 = 'static/assets/images/explore8.webp',
    exploreImg9 = 'static/assets/images/explore9.webp'

where id = 1; 

insert into ExploreSection values(1, 'Explore Our', 'Industries and Services', 'static\assets\images\explore1.webp', 'static\assets\images\explore2.webp', 'static\assets\images\explore3.webp', 'static\assets\images\explore4.webp', 'static\assets\images\explore5.webp', 'static\assets\images\explore6.webp', 'static\assets\images\explore7.webp', 'static\assets\images\explore8.webp', 'static\assets\images\explore9.webp');
























-- Drop the database if it exists to ensure a clean slate for recreation
DROP DATABASE IF EXISTS newFront;
CREATE DATABASE newFront;
USE newFront;

-- Table: navSection
CREATE TABLE navSection (
    id INT PRIMARY KEY,
    navLogo VARCHAR(1000),
    anchor1 VARCHAR(200),
    anchor2 VARCHAR(200),
    anchor3 VARCHAR(200),
    dropdown1 VARCHAR(200),
    dropdown2 VARCHAR(200),
    navbtn VARCHAR(200)
);

-- Table: heroSection
CREATE TABLE heroSection (
    id INT PRIMARY KEY,
    heroImg VARCHAR(500),
    heroHead1 VARCHAR(200),
    heroHead2 VARCHAR(200),
    heroPara VARCHAR(1000)
);

-- Table: clientTrust
CREATE TABLE clientTrust (
    id INT PRIMARY KEY,
    clientHead VARCHAR(200),
    clientDscp VARCHAR(200),
    clImg1 VARCHAR(500),
    clImg2 VARCHAR(500),
    clImg3 VARCHAR(500),
    clImg4 VARCHAR(500),
    clImg5 VARCHAR(500),
    clImg6 VARCHAR(500),
    clImg7 VARCHAR(500),
    clImg8 VARCHAR(500),
    clImg9 VARCHAR(500)
);

-- Table: innovationSection
CREATE TABLE innovationSection (
    id INT PRIMARY KEY,
    innovationh5 VARCHAR(100),
    innovationh1 VARCHAR(100),
    innovationh2 VARCHAR(100), -- Corrected typo 'innoavtionh2'
    innovationPara VARCHAR(500),
    innovationl1 VARCHAR(500),
    innovationl2 VARCHAR(500),
    innovationl3 VARCHAR(500),
    innovationl4 VARCHAR(500),
    innovationVideo VARCHAR(500)
);

-- Table: ExperienceSection
CREATE TABLE ExperienceSection (
    id INT PRIMARY KEY,
    exph1 VARCHAR(200),
    exph2 VARCHAR(200),
    exph3 VARCHAR(200),
    exppara VARCHAR(500),
    expVideo VARCHAR(500)
);

-- Table: StatsSection
CREATE TABLE StatsSection (
    id INT PRIMARY KEY,
    statHead VARCHAR(100),
    statPara VARCHAR(1000),
    cardLogo1 VARCHAR(100),
    cardLogo2 VARCHAR(100),
    cardLogo3 VARCHAR(100),
    cardHead1 VARCHAR(100),
    cardHead2 VARCHAR(100),
    cardHead3 VARCHAR(100),
    cardPara1 VARCHAR(1000),
    cardPara2 VARCHAR(1000),
    cardPara3 VARCHAR(1000)
);

-- Table: knowSection
CREATE TABLE knowSection (
    id INT PRIMARY KEY,
    knowh1 VARCHAR(100),
    know2 VARCHAR(100),
    knowVideo VARCHAR(200)
);

-- Table: ExploreSection
CREATE TABLE ExploreSection (
    id INT PRIMARY KEY,
    exploreh1 VARCHAR(200),
    exploreh2 VARCHAR(200),
    exploreImg1 VARCHAR(200),
    exploreImg2 VARCHAR(200),
    exploreImg3 VARCHAR(200),
    exploreImg4 VARCHAR(200),
    exploreImg5 VARCHAR(200),
    exploreImg6 VARCHAR(200),
    exploreImg7 VARCHAR(200),
    exploreImg8 VARCHAR(200),
    exploreImg9 VARCHAR(200)
);

-- Table: contactSection
CREATE TABLE contactSection (
    id INT PRIMARY KEY,
    contactHead VARCHAR(200),
    contactSubHead VARCHAR(500),
    firstNameLabel VARCHAR(100),
    lastNameLabel VARCHAR(100),
    jobTitleLabel VARCHAR(100),
    companyNameLabel VARCHAR(100),
    phoneNumberLabel VARCHAR(100),
    emailLabel VARCHAR(100),
    industryLabel VARCHAR(100),
    employeeNumLabel VARCHAR(100),
    helpQuestion VARCHAR(200),
    checkbox1Label VARCHAR(100),
    checkbox2Label VARCHAR(100),
    checkbox3Label VARCHAR(100),
    checkbox4Label VARCHAR(100),
    checkbox5Label VARCHAR(100),
    checkbox6Label VARCHAR(100),
    additionalDetailsLabel VARCHAR(100),
    submitButtonText VARCHAR(100),
    termsPolicyText VARCHAR(500),
    recaptchaText VARCHAR(500)
);

-- Table: footerSection
CREATE TABLE footerSection (
    id INT PRIMARY KEY,
    footerStatement VARCHAR(500),
    socialLink1Url VARCHAR(255),
    socialImg1 VARCHAR(255), -- Added to store the path for social media image 1
    socialLink2Url VARCHAR(255),
    socialImg2 VARCHAR(255), -- Added to store the path for social media image 2
    socialLink3Url VARCHAR(255),
    socialImg3 VARCHAR(255), -- Added to store the path for social media image 3
    socialLink4Url VARCHAR(255),
    socialImg4 VARCHAR(255), -- Added to store the path for social media image 4
    footerLink1Text VARCHAR(100),
    footerLink1Url VARCHAR(255),
    footerLink2Text VARCHAR(100),
    footerLink2Url VARCHAR(255),
    footerLink3Text VARCHAR(100),
    footerLink3Url VARCHAR(255),
    footerLink4Text VARCHAR(100),
    footerLink4Url VARCHAR(255),
    footerLink5Text VARCHAR(100),
    footerLink5Url VARCHAR(255),
    footerLink6Text VARCHAR(100),
    footerLink6Url VARCHAR(255),
    copyrightText VARCHAR(500),
    privacyLinkText VARCHAR(100),
    privacyLinkUrl VARCHAR(255),
    footerDescription TEXT
);

USE newFront;

-- Insert data into navSection
INSERT INTO navSection (id, navLogo, anchor1, anchor2, anchor3, dropdown1, dropdown2, navbtn) VALUES
(1, 'NEWTECH', 'Solutions', 'FAQs', 'Connect', 'Match Making(Live Now)', 'Upcoming Solutions (Coming Soon)', 'Book Demo');

-- Insert data into heroSection
INSERT INTO heroSection (id, heroImg, heroHead1, heroHead2, heroPara) VALUES
(1, 'static/assets/images/hero.png', 'De-Risking', 'Human Progress', 'With elite insurance expertise empowered by breakthrough technology, Newfront is the modern insurance brokerage for the 21st century.');

-- Insert data into clientTrust
INSERT INTO clientTrust (id, clientHead, clientDscp, clImg1, clImg2, clImg3, clImg4, clImg5, clImg6, clImg7, clImg8, clImg9) VALUES
(1, 'Clients Trust Newfront', 'Our experts consult with companies across all growth stages on strategies that align with their benefits philosophy.', 'static/assets/images/client1.png', 'static/assets/images/client2.webp', 'static/assets/images/client3.png', 'static/assets/images/client4.webp', 'static/assets/images/client5.png', 'static/assets/images/client6.png', 'static/assets/images/client7.webp', 'static/assets/images/client8.png', 'static/assets/images/client9.webp');

-- Insert data into innovationSection
INSERT INTO innovationSection (id, innovationh5, innovationh1, innovationh2, innovationPara, innovationl1, innovationl2, innovationl3, innovationl4, innovationVideo) VALUES
(1, 'IMPACTFUL INNOVATION', 'Charting ', 'New Course', 'We are bringing advanced technology to an antiquated industry, fostering transparency, convenience, and optimized client outcomes.', 'Business insurance clients can have 24/7 access to their entire insurance program including policies, losses, COIs, and billing, on any device through Newfront is connected dashboard', 'Total rewards clients can access benefit plans, compliance information, and secure documents in our centralized platform', 'Predictive analytics and proprietary benchmarking enable better carrier negotiations and informed decision-making', 'Multiple AI-enabled technology solutions continue to be developed, saving clients time and improving their experiences', 'static/assets/videos/a_new_course.webm');

-- Insert data into ExperienceSection
INSERT INTO ExperienceSection (id, exph1, exph2, exph3, exppara, expVideo) VALUES
(1, 'Using AI to', 'Improve the', 'Client Experience', 'Newfront is building breakthrough AI to drive client insights and free our teams to do the strategic work they were built to do.', 'static/assets/videos/improve-experience.webm');

-- Insert data into StatsSection
INSERT INTO StatsSection (id, statHead, statPara, cardLogo1, cardLogo2, cardLogo3, cardHead1, cardHead2, cardHead3, cardPara1, cardPara2, cardPara3) VALUES
(1, 'By the Numbers', 'The data speaks for itself. From our large roster of established and growing clients to our stellar client retention rate—we build relationships that last.', 'static/assets/images/stats1.png', 'static/assets/images/stats2.png', 'static/assets/images/stats3.png', '$3.1B', '~20%', '500+', 'in annual premiums placed', 'U.S. unicorns represented', 'public company experience');

-- Insert data into knowSection
INSERT INTO knowSection (id, knowh1, know2, knowVideo) VALUES
(1, 'Get to Know', 'Newfront', 'static/assets/videos/get-to-know.webm');

-- Insert data into ExploreSection
INSERT INTO ExploreSection (id, exploreh1, exploreh2, exploreImg1, exploreImg2, exploreImg3, exploreImg4, exploreImg5, exploreImg6, exploreImg7, exploreImg8, exploreImg9) VALUES
(1, 'Explore Our', 'Industries and Services', 'static/assets/images/explore1.webp', 'static/assets/images/explore2.webp', 'static/assets/images/explore3.webp', 'static/assets/images/explore4.webp', 'static/assets/images/explore5.webp', 'static/assets/images/explore6.webp', 'static/assets/images/explore7.webp', 'static/assets/images/explore8.webp', 'static/assets/images/explore9.webp');

-- Insert data into contactSection
INSERT INTO contactSection (
    id, contactHead, contactSubHead, firstNameLabel, lastNameLabel, jobTitleLabel,
    companyNameLabel, phoneNumberLabel, emailLabel, industryLabel, employeeNumLabel,
    helpQuestion, checkbox1Label, checkbox2Label, checkbox3Label, checkbox4Label,
    checkbox5Label, checkbox6Label, additionalDetailsLabel, submitButtonText,
    termsPolicyText, recaptchaText
) VALUES (
    1,
    'Get Started Today',
    'Schedule a consultation to see how Newfront can reduce your risk',
    'First name*',
    'Last name*',
    'Job Title*',
    'Company Name*',
    'Phone Number*',
    'Email*',
    'Industry*',
    'Number of employee*',
    'How can we help?*',
    'Employee Benefits',
    'Retirement Services',
    'HR Services',
    'Personal Lines',
    'Wholesale Benefits',
    'Asset Protection Program (APP)',
    'Additional Details',
    'Submit',
    'By submitting, you agree to our <a href="#">terms</a> and <a href="#">Policy</a>.',
    'This site is protected by reCAPTCHA and the Google <a href="#">Privacy Policy</a>, and <a href="#">Term of Service</a> apply.'
);

-- Insert data into footerSection
-- IMPORTANT: I've used placeholder image paths for socialImg1, socialImg2, socialImg3, socialImg4.
-- You'll need to replace these with the actual paths to your social media icons.
INSERT INTO footerSection (
    id, footerStatement,
    socialLink1Url, socialImg1,
    socialLink2Url, socialImg2,
    socialLink3Url, socialImg3,
    socialLink4Url, socialImg4,
    footerLink1Text, footerLink1Url,
    footerLink2Text, footerLink2Url,
    footerLink3Text, footerLink3Url,
    footerLink4Text, footerLink4Url,
    footerLink5Text, footerLink5Url,
    footerLink6Text, footerLink6Url,
    copyrightText, privacyLinkText, privacyLinkUrl, footerDescription
) VALUES (
    1,
    'A Brokerage For<br>The 21st Century',
    '#', 'static/assets/images/fbimg.png', -- Placeholder for socialImg1 (LinkedIn)
    '#', 'static/assets/images/image.png',  -- Placeholder for socialImg2 (Twitter/X)
    '#', 'static/assets/images/insta.png', -- Placeholder for socialImg3 (Facebook)
    '#', 'static/assets/images/twitter.png',-- Placeholder for socialImg4 (Instagram)
    'Press', '#',
    'Careers', '#',
    'Events', '#',
    'Contact', '#',
    'Insights', '#',
    'Logins', '#',
    '&copy; 2023-2025 NEWFRONT,-License #CH45768',
    'Privacy', '#',
    'We are transforming the risk management business insurance, and are providing our customers with the best solution guided through AI and statistics.'
);
-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2023 at 11:30 AM
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
-- Database: `web_tech`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders1`
--

CREATE TABLE `orders1` (
  `orderId` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders1`
--

INSERT INTO `orders1` (`orderId`, `total`) VALUES
(1, 10380),
(9, 14770);

-- --------------------------------------------------------

--
-- Table structure for table `orders2`
--

CREATE TABLE `orders2` (
  `orderId` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders2`
--

INSERT INTO `orders2` (`orderId`, `pid`, `quantity`) VALUES
(1, 14, 1),
(1, 13, 1),
(9, 23, 2),
(9, 18, 2),
(9, 26, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `pid` int(11) NOT NULL,
  `pname` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `price` int(11) NOT NULL,
  `category` enum('processor','motherboard','cooler','ram','graphics','ssd','hdd','psu','cabinet','keyboard','mouse','mousepad','monitor') DEFAULT NULL,
  `brand` varchar(20) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`pid`, `pname`, `description`, `price`, `category`, `brand`, `image`) VALUES
(2, 'Asus ROG Strix X670E-A Gaming WiFi', 'Suit up for the next gen with the stylish ROG Strix X670E-A Gaming WiFi. Its black PCB and white accents neatly contrast silver-colored heatsinks that emphasize premium power delivery for AMD Ryzen™ 7000 Series processors. Exclusive ROG overclocking utilities, full PCIe 5.0 capabilities, and DDR5 support are woven in alongside, adding uniquely tailored performance and AM5 essentials to your gaming build.', 41810, 'motherboard', 'asus', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2023/01/Asus-ROG-Strix-X670E-A-Gaming-WiFi.webp?fit=600%2C600&ssl=1'),
(3, 'Gigabyte Z790 UD AX (Wi-Fi) (DDR5)', 'With the fast-moving technology changes, GIGABYTE always follows the latest trends and provides customers with advanced features and latest technologies. GIGABYTE motherboards are equipped with upgraded power solution, latest storage standards and outstanding connectivity to enable optimized performance for gaming.', 25730, 'motherboard', 'gigabyte', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2023/01/Gigabyte-Z790-UD-AX-Wi-Fi-DDR5.webp?fit=600%2C600&ssl=1'),
(4, 'MSI MEG Z790 ACE (Wi-Fi) (DDR5)', 'Supports 12th/ 13th Gen Intel® Core™, Pentium® Gold and Celeron® processors for LGA 1700 socket Supports DDR5 Memory, Dual Channel DDR5 7800+MHz (OC) Dual Thunderbolt 4 ports: Thunderbolt USB-C at true 40 Gb/s speeds, 8K display support, Daisy-Chaining and Multi-Port Accessory Architecture provide reliable connectivity and better user experience. Extreme Power Design: 24+1+2 phases power design with 105A Smart Power Stage and dual CPU power connectors are ready to unleash the maximum performance', 68190, 'motherboard', 'msi', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2023/04/MSI-MEG-Z790-ACE-Wi-Fi.webp?fit=600%2C600&ssl=1'),
(5, 'ASUS Dual RTX 3060 OC Edition 8GB', 'Featuring the latest NVIDIA® Ampere architecture, ASUS Dual GeForce RTX™ 3060 fuses dynamic thermal performance with broad compatibility. Advanced cooling solutions from flagship graphics cards — including two Axial-tech fans for maximizing airflow to the heatsink — are packed into the 20 cm long, 2-slot card, delivering more power in less space. These enhancements make ASUS Dual the perfect choice for gamers who want heavyweight graphics performance in a compact build.', 28490, 'graphics', 'asus', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2023/04/ASUS-Dual-GeForce-RTX-3060-OC-Edition-8GB.jpg?fit=1000%2C1000&ssl=1'),
(6, 'Gigabyte RTX 3050 Gaming OC 8GB', 'NVIDIA Ampere Streaming Multiprocessors\r\n2nd Generation RT Cores\r\n3rd Generation Tensor Cores\r\nPowered by GeForce RTX™ 3050\r\nIntegrated with 8GB GDDR6 128-bit memory interface\r\nWINDFORCE 3X Cooling System with alternate spinning fans\r\nRGB Fusion 2.0\r\nProtection metal back plate', 29490, 'graphics', 'gigabyte', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2022/08/Gigabyte-RTX-3050-Gaming-OC-LHR-8GB.webp?fit=600%2C600&ssl=1'),
(7, 'MSI RX 7900 XT Gaming Trio Classic 20GB', 'AMD Radeon™ RX 7000 Series graphics cards set a new standard for ultra-enthusiast class gaming performance. Featuring advanced AMD RDNA™ 3 compute units, blazing fast clock speeds, and chiplet technology to enable fluid, high-refresh rate gaming experiences. Breakthrough new levels of performance with up to 24GB of GDDR6 memory and 2nd generation AMD Infinity Cache™ to deliver an incredible experience at 4K and beyond.', 94990, 'graphics', 'msi', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2023/04/MSI-RX-7900-XT-Gaming-Trio-Classic-20GB.webp?fit=600%2C600&ssl=1'),
(8, 'Corsair Dominator Platinum RGB DDR5 32GB (16GBx2) 5600MHz RAM (White)', 'In the many-core era, the unprecedented processing speed of DDR5 ensures your high-end CPU gets data quickly with ease. Whether you are gaming, creating content, opening 100 tabs, or multi-tasking, your PC can power through complex tasks faster than ever before. You have the power and the control. Built-in voltage regulation with iCUE software control makes for easier, finely-tuned output that provides more stable overclocking than ever.', 17990, 'ram', 'corsair', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2023/03/Corsair-Dominator-Platinum-RGB-DDR5-32GB-16GBx2-5600MHz-RAM-White.webp?fit=600%2C600&ssl=1'),
(9, 'G.Skill Ripjaws V 8GB (8GBx1) DDR4 3200MHz', 'As the latest addition to the classic Ripjaws family, Ripjaws V series is the newest DDR4 memory designed for maximum compatibility and cutting-edge performance with the latest Intel® Core™ processors. Built with the finest components, tested under the most rigorous conditions, and offered in five color options, Ripjaws V is the perfect choice for building a new performance system or for a simple memory upgrade. Ripjaws V lets you enjoy a faster computing experience for gaming, video & image edi', 1890, 'ram', 'g.skill', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2022/02/G.Skill-Ripjaws-V-8GB-8GBx1-DDR4-3200MHz.webp?fit=600%2C600&ssl=1'),
(10, 'Adata XPG Spectrix D50 16GB (16GBx1) DDR4 3200MHz RGB RAM', 'Reaching speeds of up to 4133MHz and sporting a maximum capacity of 32GB, the XPG SPECTRIX D50 is a monster of a memory module. It also has looks to kill with an elegant geometric styling and a stunning triangular RGB light bar. Made with only the highest quality chips and PCBs, the D50 provides ultimate stability, reliability. What’s more, it supports the latest Intel and AMD platforms.', 3650, 'ram', 'adata', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2023/03/Adata-XPG-Spectrix-D50-16GB-16GBx1-DDR4-3200MHz-RGB-RAM-Tungsten-Grey.webp?fit=600%2C600&ssl=1'),
(11, 'Corsair ICUE H100i Elite Capellix', 'The CORSAIR iCUE H100i ELITE CAPELLIX Liquid CPU Cooler delivers powerful, low-noise cooling for your CPU, with a 240mm radiator, two CORSAIR ML120 RGB PWM fans, and an ultra-bright CAPELLIX RGB pump head.An optimal cold plate design and a high-density stack of 128 micro-skived fins-per-inch provides highly efficient cooling at all loads.', 11190, 'cooler', 'corsair', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2022/06/Corsair-ICUE-H100i-Elite-Capellix-CPU-Liquid-Cooler.webp?fit=600%2C600&ssl=1'),
(12, 'MSI MAG Coreliquid C360 ARGB\"', 'MSI\'s MAG CORELIQUID C360 is a real contender. Top-notch performance, a brilliant display of lighting, a look anyone will appreciate overall, and a cost that won\'t break the bank are all solid reasons to pick this over the vast array of options.The pump has been integrated into the radiator for sound dampening and noise reduction. Additionally, placing the pump into the radiator also increases the pump\'s life expectancy by moving it away from the heat source.', 9650, 'cooler', 'msi', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2022/12/MSI-MAG-Coreliquid-C360-ARGB.webp?fit=600%2C600&ssl=1'),
(13, 'Deepcool Gammaxx AG400 LED 120mm CPU Air Cooler', 'The DeepCool AG400 LED is a single tower 120mm CPU cooler that builds upon our legacy for high-quality cooling performance but stripped down for a streamlined and efficient package.Enjoy better system performance by keeping things cool with up to 220W of heat dissipation power featuring four direct touch heat pipes that rapidly draw heat away from the CPU.LGA1700/1200/1151/1150/1155 & AM5/AM4', 1890, 'cooler', 'deepcool', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2022/08/Deepcool-Gammaxx-AG400-LED-120mm-CPU-Air-Cooler.webp?fit=600%2C600&ssl=1'),
(14, 'Intel Core I3-12100F Desktop Processor', 'With 4 cores (8 threads), 4.30 GHz Max Turbo frequency, and based on Intel’s new micro architecture, the Core i3-12100F delivers amazingly smooth performance for a variety of home and office applications. It’s also future-proof with PCIe 5.0 and DDR5 support, making it well ready for next gen graphics and memory.Support for PCIe Gen 5 and DDR5 for high-performance components like memory and graphics.Thunderbolt 4 and Intel Killer Wi-Fi 6/6E (Gig+) deliver fast transfer speeds and connections to ', 8490, 'processor', 'intel', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2022/02/Intel-Core-I3-12100F-Desktop-Processor-4.webp?fit=600%2C600&ssl=1'),
(15, 'Intel Core I7-12700F Desktop Processor', 'The i7 12700F by Intel is a part of its 12th Generation Alder lake lineup for High desktops and workstations. It is powered by 8 high-power cores (Golden Cove Cores) and 4 power-efficient cores (Gracemont Cores) with the power-efficient Gracemont cores having a base clock of 1.6 GHz and a boost clock of 3.6 GHz on the other hand the high-performance golden cove cores have a base clock of 2.1 GHz and a boost clock of 4.9 GHz.', 28590, 'processor', 'intel', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2022/04/Intel-Core-I7-12700F-Desktop-Processor.webp?fit=600%2C600&ssl=1'),
(16, 'AMD Ryzen 3 3200G', 'Specifications of the AMD Ryzen 3 3200G processor dedicated to the desktop sector, it has 4 cores, 4 threads, a maximum frequency of 4.0GHz. The table below makes it possible to observe well the lithography, the number of transistors (if present), the offered cache memory, the maximum capacity of RAM memory that we can get, the type of compatible memory, the release date, the maximum number of PCIe lanes, the values obtained in the Passmark platform, Cinebench R23 and Geekbench 5.', 7990, 'processor', 'amd', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2022/03/Amd-Ryzen-3-3200G-APU.webp?fit=600%2C600&ssl=1'),
(17, 'AMD Ryzen 5 7600 Processor With Radeon Graphics', 'The Ryzen 5 7600X is a 6-core, 12-thread processor that clocks between 4.7 GHz and 5.3 GHz depending on the load, it\'s composed of a single 5nm Core Complex Die (CCD) along with a 6nm I/O die, packs 32MB of L3 cache, 6MB of L2, DDR5 support, 28 PCIe 5.0 lanes, a 105w TDP and is designed for the new AM5 socket. When compared to Zen 3, new Zen 4 CPUs boost peak clock speeds by 16% to 5.7 GHz', 23690, 'processor', 'amd', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2023/02/AMD-Ryzen-5-7600-Processor-With-Radeon-Graphics.webp?fit=600%2C600&ssl=1'),
(18, 'Western Digital Green SN350 240GB M.2 NVMe Internal SSD', 'The WD Green™ SN350 NVMe™ SSD can revitalize your old computer for daily use. Whether you’re in class, shopping, chatting or surfing, this drive can work up to four times faster2 than SATA drives. Because they have no moving parts, SSDs offer a shock-resistant design to help protect your important data against accidental bumps and drops. The slim M.2 2280 form factor allows for a quick and easy upgrade for any computer with an NVMe slot. Plus, with the downloadable Western Digital® SSD Dashboard', 1890, 'ssd', 'wd', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2022/10/Western-Digital-Green-SN350-240GB-M.2-NVMe-Internal-SSD.webp?fit=600%2C600&ssl=1'),
(19, 'Western Digital 480GB Green', 'For use in laptops and desktop computers, WD Green SSDs offer high performance and reliability to boost your daily computing activities. With comprehensive WD F.I.T. Lab™ certification, and available in 2.5”/7mm cased or M.2 2280 models, WD Green solid state drives are compatible with most PCs. The free WD SSD Dashboard lets you monitor your storage, and when combined with the 3-year limited warranty, upgrading your digital storage is worry-free.', 4100, 'ssd', 'wd', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2022/02/wds480g2g0a-image-01-600x600-1.webp?fit=600%2C600&ssl=1'),
(20, 'Crucial P5 Plus 1000GB M.2 NVMe Gen4', 'Are you ready for next-gen performance? The Crucial® P5 Plus SSD delivers remarkable speed and data protection with sequential reads up to 6600MB/s1 for transformative computing. Engineered by Micron® with the latest Gen4 NVMe technology, the Crucial P5 Plus includes advanced features like full hardware-based encryption, dynamic write acceleration, and adaptive thermal protection to keep your data safe while enhancing system reliability. Designed specifically for intensive workloads, high-qualit', 8890, 'ssd', 'crucial', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2022/06/Crucial-P5-Plus-1000GB-M.2-NVMe-Gen4-Internal-SSD.webp?fit=600%2C600&ssl=1'),
(21, 'Western Digital Blue 1TB 7200 RPM', 'Boost your PC storage with WD Blue drives, the brand designed specifically for desktop and all-in-one PCs. WD hard drives come with free access to WD Acronis True Image. Backup and restore functions make it easy to save and retrieve your personal data without the need to reinstall the OS. Safely positions the recording head off the disk surface to protect your data.', 3290, 'hdd', 'wd', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2022/02/Western-Digital-Blue-1TB-7200-RPM.webp?fit=600%2C600&ssl=1'),
(22, 'Western Digital Blue 4TB 5400 RPM', 'Boost your PC storage with WD Blue drives, the brand designed just for desktop and all-in-one PCs with a variety of storage capacities. Give your desktop a performance and storage boost when you combine your hard drive with an SSD to maximize speed of data access and a WD Blue drive for up to 6TB of additional capacity. NoTouch Ramp Load technology safely positions the recording head off the disk surface to help protect your data.', 7890, 'hdd', 'wd', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2022/02/Western-Digital-Blue-4TB-5400-RPM-Internal-Hard-Drive.webp?fit=600%2C600&ssl=1'),
(23, 'Cooler Master MWE 550 V2 80 Plus Bronze', 'The MWE Bronze V2 offers a simple, reliable way to power your system safely and efficiently at a low cost. The 80 PLUS Bronze efficiency rating, DC-to-DC + LLC circuit design, single +12V rail, active PFC, and temperature sensitive HDB fan offer a power supply unit that stays true to its original purpose. This PSU will handle all your core computing needs with none of the hassles or challenges of additional specialty features, software synchronization, or other bells and whistles. Just plug it i', 3870, 'psu', 'cooler master', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2022/02/mpe-5501-acabw-bin-image-main-600x600-1.webp?fit=600%2C600&ssl=1'),
(24, 'Corsair CX650F RGB Full Modular 80 Plus Bronze', '80 PLUS Bronze certified efficiency provides up to 88% operational efficiency, generating less heat and lowering your energy costs. Control RGB lighting at the push of a button, with ten preset lighting modes for eight individually addressable RGB LEDs built into a 120mm RGB fan.Connect to a CORSAIR iCUE RGB Lighting Controller (sold separately) or motherboard via the included 5V ARGB adapter for advanced RGB lighting control.', 5690, 'psu', 'corsair', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2023/03/Corsair-CX650F-RGB-80-Plus-Bronze-SMPS.webp?fit=600%2C600&ssl=1'),
(25, 'EVGA SuperNova 1000 GT 1000 Watt 80 Plus Gold', 'Introducing the EVGA SuperNOVA GT Series of power supplies – the newest addition to the outstanding line of EVGA Power Supplies. Featuring 80 Plus Gold certification, 100% Japanese capacitors, a fluid dynamic bearing fan, and a fully modular design, this power supply is built for long-term usage and durability. Building upon EVGA’s line of 80 Plus Gold rated power supplies, the EVGA GT Series combines all these features at a great price.The EVGA SuperNOVA GT uses a long-life 135mm fan with a Flu', 14490, 'psu', 'EVGA', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2022/08/EVGA-SuperNova-1000-GT-1000-Watt-80-Plus-Gold.webp?fit=600%2C600&ssl=1'),
(26, 'Ant Esports ICE-100 Auto RGB Cabinet (Black)', 'The Ant Esports ICE-100 is a mid-tower cabinet that seamlessly combines a bevy of gaming centric features such as high air flow, multiple storage options and USB 3.0 connectivity. Supporting upto ATX motherboard and ample of fan mounts the ICE-100 is perfect for building mainstream gaming system without compromising on essential features.Two 140mm Auto-RGB fans in the front and a single 120mm at the back come out of the box while the case can support a maximum of six 120mm fans simultaneously to', 3250, 'cabinet', 'Ant Esports', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2023/04/Ant-Esports-ICE-100-Auto-RGB.webp?fit=600%2C600&ssl=1'),
(27, 'Nzxt H7 Flow (E-ATX) Mid Tower Cabinet (White)', 'This mid-tower case is ready to bring the cool. Featuring a perforated front and top panel, alongside widened channels, hooks, straps, and toolless entry, this sleek case will keep any build cool and comfortable while offering plenty of space.Perforated front & top panels enable maximum thermal performance.Intuitive cable management system with wide channels, hooks, & straps\r\nTool-less access to front & side panels\r\nFront & top support radiators up to 360mm\r\nIncludes two F Series Quiet 120mm Fan', 12290, 'cabinet', 'Nzxt', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2022/12/Nzxt-H7-Flow-E-ATX-Mid-Tower-Cabinet-White.webp?fit=600%2C600&ssl=1'),
(28, 'Redragon Mitra K551 RGB Mechanical Gaming Keyboard Black', 'Gaming Keyboard: 104 Key Mechanical Gaming Keyboard with Custom Mechanical Switches(Cherry Blue equivalent) designed for longevity with greater durability and responsiveness.Fast mechanical keys with medium resistance, precise actuation, audible click sound, and tactile bump feedback.RGB Led illuminated keyboard comes with Double-shot injection molded keycaps offering crystal clear uniform backlighting and lettering that doesn’t scratch off; Featuring rainbow, RGB colors, 5 different lighting mo', 3390, 'keyboard', 'Redragon', 'https://cdn.shopify.com/s/files/1/0309/3679/3226/products/B019O8YZ4A.PT02_800x.jpg?v=1628502100'),
(29, 'Ant Esports MK1000 Blue Switches', '7-color backlight (each row has a different specific color), 6 preset lighting effects.Anti-ghosting 104 Keys. N-key rollover, Allowing multi-keys to work simultaneously with high speed. Each key is controlled by independent switch, let you enjoy high- grade games with fast response.Durable & Water-Resistant: The double-shot-molded ABS keycaps and brushed metal panel are extremely durable and abrasion-resistant', 1790, 'keyboard', 'Ant Esports', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2022/07/Ant-Esports-MK1000-Blue-Switches.webp?fit=600%2C600&ssl=1'),
(30, 'Ant Esports GM100 RGB Gaming Mouse (Black)', 'Ant Esports GM100 RGB gaming mouse with optical Sensor 1000 Hz Polling Rate 4800 Dpi for FPS and MOBA Games. Enhance your gaming with the perfectly designed and elegantly stylish-Ant Esports GM300 Optical Gaming Mouse featuring braided cables, 1000 polling rate, 4800 DPI gaming sensor, 5 colors LED Illumination mode and 7 buttons elegant look and durable switches designed for unlimited gaming.', 540, 'mouse', 'Ant Esports', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2022/07/Ant-Esports-GM100-RGB-Gaming-Mouse-Black.webp?fit=600%2C600&ssl=1'),
(31, 'Logitech G402 HYPERION FURY', 'The Logitech G402 Hyperion Fury is a gaming mouse that offers precise and fast tracking. It features Fusion Engine sensor technology for accurate tracking at high speeds, customizable buttons for quick access to commands, and an ergonomic design for comfort during long gaming sessions. With its high-performance features, it aims to enhance your gaming experience.', 2390, 'mouse', 'Logitech', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2022/07/Logitech-G402-HYPERION-FURY-2.webp?fit=600%2C600&ssl=1'),
(32, 'Acer Nitro VG240YS 24″ 1080p 165Hz IPS 1ms', '\r\nThe Acer Nitro VG240YS is a 24-inch gaming monitor that offers a host of features and specifications. It boasts a Full HD (1920x1080) IPS panel for vibrant and detailed visuals. With a 75Hz refresh rate and 1ms response time, it provides smooth and responsive gameplay. The monitor supports AMD FreeSync technology, reducing screen tearing and stuttering. It has a wide viewing angle of 178 degrees, ensuring consistent colors from various perspectives. Connectivity options include HDMI and Displa', 13990, 'monitor', 'Acer', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2022/07/Acer-Nitro-VG240YS.jpg?fit=500%2C500&ssl=1'),
(33, 'LG 27GN800-B 27″ 1440p 144Hz IPS 1ms', 'The LG 27GN800-B is a 27-inch gaming monitor packed with impressive features and specifications. It offers a QHD (2560x1440) IPS panel, delivering sharp and vibrant visuals. With a fast 144Hz refresh rate and 1ms response time, it ensures smooth and fluid gameplay. The monitor supports AMD FreeSync Premium technology, reducing tearing and stuttering for a more immersive experience. It has a wide color gamut, covering 99% of the sRGB color space, resulting in accurate and vivid color reproduction', 25990, 'monitor', 'LG', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2022/11/LG-27GN800-B.webp?fit=600%2C600&ssl=1'),
(35, 'Ant Esports MP505 RGB', '10 Chroma RGB Lighting Modes – 10 Lighting Modes. Including 3 Dynamic modes:1 rainbow and 2 breathing modes. 7 Static lighting modes : red,dark,blue,yellow,green,pink,white,ice blue. Get visually stunning display of colors and effects. Non-slip rubber base – Dense slip-resistant base can firmly grip the desktop to provide stable operation.\r\nConvenient and Easy – This backlit mouse pad is powered by USB and requires no driver to work.', 890, 'mousepad', 'Ant Esports', 'https://i0.wp.com/modxcomputers.com/wp-content/uploads/2022/07/Ant-Esports-MP505-RGB-Small.webp?fit=600%2C600&ssl=1');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `cid` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`cid`, `name`, `email`, `password`) VALUES
(1, 'edgar', 'edgar@gmail.com', 'edgar123'),
(2, 'john smith', 'john@gmail.com', 'john123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders1`
--
ALTER TABLE `orders1`
  ADD PRIMARY KEY (`orderId`);

--
-- Indexes for table `orders2`
--
ALTER TABLE `orders2`
  ADD KEY `cs2` (`pid`),
  ADD KEY `cs1` (`orderId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`cid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders1`
--
ALTER TABLE `orders1`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders2`
--
ALTER TABLE `orders2`
  ADD CONSTRAINT `cs1` FOREIGN KEY (`orderId`) REFERENCES `orders1` (`orderId`) ON DELETE CASCADE,
  ADD CONSTRAINT `cs2` FOREIGN KEY (`pid`) REFERENCES `products` (`pid`),
  ADD CONSTRAINT `cs3` FOREIGN KEY (`orderId`) REFERENCES `orders1` (`orderId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

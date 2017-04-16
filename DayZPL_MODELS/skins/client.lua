local replace = {
--Балаклава Акула
--{"1.txd","1.dff",2001},
--Балаклава коричнева
--{"2.txd","1.dff",2002},
--Балаклава чорна
--{"3.txd","1.dff",2003},
--Балаклава синя
--{"4.txd","1.dff",2004},
--Балаклава зелена
--{"5.txd","1.dff",2005},
--Балаклава рожева
--{"6.txd","1.dff",2006},
--Балаклава была
--{"7.txd","1.dff",2007},
--Броник с слотами и кужурою
--{"123.txd","123.dff",2008},
--рЮКЗАК НА 28 камо
--{"111.txd","111.dff",2009},
--рЮКЗАК НА 35 Оранжевий
--{"222.txd","222.dff",2010},
--рЮКЗАК НА 35 Синый
--{"2221.txd","222.dff",2011},
--рЮКЗАК НА 35 зелений
--{"2222.txd","222.dff",2012},
--рЮКЗАК НА 35 Червоний
--{"2223.txd","222.dff",2013},
--рЮКЗАК НА 30 Охотника
--{"333.txd","333.dff",2014},
--рЮКЗАК НА 28  Чорний
--{"444.txd","444.dff",2015},
--рЮКЗАК НА 28  Синій
--{"4441.txd","444.dff",2016},
--рЮКЗАК НА 28  зелений
--{"4442.txd","444.dff",2017},
--рЮКЗАК НА 28 оринж
--{"4443.txd","444.dff",2018},
--рЮКЗАК НА 28 жовтий
--{"4444.txd","444.dff",2019},
--рЮКЗАК НА 28 
--{"4445.txd","444.dff",2020},
--Косынка ТТСКО
--{"555.txd","555.dff",2021},
--Косынка Чорна
--{"5551.txd","555.dff",2022},
--Косынка Фиолетова
--{"5552.txd","555.dff",2023},
--Косынка Червона
--{"5553.txd","555.dff",2024},
--Косынк Жовта
--{"5554.txd","555.dff",2025},
--Косынка Зелена
--{"5555.txd","555.dff",2026},
--Беретка червона
--{"777.txd","777.dff",2027},
--Беретка чорна
--{"7771.txd","777.dff",2028},
--Беретка синя
--{"7772.txd","777.dff",2029},
--Беретка зелена
--{"7773.txd","777.dff",2030},
--Беретка бежева
--{"7774.txd","777.dff",2031},
--Панама чорна
--{"888.txd","888.dff",2032},
--Панама синя
--{"8881.txd","888.dff",2033},
--Панама зелений камувляж
--{"8882.txd","888.dff",2034},
--Панама ТТСКО
--{"8883.txd","888.dff",2035},
--Панама Зелене ТТСКО
--{"8884.txd","888.dff",2036},
--Панама Джинсова
--{"8885.txd","888.dff",2037},
--Панама зелена
--{"8886.txd","888.dff",2038},
--Панама Оранжева
--{"8887.txd","888.dff",2039},
--Панама червна
--{"8888.txd","888.dff",2040},
--Панама бежева
--{"8889.txd","888.dff",2041},
--Маска далас
--{"dallas.txd","dallas.dff",2042},
--Маска Хоксон
--{"hoxton.txd","hoxton.dff",2043},
--Маска Хоксон
--{"wolf.txd","wolf.dff",2044},
--Гиля спина зелена
{"G1.txd","G2.dff",2045},
--Гиля голвва зелена
--{"G1.txd","G1.dff",2046},
--Гиля спина темно-зелена
--{"G2.txd","G2.dff",2047},
--Гиля голова темно-зелена
--{"G2.txd","G1.dff",2048},
--Гиля спина была
--{"G3.txd","G2.dff",2049},
--Гиля голова біла
{"G3.txd","G1.dff",2050},
--Шлем зелений
--{"H1.txd","H1.dff",2051},
--Шлем чорний
--{"H2.txd","H1.dff",2052},
--Шлем синый
--{"H3.txd","H1.dff",2053},
--Шлем горка зелений
--{"HG1.txd","HG1.dff",2054},
--Шлем горка Чорний
--{"HG2.txd","HG1.dff",2055},
--Противогаз
{"M1.txd","M1.dff",2056},
--Бронижелет Полиция
{"P1.txd","P1.dff",2057},
--Бронижелет PRESS
{"P2.txd","P2.dff",2058},
--Навеска на 12 чорна
{"N1.txd","N1.dff",2059},
--Навеска на 12 зелена
{"N12.txd","N1.dff",2060},
--Навеска на 12 ТТСКО
{"N13.txd","N1.dff",2061},
--Навеска на 8 чорна
--{"N2.txd","N2.dff",2062},
--Навеска на 8 Камуфляж
--{"N22.txd","N2.dff",2063},
--Навеска на 8 оливкова
--{"N23.txd","N2.dff",2064},
--Навеска на 8 бежева
{"N24.txd","N2.dff",2065},
--Бронижелет PRESS голубий
{"P22.txd","P2.dff",2066},
--Навеска2 на 8 чорна
{"V1.txd","V1.dff",2067},
--Навеска2 на 8 Камуфляж
--{"V12.txd","V1.dff",2068},
--Навеска2 на 8 оливкова
--{"V13.txd","V1.dff",2069},
--Навеска2 на 8 зелена
--{"V14.txd","V1.dff",2070},
--Ушанка чорна
--{"U1.txd","U1.dff",2071},
--Ушана синя
--{"U12.txd","U1.dff",2072},
--Ушанка зелена
--{"U13.txd","U1.dff",2073},
--Бронижелет PRESS Коричневий
--{"P23.txd","P2.dff",2074},
--Навеска на 12 зелена камуфляж
--{"N14.txd","N1.dff",2075},
--Навеска на 12 зелена камуфляж,
--{"S1.txd","S1.dff",2076},
--Навеска2 на 8 коричневий камувляж
--{"V15.txd","V1.dff",2077},
--Ковбой коричнева
{"K1.txd","K1.dff",2078},
--Ковбой чорна
{"K12.txd","K1.dff",2079},
--Ковбой коричнева-темно
--{"K13.txd","K1.dff",2080},
--Ковбой зелена
{"K14.txd","K1.dff",2081},
--Ковбой сира,
{"K15.txd","K1.dff",2082},
--Ковбой била
{"K16.txd","K1.dff",2083},
--Рюкзак 20 камо
{"T1.txd","T1.dff",2084},
--Рюкзак 20 синый
--{"T12.txd","T1.dff",2085},
--Рюкзак 20 зелений
--{"T13.txd","T1.dff",2086},
--Рюкзак 20 оранжевий
{"T14.txd","T1.dff",2087},
--Рюкзак 20 фиолетовий
{"T15.txd","T1.dff",2088},
--Рюкзак NEW Камо
{"F13.txd","F1.dff",2089},
--Рюкзак NEW чорний
{"F12.txd","F1.dff",2090},
--Рюкзак NEW зелений
{"F1.txd","F1.dff",2091},
--рЮКЗАК НА 28 камо 1
{"1112.txd","111.dff",2092},
--рЮКЗАК НА 28 камо 2
{"1113.txd","111.dff",2093},
--рЮКЗАК НА 28 камо 3
{"1114.txd","111.dff",2094},
--рЮКЗАК НА 30 Охотника камо 1
{"3331.txd","333.dff",2095},
--рЮКЗАК НА 30 Охотника камо 2
{"3332.txd","333.dff",2096},
--рЮКЗАК НА 30 Охотника камо 3
{"3333.txd","333.dff",2097},
--рЮКЗАК НА 30 Охотника камо 4
--{"3334.txd","333.dff",2098},
--рЮКЗАК НА 35 КАМО
{"2224.txd","222.dff",2099},
--Шлем горка Чорний СВАТ
{"HG3.txd","HG1.dff",2100},
--Шлем горка КАМО
{"HG4.txd","HG1.dff",2101},
--Шлем Камо 1
{"H6.txd","H1.dff",2102},
--Шлем Камо 2
{"H5.txd","H1.dff",2103},
--Шлем Камо 3
{"H4.txd","H1.dff",2104},
--Балаклава КАМО
{"8.txd","1.dff",2105},
--Бронижелет PRESS камо
{"P24.txd","P2.dff",2106},
--Навеска2 на 8 КАМО 1 
--{"V16.txd","V1.dff",2107},
--Навенка2 на 8 КАМО 1
{"V17.txd","V1.dff",2108},
--Шапка коричнева
{"Q1.txd","Q1.dff",2109},
--Шапка чорна
--{"Q12.txd","Q1.dff",2110},
--Шапка синя
--{"Q13.txd","Q1.dff",2111},
--Шапка темно-корочнева
--{"Q14.txd","Q1.dff",2112},
--Шапка зелена
--{"Q15.txd","Q1.dff",2113},
--Шапка сыра
{"Q16.txd","Q1.dff",2114},
--Шапка червона
--{"Q17.txd","Q1.dff",2115},
--Гопник 1
--{"W1.txd","W1.dff",2116},
--Гопник 2
--{"W12.txd","W1.dff",2117},
--Гопник 3
--{"W13.txd","W1.dff",2118},
--Гопник 4
--{"W14.txd","W1.dff",2119},
--Гопник 5
{"W15.txd","W1.dff",2120},
--Гопник 6
{"W16.txd","W1.dff",2121},
--Гопник 7
{"W17.txd","W1.dff",2122},
--Гопник 8
{"W18.txd","W1.dff",2123},
--Каска чорна
{"E1.txd","E1.dff",2124},
--Каска синя
{"E12.txd","E1.dff",2125},
--Каска воєнна
{"E13.txd","E1.dff",2126},
--Каска зелена
{"E14.txd","E1.dff",2127},
--Каска оринж
{"E15.txd","E1.dff",2128},
--Каска червона
{"E16.txd","E1.dff",2129},
--Каска біла
{"E17.txd","E1.dff",2130},
--Каска жовта
{"E18.txd","E1.dff",2131},
--Пожпрник чорна
{"R1.txd","R1.dff",2132},
--Пожпрник чорний
{"R12.txd","R1.dff",2133},
--Пожпрник біла
{"R13.txd","R1.dff",2134},
--Пожпрник жовтий
{"R14.txd","R1.dff",2135},
--Шлем лютчика чорний
{"Y1.txd","Y1.dff",2136},
--Шлем лютчика білий
{"Y12.txd","Y1.dff",2137},
--Шлем лютчика зелений
{"Y13.txd","Y1.dff",2138},
--Шапка лікаря синя
{"I1.txd","I1.dff",2139},
--Шапка лікаря зелена
{"I12.txd","I1.dff",2140},
--Шапка лікаря біла
{"I13.txd","I1.dff",2141},
--Мото-шлем 1
{"O1.txd","O1.dff",2142},
--Мото-шлем 2
{"O12.txd","O1.dff",2143},
--Мото-шмем 3
{"O13.txd","O1.dff",2144},
--Мото-шлем 4
{"O14.txd","O1.dff",2145},
--Мото-шлем 5
--{"O15.txd","O1.dff",2146},
--Мото-шлем 6
{"O16.txd","O1.dff",2147},
--Мото-шлем 7
{"O17.txd","O1.dff",2148},
--Шапка офіцера
{"A1.txd","A1.dff",2149},
--Палотка
{"D1.txd","D1.dff",2150},
--Шапка полыцыя
{"F2.txd","F2.dff",2151},
--Кепка 1
{"J1.txd","J1.dff",2152},
--Кепка 2
{"J12.txd","J1.dff",2153},
--Кепка 3
{"J13.txd","J1.dff",2154},
--Кепка 4
--{"J14.txd","J1.dff",2155},
--Кепка 5
{"J15.txd","J1.dff",2156},
--Кепка 6
{"J16.txd","J1.dff",2157},
--Кепка 7
{"J17.txd","J1.dff",2158},
--Кепка 8
{"J18.txd","J1.dff",2159},
--Косынка ТТСКО
{"555.txd","L1.dff",2160},
--Косынка Чорна
{"5551.txd","L1.dff",2161},
--Косынка Фиолетова
{"5552.txd","L1.dff",2162},
--Косынка Червона
{"5553.txd","L1.dff",2163},
--Косынка Жовта
{"5554.txd","L1.dff",2164},
--Косынка Зелена
{"5555.txd","L1.dff",2165},
--Шапка з козирком чорна
{"Z1.txd","Z1.dff",2166},
--Шапка з козирком коричнева
{"Z12.txd","Z1.dff",2167},
--Шапка з козирком зелена
{"Z13.txd","Z1.dff",2168},
--Шапка з козирком рожева
{"Z14.txd","Z1.dff",2169},
--Шапка з козирком синя
{"Z15.txd","Z1.dff",2170},
--Шапка танкиста
{"X1.txd","X1.dff",2171},
--Шапка з банбоном чорна
{"C1.txd","C1.dff",2172},
--Шапка з банбоном синя
{"C12.txd","C1.dff",2173},
--Шапка з банбоном коричнева
{"C13.txd","C1.dff",2174},
--Шапка з банбоном червона
{"C14.txd","C1.dff",2175},
--Шапка з банбоном зелена
{"C15.txd","C1.dff",2176},
--Окуляри 1
{"B1.txd","B1.dff",2177},
--Окуляри 2
{"B2.txd","B2.dff",2178},
--Навески броники
{"BOX.txd","BOX.dff",2179},

--Їжа
--Сардини
{"HA1.txd","HA1.dff",2180},
--Спагетти
{"HA2.txd","HA2.dff",2181},
--Персики
{"HA22.txd","HA2.dff",2182},
--Бекон
{"HA23.txd","HA2.dff",2183},
--Ягоди
{"HA3.txd","HA3.dff",2184},
--Банан
{"HA4.txd","HA4.dff",2185},
--Киви
{"HA5.txd","HA5.dff",2186},
--Апельсин
{"HA6.txd","HA6.dff",2187},
--Груша
{"HA7.txd","HA7.dff",2188},
--Перець
--{"HA8.txd","HA8.dff",2189},
--Клюква
{"HA9.txd","HA9.dff",2190},
--Картопля
{"HA10.txd","HA10.dff",2191},
--Водка сухе
{"HA11.txd","HA11.dff",2192},
--Помидор
{"HA12.txd","HA12.dff",2193},
--Рис
{"HA13.txd","HA13.dff",2194},
--Тунець
{"HA14.txd","HA14.dff",2195},
--Кабачок
--{"HA15.txd","HA15.dff",2196},

--Напитки
--Фляга
{"HA16.txd","HA16.dff",2197},
--Бутилка
{"HA17.txd","HA17.dff",2198},
--Кола
{"HA18.txd","HA18.dff",2199},
--Пепси
{"HA182.txd","HA18.dff",2200},
--Квас
{"HA183.txd","HA18.dff",2201},
--Спрайт
{"HA184.txd","HA18.dff",2202},
--Водка
{"HA184.txd","HA18.dff",2203},

--ЛІКИ
--Бинт
{"HA20.txd","HA20.dff",2204},
--Пакет крові
{"HA21.txd","HA21.dff",2205},
--Угиль
{"HA24.txd","HA24.dff",2206},
--Витамини
{"HA25.txd","HA25.dff",2207},
--Болеутоляющие
{"HA26.txd","HA26.dff",2208},
--Морфин
{"HA27.txd","HA27.dff",2209},
--Физраствор
{"HA28.txd","HA28.dff",2210},
--Грелка
{"HA29.txd","HA29.dff",2211},

--ЛУТ
--Дрова
{"IT1.txd","IT1.dff",2212},
--Проволка
{"IT2.txd","IT2.dff",2213},
--Відкриті дрова
{"IT3.txd","IT3.dff",2214},
--Фаер
{"IT4.txd","IT4.dff",2215},
--Горить 2216

--Воєнна палатка (з)
{"IT5.txd","IT5.dff",2219},
{"IT6.txd","IT6.dff",2218},
--2218 Розкладена

--Проста палатка (з)
{"IT7.txd","IT7.dff",2217},
{"IT8.txd","IT8.dff",2220},
--2220 Розкладена

--Проста палатка (з)
{"IT10.txd","IT10.dff",2221},
{"IT9.txd","IT9.dff",2222},
--2222 Розкладена

--Косюм на землі
{"IT11.txd","IT11.dff",2223},
--Броня на машину
{"IT12.txd","IT12.dff",2224},

--Фара
{"LU1.txd","LU1.dff",2225},
--Свеча
{"LU1.txd","LU2.dff",2226},
--Тулбокс
{"LU3.txd","LU3.dff",2227},
--Акамулятор
{"LU4.txd","LU4.dff",2228},
--Колесо
{"LU5.txd","LU5.dff",2229},
--Канистра
{"LU6.txd","LU6.dff",2230},

--Спички
{"LU7.txd","LU7.dff",2231},
--GPS
{"LU8.txd","LU8.dff",2232},
--Карта
{"LU9.txd","LU9.dff",2233},
--Часи
{"LU10.txd","LU10.dff",2234},
--Компас
{"LU11.txd","LU11.dff",2235},
--Денги
{"MON.txd","MON.dff",2245},
--Оружка
--АК-101
{"WE1.txd","WE1.dff",2246},
{"WE2.txd","WE1.dff",2246},
{"WE3.txd","WE1.dff",2246},
{"WE4.txd","WE1.dff",2246},
--АК-101 шлуш
{"WE1.txd","WE2.dff",2247},
{"WE2.txd","WE2.dff",2247},
{"WE3.txd","WE2.dff",2247},
{"WE4.txd","WE2.dff",2247},
{"WE5.txd","WE2.dff",2247},
--АК-101 гиля
{"WE1.txd","WE3.dff",2248},
{"WE2.txd","WE3.dff",2248},
{"WE3.txd","WE3.dff",2248},
{"WE4.txd","WE3.dff",2248},
{"WE6.txd","WE3.dff",2248},
--АК-101 гиля глушитель
{"WE1.txd","WE4.dff",2249},
{"WE2.txd","WE4.dff",2249},
{"WE3.txd","WE4.dff",2249},
{"WE4.txd","WE4.dff",2249},
{"WE5.txd","WE4.dff",2249},
{"WE6.txd","WE4.dff",2249},
--АКМ 
{"WE1.txd","WE5.dff",2250},
{"WE2.txd","WE5.dff",2250},
{"WE3.txd","WE5.dff",2250},
{"WE4.txd","WE5.dff",2250},
{"WE7.txd","WE5.dff",2250},
{"WE8.txd","WE5.dff",2250},
{"WE9.txd","WE5.dff",2250},
--АКМ  глуш
{"WE1.txd","WE6.dff",2251},
{"WE2.txd","WE6.dff",2251},
{"WE3.txd","WE6.dff",2251},
{"WE4.txd","WE6.dff",2251},
{"WE5.txd","WE6.dff",2251},
{"WE7.txd","WE6.dff",2251},
{"WE8.txd","WE6.dff",2251},
{"WE9.txd","WE6.dff",2251},
--АКМ  гиля
{"WE1.txd","WE7.dff",2252},
{"WE2.txd","WE7.dff",2252},
{"WE3.txd","WE7.dff",2252},
{"WE4.txd","WE7.dff",2252},
{"WE6.txd","WE7.dff",2252},
{"WE7.txd","WE7.dff",2252},
{"WE8.txd","WE7.dff",2252},
{"WE9.txd","WE7.dff",2252},
--АКМ  гиля глуш
{"WE1.txd","WE8.dff",2253},
{"WE2.txd","WE8.dff",2253},
{"WE3.txd","WE8.dff",2253},
{"WE4.txd","WE8.dff",2253},
{"WE5.txd","WE8.dff",2253},
{"WE6.txd","WE8.dff",2253},
{"WE7.txd","WE8.dff",2253},
{"WE8.txd","WE8.dff",2253},
{"WE9.txd","WE8.dff",2253},
--АК-74у
{"WE10.txd","WE9.dff",2254},
{"WE11.txd","WE9.dff",2254},
--АК-74у глкшитель
--[[
{"WE10.txd","WE10.dff",2255},
{"WE11.txd","WE10.dff",2255},
{"WE5.txd","WE10.dff",2255},
--АУГ
{"WE12.txd","WE11.dff",2256},
--АУГ глуш
{"WE13.txd","WE12.dff",2257},
{"WE12.txd","WE12.dff",2257},
--М4 гиля 
{"WE14.txd","WE13.dff",2258},
{"WE15.txd","WE13.dff",2258},
{"WE16.txd","WE13.dff",2258},
{"WE17.txd","WE13.dff",2258},
{"WE18.txd","WE13.dff",2258},
{"WE7.txd","WE13.dff",2258},
{"WE6.txd","WE13.dff",2258},
{"WE3.txd","WE13.dff",2258},
--М4 глуш 
{"WE14.txd","WE14.dff",2259},
{"WE15.txd","WE14.dff",2259},
{"WE16.txd","WE14.dff",2259},
{"WE17.txd","WE14.dff",2259},
{"WE18.txd","WE14.dff",2259},
{"WE13.txd","WE14.dff",2259},
{"WE7.txd","WE14.dff",2259},
{"WE3.txd","WE14.dff",2259},
--М4 глуш гиля
{"WE14.txd","WE15.dff",2260},
{"WE15.txd","WE15.dff",2260},
{"WE16.txd","WE15.dff",2260},
{"WE17.txd","WE15.dff",2260},
{"WE18.txd","WE15.dff",2260},
{"WE13.txd","WE15.dff",2260},
{"WE7.txd","WE15.dff",2260},
{"WE3.txd","WE15.dff",2260},
{"WE6.txd","WE15.dff",2260},
--М4 
{"WE14.txd","WE16.dff",2261},
{"WE15.txd","WE16.dff",2261},
{"WE16.txd","WE16.dff",2261},
{"WE17.txd","WE16.dff",2261},
{"WE18.txd","WE16.dff",2261},
{"WE7.txd","WE16.dff",2261},
{"WE3.txd","WE16.dff",2261},
--СВД
{"WE19.txd","WE17.dff",2262},
{"WE20.txd","WE17.dff",2262},
{"WE21.txd","WE17.dff",2262},
--СВД гиля
{"WE19.txd","WE18.dff",2263},
{"WE20.txd","WE18.dff",2263},
{"WE21.txd","WE18.dff",2263},
{"WE22.txd","WE18.dff",2263},
--ВВС
{"WE23.txd","WE19.dff",2264},
{"WE24.txd","WE19.dff",2264},
{"WE21.txd","WE19.dff",2264},
--ВСС гиля
{"WE23.txd","WE20.dff",2265},
{"WE24.txd","WE20.dff",2265},
{"WE21.txd","WE20.dff",2265},
{"WE6.txd","WE20.dff",2265},]]
--Винчерстер
{"WE25.txd","WE21.dff",2266},
{"WE26.txd","WE21.dff",2266},
--Мосин
--{"WE27.txd","WE22.dff",2267},
--{"WE28.txd","WE22.dff",2267},
--Мосин гиля
--{"WE27.txd","WE23.dff",2268},
--{"WE28.txd","WE23.dff",2268},
--{"WE22.txd","WE23.dff",2268},
--SKS
--{"WE29.txd","WE24.dff",2269},
--{"WE30.txd","WE24.dff",2269},
--FNFAL
--{"WE31.txd","WE25.dff",2270},
--{"WE32.txd","WE25.dff",2270},
--{"WE24.txd","WE25.dff",2270},
--{"WE17.txd","WE25.dff",2270},
--FNFAL глуш
{"WE31.txd","WE26.dff",2271},
{"WE32.txd","WE26.dff",2271},
{"WE24.txd","WE26.dff",2271},
{"WE17.txd","WE26.dff",2271},
{"WE13.txd","WE26.dff",2271},
--Арбалет
--{"WE33.txd","WE27.dff",2272},
--iz43
--{"WE34.txd","WE28.dff",2273},
--MP-133
--{"WE35.txd","WE29.dff",2274},
--MP5
--[[
{"WE36.txd","WE30.dff",2275},
{"WE37.txd","WE30.dff",2275},
{"WE38.txd","WE30.dff",2275},
{"WE39.txd","WE30.dff",2275},
{"WE17.txd","WE30.dff",2275},
--MP5 глуш]]
{"WE36.txd","WE31.dff",2276},
{"WE37.txd","WE31.dff",2276},
{"WE38.txd","WE31.dff",2276},
{"WE39.txd","WE31.dff",2276},
{"WE17.txd","WE31.dff",2276},
{"WE40.txd","WE31.dff",2276},
--Scorpion
--{"WE43.txd","WE33.dff",2277},
--{"WE44.txd","WE33.dff",2277},
--Ump45
--{"WE17.txd","WE32.dff",2278},
--{"WE41.txd","WE32.dff",2278},
--{"WE42.txd","WE32.dff",2278},
--1911
--{"WE45.txd","WE34.dff",2279},
--1911 глуш
--{"WE45.txd","WE35.dff",2280},
--{"WE40.txd","WE35.dff",2280},
--Глок
{"WE46.txd","WE36.dff",2281},
--Глок глуш
--{"WE46.txd","WE37.dff",2282},
--{"WE40.txd","WE37.dff",2282},
--Магнус
--{"WE47.txd","WE38.dff",2283},

--Ножик
{"OH1.txd","OH1.dff",335},
--Топор
{"OH2.txd","OH2.dff",339},
--Бита
{"OH3.txd","OH3.dff",336},
--Лопата
{"OH4.txd","OH4.dff",337},
--Клюшка
{"OH5.txd","OH5.dff",333},

--Патрони
--STANAG FAL-MAG
--{"AM1.txd","AM1.dff",2284},
--AK-MAG
--{"AM2.txd","AM2.dff",2285},
--AK-DRUM
--{"WE9.txd","AM3.dff",2286},
--SVD-MAG VSS-MAG
--{"AM4.txd","AM4.dff",2287},
--MOSIN-CLIP 
--{"AM5.txd","AM5.dff",2289},
--SKS-CLIP 
--{"AM6.txd","AM6.dff",2290},
--Gauge Buckshot
{"AM7.txd","AM7.dff",2291},
--MP5-K-MAG CZ61-MAG UMP45-MAG
{"AM8.txd","AM8.dff",2292},
--1911-MAG GLOCK-MAG
{"AM9.txd","AM9.dff",2293},
--MAGNUM-MAG
{"AM10.txd","AM10.dff",2294},


}

addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()),function()
	for _, data in ipairs(replace) do
		--local fanbox_txd = sha256(data[1])
		--local fanbox_dff = sha256(data[2])
		--if not fileExists("skins/"..fanbox_txd) then
			--downloadFile("skins/"..data[1])
		--end
		--if not fileExists("skins/"..fanbox_dff) then
			--downloadFile("skins/"..data[2])
		--end
		--if fileExists("skins/"..fanbox_txd) then
			engineImportTXD(engineLoadTXD("skins/"..data[1]),data[3])
		--end
		--if fileExists("skins/"..fanbox_dff) then
			engineReplaceModel(engineLoadDFF("skins/"..data[2],0),data[3])
		end	

end)
--[[
addEventHandler("onClientFileDownloadComplete", getResourceRootElement(getThisResource()),function(file)
	for _, data in ipairs(replace) do
		if file == "skins/"..data[1] then
			local fanbox_txd = sha256(data[1])
			if not fileExists("skins/"..data[1]) then return end
			fileRename("skins/"..data[1],"skins/"..fanbox_txd)
			engineImportTXD(engineLoadTXD("skins/"..fanbox_txd),data[3])
		end
		if file == "skins/"..data[2] then
			local fanbox_dff = sha256(data[2])
			if not fileExists("skins/"..data[2]) then return end
			fileRename("skins/"..data[2],"skins/"..fanbox_dff)
			engineReplaceModel(engineLoadDFF("skins/"..fanbox_dff,0),data[3])
		end
	end	
end)
]]
local models = {
	 {fileName="weapon", model=355},
	 {fileName="weapon", model=356},
	 {fileName="weapon", model=357},
	 {fileName="weapon", model=358},
	 {fileName="weapon", model=349},
	 {fileName="weapon", model=346},
	 {fileName="weapon", model=347},
	 {fileName="weapon", model=348},
	 {fileName="weapon", model=353},
	 {fileName="weapon", model=372},
	 {fileName="weapon", model=352},
}

addEventHandler("onClientResourceStart",resourceRoot,function()
    for _, data in pairs(models) do
        tex = engineLoadTXD ( ""..data.fileName.. ".txd", data.model )
        engineImportTXD ( tex, data.model )
        mod = engineLoadDFF ( ""..data.fileName.. ".dff", data.model )
        engineReplaceModel ( mod, data.model )   	
    end 
end)


--Палатки
--Арми
local col = engineLoadCOL ( "skins/IT6.col" ) 
engineReplaceCOL ( col, 2218 )
engineSetModelLODDistance(2218, 160)
--Проста
local col = engineLoadCOL ( "skins/IT8.col" ) 
engineReplaceCOL ( col, 2220 )
engineSetModelLODDistance(2220, 160)
--Авто
local col = engineLoadCOL ( "skins/IT9.col" ) 
engineReplaceCOL ( col, 2222 )
engineSetModelLODDistance(2222, 160)

local txd = engineLoadTXD('hel/1.txd',true)
engineImportTXD(txd, 2236)
local dff = engineLoadDFF('hel/1.dff', 0)
engineReplaceModel(dff, 2236)
local col = engineLoadCOL('hel/1.col')
engineReplaceCOL(col, 2236)
engineSetModelLODDistance(2236, 400)

local txd = engineLoadTXD('hel/12.txd',true)
engineImportTXD(txd, 2237)
local dff = engineLoadDFF('hel/1.dff', 0)
engineReplaceModel(dff, 2237)
local col = engineLoadCOL('hel/1.col')
engineReplaceCOL(col, 2237)
engineSetModelLODDistance(2237, 400)

local txd = engineLoadTXD('hel/2.txd',true)
---engineImportTXD(txd, 2238)
local dff = engineLoadDFF('hel/2.dff', 0)
engineReplaceModel(dff, 2238)
--local col = engineLoadCOL('hel/2.col')
--engineReplaceCOL(col, 2238)
--engineSetModelLODDistance(2238, 400)

local txd = engineLoadTXD('hel/22.txd',true)
--engineImportTXD(txd, 2239)
local dff = engineLoadDFF('hel/2.dff', 0)
engineReplaceModel(dff, 2239)
--local col = engineLoadCOL('hel/2.col')
--engineReplaceCOL(col, 2239)
--engineSetModelLODDistance(2239, 400)

local txd = engineLoadTXD('hel/23.txd',true)
engineImportTXD(txd, 2240)
local dff = engineLoadDFF('hel/2.dff', 0)
engineReplaceModel(dff, 2240)
local col = engineLoadCOL('hel/2.col')
engineReplaceCOL(col, 2240)
engineSetModelLODDistance(2240, 400)

local txd = engineLoadTXD('hel/24.txd',true)
engineImportTXD(txd, 2241)
local dff = engineLoadDFF('hel/2.dff', 0)
engineReplaceModel(dff, 2241)
local col = engineLoadCOL('hel/2.col')
engineReplaceCOL(col, 2241)
engineSetModelLODDistance(2241, 400)

local txd = engineLoadTXD('hel/25.txd',true)
engineImportTXD(txd, 2242)
local dff = engineLoadDFF('hel/2.dff', 0)
engineReplaceModel(dff, 2242)
local col = engineLoadCOL('hel/2.col')
engineReplaceCOL(col, 2242)
engineSetModelLODDistance(2242, 400)

local txd = engineLoadTXD('hel/3.txd',true)
engineImportTXD(txd, 2243)
local dff = engineLoadDFF('hel/3.dff', 0)
engineReplaceModel(dff, 2243)
local col = engineLoadCOL('hel/3.col')
engineReplaceCOL(col, 2243)
engineSetModelLODDistance(2241, 400)

local txd = engineLoadTXD('hel/32.txd',true)
engineImportTXD(txd, 2244)
local dff = engineLoadDFF('hel/3.dff', 0)
engineReplaceModel(dff, 2244)
local col = engineLoadCOL('hel/3.col')
engineReplaceCOL(col, 2244)
engineSetModelLODDistance(2244, 400)
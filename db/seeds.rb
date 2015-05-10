# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



countries = [ { english_name: "Italy", 
                native_language_name: "Italia",
                description: "Italy, officially the Italian Republic (Italian: Repubblica italiana), is a unitary parliamentary republic in Europe. Italy covers an area of 301,338 km2 (116,347 sq mi) and has a largely temperate climate; due to its shape, it is often referred to in Italy as lo Stivale (the Boot). With 61 million inhabitants, it is the 5th most populous country in Europe. Italy is a very highly developed country and has the third largest economy in the Eurozone and the eighth-largest in the world", 
                country_website: "http://www.italia.it/en/home.html"
              },
              { english_name: "USA", 
                native_language_name: "The United States of America", 
                description: "The U.S. is a country of 50 states covering a vast swath of North America, with Alaska in the extreme Northwest and Hawaii extending the nation’s presence into the Pacific Ocean. Major cities include New York, a global finance and culture center, and Washington, DC, the capital, both on the Atlantic Coast; Los Angeles, famed for filmmaking, on the Pacific Coast; and the Midwestern metropolis Chicago.",
                country_website: "http://www.usa.gov/"}
            ]


countries.each do |country| 
  Country.find_or_create_by!(
      english_name: country[:english_name],
      native_language_name: country[:native_language_name],
      description: country[:description],
      country_website: country[:country_website]
    )
end

regions = [
  { native_language_name: "Toscana",
    english_name: "Tuscany",
    description: "The region stretches over the slope of the Apennines, in front of the Tyrrhenian Sea. The Tuscan landscape is mainly mountainous and hilly, with a flat area besides the sea (the Maremma). The coastline presents different aspects, offering both long sandy expances and headlands. In front of the coast there are the small enchanting islands of the Tuscan archipelago.",
    region_website: "http://www.italia.it/en/discover-italy/tuscany.html",
  country_id: Country.where(english_name: "Italy").first.id.to_int},
  { native_language_name: "Lazio",
  english_name: "Lazio",
  description: "The region, with undulated hills, stretches from the western buttresses of the Apennines to the Tyrrhenian Sea. The landscape is varied and presents flatlands, on the coastline and in the hinterland, ridges and calcareous highlands. Latium has four very ancient volcanic distincts, where the craters of extinct volcanoes form the lakes of Bolsena, Vico, Bracciano, Albano and Nemi.",
  region_website: "http://www.italia.it/en/discover-italy/lazio.html",
  country_id: Country.where(english_name: "Italy").first.id.to_int},
  { native_language_name: "Valle d'Aosta",
  english_name: "Aosta Valley",
  description: "It ins the most mountainous region of Italy, entirely surrounded by the best known, splendid peaks of the Alps: the Monte Bianco, the Matterhorn, the Monte Rosa and the Gran Paradiso. The latter is at the center of a magnificent National Park, populated by beautiful specimens of ibex, chamois and eagle. Numerous glaciers feed a rich web of streams, which at the bottom of the respective valleys flow in the basin of the Dora Baltea. The distinctly Alpine character of this region can be seen in the pine forests, up to rather high altitudes, where they give place to large pasturelands. The small Alpine lakes, little jewels set in majestic mountain landscapes, are numerous. Thanks to the Monte Bianco’s and the Gran San Bernardo’s tunnels, the great historic passes are today important lines of communication.",
  region_website: "http://www.italia.it/en/discover-italy/aosta-valley.html",
  country_id: Country.where(english_name: "Italy").first.id.to_int},
  { native_language_name: "Trentino-Alto Adige",
  english_name: "Trentino-Alto Adige",
  description: "It is a mainly mountainous province, rich in rivers, torrents and numerous lakes, clusters and chains of mountains of singular beauty, divided in two by the valley of the river Adige. To the west one finds the glaciers of the group Adamello-Presanella-Care Alto and the group of Brenta. To the east the groups of Lagorai, Latemar, the Dolomites of Fassa, and the Pale di S. Martino. Many alpine valleys break away from the valley of Adige: the Valsugana, the Vallarsa, the Val di Non, the Val di Sole, the Val di Cembra, Fiemme and Fassa; inside instead the valley Giudicarie and Rendena. The principle lakes are those of Garda, Caldonazzo, Tovel and Ledro; thermal waters gush forth from springs rich in therapeutic properties. Extensive coniferous forests cover the dolomitic slopes and wide table-lands like those of Folgaria, Lavarone and Pine. Three natural parks, Adamello-Brenta, Paneveggio-Pale of S. Martino and Stelvio conserve the typical species of animals and vegetation of the alpine environment including even the bear.",
  region_website: "http://www.italia.it/en/discover-italy/trentino-alto-adige.html",
  country_id: Country.where(english_name: "Italy").first.id.to_int},
  { native_language_name: "Lombardia",
  english_name: "Lombardy",
  description: "The region occupies the main part of the Po Valley. Its northern borders are formed by the Lepontine, Rhaetian and Orobic Alps. It includes a hilly district with the major Italian lakes, from the Easter slope of Lago Maggiore to the Lakes of Varese, lseo, Como and to the northern part of Lake Garda. This region ins rich inn water, thanks to the Po and its affluents.",
  region_website: "http://www.italia.it/en/discover-italy/lombardy.html",
  country_id: Country.where(english_name: "Italy").first.id.to_int},
  { native_language_name: "Veneto",
  english_name: "Veneto",
  description: "The region includes the eastern part of the Po Valley and, to the north, a part of the Dolomites. The extensive plain, with the Po delta, is rich in waters. It is a region which combines two different and unique aspects of the Italian nature: the lagoon zone (Venice) and the majestic peaks of the Dolomites of Cadore.",
  region_website: "http://www.italia.it/en/discover-italy/veneto.html",
  country_id: Country.where(english_name: "Italy").first.id.to_int},
  { native_language_name: "Emilia-Romagna",
  english_name: "Emilia-Romagna",
  description: "Half of Emilia Romagna territory is formed by the Apennines; the other half is a large plain, which reaches to the Adriatic Sea. The coastline is flat and sandy, with a typical lagoon and marshy area (the Valli of Comacchio).",
  region_website: "http://www.italia.it/en/discover-italy/emilia-romagna.html",
  country_id: Country.where(english_name: "Italy").first.id.to_int},
  { native_language_name: "Marche",
  english_name: "The Marches",
  description: "Is an essentially mountainous and hilly region, facing the Adriatic Sea. The mountain area is rugged, with narrow valleys, deep gorges and numerous rushing, sometimes inaccessible, streams (Gorge of Furlo). The coastline presents a succession of gently rolling hills and flat plains crossed by rivers.",
  region_website: "http://www.italia.it/en/discover-italy/the-marches.html",
  country_id: Country.where(english_name: "Italy").first.id.to_int},
  { native_language_name: "Sicilia",
  english_name: "Sicily",
  description: "Mainland, Sicilia is the largest island in the Mediterranean and the southernmost region  of Italy. Famous for its blue skies and mild winter climate Sicilia is also home to Mount Etna, Europe's largest active volcano. This fertile paradise was settled by Siculi, Phonecians, Greeks, Carthaginians, Romans, Moors, Normans, Spaniards and Bourbons among others, and the remnants of these astounding cultures cover the entire island, from the temples of Agrigento to the priceless mosaics of Piazza Armerina and the ancient capital of Siracusa. Smaller islands, such as the Aeolian, Aegadean and Pelagian chains as well as Pantelleria, just 90 miles off of the African coast, are also part of Sicilia, offering superb beaches.",
  region_website: "http://www.italia.it/en/discover-italy/sicily.html",
  country_id: Country.where(english_name: "Italy").first.id.to_int},
  { native_language_name: "Campania",
  english_name: "Campania",
  description: "The region faces the Tyrrhenian Sea and includes one of the finest coastlines in Italy. The hinterland is essentially mountainous, with irregular massifs broken here and there by valleys and plains. In front of the Gulfs of Naples and Salerno, we can admire marvelous and enchanting islands: Capri, Ischia, Procida.",
  region_website: "http://www.italia.it/en/discover-italy/campania.html",
  country_id: Country.where(english_name: "Italy").first.id.to_int },
  {
    native_language_name: "Louisiana",
    english_name: "Louisiana",
    description: "Louisiana is a state located in the southern region of the United States. Louisiana is the 31st most extensive and the 25th most populous of the 50 United States. Its capital is Baton Rouge and largest city is New Orleans.",
    region_website: "http://louisiana.gov/",
    country_id: Country.where(english_name: "USA").first.id.to_int
  }
]

regions.each do |region|
  Region.find_or_create_by!(
    english_name: region[:english_name],
    native_language_name: region[:native_language_name],
    description: region[:description],
    region_website: region[:region_website],
    country_id: region[:country_id]
  )
end


cities = [
          {english_name: "Florence",
            native_language_name: "Firenze",
            description: "At the Province's center, in a basin crossed by the Arno River, stands the magnificent City of Florence, one of the most beautiful cities in Europe, filled with historical relics and artistic masterpieces by the greatest masters of Humanism and the Renaissance. These creative geniuses made an indelible mark on the world’s architecture and art: Giotto and Brunelleschi, Michelangelo and Vasari, Michelozzo and Leon Battista Alberti, just to mention a few.",
            is_capital: true,
            city_website: "http://www.italia.it/en/discover-italy/tuscany/florence",
            region_id: Region.where(english_name: "Tuscany").first.id.to_int},
          { english_name: "Rome",
            native_language_name: "Roma",
            description: "The Province of Rome is a matching frame for the many treasures of the Capital, and the surrounding area has, more or less directly, experienced the influence of the history of the Eternal City. The Region of Lazio offers everything from sea and nature to good food and lovely villages rich in history and art. And around Rome, the hills, lakes, rivers and vineyards make for a kaleidoscope of diversity and attractions for nature lovers.",
            is_capital: true,
            city_website: "http://www.italia.it/en/discover-italy/lazio/rome.html",
            region_id: Region.where(english_name: "Lazio").first.id.to_int
          },
          { english_name: "Venice",
            native_language_name: "Venezia",
            description: "Situated in Italy's northeast, Veneto extends from the Dolomites to the Adriatic Sea, by way of an expansive range of hills and a valley furrowed by rivers, canals and the Po River Delta. The typical scenery of Veneto's coast is the Venetian lagoon, and, right on this very lagoon stands perhaps the most unique city in the entire world - Venice, visited by millions of tourists every year. ",
            is_capital: true,
            city_website: "http://www.italia.it/en/discover-italy/veneto.html",
            region_id: Region.where(english_name: "Veneto").first.id.to_int},
          {
            english_name: "New Orleans",
            native_language_name: "New Orleans",
            description: "New Orleans is a Louisiana city on the Mississippi River, near the Gulf of Mexico. Nicknamed the \"Big Easy,\" it's known for its round-the-clock nightlife, vibrant live-music scene and spicy, singular cuisine reflecting its history as a melting pot of French, African and American cultures. Embodying its festive spirit is Mardi Gras, the late-winter carnival famed for raucous costumed parades and public partying.",
            is_capital: true,
            city_website: "http://www.neworleansonline.com/",
            region_id: Region.where(english_name: "Louisiana").first.id.to_int
          }
          
]

cities.each do |city| 
  City.find_or_create_by!(
      english_name: city[:english_name],
      native_language_name: city[:native_language_name],
      description: city[:description],
      city_website: city[:city_website],
      region_id: city[:region_id],
      is_capital: city[:is_capital]
    )
end


destinations = [{
  english_name: "Accademia Gallery",
  native_language_name: "Galleria dell'Academia",
  category: "museum",
  description: "The Galleria dell’Accademia, or Accademia Gallery, is without a doubt most famous for its sculptures by the great Renaissance artist, Michelangelo. His Prisoners (or Slaves), his St. Matthew and, above all, the magnificent statue of David within the Tribune are what first draw most of the hundreds of thousands of visitors the museum welcomes every year.", 
  destination_website: "http://www.accademia.org/",
  cost: 23,
  hours: "open Tuesday through Sunday, 8:15am – 6:50pm"
  },{
  english_name: "Vatican Museums",
  native_language_name: "Musei Vaticani",
  category: "museum",
  description: "Vatican City, officially Vatican City State (Italian: Stato della Città del Vaticano) is a walled enclave within the city of Rome. With an area of approximately 44 hectares (110 acres), and a population of 842, it is the smallest internationally recognized independent state in the world by both area and population.", 
  destination_website: 'http://mv.vatican.va/3_EN/pages/MV_Home.html',
  cost: 16,
  hours: '(ticket office) Monday - Sunday, 9am - 4pm. The museum closes at 6pm.',
  notes_about_visiting: 'Every last Sunday of the month, entrance is free between 9am - 12:30pm, and the Museum closes at 2pm.' } ]
  # },{
  # english_name: ,
  # native_language_name: ,
  # category: ,
  # description: , 
  # destination_website: ,
  # cost: ,
  # hours: ,
  # notes_about_visiting: ,
  # closed_holidays: ,
  # address_id: 
  # },{
  # english_name: ,
  # native_language_name: ,
  # category: ,
  # description: , 
  # destination_website: ,
  # cost: ,
  # hours: ,
  # notes_about_visiting: ,
  # closed_holidays: ,
  # address_id: 
  # },{
  # english_name: ,
  # native_language_name: ,
  # category: ,
  # description: , 
  # destination_website: ,
  # cost: ,
  # hours: ,
  # notes_about_visiting: ,
  # closed_holidays: ,
  # address_id: 
  # },{
  # english_name: ,
  # native_language_name: ,
  # category: ,
  # description: , 
  # destination_website: ,
  # cost: ,
  # hours: ,
  # notes_about_visiting: ,
  # closed_holidays: ,
  # address_id: 
  # },


destinations.each do |destination| 
  puts "===================="
  puts "Saving destination..."
  puts "Street destination: #{destination[:english_name]}"
  puts "===================="

  find_destination = Destination.where(english_name: destination[:english_name]).first

  if find_destination.present?
    Destination.update(find_destination.id,
        english_name: destination[:english_name],
        native_language_name: destination[:native_language_name],
        category: destination[:category],
        description: destination[:description], 
        destination_website: destination[:destination_website],
        cost: destination[:cost],
        hours: destination[:hours],
        notes_about_visiting: destination[:notes_about_visiting],
        closed_holidays: destination[:closed_holidays]
      )
  else
    Destination.create!(
      english_name: destination[:english_name],
      native_language_name: destination[:native_language_name],
      category: destination[:category],
      description: destination[:description], 
      destination_website: destination[:destination_website],
      cost: destination[:cost],
      hours: destination[:hours],
      notes_about_visiting: destination[:notes_about_visiting],
      closed_holidays: destination[:closed_holidays]
    )
  end

end


addresses = [{ 
                street_address: "Viale Vaticano", 
                phone_number: "0039 06 69884676 - 0039 06 69883145",
                zip: "00165",
                city_id: City.where(english_name: "Rome").first.id.to_int, 
                destination_id: Destination.where(english_name: "Vatican Museums").first.id.to_int
                },
                {street_address: "Via Ricasoli 58-60",
                zip: "50122", 
                city_id: City.where(english_name: "Florence").first.id.to_int,
                destination_id: Destination.where(english_name: "Accademia Gallery").first.id.to_int }] 
                

addresses.each do |address| 
  puts "===================="
  puts "Saving address..."
  puts "Street address: #{address[:street_address]}"
  puts "City: #{address[:city_id]}, Destination: #{address[:destination_id]}"
  puts "===================="

  find_address = Address.where(street_address: address[:street_address]).first

  if find_address.present?
    Address.update(find_address.id,
      street_address: address[:street_address],
      phone_number: address[:phone_number],
      zip: address[:zip],
      city_id: address[:city_id], 
      destination_id: address[:destination_id]
    )
  else
    Address.create!(
      street_address: address[:street_address],
      phone_number: address[:phone_number],
      zip: address[:zip],
      city_id: address[:city_id], 
      destination_id: address[:destination_id]
    )
  end
end

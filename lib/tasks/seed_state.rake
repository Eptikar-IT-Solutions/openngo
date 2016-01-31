namespace :db do
  task :seed_state => :environment do
		states = {"en" => [ "Al Jazirah", "Blue Nile ", "Sennar", "White Nile", "Central Darfur", "East Darfur", "North Darfur", "South Darfur", "West Darfur", "Kassala", "Al Qadarif","Red Sea", "North Kurdufan", "South Kurdufan", "West Kurdufan", "Northern", "River Nile", "Khartoum"], "ar" =>[ "الجزيرة", "النيل الأزرق", "سنار", "النيلالأبيض", "وسط دارفور", "شرق دارفور", "شمال دارفور", "جنوب دارفور", "غرب دارفور", "كسلا", "القضارف", "البحر الأحمر", "شمال كردفان", "جنوب كردفان", "غرب كردفان", "الشمالية", "نهر النيل", "الخرطوم"]}

		(0..17).each do |n|
		  State.create(name: states["en"][n])
		  State::Translation.create(name: states["ar"][n], state_id: State.last.id, locale: "ar")
	    end  
  end
end

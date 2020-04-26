# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# populating lecturer_list table

lecturer_list = [
    ["Robert", "Kaiser"],
    ["Thomas", "Steffen"],
    ["Detlef", "Richter"],
    ["Dirk", "Krechel"],
    ["Thomas", "Heimrich"],
    ["Wolfgang", "Weitz"],
    ["Martin", "Gergeleit"],
    ["Heinz","Werntges"],
    ["Robert", "Kaiser"],
    ["Ulrich", "Schwanecke"],
    ["Christoph", "Schulz"],
    ["Lorenz", "Jarass"],
    ["Steffen", "Reith"],
    ["Sven Eric", "Panitz"],
    ["Peter", "Barth"],
    ["Bodo", "Igler"],
    ["Bernhard", "Geib"]
]

lecturer_list.each do |first_name, family_name|
  Lecturer.create( first_name: first_name, family_name: family_name )
end

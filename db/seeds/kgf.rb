#encoding: utf-8
puts 'START to include KGF building'
KGF = Building.find(4)
KGF.rooms.destroy_all
KGF.rooms.create([
	{ :name => '402' },
	{ :name => '417' },
	{ :name => '418' },
	{ :name => '421' },
	{ :name => '422' },
	{ :name => '423' },
	{ :name => '425' },
	{ :name => '428' },
	{ :name => '504' },
	{ :name => '505' },
	{ :name => '517' },
	{ :name => '519' },
	{ :name => '520' },
	{ :name => '521' },
	{ :name => '522' },
	{ :name => '523' },
	{ :name => '524' },
	{ :name => '525' },
	{ :name => '526' },
	{ :name => '723' },
	{ :name => '802' },
	{ :name => '803' },
	{ :name => '804' },
	{ :name => '805' },
	{ :name => '809' },
	{ :name => '810' },
	{ :name => '811' }
])
puts 'STOP to include KGF building'
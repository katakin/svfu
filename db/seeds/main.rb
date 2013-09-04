#encoding: utf-8
puts 'CREATING ROLES'
Role.delete_all
Role.create([
  { :name => 'admin' }, 
  { :name => 'user' },
  { :name => 'guest' }
], :without_protection => true)

puts 'SETTING UP DEFAULT USER LOGIN'
User.delete_all
user = User.create! :name => 'First User', :email => 'user@example.com', :password => 'please123', :password_confirmation => 'please123'
puts 'New user created: ' << user.name
user2 = User.create! :name => 'Second User', :email => 'user2@example.com', :password => 'please123', :password_confirmation => 'please123'
puts 'New user created: ' << user2.name
user.add_role :admin
user2.add_role :user

# Faculties
puts 'Start adding faculties'
Faculty.delete_all
# Faculty.reset_pk_sequence
ADF = Faculty.create!(
    :id => 1,
    :name => 'Автодорожный факультет',
    :url => 'http://s-vfu.ru/universitet/rukovodstvo-i-struktura/instituty/adf')
BGF = Faculty.create!(
    :id => 2,
    :name => 'Биолого-географический факультет',
    :url => 'http://s-vfu.ru/universitet/rukovodstvo-i-struktura/instituty/bgf')
GRF = Faculty.create!(
    :id => 3,
    :name => 'Геологоразведочный факультет',
    :url => 'http://s-vfu.ru/universitet/rukovodstvo-i-struktura/instituty/grf')
GF = Faculty.create!(
    :id => 4,
    :name => 'Горный факультет',
    :url => 'http://s-vfu.ru/universitet/rukovodstvo-i-struktura/instituty/gf')
ITI = Faculty.create!(
    :id => 5,
    :name => 'Инженерно-технический институт',
    :url => 'http://s-vfu.ru/universitet/rukovodstvo-i-struktura/instituty/iti')
IZFIR = Faculty.create!(
    :id => 6,
    :name => 'Институт зарубежной филологии и регионоведения',
    :url => 'http://s-vfu.ru/universitet/rukovodstvo-i-struktura/instituty/izfir')
IMI = Faculty.create!(
    :id => 7,
    :name => 'Институт математики и информатики',
    :url => 'http://s-vfu.ru/universitet/rukovodstvo-i-struktura/instituty/imi')
IP = Faculty.create!(
    :id => 8,
    :name => 'Институт психологии',
    :url => 'http://s-vfu.ru/universitet/rukovodstvo-i-struktura/instituty/ip')
IFKIS = Faculty.create!(
    :id => 9,
    :name => 'Институт физической культуры и спорта',
    :url => 'http://s-vfu.ru/universitet/rukovodstvo-i-struktura/instituty/ifkis')
IYIKN = Faculty.create!(
    :id => 10,
    :name => 'Институт языков и культуры народов Северо-Востока РФ',
    :url => 'http://s-vfu.ru/universitet/rukovodstvo-i-struktura/instituty/iyikn')
IF = Faculty.create!(
    :id => 11,
    :name => 'Исторический факультет',
    :url => 'http://s-vfu.ru/universitet/rukovodstvo-i-struktura/instituty/if')
MI = Faculty.create!(
    :id => 12,
    :name => 'Медицинский институт',
    :url => 'http://s-vfu.ru/universitet/rukovodstvo-i-struktura/instituty/mi')
PI = Faculty.create!(
    :id => 13,
    :name => 'Педагогический институт',
    :url => 'http://s-vfu.ru/universitet/rukovodstvo-i-struktura/instituty/pi')
TI = Faculty.create!(
    :id => 14,
    :name => 'Технологический институт',
    :url => 'http://s-vfu.ru/universitet/rukovodstvo-i-struktura/instituty/ti')
FTI = Faculty.create!(
    :id => 15,
    :name => 'Физико-технический институт',
    :url => 'http://s-vfu.ru/universitet/rukovodstvo-i-struktura/instituty/fti')
FLF = Faculty.create!(
    :id => 16,
    :name => 'Филологический факультет',
    :url => 'http://s-vfu.ru/universitet/rukovodstvo-i-struktura/instituty/flf')
FEI = Faculty.create!(
    :id => 17,
    :name => 'Финансово-экономический институт',
    :url => 'http://s-vfu.ru/universitet/rukovodstvo-i-struktura/instituty/fei')
YF = Faculty.create!(
    :id => 18,
    :name => 'Юридический факультет',
    :url => 'http://s-vfu.ru/universitet/rukovodstvo-i-struktura/instituty/yf')
puts 'Stop adding faculties'
puts 'Start adding levels'
#Levels
Level.delete_all
# Level.reset_pk_sequence
Level.create([
    {:id => 1, :name => '1'},
    {:id => 2, :name => '2'},
    {:id => 3, :name => '3'},
    {:id => 4, :name => '4'},
    {:id => 5, :name => '5'},
    {:id => 6, :name => '6'},
    {:id => 7, :name => 'МАГ'}])
puts 'Stop adding levels'
puts 'Start adding pairs'
Pair.delete_all
# Pair.reset_pk_sequence
Pair.create([
    {:id => 1, :name => 1, :duration => '08:00 - 09:35'},
    {:id => 2, :name => 2, :duration => '09:50 - 11:25'},
    {:id => 3, :name => 3, :duration => '11:40 - 13:15'},
    {:id => 4, :name => 4, :duration => '14:00 - 15:35'},
    {:id => 5, :name => 5, :duration => '15:45 - 17:20'},
    {:id => 6, :name => 6, :duration => '17:30 - 19:05'}
    ])
puts 'Stop adding pairs'
puts 'Start adding weekdays'
Weekday.delete_all
# Weekday.reset_pk_sequence
Weekday.create([
    {:id => 1, :name => 'Понедельник'},
    {:id => 2, :name => 'Вторник'},
    {:id => 3, :name => 'Среда'},
    {:id => 4, :name => 'Четверг'},
    {:id => 5, :name => 'Пятница'},
    {:id => 6, :name => 'Суббота'},
    {:id => 7, :name => 'Воскресенье'}
    ])
puts 'Stop adding weekdays'

puts 'Start adding buildings'
Building.delete_all
# Building.reset_pk_sequence
Building.create([    
    {:id => 1, :name => 'КФЕН'},
    {:id => 2, :name => 'КТФ'},
    {:id => 3, :name => 'МИ'},
    {:id => 4, :name => 'КГФ'},
    {:id => 5, :name => 'УЛК'},
    {:id => 6, :name => 'ГУК'}
    ])
puts 'Stop adding buildings'

puts 'FINISHED'
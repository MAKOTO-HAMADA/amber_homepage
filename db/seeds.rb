# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


## adominのログイン情報... 
# $ rails c → Admin.allで確認可能（パスワードは不可）
Admin.create!(
   email: 'makoto.se1988@outlook.jp',
   password: 'makoto1988'
)
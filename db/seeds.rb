# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all
Product.create(name: "apron1",info: "大人用エプロンサイズはS,M,L です",product_image: "apron1.jpg",price:1000,category:"g",status:"on")
Product.create(name: "apron2",info: "大人用エプロンサイズはS,M,L です",product_image: "apron2.jpg",price:1100,category:"g",status:"on")
Product.create(name: "recipe1",info: "レシピ本１です",product_image: "recipe1.jpg",price:2000,category:"b",status:"on")
Product.create(name: "recipe2",info: "レシピ本２です",product_image: "recipe2.jpg",price:3000,category:"b",status:"es")


Customer.delete_all
Customer.create(last_name:"松下",first_name:"昌弘",last_kana:"マツシタ",first_kana:"マサヒロ",phone:"08012345678",email:"mmatsu3737@gmail.com",zip1:"150",zip2:"0041",pref:"東京都",city:"渋谷区",addr1:"神南1-8-18",addr2:"クオリア神南フラッツ1203")
Customer.create(last_name: "松下",first_name: "佐久良",last_kana: "マツシタ",first_kana: "サクラ", phone:"08098765432", email:"mmatsu37@softbank.ne.jp", zip1:"154", zip2:"0015", pref:"東京都", city:"世田谷区", addr1:"桜新町1-21-13", addr2:"ラミテリア桜新町501")



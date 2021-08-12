# README

## 概要
- Udemyの講座で勉強したアプリ
  - はじめてのRuby on Rails入門-RubyとRailsを基礎から学びWebアプリケーションをネットに公開しよう
  - https://www.udemy.com/course/the-ultimate-ruby-on-rails-bootcamp/
- Ruby on Rails

## メモ

### コントローラ作成
1. `$ rails g controller questions`
2. `$ rails g controller answers`

### モデル作成
1. `$ rails g model question name:string title:string content:text`
2. `$ rails db:migrate`
3. seeds.rb 編集
4. `$ rails db:seeds`
5. `$ rails g model answer question:references name:string content:text`
6. question.rb に has_many の設定を追加
7. `$ db:migrate`

### bootstrap 導入
1. Gemfile に以下記述
  ```
  gem 'bootstrap', '~> 4.1.1'
  gem 'jquery-rails', '~> 4.3.1'
  ```
2. `$ bundle install`
3. `$ mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss`
4. javascripts/application.js に以下追記
  ```
  //= require jquery3
  //= require popper
  //= require bootstrap
  ```
5. stylesheets/application.scss に以下追記
  ```
  @import "bootstrap";
  ```

### dbconsole
```
$ rails dbconsole

sqlite> .tables
ar_internal_metadata schema_migrations users

sqlite> .schema users
CREATE TABLE IF NOT EXISTS "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "age" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);

sqlite> .q
```

### console
```
$ rails console

参照
> User.all
> User.find(2)

レコードの作成
> user = User.new
> user.name = 'Yuta Nakamura'
> user.age = 20
> user.save
または
> user = User.new(name: 'Yuta Nakamura', age: 20)
> user.save

レコードのアップデート
> yamada = User.find(2)
> yamada.name = 'Hanako Yamada'
> yamada.age = 30
> yamada.save

レコードの削除
> yamada = User.find(2)
> yamada.destroy
または
> User.find(2).destroy
```
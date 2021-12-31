# README

# アプリ名

Mathnection
<br>
<br>

# アプリケーションの概要

ユーザーを登録すると自分で作成した数学の問題を投稿することができます。自身が投稿した問題は、編集と削除をすることができます。他のユーザーが投稿した問題を閲覧することもでき、ログイン状態ではコメントし、解くこともできます。
<br>
<br>

# URL 



#### Herokuによるデプロイ



#### Basic認証
- ID: admin
- Pass: 2222
<br>
<br>

# テスト用アカウント
#### 投稿者用
- メールアドレス: test1@math
- パスワード: test1math



#### コメント者用
- メールアドレス名: test2@math 
- パスワード: test2math
<br>
<br>

# 実装機能

## トップページ

<br>

## 1.ユーザー登録機能
ユーザー登録することで投稿、コメントできるようになる。（ユーザー登録していない人でも投稿している問題を見ることは可能。）


<br>

## 2.問題投稿機能
問題画像を選択し、問題本文やテーマを入力すると、投稿することができる。（


<br>

## 3.問題編集機能
投稿した問題について、編集することができます。その際に、ユーザーの手間を省くため投稿時の情報が表示されるようになっています。



## 4.商品の削除機能
投稿中であった問題について、削除ボタンを押すことで商品を削除することができます。



<br>

## 5.問題へのコメント機能
投稿されている問題に対して、コメントをすることができる。



<br>
<br>

## アプリケーションを作成した背景
数学好きがいつでも自分の作成した問題を出題し合うことができ、また解き合うことで、数学を通じた繋がりを生み出す。



## 洗い出した要件
https://docs.google.com/spreadsheets/d/1zIxWsTvk-IQaGU5xOokiufJjLCRmEZ1IlZUjk4dvSas/edit#gid=982722306


## 実装した機能についての画像やGIFおよびその説明

## データベース設計(ER図)






# テーブル設計

### users テーブル

| Column             | Type   | Options                   |
| :----------------- | :----- | :------------------------ |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |

### Association

- has_many :questions
- has_many :comments

## questions テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| main       | text       | null: false,                   |
| theme      | text       | null: false,                   |
| user       | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| content    | text       | null: false                    |
| prototype  | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :questions
- belongs_to :user


## 開発環境


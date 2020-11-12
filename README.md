# 'kurogane'のwebサイト

* webサイトの概要

      このサイトはニュース・投資情報のまとめサイトです。

情報は基本経済などを中心としています。また、ニュースをまとめているだけではなく、投資情報などを共有できるような投稿サイトの面も有しています。
#
* このサイトの作成理由

 私自信が前職で感じた若い人たちを中心に投資などの普及ができたらと考えたからです。
 #
* このサイトのURL

http://
#
* テスト用アカウント

 Basic認証:ユーザー名():pw(),
 #
 * 利用方法

 新規登録を行う→自分の気になるニュースがあれば、画像をクリックするとニュースのサイトに遷移できる。また、投稿されている記事をクリックすると記事の詳細に遷移また気に入った記事であれば「いいね」もできるようにしている。また、一番下のQRを読み込みLINEの友達追加をして頂くと1時間に一度最新のニュースがLINEに届けます。
#
* 目指した課題解決

        老後のお金関連の不安を解消するため。

若い人たちを中心に手軽に投資情報、ニュースなどを取得して資産運用の機会につながれば、
皆が将来の年金などの不安を解消できるのではないかと。
#
* 洗い出した要件

ユーザー認証機能 / 記事投稿機能 / いいね機能 / LINEAPI / NEWSAPI /
#
* 実装した機能についてのGIFと説明

・いいね機能。

気に入った記事をいいね！できる機能。投稿者の評価へと。
[![Image from Gyazo](https://i.gyazo.com/1321b28c7433a70b94f9e914c5b02b02.gif)](https://gyazo.com/1321b28c7433a70b94f9e914c5b02b02)
・LINE通知（ニュース）

QRから友達追加をしていただけると6時間ごとにニュースが届くようになります。
[![Image from Gyazo](https://i.gyazo.com/08d590206e778add71a6fdd75f6113f1.gif)](https://gyazo.com/08d590206e778add71a6fdd75f6113f1)


#
* データベース設計

      ・usersテーブル

| colum          |  Type       | Options      |
| -------------- | ----------- | ------------ |
| email          | string      | null: false  |
| password       | string      | null: false  |
| nickname       | string      | null: false  |
| firstname      | string      | null: false  |
| lastname       | string      | null: false  |
| firstname_kana | string      | null: false  |
| lastname_kana  | string      | null: false  |

  ・Association
 - has_many :article, through: :favorite
 - has_many :favorite

       articleテーブル

| Colum          |  Type       | Options      |
| -------------- | ----------- | ------------ |
| title          | string      | null: false  |
| description    | text        | null: false  |
| category_id    | integer     | null: false  |
| user_id        | references  | foreign_key  |
・Association
 - belongs_to :user, through: :favorite
 - has_many :favorite

       favoriteテーブル
| Colum          |  Type       | Options      |
| -------------- | ----------- | ------------ |
| user_id        | references  | foreign_key  |
| article_id     | references  | foreign_key  |
・Association
 - belongs_to :user
 - belongs_to :article

       news_storeテーブル
| Colum          |  Type       | Options      |
| -------------- | ----------- | ------------ |
| title          | string      | null: false  |
| description    | text        | null: true   |
| url            | string      | null: false  |
| category       | string      | null: false  |
| urlToImage     | string      | null: true   |
#
* ローカルでの動作方法

basic認証の
#
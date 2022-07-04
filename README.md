# warikan

割り勘アプリを作成する予定でしたが、上位互換アプリを見つけたため、開発を中断し、ソースを公開することにしました。
そのアプリが[Settle Up](https://settleup.io/)です。
日本語対応されていませんが、便利なので是非使ってみてください。

[こちら](http://translate.settleup.io/collaboration/project?id=158241)で翻訳者も募集しているみたいです。

## どういうアプリ？

旅行などで複数人で支払いをした場合に、最後に誰にいくら支払えばいいのかを計算してくれるアプリ

## 開発概要

Flutter での mvvm + repository パターンの実装経験のために開発していました。

Flutter を選んだ理由は ReactNative での開発経験があったのと、最近流行っているからです。

## 使用したフレームワーク、ライブラリなど

- Flutter
- Cloud Firestore
- Riverpod
- Flutter Hooks
- Auto Route
- Freezed

## 実装した機能

- Group, Payment の Read
  起動時に Firestore から読み込まれます

- Payment の Create
  Firestore に書き込みます

validate もします

- Payment の Update
  Firestore のデータを上書きします

- Payment の Delete
  Firestore のデータを削除します

## 未実装

- Drawer からのページ遷移（Drawer 自体は実装）
- Group の Create, Update, Delete
- ユーザー認証
- etc

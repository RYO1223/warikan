# warikan

割り勘アプリを作成する予定でしたが、上位互換アプリを見つけたため、開発を中断し、ソースを公開することにしました。
そのアプリが[Settle Up](https://settleup.io/)です。
日本語対応されていませんが、便利なので是非使ってみてください。

[こちら](http://translate.settleup.io/collaboration/project?id=158241)で翻訳者も募集しているみたいです。

## どういうアプリ？

旅行などで複数人で支払いをした場合に、最後に誰にいくら支払えばいいのかを計算してくれるアプリ

## 開発概要

Flutter での mvvm + repository パターンの実装練習のために開発していました。

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

https://user-images.githubusercontent.com/70420716/177105904-c3b18e41-8216-4a1b-8cf6-87a2617804be.mov

- Payment の Create

Firestore に書き込みます

https://user-images.githubusercontent.com/70420716/177105967-3f0d29d7-8cd2-4d66-b137-7b13b5c89ef7.mov

validate もします

![validate](https://user-images.githubusercontent.com/70420716/177106009-5d86a7d6-25a3-4940-8fd8-9a7cbf64d747.png)

- Payment の Update

Firestore のデータを上書きします

https://user-images.githubusercontent.com/70420716/177106078-3186dcff-602d-4a7e-9549-6f9818704bf9.mov

- Payment の Delete

Firestore のデータを削除します

https://user-images.githubusercontent.com/70420716/177106118-b599caf1-f109-4f24-aaa7-ee183a7c015e.mov

## 未実装

- Drawer からのページ遷移（Drawer 自体は実装）
- Group の Create, Update, Delete
- ユーザー認証
- etc

# LivePlanningManager

## サービス概要
「LivePlanningManager」は、ライブ参加時の持ち物準備をサポートするサービスです。

## このサービスへの思い・作りたい理由
私はライブが好きで、年に4回ほど趣味として参加しています。しかし、短い期間で何回もライブに行くことは少なく、前回持って行ったものを覚えていないことがほとんどでした。そのため、毎回一から持ち物を考えるのが手間で面倒だと感じていました。

また、ライブによって必要な持ち物が異なることもあり、そのたびに新たにリストを作成する必要がありました。そこで、「LivePlanningManager」を企画しました。このサービスは、ライブごとの必要な持ち物を管理できるため、参加者が持ち物を忘れるリスクを低減できます。

## ユーザー層について
「LivePlanningManager」は、ライブ参加者全般に向けたサービスですが、特に、ライブが好きで頻繁に異なるイベントに参加する方や、準備に不安を感じる方におすすめです。

## サービスの利用イメージ
1.会員登録：
  ・「LivePlanningManager」のアカウントを作成し、サービスを利用できるようになります。

2.ライブ登録：
  ・ライブ登録機能を使用して、ライブ情報を入力します。
  ・項目は、タイトル、ライブ会場、日付、開場時間、開演時間、出発時間、持ち物リスト、タグです。
  ・持ち物リストは後で管理しやすいようにチェックボックスで操作できます。

3.LINE通知機能：
  ・出発時間が近づくと、通知が送られます。

4.ライブ参加履歴の保存：
  ・過去のライブ参加履歴が保存され、再度参加する際や似たようなライブに参加するときに役立ちます。

5.持ち物リストを投稿：
  ・作成した持ち物リストを任意で投稿できます。匿名での投稿も可能です。

6.持ち物リスト投稿一覧ページの閲覧：
  ・未ログインでも持ち物リスト投稿一覧ページを閲覧できます。

## ユーザーの獲得について
・ライブ仲間やライブ好きな友人に提案する：アプリの魅力や便利さを具体的に説明し、口コミで共有します。そうすることで、安心感や信頼性を提供し、新規ユーザーの獲得を促進します。

・アプリにSNS共有機能をつけ、拡散してもらいやすくする：アプリ内にSNS共有機能を導入し、ユーザーが手軽にアプリの魅力を友人やフォロワーと共有できるようにします。

## サービスの差別化ポイント・推しポイント
・通知機能の効果的な活用：通知機能は出発時間が近づいた際にリマインダーを送ることで、ユーザーが移動を忘れるリスクを低減します。これにより、余裕をもってライブに参加でき、ストレスなく移動ができる点が魅力です。

・履歴の活用：過去のライブと持ち物リストの履歴を保存し、同じライブや似たようなライブに参加する際、より効率的な準備ができます。

・SNS共有機能：SNS共有機能を通じて手軽にアプリを広め、新規ユーザーの獲得を促進します。

・持ち物リストの投稿機能：持ち物リストの投稿機能によって、他のユーザーとの情報交換ができます。

## 実装を予定している機能
### MVP
・ユーザー登録機能

・ログイン, ログアウト機能

・パスワード再設定機能

・ライブ登録機能

・持ち物リスト一覧機能

・LINE通知機能(LINE Messaging API)

・テスト機能(RSpec)

### その後の機能
・ユーザープロフィール機能

・持ち物リスト投稿機能

・タグ機能

・お気に入り機能

・マルチ検索, オートコンプリート機能

・管理ユーザー機能

・SNS共有機能

・PWA機能

## 画面遷移図
[画面遷移図_LivePlanningManager](https://www.figma.com/file/CiZwj9zjqgAh3L7pqH49ap/LivePlanningManager?type=design&node-id=0%3A1&mode=design&t=o6Ubn2nYSTTa9klm-1)

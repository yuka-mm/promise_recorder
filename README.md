# [promise recorder]

## サービス概要
「子供がなかなか約束を守ってくれない...」と悩んでる方に
約束事をタスク化し、お子様の「出来た！」を増やすきっかけをつくる
ツール型アプリケーションです。

##　想定されるユーザー層
未成年のお子様が居るご家庭の方

## サービスコンセプト
「子どもとの約束事」と一言で言っても、些細なことから大事なことまで様々あるかと思います。
また、お子様の年齢によっても内容は変わってくるかと思います。

**未就学(3歳)の例**
 * あいさつをしっかりする
 * 食べる前に手を洗う
 * 寝る前に歯を磨く
 * おもちゃを使ったらおもちゃ箱にしまう

**中学生(13歳)の例**
 * 使った食器は自分で洗う
 * 自分の部屋は自分で掃除する
 * ゲームは１日2時間まで
 * 門限を守る

もっと細かいものだと、脱いだ服は洗濯カゴに、ゴミはゴミ箱に、などもあるかもしれません。
親からしたら当たり前のことであり、守って欲しいからするこれらの約束事ですが、
子どもからすると多すぎて覚えられなかったり、「ちょっとくらい...」という気持ちから守れなかったりします。
約束を守ってもらえないことで親がストレスを感じ、守らないことに怒る。
そして怒られることで子どものストレスにもなる。お子様が多いご家庭だとそのストレスも倍に...。
そんな悪循環を減らし、お子様が約束を守るきっかけをつくれればと考えました。

## サービスの利用イメージ
1. 約束事項をタスク化しお子様がタスクをこなすことでポイントを貯める
2. PaydayとRewardを設定することでやる気を促す
　　例）未就学児
　　　　Payday：１週間ごとに設定
　　　　Reward：10個以上タスクがクリアできれば週末に好きなお菓子を買ってもらえる
　　例）中学生
　　　　Payday：１ヶ月ごとに設定
　　　　Reward：獲得したポイントが次月のお小遣いの金額になる
3. これを繰り返すことでゲーム感覚で約束を守ってもらい、習慣化させる

## ユーザーの獲得について
SNSやRUNTEQコミュニティを通じてサービスをアピールし、サービス利用につなげます。

## サービスの差別化ポイント・推しポイント
同じようなサービスに幼児〜小学校低学年向けのサービスは存在しています。
しかし、ある程度の年齢になると利用しづらくなり、利用するサービスを切り替えなければいけない印象がありました。
また、お子様の年齢が離れていて複数のアプリケーションを利用しなくてはいけないと感じました。

・お子様の登録をしていただくことで、それぞれの約束事項を個別にタスク化し管理できる
・お子様の成長やご兄弟の年齢幅を気にせず、１つのアプリケーションで管理できるため長く利用できる

という点がポイントになります。

## 実装を予定している機能
### MVP
* 会員登録
* ログイン
* マイページ
* お子様の登録
* タスク設定
* PaydayとRewardの設定
* LINE通知
* 利用規約、プライバシーポリシー

### その後の機能
* タスクのグラフ化
* パスワードリセット機能
* メールアドレスの変更
* 退会
* 利用案内（サイトの簡単な案内と利用例を数ページ、ログイン前に閲覧しイメージを掴んでもらう）
* ヘルプページ（各設定の仕方などを記載、管理者にメールできるリンクをつける）
* 管理画面

### 画面遷移図
figmaのリンク:https://www.figma.com/file/U3jWosjwUxRJwZDBnV0sVi/promise-recorder?type=design&node-id=0%3A1&mode=design&t=E0d5TVMiefE3FuVR-1

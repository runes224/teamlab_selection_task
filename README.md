## 目次

- 概要
- 利用技術と内容
- この課題を通して学んだこと
- 工夫した点
- 苦労した点
- 参考

## 概要
タスクの追加／変更／削除が可能なREST API + ajaxでAPIを操作可能なWebページ  
（製作期間 10/12(土)〜10/25(金)）
### Webページ（フロントエンド）
https://teamlab-selection-task-hitaka.netlify.com
### Github（フロントエンド）
https://github.com/runes224/teamlab_selection_task_front

## 利用技術と内容

### サーバサイド
* 利用技術
    * Ruby 2.6.5
    * Rails 5.2.3
    * MySQL 5.7.22
* 内容
    * REST APIの実装
    * Rspecを使ったモデルのテスト／結合テスト
    * CORSの設定
### フロントエンド
* 利用技術
    * jQuery 3.3.1
    * Bootstrap 4
    * DataTables 1.10.16
* 内容
    * ajaxを用いたREST APIの操作
    * SSL/HTTPS
    * Netlifyを利用した自動デプロイ
        * GitHubへのpushがトリガー
    * 検索機能／ソート機能／ページネーション
### インフラ
* 利用技術
    * AWS ( VPC / EC2 / ACM / ALB )
    * Docker 19.03.2
    * CircleCI 2
* 内容
    * 開発環境／本番環境をDockerで構築
    * 独自ドメインとSSL証明書の取得と設定
    * CIによるデプロイの自動化
        * GitHubへのpushがトリガー
        * masterブランチ＆テスト成功時のみデプロイ
        
## この課題を通して学んだこと
* AWS／CircleCIの各種サービスの基本概念とその利用方法
* Dockerの仕組み
* jQueryでのJSONオブジェクトの操作

## 工夫した点
* 理解度を高めるため、コメントを記入
* AWS CLIを用いて、デプロイ時のみCircleCIからEC2へのアクセスを許可する

## 苦労した点
* Docker + EC2を使った自動デプロイの参考サイトが少なく、苦労した。

## 参考
- [GitHub+CircleCI入門 - Qiita](https://qiita.com/tatane616/items/8624e61473a9957d9a81)
- [CircleCI→herokuのCI/CD構築手順(デプロイ先をstagingとprodcutionで切替） - Qiita](https://qiita.com/daichi41/items/972483e963b6a08933d8)
- [RubyMine で Git を使う - Qiita](https://qiita.com/Yukibou/items/cf9bc7d76a3133656c56)
- [API開発・テスト便利ツール Postmanの使い方メモ - Qiita](https://qiita.com/zaburo/items/16ac4189d0d1c35e26d1)
- [【Rails】APIテストの書き方 - Qiita](https://qiita.com/k-penguin-sato/items/defdb828bd54729272ad)
- [RailsアプリをAWSにイチからデプロイするまでの手順メモ](https://www.codeofduty.me/2018/01/31/railsapp-aws-deploy/)
- [【Rails】APIテストの書き方 - Qiita](https://qiita.com/k-penguin-sato/items/defdb828bd54729272ad)
- [(下準備編)世界一丁寧なAWS解説。EC2を利用して、RailsアプリをAWSにあげるまで - Qiita](https://qiita.com/naoki_mochizuki/items/f795fe3e661a3349a7ce)
- [無料！かつ最短？で Ruby on Rails on Docker on AWS のアプリを公開するぞ。 - Qiita](https://qiita.com/at-946/items/1e8acea19cc0b9f31b98)
- [CircleCIからCapistranoを利用してAWS（EC2）にデプロイする - Qiita](https://qiita.com/ryshinoz/items/85eecd2b860227a45ccd)
- [DataTables.jsでAjaxなデータベースアプリをサクッと作成する - Qiita](https://qiita.com/okoppe8/items/8cc21e044fc400ab4d99)
- [Netlityを用いた静的サイトのホスティング - Qiita](https://qiita.com/_Keitaro_/items/44cc974140a5b99fb6cc)
- [docker-compose.ymlの書き方について解説してみた - Qiita](https://qiita.com/yuta-ushijima/items/d3d98177e1b28f736f04)
- [クジラに乗ったRuby: Evil Martians流Docker+Ruby/Rails開発環境構築（翻訳）](https://techracho.bpsinc.jp/hachi8833/2019_09_06/79035)
- [Docker-Compose の変数定義について - Qiita](https://qiita.com/kimullaa/items/f556431b8103e686f356)
- [docker-compose.ymlの書き方について解説してみた - Qiita](https://qiita.com/yuta-ushijima/items/d3d98177e1b28f736f04)
- [EC2へ自動テスト、デプロイをCircleCIで実現する(Django) - Qiita](https://qiita.com/kenkono/items/ef2f93eee713d154285d)
- [CircleCI2.0からEC2にアクセスするときだけ特定のIPを許可したい - Qiita](https://qiita.com/rintaro-ishikawa/items/02e6a63dbc90ea67a991)
- [Rails5.2でCircleCIビルドエラー。Devise.secret_key was not set. Please add the following to your Devise initializer - Qiita](https://qiita.com/murata0705/items/9c99fc715d8b987a5b6e)
- [Dockerのデータを永続化！Data Volume（データボリューム）の理解から始める環境構築入門 | Enjoy IT Life](https://nishinatoshiharu.com/docker-volume-tutorial/)
- [Dockerfileについて - Qiita](https://qiita.com/tanan/items/e79a5dc1b54ca830ac21)

Meister Hackers
===
[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors)

エンジニアがOSSでチーム開発をする事を支援するWebサービス

## 概要

GitHubで開発したい人と開発に協力したい人をマッチングすることを目的とするWebサービスを開発します。

* GitHubでOSS開発推進したいひとは無償で開発に協力してくれる共同開発者が欲しい。
* 駆け出しエンジニアはベテランエンジニアについて成長したい。

OSS推進者は無償でコントリビューションしてくれる開発者が欲しく、
駆け出しエンジニアはチーム開発やレビューをしてもらい成長させてくれる機会を求めているので、そのマッチングを支援します。

* 開発メンバー募集掲示板機能
* 開発メンバースカウト機能（開発予定）
* 開発メンバー推薦コメント機能(開発予定)
* GitHubダッシュボード機能（開発予定）

## 開発スタートガイド

### 事前条件

* Rails 5.2.2
* Ruby 2.6.0
* PostgreSQL 10.6

and see Gemfile and package.json

### インストール

このプロジェクトは docker-composeで構成管理をしています。

```bash
$ git clone https://github.com/WEBsinjyuku/meister-hackers.git
$ cd meister-hackers
$ docker-commpose build
$ docker-compose run rails bundle install
$ docker-compose run rails yarn install
$ docker-compose run rails rails db:create
$ docker-compose run rails rails db:migrate
$ docker-compose up -d
```

http://localhost:3000 にアクセス。 終了するときは、 `docker-compose down`

See also [Introduction Guide](https://github.com/WEBsinjyuku/meister-hackers/wiki/Introduction-Guide)

## コミュニティに参加

* Slackコミュニティ→[Slackリンク](https://join.slack.com/t/meister-hackers/shared_invite/enQtNTYyMzAyNDM2MjI2LTAzYjIyYmY0ZWM5YWQ2ODc3M2Y4MGI3MWYxMTVmODk5NWU0NmNmMDc1NjVjMDBmODcxZDkyNjUwZTgxMTM0M2I)

* LT会交流会のコミュニテイ→[Connpassリンク](https://ossteam.connpass.com/)

## コントリビューションするには

このプロジェクトはオープンソースですので、あなたのコントリビューションをお待ちしています。

私たちのコーディング規範とプルリクエストの手順についての詳細は、
[CONTRIBUTING.md](https://github.com/WEBsinjyuku/meister-hackers/blob/master/CONTRIBUTING.md) を参照してください。

See also [メンバー募集要綱](https://github.com/WEBsinjyuku/meister-hackers/wiki/%E3%83%A1%E3%83%B3%E3%83%90%E3%83%BC%E5%8B%9F%E9%9B%86%E8%A6%81%E9%A0%85)

## サポート

バクがあった場合は[こちら](https://github.com/WEBsinjyuku/meister-hackers-support)にissueで報告をお願い致します。

## ライセンス

このプロジェクトは MIT ライセンスの元にライセンスされています。 
詳細は[LICENSE](https://github.com/WEBsinjyuku/meister-hackers/blob/master/LICENSE)をご覧ください。

## その他

### 背景

中世ヨーロッパのマイスター制度にインスパイヤされています。

マイスター制度は大学などの教育機関や資格がない時代における技術伝承の仕組みです。
駆け出しの頃から徐々に位があがり、各業界の最高位にはマイスターと呼ばれる称号がついたといいます。

会社が教育に対して投資をせず、現場の即戦力が求められる近年の採用情勢を鑑みると、エンジニアは会社には依存せずに学び成長する必要があります。
そのためには、エンジニアにも師弟関係なるものが必要です。

そこで、現在のエンジニア業界において、このマイスター制度なるコミュニティを復活させて、ベテランエンジニアが中堅、駆け出しエンジニアを育てる仕組みを作ります。

### 参考

* 外部仕様 [Outer Spec](https://github.com/WEBsinjyuku/meister-hackers/wiki/Outer-Spec)
* 内部仕様 [Inner Spec](https://github.com/WEBsinjyuku/meister-hackers/wiki/Inner-Spec)

## Contributors

Thanks goes to these wonderful people ([emoji key](https://github.com/all-contributors/all-contributors#emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->
| [<img src="https://avatars3.githubusercontent.com/u/40923242?v=4" width="100px;" alt="dh_megane"/><br /><sub><b>dh_megane</b></sub>](https://github.com/dh-megane)<br />[🚧](#maintenance-dh-megane "Maintenance") |
[<img src="https://avatars2.githubusercontent.com/u/40596064?v=4" width="100px;" alt="takahashi"/><br /><sub><b>takahashi</b></sub>](https://github.com/takahashi19)<br />[🚧](#maintenance-takahashi19 "Maintenance") |
[<img src="https://avatars1.githubusercontent.com/u/760627?v=4" width="100px;" alt="Tsunemichi Harada"/><br /><sub><b>tsu-nera</b></sub>](https://github.com/tsu-nera)<br />[🚧](#maintenance-tsu-nera "Maintenance") |
[<img src="https://avatars1.githubusercontent.com/u/39451570?v=4" width="100px;" alt="LeonardoMatusaki"/><br /><sub><b>LeonardoMatusaki</b></sub>](https://github.com/LeonardoMatusaki)<br />[🚧](#maintenance-LeonardoMatusaki "Maintenance") |
[<img src="https://avatars1.githubusercontent.com/u/40492325?v=4" width="100px;" alt="hiromoto-kazuya"/><br /><sub><b>hiromoto-kazuya</b></sub>](https://github.com/hiromoto-kazuya)<br />[🚧](#maintenance-hiromoto-kazuya "Maintenance") |
[<img src="https://avatars2.githubusercontent.com/u/45489481?v=4" width="100px;" alt="shikky0331"/><br /><sub><b>shikky0331</b></sub>](https://github.com/shikky0331)<br />[🚧](#maintenance-shikky0331 "Maintenance") |
[<img src="https://avatars3.githubusercontent.com/u/25857381?v=4" width="100px;" alt="takaaa220"/><br /><sub><b>takaaa220</b></sub>](https://github.com/takaaa220)<br />[🚧](#maintenance-takaaa220 "Maintenance") |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!

# アプリケーション名
ALCORHYTHM

# アプリケーション概要
カレンダーに飲酒した記録を追加することで、自分の飲酒結果を確認し、休肝日を設ける意識付けを行うことができる。

# URL
https://alcorhythm.herokuapp.com/

# テスト用アカウント
・Basic認証ID： matsur2  
・Basic認証パスワード： 2150  
・メールアドレス：  test@test.jp  
・パスワード：  aaaa1111

# 利用方法


## 予定確認・更新
テスト用アカウントでログイン後、トップページ（一覧ページ）で飲酒結果の追加・編集・削除を行うことができる。  

## 結果の集計、計算ツール
1.一覧ページ右上部で登録された飲酒結果をもとに直近1週間の休肝日日数の情報や、飲酒した日1日における平均飲酒量を確認できる。  
2.一覧ページ右下部で、アルコール度数を入力するだけでどれほどの量を飲めるかを確認できる計算ツールがある。


# アプリケーションを作成した背景  
リモートワークが増えてきた昨今において、アルコール依存症患者の症状悪化や新たに依存症患者と診断されるケースが増えているというニュースがよく報道されてる。こういった生活習慣に関する課題を解決すべく、スケジュール型のアプリケーションを開発することにした。
# 洗い出した要件  
要件定義シート  
https://docs.google.com/spreadsheets/d/1aioVNgLSpntq_kfpYjhuk6dSSpR-p0NqNvqMkalQSsg/edit?usp=sharing 
# 実装予定の機能  
1.スケジュール作成機能のAjax化  
2.スケジュール作成機能で複数データの保存
# データベース設計  
[![Image from Gyazo](https://i.gyazo.com/985d57312be4bea6f3a66c7ac3795aa9.png)](https://gyazo.com/985d57312be4bea6f3a66c7ac3795aa9)
# 画面遷移図  
[![Image from Gyazo](https://i.gyazo.com/81fbfba9e30e2bc43c4ce35070b7d3ee.png)](https://gyazo.com/81fbfba9e30e2bc43c4ce35070b7d3ee)
# 開発環境  
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code

# 工夫したポイント  
1.性別によってアルコールの基準値が変わるため、ユーザー登録の際、性別を登録させることで一覧ページに表示する情報が男女で変化する点。  
2.集計結果を色分けで表示することで、視覚的にも意識しやすくなる点。



# 単体テスト仕様書

| システム名           | サブシステム名   | 会社名     | 作成者 | 作成日     | 実施者 |
| -------------------- | ---------------- | ---------- | ------ | ---------- | ------ |
| Z Generation Library | 検索結果表示機能 | Kyamy-Tech | 山岸   | 2021/06/01 | 山岸   |

<br>

<table>
  <tr>
    <td>No</td>
    <td>分類</td>
    <td>テスト項目</td>
    <td>検証内容</td>
    <td>実施日</td>
    <td>結果</td>
    <td>備考・特記事項</td>
  </tr>
  <tr>
    <td>1</td>
    <td></td>
    <td>画面表示</td>
    <td>図書のカテゴリ・タイトル・著者・本の場所・詳細が表示されること</td>
    <td><input type="date" value="2021-06-01"></td>
    <td><input type="checkbox" status="true" checked></td>
    <td></td>
  </tr>
  <tr>
    <td>2</td>
    <td></td>
    <td></td>
    <td>検索窓画面で得た情報に合致した蔵書を表示する</td>
    <td><input type="date" value="2021-06-01"></td>
    <td><input type="checkbox" status="true" checked></td>
    <td>①検索窓画面での入力が本の名前とカテゴリ両方の場合、情報に合致する全ての図書を表示する<br>②本の名前のみの場合、入力された言葉が含まれる全ての蔵書を表示する<br>③カテゴリの選択のみの場合、選択されたカテゴリに合致する全ての蔵書を表示する<br>④入力がない場合、全ての蔵書をカテゴリ順に表示する</td>
  </tr>
  <tr>
    <td>3</td>
    <td></td>
    <td>画面遷移</td>
    <td>詳細ボタンを押下でその図書の詳細画面に遷移する</td>
    <td><input type="date" value="2021-06-01"></td>
    <td><input type="checkbox" status="true" checked></td>
    <td></td>
  </tr>
</table>

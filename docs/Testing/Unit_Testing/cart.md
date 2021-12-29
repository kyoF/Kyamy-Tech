# 単体テスト仕様書

| システム名           | サブシステム名 | 会社名     | 作成者 | 作成日     | 実施者 |
| -------------------- | -------------- | ---------- | ------ | ---------- | ------ |
| Z Generation Library | カート機能     | Kyamy-Tech | 藤木   | 2021/06/01 | 藤木   |

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
    <td>詳細から「カートに追加」ボタンをクリックした本の情報を表示すること</td>
    <td><input type="date" value="2021-06-01"></td>
    <td><input type="checkbox" status="true" checked></td>
    <td></td>
  </tr>
  <tr>
    <td>2</td>
    <td></td>
    <td></td>
    <td>上記からカートに追加した場合、「カートに追加しました」とメッセージが表示されること</td>
    <td><input type="date" value="2021-06-01"></td>
    <td><input type="checkbox" status="true" checked></td>
    <td></td>
  </tr>
  <tr>
    <td>3</td>
    <td></td>
    <td></td>
    <td>カートに本がある場合、カテゴリ・タイトル・著者・カートから削除ボタンを、各蔵書ごとに表示すること</td>
    <td><input type="date" value="2021-06-01"></td>
    <td><input type="checkbox" status="true" checked></td>
    <td></td>
  </tr>
  <tr>
    <td>4</td>
    <td></td>
    <td></td>
    <td>カートに本がある場合、前削除ボタンを表示すること</td>
    <td><input type="date" value="2021-06-01"></td>
    <td><input type="checkbox" status="true" checked></td>
    <td></td>
  </tr>
  <tr>
    <td>5</td>
    <td></td>
    <td></td>
    <td>借りるボタンが表示されていること</td>
    <td><input type="date" value="2021-06-01"></td>
    <td><input type="checkbox" status="true" checked></td>
    <td></td>
  </tr>
  <tr>
    <td>6</td>
    <td></td>
    <td>画面遷移</td>
    <td>蔵書ごとに表示されている削除ボタンを押下で、該当の蔵書がカートから削除されていること</td>
    <td><input type="date" value="2021-06-01"></td>
    <td><input type="checkbox" status="true" checked></td>
    <td></td>
  </tr>
  <tr>
    <td>7</td>
    <td></td>
    <td></td>
    <td>全削除ボタンを押下で、カートから全ての蔵書が削除されること</td>
    <td><input type="date" value="2021-06-01"></td>
    <td><input type="checkbox" status="true" checked></td>
    <td></td>
  </tr>
  <tr>
    <td>8</td>
    <td></td>
    <td></td>
    <td>カートに蔵書がない状態で借りるボタン押下で、「図書がありません」とメッセージ表示すること</td>
    <td><input type="date" value="2021-06-01"></td>
    <td><input type="checkbox" status="true" checked></td>
    <td></td>
  </tr>
  <tr>
    <td>9</td>
    <td></td>
    <td></td>
    <td>カートに蔵書がある状態で借りるボタンを押下で、ポップアップが表示されること</td>
    <td><input type="date" value="2021-06-01"></td>
    <td><input type="checkbox" status="true" checked></td>
    <td></td>
  </tr>
  <tr>
    <td>10</td>
    <td></td>
    <td></td>
    <td>ポップアップでキャンセルを押下で、「キャンセルされました」と表示されること</td>
    <td><input type="date" value="2021-06-01"></td>
    <td><input type="checkbox" status="true" checked></td>
    <td></td>
  </tr>
  <tr>
    <td>11</td>
    <td></td>
    <td></td>
    <td>ポップアップで「OK」をクリックすると、「借りました」と表示され、historiesテーブルにカートの図書情報と、借りた日付を登録し、booksテーブルの該当学部をカウントアップすること</td>
    <td><input type="date" value="2021-06-01"></td>
    <td><input type="checkbox" status="true" checked></td>
    <td></td>
  </tr>
</table>

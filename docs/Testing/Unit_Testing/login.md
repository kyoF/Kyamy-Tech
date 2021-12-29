# 単体テスト仕様書

| システム名           | サブシステム名 | 会社名     | 作成者 | 作成日     | 実施者 |
| -------------------- | -------------- | ---------- | ------ | ---------- | ------ |
| Z Generation Library | ログイン機能   | Kyamy-Tech | 藤木   | 2021/06/01 | 藤木   |

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
    <td>ログイン</td>
    <td>画面表示</td>
    <td>ユーザID・パスワードの入力ボックスが表示されていること</td>
    <td><input type="date" value="2021-06-01"></td>
    <td><input type="checkbox" status="true" checked></td>
    <td></td>
  </tr>
  <tr>
    <td>2</td>
    <td></td>
    <td></td>
    <td>ログインボタン・新規登録ボタンが表示されていること</td>
    <td><input type="date" value="2021-06-01"></td>
    <td><input type="checkbox" status="true" checked></td>
    <td></td>
  </tr>
  <tr>
    <td>3</td>
    <td></td>
    <td>入力</td>
    <td>usersテーブルに入っているユーザIDとパスワードを入力し、ログインをクリックすると、TOP画面に遷移すること</td>
    <td><input type="date" value="2021-06-01"></td>
    <td><input type="checkbox" status="true" checked></td>
    <td></td>
  </tr>
  <tr>
    <td>4</td>
    <td></td>
    <td></td>
    <td>usersテーブルに入っていないユーザIDとパスワードw入力し、ログインをクリックすると、エラーが表示されること</td>
    <td><input type="date" value="2021-06-01"></td>
    <td><input type="checkbox" status="true" checked></td>
    <td>ユーザIDが違う場合、「ユーザIDが違います」と表示し、パスワードが違う場合、「パスワードが違います」と表示する</td>
  </tr>
  <tr>
    <td>5</td>
    <td></td>
    <td>画面遷移</td>
    <td>新規登録画面をクリックすると、新規登録画面に遷移すること</td>
    <td><input type="date" value="2021-06-01"></td>
    <td><input type="checkbox" status="true" checked></td>
    <td></td>
  </tr>
  <tr>
    <td>6</td>
    <td></td>
    <td></td>
    <td>DBに登録されたユーザIDにパスワードが合致すれば、TOP画面に遷移すること</td>
    <td><input type="date" value="2021-06-01"></td>
    <td><input type="checkbox" status="true" checked></td>
    <td></td>
  </tr>
</table>

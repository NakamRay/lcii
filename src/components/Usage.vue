<template>
  <v-card>
    <v-toolbar dark color="#a82a30" height="50px">
      <v-toolbar-title>Usage</v-toolbar-title>
      
      <v-spacer></v-spacer>

      <v-btn icon dark @click="close">
        <v-icon>mdi-close</v-icon>
      </v-btn>
    </v-toolbar>
    
    <v-tabs :vertical="$vuetify.breakpoint.smAndUp" color="#efe7e6">
      <v-tab>
        サイト概要
      </v-tab>
      <v-tab>
        ラムダ式
      </v-tab>
      <v-tab>
        型
      </v-tab>

      <v-tab-item>
        <v-card flat style="overflow-y: auto;" :height='windowHeight'>
          <v-card-title>サイト概要</v-card-title>
          <v-card-text>
            <p>
              ラムダ式の簡約を行います．1ステップの簡約ごとに簡約したいRedexを選択できます．
            </p>
          </v-card-text>
          <v-card-title>使い方</v-card-title>
          <v-card-text>
            <p>
              画面下のInputフォームに簡約したいラムダ式を入力します．式の記法については「ラムダ式」を参照してください．
              次に，型環境を入力します（型付きラムダ計算の場合）．型の記法については「型」を参照してください．
              また，それぞれの入力は，「λ」以外半角で行ってください．
            </p>
            <p>
              式と型環境の入力が終わると，Redexの一覧が表示されます．
              それぞれのRedexに割り当てられた番号が各Redexの左に表示されるので，簡約したいRedexの番号を画面下のInputフォームに入力します．
              入力が受け付けられると，選択したRedexのみが簡約された式と，その式に含まれるRedexの一覧が表示されます．
              以降は同様にRedexの番号の入力を繰り返します．式からRedexがなくなり，正規形となった時点で式と型環境の入力に戻ります．
            </p>
          </v-card-text>
          <v-card-title>画面</v-card-title>
          <v-card-text>
            <p>
              画面右にある3つのアイコン（縦長の画面では右下の青いボタンを押すと表示される）は，
              上から「コンソールのクリア」，「簡約の履歴の表示」，「ラムダ式の例の表示」を実行します．
              また，入力したラムダ式や型環境が表示されているブロックの右側にある「UNTYPED」スイッチは，
              切り替えることで型無しのラムダ式を受け付けるようになります．
            </p>
            <div><v-icon>mdi-delete</v-icon> <b>コンソールのクリア</b></div>
            <p>
              ラムダ式，型環境，簡約過程などが入力されているコンソールの内容を消去します．
              消去された内容は「<v-icon>mdi-history</v-icon> <b>簡約の履歴の表示</b>」に保持されます．
            </p>
            <div><v-icon>mdi-history</v-icon> <b>簡約の履歴の表示</b></div>
            <p>
              クリアされたコンソールの内容が表示されます．
            </p>
            <div><v-icon>mdi-lambda</v-icon> <b>ラムダ式の例の表示</b></div>
            <p>
              ラムダ式と型環境の例が一覧されます．クリックすることでその式の簡約が実行されます．
              型付きと型無しの例のそれぞれを，タブを切り替えることで選ぶことが出来ます．
            </p>
          </v-card-text>
          <v-card-title>コマンド</v-card-title>
          <v-card-text>
            <p>
              Inputフォームに「:（コロン）」と決められた文字列を入力することで，それに対応した操作を行うことが出来ます．
            </p>
            <div><b>コンソールのクリア</b></div>
            <p>
              「<v-icon>mdi-delete</v-icon> <b>コンソールのクリア</b>」を実行したときと同じ動作をします．
              ラムダ式，型環境，簡約過程などが入力されているコンソールの内容を消去します．
              <br><br>
              <kbd>:clear</kbd> or <kbd>:c</kbd>
            </p>
            <div><b>簡約の中止</b></div>
            <p>
              簡約を中止して，ラムダ式を受け付ける状態に遷移します．無限ループになったときはこれを実行してください．
              <br><br>
              <kbd>:quit</kbd> or <kbd>:q</kbd>
            </p>
          </v-card-text>
          <v-card-title>α変換</v-card-title>
          <v-card-text>
            <p>
              自由変数の捕捉が起こる場合，対応する束縛変数の名前が変更されるα変換が起こります．
              α変換が行われたとき，名前がどう変更されたのか，下線が引かれた状態で表示されます．
              次の例は，α変換により束縛変数 <kbd>x</kbd> が <kbd>y</kbd> にリネームされたことを示しています．
              <br><br>
              - 例<br>
              <kbd><u>α: x -> y</u></kbd>
            </p>
          </v-card-text>
        </v-card>
      </v-tab-item>
      <v-tab-item>
        <v-card flat style="overflow-y: auto;" :height='windowHeight'>
          <v-card-title>記法</v-card-title>
          <v-card-text>
            <p>
              ラムダ式中の括弧は自由です．括弧がない場合，ラムダ抽象のλx.MのMをできる限り多くとるようになっています．
              <br><br>
              - 例<br>
              <code>λx:INT.x y</code> → <code>λx:INT.(x y)</code>
            </p>
            <p>
              UntypedスイッチがONとなり，型無しのラムダ式を扱うようになったときは，定数やラムダ抽象の型指定を省略して記述します．
              <br><br>
              - 例<br>
              <code>λx:INT.x y:BOOL</code> → <code>λx.x y</code>
            </p>
          </v-card-text>
          <v-card-title>定数</v-card-title>
          <v-card-text>
            <p>
              任意の定数名に「:（コロン）」を付け，型を指定することで定数として扱われます．
              <br><br>
              - 例<br>
              <code>f:INT->BOOL</code><br><br>
              <code>x:INT</code>
            </p>
          </v-card-text>
          <v-card-title>変数</v-card-title>
          <v-card-text>
            <p>
              任意の変数名を決められます．
              <br><br>
              - 例<br>
              <code>x</code>
            </p>
          </v-card-text>
          <v-card-title>ラムダ適用</v-card-title>
          <v-card-text>
            <p>
              半角スペースで並べられたラムダ式は，ラムダ適用として扱われます．括弧を省略して並べた場合，左結合します．
              <br><br>
              - 例<br>
              <code>x y</code><br><br>
              <code>x y z</code> → <code>(x y) z</code>
            </p>
          </v-card-text>
          <v-card-title>ラムダ抽象</v-card-title>
          <v-card-text>
            <p>
              ラムダ抽象で束縛される変数は型を持ちます．また，「λ」は「&（アンパサンド）」でも代用できます．
              <br><br>
              - 例<br>
              <code>λx:INT.x</code> or <code>&x:INT.x</code>
            </p>
            <p>
              ラムダ抽象とラムダ式のラムダ適用は，簡約可能な項（Redex）となります．
              <br><br>
              - 例<br>
              <code>(λx:INT.x) a:INT</code>
            </p>
          </v-card-text>
          <v-card-title>タプル</v-card-title>
          <v-card-text>
            <p>
              複数のラムダ式を「,（カンマ）」で区切り，括弧で囲むとタプルとして扱われます．
              <br><br>
              - 例<br>
              <code>(x, y, z)</code>
            </p>
          </v-card-text>
          <v-card-title>プロジェクション</v-card-title>
          <v-card-text>
            <p>
              タプルに「.（ピリオド）」と数字を続けることで，タプルのn番目を取り出す操作となります．
              <br><br>
              - 例<br>
              <code>(x, y, z).3</code> → <code>z</code>
            </p>
          </v-card-text>
        </v-card>
      </v-tab-item>
      <v-tab-item>
        <v-card flat style="overflow-y: auto;" :height='windowHeight'>
          <v-card-title>型チェック</v-card-title>
          <v-card-text>
            <p>
              簡約を開始する前に入力された式の型規則をチェックします．
              型規則が正しくない場合，Typing Errorと表示され，簡約が開始されません．
            </p>
          </v-card-text>
          <v-card-title>種類</v-card-title>
          <v-card-text>
            <p>
              <i>Type</i> ::= INT | BOOL | <i>Type</i> -><i>Type</i> | (<i>Type</i>, <i>Type</i>, ... , <i>Type</i>)
            </p>
          </v-card-text>
          <v-card-title>記法</v-card-title>
          <v-card-text>
            <p>
              型環境は，自由変数の名前に「：（コロン）」とその型を指定したものを「，（カンマ）」で区切って並べて表現します．
              自由変数を含まない式で，型環境を指定する必要がない場合は，空欄のまま入力することができます．
              <br><br>
              - 例<br>
              <code>a:INT, b:BOOL, f:INT->BOOL</code>
            </p>
          </v-card-text>
          <v-card-title>型規則</v-card-title>
          <v-card-text>
            <p>
              各ラムダ項に対する型規則を以下に示します．Typeは型を，Mはラムダ式を表しています．
              また，[]括弧に囲まれた部分は，型環境の下で正しいとします．
              <br><br>
              - 定数<br>
              <code>c:Type</code>
              <br><br>
              - 変数<br>
              <code>x:Type (xは束縛変数 または 型環境で型を定義済みの自由変数)</code>
              <br><br>
              - ラムダ適用<br>
              <code>M1 M2:Type2 [M1:Type1->Type2, M2:Type1]</code>
              <br><br>
              - ラムダ抽象<br>
              <code>λx.M:Type1->Type2 [x:Type1, M:Type2]</code>
              <br><br>
              - タプル<br>
              <code>(M1,...,Mn):(Type1,...,Typen) [Mi:Typei (1≦i≦n)]</code>
              <br><br>
              - プロジェクション<br>
              <code>M.i:Typei [M:(M1,...,Mn)] (1≦i≦n)</code>
            </p>
          </v-card-text>
        </v-card>
      </v-tab-item>
    </v-tabs>
  </v-card>
</template>

<script>
export default {
  data: () => ({
    windowHeight: 0
  }),
  mounted () {
    this.updateDialogHeight()
    window.addEventListener('resize', this.updateDialogHeight)
  },
  destroyed() {
    window.removeEventListener('resize', this.updateDialogHeight)
  },
  methods: {
    updateDialogHeight () {
      var tabsHeight = this.$vuetify.breakpoint.smAndUp ? 0 : 48
      this.windowHeight = window.innerHeight - tabsHeight - 50
    },
    close () {
      this.$emit('updated')
    }
  }
};
</script>

<style scoped>
.v-dialog p {
  text-indent: 1em;
}
kbd {
  text-indent: 0;
}
code {
  text-indent: 0;
}
.v-card__title {
  padding: 8px 16px 8px !important;
}
.theme--dark.v-tabs > .v-tabs-bar {
    background-color: #333333 !important;
}
</style>

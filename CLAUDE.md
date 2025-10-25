# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

このプロジェクトはMoonBit言語で書かれたCloudflare Workersアプリケーションです。MoonBitコードはJavaScriptにコンパイルされ、Cloudflare Workersのランタイムで実行されます。

## アーキテクチャ

- **MoonBitライブラリ** (`hello.mbt`): MoonBitで書かれたビジネスロジック。JavaScriptにエクスポートされる関数を定義。
- **Worker エントリーポイント** (`index.js`): Cloudflare Workersの fetch ハンドラー。コンパイルされたMoonBit関数をインポートして実行。
- **コマンドラインツール** (`cmd/main/main.mbt`): スタンドアロンのMoonBitプログラム（Worker実行には不要）。

### ビルドとデプロイのフロー

1. MoonBitコードが `target/js/release/build/` 配下のJavaScriptにコンパイルされる
2. `index.js` がコンパイル済みMoonBit関数をインポート
3. Wrangler が Worker を Cloudflare にデプロイ

## 主要コマンド

### 開発とデプロイ
- `npm run dev` または `npm start`: ローカル開発サーバーを起動（Wrangler）
- `npm run deploy`: Cloudflare Workers にデプロイ

### MoonBit開発
- `moon build`: MoonBitコードをビルド（JavaScriptへコンパイル）
- `moon test`: MoonBitのテストを実行
- `moon test --update`: テストの期待値を更新（`inspect` を使用）

### JavaScriptテスト
- `npm test`: Vitestを使用したテスト（Cloudflare Workers環境）

## MoonBit特有の注意点

### エクスポート設定
JavaScriptからMoonBit関数を使用するには、`moon.pkg.json` で明示的にエクスポート設定が必要:
```json
{
  "link": {
    "js": {
      "exports": ["function_name"]
    }
  }
}
```

### テストの書き方
MoonBitテストでは `inspect` 関数を使用してスナップショットテストを行う:
```moonbit
test "example" {
  inspect(value, content="expected output")
}
```

### ビルド成果物
MoonBitコンパイラは `target/js/release/build/` にJSファイルを生成。このパスは `index.js` でインポートされている。

## 設定ファイル

- `wrangler.jsonc`: Cloudflare Workers設定
- `moon.mod.json`: MoonBitモジュール設定
- `moon.pkg.json`: MoonBitパッケージとエクスポート設定
- `vitest.config.js`: Cloudflare Workers環境でのVitest設定

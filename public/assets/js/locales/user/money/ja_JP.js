window.i18nLocales = window.i18nLocales || {};
window.i18nLocales.user = window.i18nLocales.user || {};
window.i18nLocales.user.money = window.i18nLocales.user.money || {};

window.i18nLocales.user.money.ja_JP = {
    // ページタイトル
    page_title:    "残高履歴",
    page_subtitle: "アカウントの残高変動を詳細に追跡します。",

    // アクションボタン
    btn_redeem:    "ギフトカードを使用",
    btn_topup:     "チャージ",

    // サマリーカード
    stat_balance:  "現在の残高",
    stat_guardian: "Luminous Guardian によって保護されています",
    stat_credit:   "累計チャージ",
    stat_debit:    "累計消費",

    // テーブル
    table_title:   "取引明細",

    // テーブルヘッダー
    fields: {
        id:          "取引ID",
        before:      "変動前残高",
        after:       "変動後残高",
        amount:      "金額",
        remark:      "メモ",
        create_time: "日時",
    },

    // 空の状態
    empty_title: "取引履歴がありません",
    empty_desc:  "まだチャージや消費の取引を行っていません。",

    // ページネーション
    pagination_info: "{total} 件中 {from}–{to} 件を表示",

    // モーダル
    modal_giftcard_title:       "ギフトカードを使用",
    modal_giftcard_placeholder: "ギフトカードコードを入力して使用をクリック",
    modal_giftcard_cancel:      "キャンセル",
    modal_giftcard_submit:      "使用する",

    modal_topup_title:       "残高チャージ",
    modal_topup_placeholder: "チャージ金額を入力してください",
    modal_topup_cancel:      "キャンセル",
    modal_topup_submit:      "チャージ",
};

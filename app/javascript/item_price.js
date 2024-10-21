const price = () => {
  // 入力フィールドと表示要素の取得
  const priceInput = document.getElementById("item-price"); // 価格入力フィールド
  const addTaxDom = document.getElementById("add-tax-price"); // 販売手数料を表示する場所
  const profitDom = document.getElementById("profit"); // 利益を表示する場所

  // 入力時のイベントリスナー
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value; // 入力された価格
    const priceValue = parseFloat(inputValue); // 数値に変換

    // 入力が無効な場合は、表示を0にリセット
    if (isNaN(priceValue)) {
      addTaxDom.innerHTML = 0; 
      profitDom.innerHTML = 0; 
    } else {
      // 有効な価格が入力された場合の計算処理
      const tax = Math.floor(priceValue * 0.1); // 販売手数料を計算（10%）
      const sellingProfit = Math.floor(priceValue - tax); // 利益を計算

      // innerHTMLを使って結果を表示
      addTaxDom.innerHTML = tax; // 計算した販売手数料を表示
      profitDom.innerHTML = sellingProfit; // 計算した利益を表示
    }
  });
};

// turbo:load および turbo:render イベントにリスナーを追加
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);
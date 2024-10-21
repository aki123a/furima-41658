window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price"); 
  const profitDom = document.getElementById("profit"); 

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const price = parseFloat(inputValue); // 数値に変換

    if (inputValue === "") {
      // 入力が空の場合
      addTaxDom.innerHTML = 0; 
      profitDom.innerHTML = 0; 
    } else if (isNaN(price)) {
      // 無効な数字の場合
      addTaxDom.innerHTML = "NaN"; 
      profitDom.innerHTML = "NaN"; 
    } else {
      // 有効な数字の場合
      const tax = Math.floor(price * 0.1); // 販売手数料（10%）
      const sellingProfit = Math.floor(price - tax); // 利益計算

      // 結果を表示
      addTaxDom.innerHTML = tax; // 販売手数料を表示
      profitDom.innerHTML = sellingProfit; // 利益を表示
    }
  });
});
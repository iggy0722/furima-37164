window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const priceBeforeTax = document.getElementById("profit");
    const chip = inputValue * 0.1;
    const chipValue = Math.floor(chip);
    const profitPrice = inputValue * 0.9;
    const profitValue = Math.floor(profitPrice);
    addTaxDom.innerHTML = chipValue
    priceBeforeTax.innerHTML = profitValue

})
});
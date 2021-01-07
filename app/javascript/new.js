function calc(){
  const price = document.getElementById('item-price')
  const tax = document.getElementById('add-tax-price')
  const profit = document.getElementById('profit')
  
  price.addEventListener('input', () => {
    const priceValue = price.value;
    const taxValue = Math.floor(priceValue * 0.1)
    tax.innerHTML = taxValue;
    profit.innerHTML = Math.floor(priceValue - taxValue);
  }) 
}

window.addEventListener('load', calc)
window.addEventListener('load', function(){

  const expectpercentageInput = document.getElementById("expect-percentage2")
  expectpercentageInput.addEventListener("input",() =>{
      const inputValue = expectpercentageInput.value;
      const addAmountDom = document.getElementById("add-collect-amount2");
      const Amount = 100/expectpercentageInput.value*12;
      addAmountDom.innerHTML = Math.floor(Amount).toLocaleString();
    })
  })
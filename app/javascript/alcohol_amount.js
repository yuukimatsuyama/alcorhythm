window.addEventListener('load', function(){

  const expectpercentageInput = document.getElementById("expect-percentage")
  expectpercentageInput.addEventListener("input",() =>{
      const inputValue = expectpercentageInput.value;
      const addAmountDom = document.getElementById("add-collect-amount");
      const Amount = 100/expectpercentageInput.value*20;
      addAmountDom.innerHTML = Math.floor(Amount).toLocaleString();
    })
  })
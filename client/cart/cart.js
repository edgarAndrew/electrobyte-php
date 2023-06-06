const cart =document.querySelector('.cart-body')
const total = document.getElementById('total-price')

let price = 0

const data = {}

for (let i = 0; i < localStorage.length; i++) {
    const key = localStorage.key(i)
    try {
        data[key] = JSON.parse(localStorage.getItem(key));
      } catch (error) {
        console.error('Error parsing JSON:', error);
      }
    //data[key] = JSON.parse(localStorage.getItem(key))
}

const updatePrice = () =>{
    total.innerText = `Rs.${price}`
    document.getElementById('subtotal').innerText = `Rs.${price}`
}
for (let [key, value] of Object.entries(data)) {
    let prod = document.createElement('tr')
    if(value.price)
        price += Number(value.price.slice(1,value.price.length)) * Number(value.quantity?value.quantity:'1')

    prod.innerHTML = `
        <span>${key}</span>
        <td>${value.name}</td>
        <td><img src=${value.img} class="cart-img" alt="logo"></td>
        <td><h4>${value.price}</h4></td>
        <td><input type="number" onchange="subtotal(this)" value="${value.quantity?value.quantity:1}"></td>
        <td><h4>${value.price}</h4></td>
        <td><button onclick="removeItem(this)">X</button></td>
    `
    cart.appendChild(prod)
    updatePrice()
}

const removeItem = (e) =>{
    const temp = e.parentElement.parentElement.children
    const key = temp[0].innerText;
    if(confirm("Removing item from cart")){
        localStorage.removeItem(key)
        cart.removeChild(e.parentElement.parentElement)
    }
}
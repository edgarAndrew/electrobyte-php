const container = document.querySelector('.cont-2')

async function getData(){
    const response = await fetch('./processors/data.json')
    const data = await response.json();
    return data;
}

getData().then((ele)=>{
    console.log(ele)
    ele.map((el)=>{
        let prod = document.createElement('div')
        prod.className = "cards"
        prod.innerHTML = `
            <img src="${el.image}" alt="image">
            <span>${el.id}</span>
            <h3>${el.name}</h3>
            <h5>${el.price}</h5>
            <button class='btn' onclick="func(this)"><h4>ADD TO CART</h4></button>
        `
        container.appendChild(prod)
    })
})

const func = (e) =>{
    const temp = e.parentElement.children
    const id = temp[1].innerText;
    const details = {
        'img' : temp[0].currentSrc,
        'name':temp[2].innerText,
        'price':temp[3].innerText
    }
    console.log(details)
    localStorage.setItem(id,JSON.stringify(details))
    alert('product added to cart')
}


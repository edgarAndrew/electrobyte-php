const container = document.querySelector('.cont-2')

const urlParams = new URLSearchParams(window.location.search);
const category = urlParams.get('category');

async function getServerData(){
    const response = await fetch(`http://localhost:4443/electrobyte/products.php?category=${category}`)
    const data = await response.json();
    let output = []
    data.forEach((ele)=>{
        const temp = JSON.parse(ele);
        output.push(temp)
    })
    return output
}
getServerData().then((ele)=>{
    ele.map((el)=>{
        let prod = document.createElement('div')
        prod.className = "cards"
        prod.innerHTML = `
            <img src="${el.image}" alt="image">
            <span>${el.pid}</span>
            <h3>${el.pname}</h3>
            <h4>₹${el.price}</h4>
            <button class='btn' onclick="func(this)"><h4>ADD TO CART</h4></button>
        `
        prod.addEventListener('click',()=>{
            window.location.href = '../product/product.html?id=' + el.pid;
        })
        container.appendChild(prod)
    })
}).catch((error)=>{
    console.log(error)
})

// Code for experiment 4
// async function getData(){
//     const response = await fetch('../processors/data.json')
//     const data = await response.json();
//     return data;
// }

// getData().then((ele)=>{
//     //console.log(ele)
//     ele.map((el)=>{
//         let prod = document.createElement('div')
//         prod.className = "cards"
//         prod.innerHTML = `
//             <img src="${el.image}" alt="image">
//             <span>${el.id}</span>
//             <h3>${el.name}</h3>
//             <h5>${el.price}</h5>
//             <button class='btn' onclick="func(this)"><h4>ADD TO CART</h4></button>
//         `
//         prod.addEventListener('click',()=>{
//             window.location.href = '../product/product.html?id=' + el.id;
//         })
//         container.appendChild(prod)
//     })
// })

const func = (e) =>{
    const temp = e.parentElement.children
    const id = temp[1].innerText;
    const details = {
        'pid':id,
        'img' : temp[0].currentSrc,
        'name':temp[2].innerText,
        'price':temp[3].innerText,
        'quantity':'1'
    }
    localStorage.setItem(id,JSON.stringify(details))
    alert('product added to cart')
}


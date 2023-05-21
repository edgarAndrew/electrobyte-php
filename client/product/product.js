const urlParams = new URLSearchParams(window.location.search);
const id = urlParams.get('id');

async function getServerData(){
    const response = await fetch(`http://localhost:4443/electrobyte/product.php?id=${id}`);
    const data = await response.json();
    return JSON.parse(data[0]);
}
getServerData().then((ele)=>{
    document.getElementById('pimage').src = ele.image
    document.getElementById('pname').innerText = ele.pname
    document.getElementById('p-price').innerText = '₹' + ele.price
    document.getElementById('brand').innerText = 'Brand : ' + ele.brand
    document.getElementById('cat').innerText = 'Category : ' + ele.category
    document.getElementById('p-desc').innerText = ele.description
    document.getElementById('pid').innerText = ele.pid
}).catch((error)=>{
    console.log(error)
})


const handleadd = (e) =>{
    document.getElementById('quantity').value = Number(document.getElementById('quantity').value) + 1
}
const handleminus = (e) =>{
    if(Number(document.getElementById('quantity').value) > 1)
     document.getElementById('quantity').value = Number(document.getElementById('quantity').value) - 1
}

const addToCart = (e) =>{
    const id = document.getElementById('pid').innerText;
    const details = {
        'pid':id,
        'img' : document.getElementById('pimage').src,
        'name':document.getElementById('pname').innerText,
        'price':document.getElementById('p-price').innerText,
        'quantity':document.getElementById('quantity').value
    }
    localStorage.setItem(id,JSON.stringify(details))
    alert('product added to cart')
}
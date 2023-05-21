let isLoggedIn = false

const apiCall = async(products,total) =>{
   const response = await fetch('http://localhost:4443/electrobyte/buy.php', {
		method: 'POST',
		headers: {
		  'Content-Type': 'application/json'
		},
		body: JSON.stringify({
			'userId':sessionStorage.getItem('userId'),
			'products':products,
         'total':total
		})
	})
   const res = await response.json();
   console.log(res)
}


if(sessionStorage.getItem('userId')){
   isLoggedIn = true;
   let price = 0
   const products = []

   for (let i = 0; i < localStorage.length; i++) {
      const key = localStorage.key(i)
      products.push(JSON.parse(localStorage.getItem(key)))
   }
   products.map((item)=>{
      if(item.price)
         price += Number(item.price.slice(1,item.price.length)) * Number(item.quantity?item.quantity:'1')
   })
   //console.log(products,price);
   const data = []
   products.forEach((ele)=>data.push({'pid':ele.pid,'quantity':ele.quantity}))
   //console.log(data)
   apiCall(data,price);
   
   document.querySelector('.content').innerHTML = 
   `
      <h2>Order Successfull</h2>
   `;
}
else{
    document.querySelector('.content').innerHTML = 
     `
        <h2>You have to be signed in to make an account</h2>
        <a href='../login/login.html'>Login</a>
     `;
}


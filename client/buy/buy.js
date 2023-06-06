let isLoggedIn = false

const apiCall = async(products,total) =>{
   try{
      const res1 = await fetch('http://localhost:4443/electrobyte/initiate.php', {
         method: 'POST',
         headers: {
         'Content-Type': 'application/json'
         },
         body: JSON.stringify({
            'total':total
         })
      })
      const data = await res1.json();
      console.log(data.amount)

      var options = {
         key: "rzp_test_qpZKjldGnI3hJS",
         amount: data.amount,
         currency: data.currency,
         name: "My Store",
         description: "Test Payment",
         order_id: data.id,
         handler: async function (re) {
           // Handle the success callback
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
            await response.json();
            document.querySelector('.content').innerHTML = 
            `
               <div>
                  <h2>Order Successfull</h2>
                  <a href='../home/home.html'>Go Home</a>
               </div>
            `;
         },
       };
 
       var rzp = new Razorpay(options);
       rzp.open();

   }catch(err){
      console.log(err);
   }
}


if(sessionStorage.getItem('userId')){
   isLoggedIn = true;
   let price = 0
   const products = []

   for (let i = 0; i < localStorage.length; i++) {
      const key = localStorage.key(i)
      try {
         products.push(JSON.parse(localStorage.getItem(key)))
       } catch (error) {
         console.error('Error parsing JSON:', error);
       }
   }
   products.map((item)=>{
      if(item.price)
         price += Number(item.price.slice(1,item.price.length)) * Number(item.quantity?item.quantity:'1')
   })
   const data = []
   products.forEach((ele)=>data.push({'pid':ele.pid,'quantity':ele.quantity}))

   document.getElementById("rzp-button").addEventListener("click", function () {
      apiCall(data,price);
   })
}
else{
    document.querySelector('.content').innerHTML = 
     `
        <h2>You have to be signed in to place an order</h2>
        <a href='../login/login.html'>Login</a>
     `;
}


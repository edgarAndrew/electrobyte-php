//console.clear();

const loginBtn = document.getElementById('login');
const signupBtn = document.getElementById('signup');

loginBtn.addEventListener('click', (e) => {
	let parent = e.target.parentNode.parentNode;
	Array.from(e.target.parentNode.parentNode.classList).find((element) => {
		if(element !== "slide-up") {
			parent.classList.add('slide-up')
		}else{
			signupBtn.parentNode.classList.add('slide-up')
			parent.classList.remove('slide-up')
		}
	});
});

signupBtn.addEventListener('click', (e) => {
	let parent = e.target.parentNode;
	Array.from(e.target.parentNode.classList).find((element) => {
		if(element !== "slide-up") {
			parent.classList.add('slide-up')
		}else{
			loginBtn.parentNode.parentNode.classList.add('slide-up')
			parent.classList.remove('slide-up')
		}
	});
});

// function show() {
//     var p = document.getElementById('pwd');
//     p.setAttribute('type', 'text');
// }

// function hide() {
//     var p = document.getElementById('pwd');
//     p.setAttribute('type', 'password');
// }

//var pwShown = 0;

// document.getElementById("eye").addEventListener("click", function () 
// {
//     if (pwShown == 0) {
//         pwShown = 1;
//         show();
//     } else {
//         pwShown = 0;
//         hide();
//     }
// }, false);

// $(document).ready(function() {
//     $('#loginBtn').click(function(event) {
//         var username = $('#username').val();
//         var password = $('#password').val();

//         if(username.length == 0) {
//             alert("Please enter username.");
//             event.preventDefault();
//             return false;
//         }

//         if(password.length == 0) {
//             alert("Please enter password.");
//             event.preventDefault();
//             return false;
//         }

//         // add other validation checks here

//         return true;
//     });
// });

const handleRegister = async(e) =>{
    e.preventDefault()
    const data = new FormData(e.target)
    const username = data.get('username');
	const email = data.get('email')
    const password = data.get('password')

	const response = await fetch('http://localhost:4443/electrobyte/signup.php', {
		method: 'POST',
		headers: {
		  'Content-Type': 'application/json'
		},
		body: JSON.stringify({
			'username':username,
			'email':email,
			'password':password
		})
	  })
	
	  const res = await response.json()
	  window.alert(res.message)
}
document.querySelector('.signup').addEventListener('submit',handleRegister)

const handleLogin = async(e) =>{
    e.preventDefault()
    const data = new FormData(e.target)
    const email = data.get('email')
    const password = data.get('password')

	const response = await fetch('http://localhost:4443/electrobyte/login.php', {
		method: 'POST',
		headers: {
		  'Content-Type': 'application/json'
		},
		body: JSON.stringify({
			'email':email,
			'password':password
		})
	  })
	  
	  const res = await response.json()
	  sessionStorage.setItem('userId',res.id)
	  window.alert(res.message)
	  window.location.href = "http://localhost:5500/home/home.html";
}
document.querySelector('.center').addEventListener('submit',handleLogin)

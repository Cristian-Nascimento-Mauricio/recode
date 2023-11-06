
document.getElementById('buttonEmail').addEventListener('click',()=>{
	
	email = document.getElementById('email').value
	messagem = document.getElementById('messagem').value
	
	fetch(`/work/sendEmail?email=${email}&mensagem=${messagem}`,{
		method:'POST'
	})
})
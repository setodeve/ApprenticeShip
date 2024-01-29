"use client"
import { useRouter } from 'next/navigation'

export default async function Page() {
  const router = useRouter()
  const handleSubmit = async (e,router) => {
    e.preventDefault()
    const formData = new FormData(e.currentTarget)
    const email = formData.get('email')
    const password = formData.get('password')
    
    const response = await fetch('http://localhost:3000/api/users/login', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ "user":{ "email":email,"password":password }}),
    })
    
    const res = await response.json()

    if (response.ok) {
      localStorage.setItem("ConduitToken", res.token);
      console.log(localStorage.getItem("ConduitToken"))
      router.push('/')
    } else {
      router.push('/login')
    }
  
  }
  return(
    <div className="auth-page" >
      <div className="container page">
        <div className="row">
          <div className="col-md-6 offset-md-3 col-xs-12">
            <h1 className="text-xs-center">Sign in</h1>
            <p className="text-xs-center">
              <a href="/register">Need an account?</a>
            </p>
            <form onSubmit={(e) => handleSubmit(e,router) }>
              <fieldset className="form-group">
                <input className="form-control form-control-lg" name="email" type="text" placeholder="Email" />
              </fieldset>
              <fieldset className="form-group">
                <input className="form-control form-control-lg" name="password" type="password" placeholder="Password" />
              </fieldset>
              <button type="submit" className="btn btn-lg btn-primary pull-xs-right">Sign in</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  )
}


import { useState } from "react";

type LoginProps = { onLogin: (email: string) => void; }

const Login = ({ onLogin }: LoginProps) => {
  const [email, setEmail] = useState<string>("");

  return (
    <div className="login-wrapper">
      <div className="login-input">
        <label htmlFor="email">Email</label>
        <input id="email" onChange={(e) => setEmail(e.target.value)} />
      </div>
      <div className="login-button"><button onClick={() => onLogin(email)}>Login</button></div>
    </div>
  )
};

export { Login };

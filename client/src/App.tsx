import { useEffect, useState } from 'react';
import './App.css';
import { SessionScheduler } from "./modules/SessionScheduler"
import { Login } from './modules/Login';
import axios from 'axios';

const COACHES_URL = 'http://localhost:3001/coaches';

function App() {
  const [email, setEmail] = useState("");
  const [coaches, setCoaches] = useState([]);

  useEffect(() => {
    const fetchCoaches = async () => {
      const coachesResponse = await axios.get(COACHES_URL);
      setCoaches(coachesResponse.data.coaches);
    }
    fetchCoaches();
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        AceUp Demo
      </header>
      {email ? <SessionScheduler coaches={coaches} email={email}/> : <Login onLogin={(e: string) => setEmail(e)} />}
    </div>
  );
}

export default App;

import { useState } from 'react';
import axios from 'axios';
import { Coach } from './types';


const SESSION_URL = 'http://localhost:3001/session';

type SessionSchedulerProps = {
  coaches: Coach[];
  email: string;
};

const SessionScheduler = ({ coaches, email }: SessionSchedulerProps) => {
  const [coach, setCoach] = useState<string>();
  const [date, setDate] = useState<string>();
  const [duration, setDuration] = useState<string>("60");
  const [errorMessage, setErrorMessage] = useState<string>();
  const [successMessage, setSuccessMessage] = useState<string>();

  const isValid = email && coach && date && duration;

  const submitSchedule = async () => {
    const response = await axios.post(SESSION_URL, {
      coach_name: coach,
      start_time: date,
      duration,
      email
    }).catch(error => setErrorMessage(error.response.data.message));
    setSuccessMessage(response?.data.message);
  };

  return (
    <div className='Session-scheduler-wrapper'>
      <div className='all-inputs'>
        <div className='coaches-section input-section'>
          <label htmlFor="coaches">Coaches</label>
          <select id='coaches' onChange={(e) => { setCoach(e.target.value) }}>
            <option value="">Select a coach</option>
            {coaches.map(({ name }) => <option key={name} value={name}>{name}</option>)}
          </select>
        </div>
        <div className='date-section input-section'>
          <label htmlFor="date">Session Date (yyyy-mm-dd hh:mm)</label>
          <input id='date' type="text" onChange={(e) => setDate(e.target.value)} />
        </div>
        <div className='duration-section input-section'>
          <label htmlFor="date">Duration (in minutes)</label>
          <input id='duration' type="number" value={duration} onChange={(e) => setDuration(e.target.value)} />
        </div>
      </div>
      {errorMessage && <div className='error'>{errorMessage}. Refresh page to change email.</div>}
      {successMessage && <div className='success'>{successMessage}. </div>}
      {isValid ? <div className='schedule'><button onClick={submitSchedule}>SCHEDULE!</button></div> : <div style={{ minHeight: "6rem" }}></div>}
    </div>
  );
};

export { SessionScheduler };

import fs from 'fs'

const logFile = '/usr/src/app/files/log_output.txt';
const randomUUID = crypto.randomUUID();

const writeMsg = (message) => {
  try {
    fs.appendFileSync(logFile, message, 'utf8');
  } catch (err) {
    console.error('Error writing to log:', err);
  }
}

const getOutput = () => {
  const date = new Date().toISOString();
  const message = `${date} ${randomUUID}\n`

  writeMsg(message)

  setTimeout(getOutput, 5000)
}


getOutput();

const randomUUID = crypto.randomUUID();

const getOutput = () => {
  const date = new Date().toISOString();

  console.log(`${date} ${randomUUID}`)

  setTimeout(getOutput, 5000)
}

getOutput();

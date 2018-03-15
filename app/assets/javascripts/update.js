

fetch('https://app.pipefy.com/', {
  method: 'POST'
  headers: {
      'Content-Type':'application/json',
      'token':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJ1c2VyIjp7ImlkIjoxMzYxMzgsImVtYWlsIjoibWlsYXphbmdpcm9sYW1lQGdtYWlsLmNvbSIsImFwcGxpY2F0aW9uIjo0Nzk3fX0.6kYAUO3-uTTUQk_MiKn0S1TSDY9eJAG5Rka-XLCRAwW5YSbo_h3rJtKxt-8xRaeqzi3frP3wCpxG80o4vcfhIA'
    }

})
  .then(checkStatus)
  .then(response => response.json())
  .then(data => {
    console.log(data);
  })
  .catch((error) => {
    console.log('There was an error', error);
  });


function checkStatus(response) {
  if (response.ok) {
      return response;
  }

  let error = new Error(response.statusText);
  error.response = response;
  return Promise.reject(error);
}



// function update() {
//   fetch('https://localhost:3000/graphiql', {
//     method: 'POST'
//     headers: {
//       'Content-Type':'application/json',
//       'email': 'pipefydevrecruitingfakeuser@mailinator.com'
//       'token':'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJ1c2VyIjp7ImlkIjo2NjE0MCwiZW1haWwiOiJwaXBlZnlkZXZyZWNydWl0aW5nZmFrZXVzZXJAbWFpbGluYXRvci5jb20iLCJhcHBsaWNhdGlvbiI6NDUzOH19.uUX4KIR4m_K-8NwLYhtVpsNnLEoLARebIQiyQDxEm3RZLHCffLrcH-V8RmuJLu8nqE8AQ-SvqUvgz3fe0UyZ4w'
//     }
//     body: 123
// })
//     .then(checkStatus)
//     .then(response => response.json())
//     .then(data => {
//       console.log(data);
//     })
//     .catch((error) => {
//       console.log('There was an error', error);
//     });


//   function checkStatus(response) {
//     if (response.ok) {
//         return response;
//     }

//     let error = new Error(response.statusText);
//     error.response = response;
//     return Promise.reject(error);
//   }
// };

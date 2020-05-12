var options = {
    apiVersion: 'v1', // default
    endpoint: 'http://127.0.0.1:8200', // default
    token: 's.3l3BNySb6FRf2zHxNnbJPt0S' // optional client token; can be fetched after valid initialization of the server
};

// get new instance of the client
var vault = require("node-vault")(options);

// init vault server
// vault.init({ secret_shares: 1, secret_threshold: 1 })
//     .then((result) => {
//         var keys = result.keys;
//         // set token for all following requests
//         vault.token = result.root_token;
//         // unseal vault server
//         return vault.unseal({ secret_shares: 1, key: keys[0] })
//     }).then(() => {
//         const data = vault.read('secret/hello');
//         console.log(data);
//     })
//     .catch(err => {
//         console.log(JSON.stringify(err));
//     });




vault.read('secret/data/hello').then(
    (data) => {
        console.log(data);
    }
)
    .catch(err => {
        console.log(JSON.stringify(err));
    })

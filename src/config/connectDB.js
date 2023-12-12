import sql from 'mssql';

const dbConfig = {
    user: 'minchou',
    password: '123456',
    database: 'QLHuanLuyen',
    server: 'DESKTOP-EQHL3IH',
    pool: {
        max: 10,
        min: 0,
        idleTimeoutMillis: 30000
    },
    options: {
        encrypt: true, // for azure
        trustServerCertificate: true // change to true for local dev / self-signed certs
    }
}

// const connection = () => {

//     sql.connect(dbConfig).then(function (err) {
//         var sqlrequest = new sql.Request();
//         let result = sqlrequest.query("select * from Users").then(function (recordset) {
//             sql.close(function (value) {
//                 console.log("connection6 closed");
//             });
//             console.log(recordset);
//             recordset.recordset.forEach(function (record) {
//                 console.log("ID User:", record.id_user);
//                 console.log("Username:", record.username);
//                 console.log("Password:", record.passwrd);
//                 console.log("ID QuyenTK:", record.id_quyenTK);
//                 console.log("--------------");
//             });

//         }).catch(function (err) {
//             console.log(err);
//         });
//         console.log(result);
//     }).catch(function (err) {
//         console.log(err);
//     });


// };



export default dbConfig;
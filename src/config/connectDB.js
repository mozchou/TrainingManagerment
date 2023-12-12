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



export default dbConfig;
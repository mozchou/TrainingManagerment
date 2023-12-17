import sql from 'mssql';
import dbConfig from "../config/connectDB";

var dvCapTren;
var username;

let getLogin = async (req, res) => {
    try {
        let data;
        await sql.connect(dbConfig);
        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`select username, passwrd from Users`);
        // Đóng kết nối
        await sql.close();
        data = result.recordsets[0];
        console.log(data);
        return res.render('login.ejs', { Users: data });
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let login = (req, res) => {

    username = req.body.data;

    // Xử lý dữ liệu ở đây (ví dụ: in ra console)
    console.log('Received data from browser:', username);

    // Phản hồi cho trình duyệt
    res.status(200).send('Data received successfully');
}

let getHomepage = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        const capDV = 3;
        console.log(username);
        await sql.connect(dbConfig);
        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec DonViTheoCap @capDV = ${capDV}`);
        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        data = result.recordsets[0];
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        return res.render('index.ejs', { dataDV: data, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let getDetailTrungDoan = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        dvCapTren = await req.params.id_DV;
        await sql.connect(dbConfig);
        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec DonViTrucThuoc @dvCapTren = ${dvCapTren}`);
        // Đóng kết nối
        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        data = result.recordsets[0];
        return res.render('detailTrungDoan.ejs', { dataDV: data, dvCapTren: dvCapTren, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let getDetailTieuDoan = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        dvCapTren = await req.params.id_DV;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec DonViTrucThuoc @dvCapTren = ${dvCapTren}`);
        // Đóng kết nối
        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        data = result.recordsets[0];

        return res.render('detailTieuDoan.ejs', { dataDV: data, dvCapTren: dvCapTren, tenCB: tenCanBo, idCB: idCanBo, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let getdsDV = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        let datacapDV;
        console.log(username);
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getDonVi`);
        // Đóng kết nối
        data = result.recordsets[0];
        let capDV = await sqlrequest.query(`exec getDV_CapDV`);
        datacapDV = capDV.recordsets[1];
        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        return res.render('dsDonVi.ejs', { dataDV: data, dataCapDV: datacapDV, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let createDV = async (req, res) => {
    try {
        console.log(req.body);
        let { id_DV, tenDV, capDV, moTa } = req.body;
        // let dvCapTren = await req.params.id_DV;
        console.log(id_DV, tenDV, capDV, moTa)
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec createDV @id_DV = '${id_DV}', @tenDV = N'${tenDV}', @id_capDV = '${capDV}', @moTa = N'${moTa}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/dsDonVi`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let updateDV = async (req, res) => {
    try {
        console.log(req.body);
        let { id_updateDV, tenDVupdate, capDVupdate, moTaupdate } = req.body;
        // let dvCapTren = await req.params.id_DV;
        console.log(id_updateDV, tenDVupdate, capDVupdate, moTaupdate)
        const capDonVi = { 1: 'Đại đội', 2: 'Tiểu đoàn', 3: 'Trung đoàn', 4: 'Sư đoàn' };
        let id_capDV = null;

        for (const key in capDonVi) {
            if (capDonVi[key] === capDVupdate) {
                id_capDV = key;
                break;
            }
        }
        console.log(id_updateDV, tenDVupdate, id_capDV, moTaupdate)
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec updateDV @id_DV = '${id_updateDV}', @tenDV = N'${tenDVupdate}', @id_capDV = '${id_capDV}', @moTa = N'${moTaupdate}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/dsDonVi`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let deleteDV = async (req, res) => {
    // var { rowIndex } = req.body;
    console.log(req.body)
    let { id_DV } = req.body;

    // Thực hiện xóa dữ liệu ở đây (ví dụ: thông qua cơ sở dữ liệu)
    await sql.connect(dbConfig);

    var sqlrequest = new sql.Request();

    let result = await sqlrequest.query(`EXEC deleteDV @id_DV = '${id_DV}'`);
    // Đóng kết nối
    await sql.close();

    // Phản hồi về client
    res.json({ success: true, message: 'Xóa thành công' });
}

let getdsCB = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        let loaiCB;
        let DV;
        let id_DV = req.params.id_DV;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getCanBo @idDV = '${id_DV}'`);
        let dataloaiCB = await sqlrequest.query(`select * from LoaiCanBo`);
        let dataDV = await sqlrequest.query(`select * from DonVi`);
        // Đóng kết nối
        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        data = result.recordsets[0];
        loaiCB = dataloaiCB.recordsets[0];
        DV = dataDV.recordsets[0];
        return res.render('dsCanBo.ejs', { dataCB: data, idDV: id_DV, dataLoaiCB: loaiCB, dataDV: DV, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }

}

let createCB = async (req, res) => {
    try {
        console.log(req.body);
        let idDV = req.params.id_DV;
        console.log(idDV);
        let { tenCB, id_CB, ngaySinh, gioiTinh, queQuan, capBac, sdt, tenLoaiCB, trangThai } = req.body;
        // let { id_DV, tenDV, capDV, moTa } = req.body;
        // // let dvCapTren = await req.params.id_DV;
        // console.log(id_DV, tenDV, capDV, moTa)
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec createCB @tenCB = N'${tenCB}', @id_CB = '${id_CB}', @ngaySinh = '${ngaySinh}', @gioiTinh = N'${gioiTinh}', @queQuan = N'${queQuan}', @capBac = N'${capBac}', @sdt = '${sdt}', @tenLoaiCB = N'${tenLoaiCB}',@trangThai = '${trangThai}', @id_DV = '${idDV}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/dsCanBo/${idDV}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let updateCB = async (req, res) => {
    try {
        console.log(req.body);
        let idDV = req.params.id_DV;
        console.log(idDV);
        let { tenCBupdate, id_CBupdate, ngaySinhCBupdate, gioiTinhupdate, queQuanupdate, capBacupdate, sdtupdate, tenLoaiCBupdate, id_DVupdate, trangThaiupdate } = req.body;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec updateCB @tenCB = N'${tenCBupdate}', @id_CB = '${id_CBupdate}', @ngaySinh = '${ngaySinhCBupdate}', @gioiTinh = N'${gioiTinhupdate}', @queQuan = N'${queQuanupdate}', @capBac = N'${capBacupdate}', @sdt = '${sdtupdate}', @tenLoaiCB = N'${tenLoaiCBupdate}', @id_DV = '${id_DVupdate}', @trangThai = '${trangThaiupdate}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/dsCanBo/${idDV}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let deleteCanBo = async (req, res) => {
    // var { rowIndex } = req.body;
    console.log(req.body)
    let { id_CB } = req.body;

    // Thực hiện xóa dữ liệu ở đây (ví dụ: thông qua cơ sở dữ liệu)
    await sql.connect(dbConfig);

    var sqlrequest = new sql.Request();

    let result = await sqlrequest.query(`exec deleteCanBo @id_CB = '${id_CB}'`);
    // Đóng kết nối
    await sql.close();

    // Phản hồi về client
    res.json({ success: true, message: 'Xóa thành công' });
}

let getDVCapDuoi = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        let datacapDV;
        let id_DV = req.params.id_DV;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getdsCapDuoi @idDV = '${id_DV}'`);
        let capDV = await sqlrequest.query(`exec getDV_CapDV`);
        datacapDV = capDV.recordsets[1];

        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        data = result.recordsets[0];

        return res.render('dsDonViCapDuoi.ejs', { dataDV: data, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB, dataCapDV: datacapDV, idDV: id_DV })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let getdsKhoaHoc = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getdsKhoaHoc`);

        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        data = result.recordsets[0];

        return res.render('QLHVtheoKhoaHoc.ejs', { dataKH: data, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let createKhoaHoc = async (req, res) => {
    try {
        console.log(req.body);
        let { id_khoaHoc, tenKhoaHoc, ngayBD, ngayKT } = req.body;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec createKhoaHoc @id_khoaHoc = '${id_khoaHoc}', @tenKhoaHoc = N'${tenKhoaHoc}',  @thoigianBD = '${ngayBD}', @thoigianKT = '${ngayKT}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/QLHVtheoKhoaHoc`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let updateKhoaHoc = async (req, res) => {
    try {
        console.log(req.body);
        let { id_KhoaHocupdate, tenKhoaHocupdate, ngayBDupdate, ngayKTupdate } = req.body;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec updateKhoaHoc @id_khoaHoc = '${id_KhoaHocupdate}', @tenKhoaHoc = N'${tenKhoaHocupdate}',  @thoigianBD = '${ngayBDupdate}', @thoigianKT = '${ngayKTupdate}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/QLHVtheoKhoaHoc`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let getdsHVtheoKhoaHoc = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        let dataDV;
        let dataKhoaHoc;
        let idKhoaHoc = req.params.idKhoaHoc;
        let capDV = 1;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getdsHVtheoKhoaHoc @idKhoaHoc = '${idKhoaHoc}'`);

        let dsDV = await sqlrequest.query(`exec DonViTheoCap @capDV = ${capDV}`);
        let KhoaHoc = await sqlrequest.query(`select * from KhoaHoc`);
        // Đóng kết nối
        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }

        data = result.recordsets[0];
        dataDV = dsDV.recordsets[0];
        dataKhoaHoc = KhoaHoc.recordsets[0];
        return res.render('dsHVtheoKhoaHoc.ejs', { dataHV: data, idKhoaHoc: idKhoaHoc, dataDV: dataDV, dataKhoaHoc: dataKhoaHoc, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}


let getdsTieuDoan = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        let idCapTren = req.params.id_DV;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getdsCapDuoi @idDV = '${idCapTren}'`);
        // Đóng kết nối
        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        data = result.recordsets[0];

        return res.render('QLHVtheoDonVi.ejs', { dataDV: data, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let getdsDaiDoi = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        let idCapTren = req.params.id_DV;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getdsCapDuoi @idDV = '${idCapTren}'`);
        // Đóng kết nối
        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        data = result.recordsets[0];

        return res.render('QLHVtheoDonVi_c.ejs', { dataDV: data, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let getdsHVtheoDonVi = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        let dataKhoaHoc;
        let dataDV;
        let idDV = req.params.id_DV;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getdsHVtheoDonVi @idDV = '${idDV}'`);
        let KhoaHoc = await sqlrequest.query(`select * from KhoaHoc`);
        let DonVi = await sqlrequest.query(`select * from DonVi`);

        // Đóng kết nối
        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }

        data = result.recordsets[0];
        dataKhoaHoc = KhoaHoc.recordsets[0];

        dataDV = DonVi.recordsets[0];
        return res.render('dsHVtheoDonVi.ejs', { dataHV: data, idDV: idDV, dataKhoaHoc: dataKhoaHoc, dataDV: dataDV, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let createHVtheoDonVi = async (req, res) => {
    try {
        console.log(req.body);
        let idDV = req.params.id_DV;
        let { tenHV, id_HV, ngaySinhHV, gioiTinh, queQuan, tenLop, id_KhoaHoce, sdt } = req.body;
        // // // let { id_DV, tenDV, capDV, moTa } = req.body;
        // // // // let dvCapTren = await req.params.id_DV;
        // // console.log(id_DV, tenDV, capDV, moTa)
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec createHV @tenHV=N'${tenHV}', @id_HV='${id_HV}', @ngaySinhHV = '${ngaySinhHV}', @gioiTinh = N'${gioiTinh}', @queQuan = N'${queQuan}', @tenLop = N'${tenLop}', @id_DV = '${idDV}', @sdt = '${sdt}', @idKhoaHoc = '${id_KhoaHoce}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/dsHVtheoDonVi/${idDV}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let updateHVtheoDonVi = async (req, res) => {
    try {
        console.log(req.body);
        let idDV = req.params.id_DV;
        let idKhoaHoc;
        let tenDV;
        let { tenHVupdate, id_HVupdate, ngaySinhHVupdate, gioiTinhupdate, queQuanupdate, tenLopupdate, idDVupdate, id_KhoaHocupdate, sdtupdate } = req.body;
        // // // let { id_DV, tenDV, capDV, moTa } = req.body;
        // // // // let dvCapTren = await req.params.id_DV;
        // // console.log(id_DV, tenDV, capDV, moTa)
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let KhoaHoc = await sqlrequest.query(`select id_khoaHoc from KhoaHoc where tenKhoaHoc = N'${id_KhoaHocupdate}'`);
        let DonVi = await sqlrequest.query(`select tenDV from DonVi where id_DV = '${idDVupdate}'`);

        let KhoaHocArr = KhoaHoc.recordsets[0];
        if (KhoaHocArr.length > 0) {
            idKhoaHoc = KhoaHocArr[0].id_khoaHoc;
        }
        console.log('>>>', idKhoaHoc);

        let DonViArr = DonVi.recordsets[0];
        if (DonViArr.length > 0) {
            tenDV = DonViArr[0].tenDV;
        }
        console.log('>>>', tenDV);

        let result = await sqlrequest.query(`exec updateHV @tenHV=N'${tenHVupdate}', @id_HV='${id_HVupdate}', @ngaySinhHV = '${ngaySinhHVupdate}', @gioiTinh = N'${gioiTinhupdate}', @queQuan = N'${queQuanupdate}', @tenLop = N'${tenLopupdate}', @tenDV = N'${tenDV}', @sdt = '${sdtupdate}', @idKhoaHoc = '${idKhoaHoc}'`);
        // // Đóng kết nối
        await sql.close();

        return res.redirect(`/dsHVtheoDonVi/${idDV}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let deleteHVtheoDonVi = async (req, res) => {
    // var { rowIndex } = req.body;
    console.log(req.body)
    let { id_HV } = req.body;

    // Thực hiện xóa dữ liệu ở đây (ví dụ: thông qua cơ sở dữ liệu)
    await sql.connect(dbConfig);

    var sqlrequest = new sql.Request();

    let result = await sqlrequest.query(`exec deleteHVtheoDonVi @id_HV = '${id_HV}'`);
    // Đóng kết nối
    await sql.close();

    // Phản hồi về client
    res.json({ success: true, message: 'Xóa thành công' });
}

let getdsCapDuoi = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        let id_DV = req.params.id_DV;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getdsCapDuoi @idDV = '${id_DV}'`);

        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        data = result.recordsets[0];

        return res.render('QLTTB_dsCapDuoi.ejs', { dataDVTD: data, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let createDVCapDuoi = async (req, res) => {
    try {
        let idCapTren = req.params.id_DV;
        console.log(req.body);
        let { id_DV, tenDV, capDV, moTa } = req.body;
        // let dvCapTren = await req.params.id_DV;
        console.log(id_DV, tenDV, capDV, moTa)
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec createDVCapDuoi @id_DV = '${id_DV}', @tenDV = N'${tenDV}', @id_capDV = '${capDV}', @moTa = N'${moTa}', @idDVCapTren = '${idCapTren}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/dsDonViCapDuoi/${idCapTren}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let updateDVCapDuoi = async (req, res) => {
    try {
        let idCapTren = req.params.id_DV;
        console.log(req.body);
        let { id_updateDV, tenDVupdate, capDVupdate, moTaupdate } = req.body;
        // let dvCapTren = await req.params.id_DV;
        console.log(id_updateDV, tenDVupdate, capDVupdate, moTaupdate)
        const capDonVi = { 1: 'Đại đội', 2: 'Tiểu đoàn', 3: 'Trung đoàn', 4: 'Sư đoàn' };
        let id_capDV = null;

        for (const key in capDonVi) {
            if (capDonVi[key] === capDVupdate) {
                id_capDV = key;
                break;
            }
        }
        console.log(id_updateDV, tenDVupdate, id_capDV, moTaupdate)
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec updateDV @id_DV = '${id_updateDV}', @tenDV = N'${tenDVupdate}', @id_capDV = '${id_capDV}', @moTa = N'${moTaupdate}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/dsDonViCapDuoi/${idCapTren}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}


let getdsChungLoai = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        let idDV = req.params.id_DV;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`select * from ChungLoai;`);

        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        data = result.recordsets[0];

        return res.render('QLTTB_ChungLoai.ejs', { dataLoaiTTB: data, tenCanBo: tenCanBo, idDV: idDV, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB, idCanBo: idCanBo })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let createChungLoai = async (req, res) => {
    try {
        console.log(req.body);
        let idDV = req.params.id_DV;
        let { id_ChungLoai, tenChungLoai, giaCa, moTa } = req.body;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec createChungLoai @id_chungLoai='${id_ChungLoai}', @tenChungLoai = N'${tenChungLoai}', @giaCa = '${giaCa}', @moTa = N'${moTa}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/QLTTB-ChungLoai/${idDV}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let updateChungLoai = async (req, res) => {
    try {
        console.log(req.body);
        let idDV = req.params.id_DV;
        let { id_ChungLoaiupdate, tenChungLoaiupdate, giaCaupdate, moTaupdate } = req.body;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec updateChungLoai @id_chungLoai='${id_ChungLoaiupdate}', @tenChungLoai = N'${tenChungLoaiupdate}', @giaCa = '${giaCaupdate}', @moTa = N'${moTaupdate}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/QLTTB-ChungLoai/${idDV}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let deleteChungLoai = async (req, res) => {
    // var { rowIndex } = req.body;
    console.log(req.body)
    let { id_chungLoai, id_DV } = req.body;

    // Thực hiện xóa dữ liệu ở đây (ví dụ: thông qua cơ sở dữ liệu)
    await sql.connect(dbConfig);

    var sqlrequest = new sql.Request();

    let result = await sqlrequest.query(`exec deleteChungLoaitheoDonVi @id_chungLoai = '${id_chungLoai}', @idDV = '${id_DV}'`);
    // Đóng kết nối
    await sql.close();

    // Phản hồi về client
    res.json({ success: true, message: 'Xóa thành công' });
}


let getdsTTB = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        let idDV = req.params.id_DV;
        let id_chungLoai = req.params.id_chungLoai;
        let tenDV, tenLoaiTTB;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getTTB @id_chungLoai='${id_chungLoai}',@idDV='${idDV}'`);
        let DV = await sqlrequest.query(`select tenDV from DonVi where id_DV='${idDV}'`);
        let LoaiTTB = await sqlrequest.query(`select tenChungLoai from ChungLoai where id_chungLoai='${id_chungLoai}'`);

        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        data = result.recordsets[0];
        let tenDVArr = DV.recordsets[0];
        if (tenDVArr.length > 0) {
            tenDV = tenDVArr[0].tenDV;
        }

        let LoaiTTBArr = LoaiTTB.recordsets[0];
        if (LoaiTTBArr.length > 0) {
            tenLoaiTTB = LoaiTTBArr[0].tenChungLoai;
        }

        // // console.log(idMonHoc);
        // console.log(tenBaiHoc);

        return res.render('QLTTB_TrangBi.ejs', { dataTTB: data, tenCanBo: tenCanBo, tenDV: tenDV, idDV: idDV, tenLoaiTTB: tenLoaiTTB, id_chungLoai: id_chungLoai, id_chungLoai: id_chungLoai, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB, idCanBo: idCanBo })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let createTTB = async (req, res) => {
    try {
        console.log(req.body);
        let idDV = req.params.id_DV;
        let id_chungLoai = req.params.id_chungLoai;
        let { id_TTB, tinhTrang, trangThai } = req.body;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec createTTB @id_TTB='${id_TTB}', @id_chungLoai='${id_chungLoai}', @tinhTrang = N'${tinhTrang}', @idDV  = '${idDV}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/QLTTB-ChungLoai/${idDV}/${id_chungLoai}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let updateTTB = async (req, res) => {
    try {
        console.log(req.body);
        let idDV = req.params.id_DV;
        let id_chungLoai = req.params.id_chungLoai;
        let { id_TTBupdate, tinhTrangupdate, trangThaiupdate } = req.body;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec updateTTB @id_TTB='${id_TTBupdate}', @tinhTrang = N'${tinhTrangupdate}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/QLTTB-ChungLoai/${idDV}/${id_chungLoai}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let deleteTTB = async (req, res) => {
    // var { rowIndex } = req.body;
    console.log(req.body)
    let { id_TTB } = req.body;
    // let idMonHoc;


    // Thực hiện xóa dữ liệu ở đây (ví dụ: thông qua cơ sở dữ liệu)
    await sql.connect(dbConfig);

    var sqlrequest = new sql.Request();

    let result = await sqlrequest.query(`exec deleteTTB @id_TTB = '${id_TTB}'`);
    // Đóng kết nối
    await sql.close();

    // Phản hồi về client
    res.json({ success: true, message: 'Xóa thành công' });
}


let getdsBienChe = async (req, res) => {
    try {
        let data, TTBchuaBienChe, HVchuaBienChe, MonHoc, quyenTK, id_capDV;
        let idDV = req.params.id_DV;
        let tenDV;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getdsBienChe @idDV = '${idDV}'`);
        let DV = await sqlrequest.query(`select tenDV from DonVi where id_DV='${idDV}'`);

        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        let dsTTBchuaBienChe = await sqlrequest.query(`exec getTTBchuaBienChe @idDV = '${idDV}'`)
        let dsHVchuaBienChe = await sqlrequest.query(`exec getdsHVtheoDaiDoi @idDV = '${idDV}'`)
        let dsMonHoc = await sqlrequest.query(`select * from MonHoc`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        data = result.recordsets[0];
        TTBchuaBienChe = dsTTBchuaBienChe.recordsets[0];
        HVchuaBienChe = dsHVchuaBienChe.recordsets[0];
        MonHoc = dsMonHoc.recordsets[0];
        let tenDVArr = DV.recordsets[0];
        if (tenDVArr.length > 0) {
            tenDV = tenDVArr[0].tenDV;
        }

        return res.render('QLTTB_BienCheTB.ejs', { dataBienChe: data, tenCanBo: tenCanBo, idDV: idDV, tenDV: tenDV, TTBchuaBienChe: TTBchuaBienChe, HVchuaBienChe: HVchuaBienChe, MonHoc: MonHoc, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let createBienCheTTB = async (req, res) => {
    try {
        console.log(req.body);
        let idDV = req.params.id_DV;
        let { id_HV, id_monHoc, id_TTB, thoiGianNhan, trangThai } = req.body;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec createBienCheTTB @id_HV = '${id_HV}', @id_TTB = '${id_TTB}', @id_monHoc='${id_monHoc}', @thoiGianNhanTTB='${thoiGianNhan}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/BienCheTTB/${idDV}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let updateBienCheTTB = async (req, res) => {
    try {
        console.log(req.body);
        let idDV = req.params.id_DV;
        let { id_HVupdate, tenHVupdate, tenDVupdate, tenMonHocupdate, id_TTBupdate, thoiGianNhanupdate, trangThaiupdate } = req.body;
        let idMonHoc;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let MonHoc = await sqlrequest.query(`select id_monHoc from MonHoc where tenMonHoc = N'${tenMonHocupdate}'`)
        let MonHocArr = MonHoc.recordsets[0];
        if (MonHocArr.length > 0) {
            idMonHoc = MonHocArr[0].id_monHoc;
        }

        let result = await sqlrequest.query(`exec updateBienCheTTB @id_HV = '${id_HVupdate}', @id_TTB = '${id_TTBupdate}', @id_monHoc='${idMonHoc}', @thoiGianNhanTTB='${thoiGianNhanupdate}', @trangThai = '${trangThaiupdate}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/BienCheTTB/${idDV}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let deleteBienCheTTB = async (req, res) => {
    // var { rowIndex } = req.body;
    console.log(req.body)
    let { id_HV, tenMonHoc } = req.body;
    let idMonHoc;


    // Thực hiện xóa dữ liệu ở đây (ví dụ: thông qua cơ sở dữ liệu)
    await sql.connect(dbConfig);

    var sqlrequest = new sql.Request();
    let MonHoc = await sqlrequest.query(`select id_monHoc from MonHoc where tenMonHoc = N'${tenMonHoc}'`)
    let MonHocArr = MonHoc.recordsets[0];
    if (MonHocArr.length > 0) {
        idMonHoc = MonHocArr[0].id_monHoc;
    }

    let result = await sqlrequest.query(`exec deleteBienCheTTB @id_HV = '${id_HV}', @id_monHoc = '${idMonHoc}'`);
    // Đóng kết nối
    await sql.close();

    // Phản hồi về client
    res.json({ success: true, message: 'Xóa thành công' });
}

let getdsMonHoc = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`select * from MonHoc`);

        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        data = result.recordsets[0];

        return res.render('dsMonHoc.ejs', { dataMH: data, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let createMonHoc = async (req, res) => {
    try {
        console.log(req.body);
        let { id_monHoc, tenMonHoc, doiTuong, moTa } = req.body;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec createMonHoc @idMonHoc = '${id_monHoc}', @tenMonHoc = N'${tenMonHoc}', @doiTuong = N'${doiTuong}', @moTa = N'${moTa}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/ChuongTrinhHuanLuyen`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let updateMonHoc = async (req, res) => {
    try {
        console.log(req.body);
        let { id_monHocupdate, tenMonHocupdate, doiTuongupdate, moTaupdate } = req.body;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec updateMonHoc @idMonHoc = '${id_monHocupdate}', @tenMonHoc = N'${tenMonHocupdate}',@doiTuong = N'${doiTuongupdate}', @moTa = N'${moTaupdate}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/ChuongTrinhHuanLuyen`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let getdsBaiHoc = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        let idMonHoc = req.params.id_monHoc;
        let tenMonHoc;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getdsBaiHoc @idMonHoc='${idMonHoc}'`);
        let tenMH = await sqlrequest.query(`select tenMonHoc from MonHoc where id_monHoc='${idMonHoc}'`);

        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        data = result.recordsets[0];
        let tenMHArr = tenMH.recordsets[0];
        if (tenMHArr.length > 0) {
            tenMonHoc = tenMHArr[0].tenMonHoc;
        }
        console.log(idMonHoc);
        console.log(tenMonHoc);

        return res.render('dsBaiHoc.ejs', { dataBH: data, tenMonHoc: tenMonHoc, idMonHoc: idMonHoc, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let createBaiHoc = async (req, res) => {
    try {
        console.log(req.body);
        let idMonHoc = req.params.id_monHoc;
        let { id_baiHoc, tenBaiHoc, soGio, soTiet } = req.body;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec createBaiHoc @idBaiHoc='${id_baiHoc}', @tenBaiHoc = N'${tenBaiHoc}', @idMonHoc ='${idMonHoc}', @soGio='${soGio}', @soTiet='${soTiet}';`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/ChuongTrinhHuanLuyen/${idMonHoc}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let updateBaiHoc = async (req, res) => {
    try {
        console.log(req.body);
        let idMonHoc = req.params.id_monHoc;
        let { id_baiHocupdate, tenBaiHocupdate, soGioupdate, soTietupdate } = req.body;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec updateBaiHoc @idBaiHoc='${id_baiHocupdate}', @tenBaiHoc = N'${tenBaiHocupdate}', @soGio='${soGioupdate}', @soTiet='${soTietupdate}';`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/ChuongTrinhHuanLuyen/${idMonHoc}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let getKHHLTrungDoan = async (req, res) => {
    try {
        let data, quyenTK, id_capDV, tenDV;
        let idDV = req.params.id_DV;
        // const capDV = 1;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getKHHLTrungDoan @idDV = '${idDV}'`);
        let DonVi = await sqlrequest.query(`select tenDV from DonVi where id_DV='${idDV}'`);
        let DonViThucHien = await sqlrequest.query(`exec getDonViThucHien @idDV='${idDV}'`);
        let MonHoc = await sqlrequest.query(`exec getMonHockhongKHHL @idDV='${idDV}'`);
        let NguoiDay = await sqlrequest.query(`select * from Canbo where id_DV = '${idDV}' and id_LoaiCB = 'LCB4'`);
        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        data = result.recordsets[0];
        let DonViArr = DonVi.recordsets[0];
        if (DonViArr.length > 0) {
            tenDV = DonViArr[0].tenDV;
        }
        let listDVTT = DonViThucHien.recordsets[0];
        let listMonHoc = MonHoc.recordsets[0];
        let listNguoiDay = NguoiDay.recordsets[0];

        return res.render('KHHLTrungDoan.ejs', { dataKHHL: data, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV, tenDV: tenDV, listDVTT: listDVTT, listMonHoc: listMonHoc, listNguoiDay: listNguoiDay, idDVofCB: idDVofCB, idDV: idDV, idCanBo: idCanBo })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let createKHHLTrungDoan = async (req, res) => {
    try {
        console.log(req.body);
        let idDV = req.params.id_DV;
        let { id_monHoc, id_DV, idNguoiDay, id_CB, ngayLapHK, ghiChu, trangThai } = req.body;

        const trangThaiArr = { 1: 'Đang thực hiện', 0: 'Đã xong' };

        for (const key in trangThaiArr) {
            if (trangThaiArr[key] === trangThai) {
                trangThai = key;
                break;
            }
        }
        console.log(id_monHoc, id_DV, idNguoiDay, id_CB, ngayLapHK, ghiChu, trangThai);

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec createKHHLTrungDoan @id_monHoc='${id_monHoc}', @id_DV='${id_DV}', @idNguoiDay='${idNguoiDay}', @id_CB='${id_CB}', @ngayLapHK='${ngayLapHK}', @ghiChu=N'${ghiChu}', @trangThai='${trangThai}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/KHHLTrungDoan/${idDV}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let updateKHHLTrungDoan = async (req, res) => {
    try {
        console.log(req.body);
        let idDV = req.params.id_DV;
        let { id_monHocupdate, id_DVupdate, idNguoiDayupdate, tenCBupdate, ngayLapHKupdate, ghiChuupdate, trangThaiupdate } = req.body;

        const trangThaiArr = { 1: 'Đang thực hiện', 0: 'Đã xong' };

        for (const key in trangThaiArr) {
            if (trangThaiArr[key] === trangThaiupdate) {
                trangThaiupdate = key;
                break;
            }
        }
        console.log(id_monHocupdate, id_DVupdate, idNguoiDayupdate, tenCBupdate, ngayLapHKupdate, ghiChuupdate, trangThaiupdate);

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec updateKHHLTrungDoan @id_monHoc=N'${id_monHocupdate}', @id_DV=N'${id_DVupdate}', @idNguoiDay='${idNguoiDayupdate}', @ngayLapHK='${ngayLapHKupdate}', @ghiChu=N'${ghiChuupdate}', @trangThai='${trangThaiupdate}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/KHHLTrungDoan/${idDV}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let getKHHLTieuDoan = async (req, res) => {
    try {
        let data, quyenTK, id_capDV, tenDV;
        let idDV = req.params.id_DV;
        // const capDV = 1;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getKHHLTieuDoan @idDV = '${idDV}'`);
        let DonVi = await sqlrequest.query(`select tenDV from DonVi where id_DV='${idDV}'`);
        let DonViThucHien = await sqlrequest.query(`exec getDonViThucHien @idDV='${idDV}'`);
        let MonHoc = await sqlrequest.query(`exec getMonHocinKHHLCapTren @idDV = '${idDV}'`);
        // let NguoiDay = await sqlrequest.query(`select * from Canbo where id_DV = '${idDV}' and id_LoaiCB = 'LCB4'`);
        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        data = result.recordsets[0];
        let DonViArr = DonVi.recordsets[0];
        if (DonViArr.length > 0) {
            tenDV = DonViArr[0].tenDV;
        }
        let listDVTT = DonViThucHien.recordsets[0];
        let listMonHoc = MonHoc.recordsets[0];
        // let listNguoiDay = NguoiDay.recordsets[0];

        return res.render('KHHLTieuDoan.ejs', { dataKHHL: data, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV, tenDV: tenDV, idDVofCB: idDVofCB, idDV: idDV, listDVTT: listDVTT, listMonHoc: listMonHoc, idCanBo: idCanBo })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let createKHHLTieuDoan = async (req, res) => {
    try {
        console.log(req.body);
        let idDV = req.params.id_DV;
        let { id_monHoc, id_DV, tgBatDau, id_CB } = req.body;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec createKHHLTieuDoan @id_monHoc='${id_monHoc}', @id_DV='${id_DV}', @tgBatDau='${tgBatDau}', @id_CB='${id_CB}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/KHHLTieuDoan/${idDV}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let updateKHHLTieuDoan = async (req, res) => {
    try {
        console.log(req.body);
        let idDV = req.params.id_DV;
        let { tenDVupdate, tenMonHocupdate, tgBatDauupdate, tenCBupdate } = req.body;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec updateKHHLTieuDoan @tenMonHoc=N'${tenMonHocupdate}', @tenDV=N'${tenDVupdate}', @tgBatDau='${tgBatDauupdate}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/KHHLTieuDoan/${idDV}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let getKHHLCapTren = async (req, res) => {
    try {
        let data, quyenTK, id_capDV, tenDV;
        let idDV = req.params.id_DV;
        // const capDV = 1;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getKHHLCapTren @id_DV = '${idDV}'`);
        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        data = result.recordsets[0];

        return res.render('KHHLCapTren.ejs', { dataKHHL: data, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB, idDV: idDV })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let getKHHLdsCapDuoi = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        let idDV = req.params.id_DV;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getdsCapDuoi @idDV = '${idDV}'`);

        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        data = result.recordsets[0];

        return res.render('KHHL_dsCapDuoi.ejs', { dataDVTD: data, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB, idDV: idDV })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let getKHHLDaiDoi = async (req, res) => {
    try {
        let data, quyenTK, id_capDV, tenDV, idCapTren;
        let idDV = req.params.id_DV;
        // const capDV = 1;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getKHHLDaiDoi @id_DV = '${idDV}'`);
        let DonVi = await sqlrequest.query(`select tenDV from DonVi where id_DV='${idDV}'`);
        let CapTren = await sqlrequest.query(`select id_capTren from DVTrucThuoc where id_capDuoi='${idDV}'`);
        let BaiHoc = await sqlrequest.query(`exec getdsBaiHocchuaKHHL @idDV='${idDV}'`);
        // let NguoiDay = await sqlrequest.query(`select * from Canbo where id_DV = '${idDV}' and id_LoaiCB = 'LCB4'`);
        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        data = result.recordsets[0];
        let DonViArr = DonVi.recordsets[0];
        if (DonViArr.length > 0) {
            tenDV = DonViArr[0].tenDV;
        }
        let listBaiHoc = BaiHoc.recordsets[0];
        let CapTrenArr = CapTren.recordsets[0];
        if (CapTrenArr.length > 0) {
            idCapTren = CapTrenArr[0].id_capTren;
        }

        return res.render('KHHLDaiDoi.ejs', { dataKHHL: data, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV, tenDV: tenDV, idDVofCB: idDVofCB, idDV: idDV, idCanBo: idCanBo, listBaiHoc: listBaiHoc, idCapTren: idCapTren })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let createKHHLDaiDoi = async (req, res) => {
    try {
        console.log(req.body);
        let idDV = req.params.id_DV;
        let { id_baiHoc, ngayHoc, diaDiem, id_CB } = req.body;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec createKHHLDaiDoi @id_baiHoc='${id_baiHoc}',@id_DV='${idDV}',@id_CB='${id_CB}', @ngayHoc='${ngayHoc}',@diaDiem=N'${diaDiem}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/KHHLDaiDoi/${idDV}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let updateKHHLDaiDoi = async (req, res) => {
    try {
        console.log(req.body);
        let idDV = req.params.id_DV;
        let { id_baiHocupdate, tenBaiHocupdate, tenDVupdate, ngayHocupdate, diaDiemupdate, soTietupdate, tenCBupdate } = req.body;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec updateKHHLDaiDoi @id_baiHoc='${id_baiHocupdate}',@id_DV='${idDV}', @ngayHoc='${ngayHocupdate}',@diaDiem=N'${diaDiemupdate}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/KHHLDaiDoi/${idDV}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let getKQHL = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`select * from MonHoc`);

        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        data = result.recordsets[0];

        return res.render('KetQuaHuanLuyen.ejs', { dataMH: data, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let getdsDonVitheoMonHoc = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        let id_monHoc = req.params.id_monHoc;
        await sql.connect(dbConfig);
        let tenMonHoc;

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getdsDonVitheoMonHoc @id_monHoc='${id_monHoc}'`);
        let MonHoc = await sqlrequest.query(`select tenMonHoc from MonHoc where id_monHoc='${id_monHoc}'`);

        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        data = result.recordsets[0];
        let MonHocArr = MonHoc.recordsets[0];
        if (MonHocArr.length > 0) {
            tenMonHoc = MonHocArr[0].tenMonHoc;
        }

        return res.render('KQHL_dsDonVi.ejs', { dataDV: data, tenCanBo: tenCanBo, id_monHoc: id_monHoc, tenMonHoc: tenMonHoc, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let getNhapDiem = async (req, res) => {
    try {
        let data, quyenTK, id_capDV, idNguoiDay;
        let idMonHoc = req.params.id_monHoc;
        let idDV = req.params.id_DV;
        let tenMonHoc, tenDV;


        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        // let result = await sqlrequest.query(`exec getKetQuaHuanLuyen @id_monHoc = '${idMonHoc}', @idDV = '${idDV}';`);
        let result = await sqlrequest.query(`select HV.id_HV, HV.tenHV, MH.id_monHoc, MH.tenMonHoc, KQ.namHoc, KQ.diemCC, KQ.diemTX, KQ.diemThi, ROUND(KQ.diemCC*0.1+KQ.diemTX*0.3+KQ.diemThi*0.6,2) as diemTB from KetQuaHuanLuyen as KQ inner join HocVien as HV on KQ.id_HV = HV.id_HV inner join MonHoc as MH on KQ.id_monHoc = MH.id_monHoc where HV.id_DV = '${idDV}' and KQ.id_monHoc = '${idMonHoc}';`)

        let MonHoc = await sqlrequest.query(`select tenMonHoc from MonHoc where id_monHoc='${idMonHoc}'`);
        let DonVi = await sqlrequest.query(`select tenDV from DonVi where id_DV='${idDV}'`);
        let ThongKe = await sqlrequest.query(`exec ThongKeDiemTB @id_monHoc = '${idMonHoc}', @idDV = '${idDV}';`);

        let GiaoVien = await sqlrequest.query(`exec getGVnhapdiem @id_DV='${idDV}', @id_monHoc='${idMonHoc}'`);
        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        data = result.recordsets[0];
        let MonHocArr = MonHoc.recordsets[0];
        if (MonHocArr.length > 0) {
            tenMonHoc = MonHocArr[0].tenMonHoc;
        }
        let DonViArr = DonVi.recordsets[0];
        if (DonViArr.length > 0) {
            tenDV = DonViArr[0].tenDV;
        }
        let GiaoVienArr = GiaoVien.recordsets[0];
        if (GiaoVienArr.length > 0) {
            idNguoiDay = GiaoVienArr[0].idnguoiDay;
        }
        console.log(GiaoVienArr)

        let dataKQDV = ThongKe.recordsets[0];

        return res.render('KQHL_NhapDiem.ejs', { dataKQHL: data, tenCanBo: tenCanBo, tenMonHoc: tenMonHoc, tenDV: tenDV, idMonHoc: idMonHoc, idDV: idDV, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB, idNguoiDay: idNguoiDay, idCanBo: idCanBo, dataKQDV: dataKQDV })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let nhapDiemKQHL = async (req, res) => {
    try {
        console.log(req.body);
        let idMonHoc = req.params.id_monHoc;
        let idDV = req.params.id_DV;
        let { id_HV, tenHV, tenMonHoc, namHoc, diemCC, diemTX, diemThi } = req.body;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec updateKetQuaHuanLuyen @id_monHoc = '${idMonHoc}', @id_HV='${id_HV}', @diemCC = '${diemCC}', @diemTX = '${diemTX}', @diemThi='${diemThi}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/NhapDiem/${idMonHoc}/${idDV}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let getdsBuoiHoc = async (req, res) => {
    try {
        let data, quyenTK, id_capDV, idNguoiDay;
        let idMonHoc = req.params.id_monHoc;
        let idDV = req.params.id_DV;
        let tenMonHoc, tenDV;


        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getdsBuoiHoc @id_DV='${idDV}', @id_monHoc='${idMonHoc}'`);
        let MonHoc = await sqlrequest.query(`select tenMonHoc from MonHoc where id_monHoc='${idMonHoc}'`);
        let DonVi = await sqlrequest.query(`select tenDV from DonVi where id_DV='${idDV}'`);
        let ThongKe = await sqlrequest.query(`exec ThongKeChuyenCan @id_monHoc = '${idMonHoc}', @id_DV = '${idDV}';`);

        let GiaoVien = await sqlrequest.query(`exec getGVnhapdiem @id_DV='${idDV}', @id_monHoc='${idMonHoc}'`);
        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        data = result.recordsets[0];
        let MonHocArr = MonHoc.recordsets[0];
        if (MonHocArr.length > 0) {
            tenMonHoc = MonHocArr[0].tenMonHoc;
        }
        let DonViArr = DonVi.recordsets[0];
        if (DonViArr.length > 0) {
            tenDV = DonViArr[0].tenDV;
        }
        let GiaoVienArr = GiaoVien.recordsets[0];
        if (GiaoVienArr.length > 0) {
            idNguoiDay = GiaoVienArr[0].idnguoiDay;
        }
        console.log(GiaoVienArr)

        let dataKQDV = ThongKe.recordsets[0];

        return res.render('KQHL_buoiHoc.ejs', { dataBuoiHoc: data, tenCanBo: tenCanBo, tenMonHoc: tenMonHoc, tenDV: tenDV, idMonHoc: idMonHoc, idDV: idDV, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB, idNguoiDay: idNguoiDay, idCanBo: idCanBo, dataKQDV: dataKQDV })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let getdsDiemDanh = async (req, res) => {
    try {
        let data, quyenTK, id_capDV, idNguoiDay;
        let idKHHL = req.params.id_KHHL;
        let idDV = req.params.id_DV;
        let idMonHoc, tenMonHoc, tenDV;


        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getdsDiemDanh @id_KHHL='${idKHHL}', @id_DV = '${idDV}'`);
        let MonHoc = await sqlrequest.query(`exec getMonHocfromKHHL @id_KHHL='${idKHHL}'`);
        let MonHocArr = MonHoc.recordsets[0];
        if (MonHocArr.length > 0) {
            tenMonHoc = MonHocArr[0].tenMonHoc;
            idMonHoc = MonHocArr[0].id_monHoc;
        }
        let DonVi = await sqlrequest.query(`select tenDV from DonVi where id_DV='${idDV}'`);
        let GiaoVien = await sqlrequest.query(`exec getGVnhapdiem @id_DV='${idDV}', @id_monHoc='${idMonHoc}'`);
        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        data = result.recordsets[0];

        let DonViArr = DonVi.recordsets[0];
        if (DonViArr.length > 0) {
            tenDV = DonViArr[0].tenDV;
        }
        let GiaoVienArr = GiaoVien.recordsets[0];
        if (GiaoVienArr.length > 0) {
            idNguoiDay = GiaoVienArr[0].idnguoiDay;
        }

        return res.render('KQHL_DiemDanh.ejs', { dataDiemDanh: data, tenCanBo: tenCanBo, tenMonHoc: tenMonHoc, tenDV: tenDV, idMonHoc: idMonHoc, idDV: idDV, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB, idNguoiDay: idNguoiDay, idCanBo: idCanBo, idKHHL: idKHHL })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let DiemDanh = async (req, res) => {
    try {
        console.log(req.body);
        let idKHHL = req.params.id_KHHL;
        let idDV = req.params.id_DV;
        let { id_HV, tenHV, isVangMat, ghiChu } = req.body;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec DiemDanh @id_HV ='${id_HV}', @isVangMat='${isVangMat}', @ghiChu=N'${ghiChu}', @idKHHL = '${idKHHL}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/DiemDanh/${idKHHL}/${idDV}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}


let getQuanLyTaiKhoan = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        let datacapDV;
        console.log(username);
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`getQuanLyTaiKhoan`);
        // // Đóng kết nối
        data = result.recordsets[0];
        let CanBo = await sqlrequest.query(`exec getCBkhongTaiKhoan`);
        let QuyenTK = await sqlrequest.query(`select * from QuyenTK`);
        // datacapDV = capDV.recordsets[1];
        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo, idDVofCB;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
            idDVofCB = dataUser[0].id_DV;
        }
        let listCanBo = CanBo.recordsets[0];
        let listQuyenTK = QuyenTK.recordsets[0];

        return res.render('QuanLyTaiKhoan.ejs', { dataTK: data, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV, idDVofCB: idDVofCB, listCanBo: listCanBo, listQuyenTK: listQuyenTK })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let updateTaiKhoan = async (req, res) => {
    try {
        console.log(req.body);
        let { id_CBupdate, id_userupdate, usernameupdate, passwrdupdate, id_quyenTKupdate } = req.body;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec updateTaiKhoan @id_user='${id_userupdate}',@username='${usernameupdate}',@passwrd='${passwrdupdate}', @id_quyenTK='${id_quyenTKupdate}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/QuanLyTaiKhoan`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}


let createTaiKhoan = async (req, res) => {
    try {
        console.log(req.body);
        let { id_CB, id_user, username, passwrd, id_quyenTK } = req.body;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec createTaiKhoan @id_CB='${id_CB}',@id_user='${id_user}',@username='${username}',@passwrd='${passwrd}', @id_quyenTK='${id_quyenTK}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/QuanLyTaiKhoan`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let deleteTaiKhoan = async (req, res) => {
    // var { rowIndex } = req.body;
    console.log(req.body)
    let { id_CB, id_user } = req.body;

    // Thực hiện xóa dữ liệu ở đây (ví dụ: thông qua cơ sở dữ liệu)
    await sql.connect(dbConfig);

    var sqlrequest = new sql.Request();

    let result = await sqlrequest.query(`exec deleteTaiKhoan @id_CB='${id_CB}', @id_user='${id_user}'`);
    // Đóng kết nối
    await sql.close();

    // Phản hồi về client
    res.json({ success: true, message: 'Xóa thành công' });
}

module.exports = {
    getLogin, login, getHomepage, getDetailTrungDoan, getDetailTieuDoan, getdsDV, createDV, updateDV, deleteDV, getdsCB, createCB, updateCB, deleteCanBo, getDVCapDuoi, createDVCapDuoi, updateDVCapDuoi, getdsHVtheoKhoaHoc, getdsHVtheoDonVi, getdsKhoaHoc, createKhoaHoc, updateKhoaHoc, getdsTieuDoan, getdsDaiDoi, createHVtheoDonVi, updateHVtheoDonVi, deleteHVtheoDonVi, getdsCapDuoi, getdsChungLoai, createChungLoai, updateChungLoai, deleteChungLoai, getdsTTB, createTTB, updateTTB, deleteTTB, getdsBienChe, createBienCheTTB, updateBienCheTTB, deleteBienCheTTB, getdsMonHoc, createMonHoc, updateMonHoc, getdsBaiHoc, createBaiHoc, updateBaiHoc, getKHHLTrungDoan, createKHHLTrungDoan, updateKHHLTrungDoan, getKHHLTieuDoan, createKHHLTieuDoan, updateKHHLTieuDoan, getKHHLCapTren, getKHHLdsCapDuoi, getKHHLDaiDoi, createKHHLDaiDoi, updateKHHLDaiDoi, getKQHL, getdsDonVitheoMonHoc, getNhapDiem, nhapDiemKQHL, getdsBuoiHoc, getdsDiemDanh, DiemDanh, getQuanLyTaiKhoan, updateTaiKhoan, createTaiKhoan, deleteTaiKhoan
}
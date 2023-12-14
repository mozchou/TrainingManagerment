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
        let tenCanBo, idCanBo;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
        }


        return res.render('index.ejs', { dataDV: data, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV })
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
        let tenCanBo, idCanBo;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
        }
        data = result.recordsets[0];
        return res.render('detailTrungDoan.ejs', { dataDV: data, dvCapTren: dvCapTren, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let createDthuocE = async (req, res) => {
    try {
        console.log(req.body);
        let { id_newDV, tenDV, moTa } = req.body;
        // let dvCapTren = await req.params.id_DV;
        console.log(id_newDV, tenDV, moTa, dvCapTren)
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec create_d_tructhuoc_e @id_DV = '${id_newDV}', @tenDV = N'${tenDV}', @moTa = N'${moTa}', @id_capTren = '${dvCapTren}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/trungdoan/${dvCapTren}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}
let updateDVCoBand = async (req, res) => {
    try {
        console.log(req.body);
        let { id_updateDV, tenDVupdate, capDVupdate, moTaupdate } = req.body;
        // let dvCapTren = await req.params.id_DV;
        console.log(id_updateDV, tenDVupdate, capDVupdate, moTaupdate)
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec updateDVCoBan @id_DV = '${id_updateDV}', @tenDV = N'${tenDVupdate}', @moTa = N'${moTaupdate}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/trungdoan/${dvCapTren}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let deleteDVTTd = async (req, res) => {
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
        let tenCanBo, idCanBo;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
        }
        data = result.recordsets[0];

        return res.render('detailTieuDoan.ejs', { dataDV: data, dvCapTren: dvCapTren, tenCB: tenCanBo, idCB: idCanBo, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let createCthuocD = async (req, res) => {
    try {
        console.log(req.body);
        let { id_newDV, tenDV, moTa } = req.body;
        // let dvCapTren = await req.params.id_DV;
        console.log(id_newDV, tenDV, moTa, dvCapTren)
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec create_c_tructhuoc_d @id_DV = '${id_newDV}', @tenDV = N'${tenDV}', @moTa = N'${moTa}', @id_capTren = '${dvCapTren}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/trungdoan/tieudoan/${dvCapTren}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let updateDVCoBanc = async (req, res) => {
    try {
        console.log(req.body);
        let { id_updateDV, tenDVupdate, capDVupdate, moTaupdate } = req.body;
        // let dvCapTren = await req.params.id_DV;
        console.log(id_updateDV, tenDVupdate, capDVupdate, moTaupdate)
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec updateDVCoBan @id_DV = '${id_updateDV}', @tenDV = N'${tenDVupdate}', @moTa = N'${moTaupdate}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/trungdoan/tieudoan/${dvCapTren}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let deleteDVTTc = async (req, res) => {
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
        let tenCanBo, idCanBo;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
        }
        return res.render('dsDonVi.ejs', { dataDV: data, dataCapDV: datacapDV, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV })
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
        let { id_updateDV, tenDVupdate, capDVupdate, idDVCapTrenupdate, moTaupdate } = req.body;
        // let dvCapTren = await req.params.id_DV;
        console.log(id_updateDV, tenDVupdate, capDVupdate, idDVCapTrenupdate, moTaupdate)
        const capDonVi = { 1: 'Đại đội', 2: 'Tiểu đoàn', 3: 'Trung đoàn', 4: 'Sư đoàn' };
        let id_capDV = null;

        for (const key in capDonVi) {
            if (capDonVi[key] === capDVupdate) {
                id_capDV = key;
                break;
            }
        }
        console.log(id_updateDV, tenDVupdate, id_capDV, idDVCapTrenupdate, moTaupdate)
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec updateDV @id_DV = '${id_updateDV}', @tenDV = N'${tenDVupdate}', @id_capDV = '${id_capDV}', @idDVCapTren = '${idDVCapTrenupdate}', @moTa = N'${moTaupdate}'`);
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
        let tenCanBo, idCanBo;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
        }
        data = result.recordsets[0];
        loaiCB = dataloaiCB.recordsets[0];
        DV = dataDV.recordsets[0];
        return res.render('dsCanBo.ejs', { dataCB: data, idDV: id_DV, dataLoaiCB: loaiCB, dataDV: DV, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV })
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

let getdsKhoaHoc = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getdsKhoaHoc`);

        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
        }
        data = result.recordsets[0];

        return res.render('QLHVtheoKhoaHoc.ejs', { dataKH: data, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV })
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

let deleteKhoaHoc = async (req, res) => {
    // var { rowIndex } = req.body;
    console.log(req.body)
    let { id_khoaHoc } = req.body;

    // Thực hiện xóa dữ liệu ở đây (ví dụ: thông qua cơ sở dữ liệu)
    await sql.connect(dbConfig);

    var sqlrequest = new sql.Request();

    let result = await sqlrequest.query(`exec deleteHVtheoKhoaHoc @id_khoaHoc = '${id_khoaHoc}'`);
    // Đóng kết nối
    await sql.close();

    // Phản hồi về client
    res.json({ success: true, message: 'Xóa thành công' });
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
        let tenCanBo, idCanBo;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
        }

        data = result.recordsets[0];
        dataDV = dsDV.recordsets[0];
        dataKhoaHoc = KhoaHoc.recordsets[0];
        return res.render('dsHVtheoKhoaHoc.ejs', { dataHV: data, idKhoaHoc: idKhoaHoc, dataDV: dataDV, dataKhoaHoc: dataKhoaHoc, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}


let createHVtheoKhoaHoc = async (req, res) => {
    try {
        console.log(req.body);
        let idKhoaHoc = req.params.idKhoaHoc;
        let { tenHV, id_HV, ngaySinhHV, gioiTinh, queQuan, tenLop, id_DV, sdt } = req.body;
        // // let { id_DV, tenDV, capDV, moTa } = req.body;
        // // // let dvCapTren = await req.params.id_DV;
        // console.log(id_DV, tenDV, capDV, moTa)
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec createHV @tenHV=N'${tenHV}', @id_HV='${id_HV}', @ngaySinhHV = '${ngaySinhHV}', @gioiTinh = N'${gioiTinh}', @queQuan = N'${queQuan}', @tenLop = N'${tenLop}', @id_DV = '${id_DV}', @sdt = '${sdt}', @idKhoaHoc = '${idKhoaHoc}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/dsHVtheoKhoaHoc/${idKhoaHoc}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}

let updateHVtheoKhoaHoc = async (req, res) => {
    try {
        console.log(req.body);
        let idKhoaHoc = req.params.idKhoaHoc;
        let { tenHVupdate, id_HVupdate, ngaySinhHVupdate, gioiTinhupdate, queQuanupdate, tenLopupdate, tenDVupdate, id_KhoaHocupdate, sdtupdate } = req.body;
        // // let { id_DV, tenDV, capDV, moTa } = req.body;
        // // // let dvCapTren = await req.params.id_DV;
        // console.log(id_DV, tenDV, capDV, moTa)
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec updateHV @tenHV=N'${tenHVupdate}', @id_HV='${id_HVupdate}', @ngaySinhHV = '${ngaySinhHVupdate}', @gioiTinh = N'${gioiTinhupdate}', @queQuan = N'${queQuanupdate}', @tenLop = N'${tenLopupdate}', @tenDV = N'${tenDVupdate}', @sdt = '${sdtupdate}', @idKhoaHoc = '${id_KhoaHocupdate}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/dsHVtheoKhoaHoc/${idKhoaHoc}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
    // console.log(req.body);
    // return res.send('hihi minh châu')
}


let getdsDaiDoi = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        const capDV = 1;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec DonViTheoCap @capDV = ${capDV}`);
        // Đóng kết nối
        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
        }
        data = result.recordsets[0];

        return res.render('QLHVtheoDonVi.ejs', { dataDV: data, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV })
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
        let tenCanBo, idCanBo;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
        }

        data = result.recordsets[0];
        dataKhoaHoc = KhoaHoc.recordsets[0];

        dataDV = DonVi.recordsets[0];
        return res.render('dsHVtheoDonVi.ejs', { dataHV: data, idDV: idDV, dataKhoaHoc: dataKhoaHoc, dataDV: dataDV, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV })
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

let getdsTrungDoan = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec DonViTheoCap @capDV = 3;`);

        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
        }
        data = result.recordsets[0];

        return res.render('QLTTB_dsTrungDoan.ejs', { dataDVTD: data, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
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
        let tenCanBo, idCanBo;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
        }
        data = result.recordsets[0];

        return res.render('QLTTB_ChungLoai.ejs', { dataLoaiTTB: data, tenCanBo: tenCanBo, idDV: idDV, quyenTK: quyenTK, id_capDV: id_capDV })
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
        let tenCanBo, idCanBo;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
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

        return res.render('QLTTB_TrangBi.ejs', { dataTTB: data, tenCanBo: tenCanBo, tenDV: tenDV, idDV: idDV, tenLoaiTTB: tenLoaiTTB, id_chungLoai: id_chungLoai, id_chungLoai: id_chungLoai, quyenTK: quyenTK, id_capDV: id_capDV })
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
        let dsMonHoc = await sqlrequest.query(`exec getdsMonHoc`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
        }
        data = result.recordsets[0];
        TTBchuaBienChe = dsTTBchuaBienChe.recordsets[0];
        HVchuaBienChe = dsHVchuaBienChe.recordsets[0];
        MonHoc = dsMonHoc.recordsets[0];
        let tenDVArr = DV.recordsets[0];
        if (tenDVArr.length > 0) {
            tenDV = tenDVArr[0].tenDV;
        }

        return res.render('QLTTB_BienCheTB.ejs', { dataBienChe: data, tenCanBo: tenCanBo, idDV: idDV, tenDV: tenDV, TTBchuaBienChe: TTBchuaBienChe, HVchuaBienChe: HVchuaBienChe, MonHoc: MonHoc, quyenTK: quyenTK, id_capDV: id_capDV })
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
        let result = await sqlrequest.query(`exec getdsMonHoc`);

        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
        }
        data = result.recordsets[0];

        return res.render('dsMonHoc.ejs', { dataMH: data, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV })
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
        let tenCanBo, idCanBo;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
        }
        data = result.recordsets[0];
        let tenMHArr = tenMH.recordsets[0];
        if (tenMHArr.length > 0) {
            tenMonHoc = tenMHArr[0].tenMonHoc;
        }
        console.log(idMonHoc);
        console.log(tenMonHoc);

        return res.render('dsBaiHoc.ejs', { dataBH: data, tenMonHoc: tenMonHoc, idMonHoc: idMonHoc, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let createBaiHoc = async (req, res) => {
    try {
        console.log(req.body);
        let idMonHoc = req.params.id_monHoc;
        let { id_baiHoc, tenBaiHoc } = req.body;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec createBaiHoc @idBaiHoc='${id_baiHoc}', @tenBaiHoc = N'${tenBaiHoc}', @idMonHoc ='${idMonHoc}';`);
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
        let { id_baiHocupdate, tenBaiHocupdate } = req.body;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec updateBaiHoc @idBaiHoc='${id_baiHocupdate}', @tenBaiHoc = N'${tenBaiHocupdate}';`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/ChuongTrinhHuanLuyen/${idMonHoc}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let getdsNDBH = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        let idMonHoc = req.params.id_monHoc;
        let idBaiHoc = req.params.id_baiHoc;
        let tenMonHoc;
        let tenBaiHoc;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getdsNoiDungBaiHoc @idBaiHoc = '${idBaiHoc}'`);
        let tenMH = await sqlrequest.query(`select tenMonHoc from MonHoc where id_monHoc='${idMonHoc}'`);
        let tenBH = await sqlrequest.query(`select tenBaiHoc from BaiHoc where id_baiHoc='${idBaiHoc}'`);
        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
        }
        data = result.recordsets[0];
        let tenMHArr = tenMH.recordsets[0];
        if (tenMHArr.length > 0) {
            tenMonHoc = tenMHArr[0].tenMonHoc;
        }

        let tenBHArr = tenBH.recordsets[0];
        if (tenBHArr.length > 0) {
            tenBaiHoc = tenBHArr[0].tenBaiHoc;
        }

        // console.log(idMonHoc);
        console.log(tenBaiHoc);

        return res.render('dsNoiDungBaiHoc.ejs', { dataNDBH: data, tenMonHoc: tenMonHoc, tenBaiHoc: tenBaiHoc, idMonHoc: idMonHoc, idBaiHoc: idBaiHoc, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let createNDBH = async (req, res) => {
    try {
        console.log(req.body);
        let idMonHoc = req.params.id_monHoc;
        let idBaiHoc = req.params.id_baiHoc;
        console.log(idMonHoc, idBaiHoc)
        let { id_NDBH, tenNDBH, thoiGian, soTiet } = req.body;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec createNoiDungBaiHoc @id_NDBH='${id_NDBH}', @tenNDBH = N'${tenNDBH}', @thoiGian = '${thoiGian}', @soTiet = '${soTiet}', @id_baiHoc = '${idBaiHoc}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/ChuongTrinhHuanLuyen/${idMonHoc}/${idBaiHoc}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let updateNDBH = async (req, res) => {
    try {
        console.log(req.body);
        let idMonHoc = req.params.id_monHoc;
        let idBaiHoc = req.params.id_baiHoc;
        console.log(idMonHoc, idBaiHoc)
        let { id_NDBHupdate, tenNDBHupdate, thoiGianupdate, soTietupdate } = req.body;

        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec updateNoiDungBaiHoc @id_NDBH='${id_NDBHupdate}', @tenNDBH = N'${tenNDBHupdate}', @thoiGian = '${thoiGianupdate}', @soTiet = '${soTietupdate}'`);
        // Đóng kết nối
        await sql.close();

        return res.redirect(`/ChuongTrinhHuanLuyen/${idMonHoc}/${idBaiHoc}`)
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let getKHHLdsTrungDoan = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        // const capDV = 1;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec DonViTheoCap @capDV = 3;`);
        // // Đóng kết nối
        // await sql.close();
        // data = result.recordsets[0];
        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
        }
        data = result.recordsets[0];

        return res.render('KHHL_dsTrungDoan.ejs', { dataDV: data, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV })
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
        let tenCanBo, idCanBo;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
        }
        data = result.recordsets[0];
        let DonViArr = DonVi.recordsets[0];
        if (DonViArr.length > 0) {
            tenDV = DonViArr[0].tenDV;
        }
        let listDVTT = DonViThucHien.recordsets[0];
        let listMonHoc = MonHoc.recordsets[0];
        let listNguoiDay = NguoiDay.recordsets[0];

        return res.render('KHHLTrungDoan.ejs', { dataKHHL: data, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV, tenDV: tenDV, listDVTT: listDVTT, listMonHoc: listMonHoc, listNguoiDay: listNguoiDay })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let getKQHL = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getdsMonHoc`);

        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
        }
        data = result.recordsets[0];

        return res.render('KetQuaHuanLuyen.ejs', { dataMH: data, tenCanBo: tenCanBo, quyenTK: quyenTK, id_capDV: id_capDV })
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
        let tenCanBo, idCanBo;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
        }
        data = result.recordsets[0];
        let MonHocArr = MonHoc.recordsets[0];
        if (MonHocArr.length > 0) {
            tenMonHoc = MonHocArr[0].tenMonHoc;
        }

        return res.render('KQHL_dsDonVi.ejs', { dataDV: data, tenCanBo: tenCanBo, id_monHoc: id_monHoc, tenMonHoc: tenMonHoc, quyenTK: quyenTK, id_capDV: id_capDV })
    } catch (err) {
        console.log(err);
        return res.status(500).send('Internal Server Error');
    }
}

let getNhapDiem = async (req, res) => {
    try {
        let data, quyenTK, id_capDV;
        let idMonHoc = req.params.id_monHoc;
        let idDV = req.params.id_DV;
        let tenMonHoc, tenDV;


        await sql.connect(dbConfig);

        var sqlrequest = new sql.Request();
        let result = await sqlrequest.query(`exec getKetQuaHuanLuyen @id_monHoc = '${idMonHoc}', @idDV = '${idDV}';`);
        let MonHoc = await sqlrequest.query(`select tenMonHoc from MonHoc where id_monHoc='${idMonHoc}'`);
        let DonVi = await sqlrequest.query(`select tenDV from DonVi where id_DV='${idDV}'`);

        let User = await sqlrequest.query(`exec getCBtheoUsername @username = N'${username}'`);
        // Đóng kết nối
        await sql.close();
        let tenCanBo, idCanBo;
        let dataUser = User.recordsets[0];
        if (dataUser.length > 0) {
            tenCanBo = dataUser[0].tenCB;
            idCanBo = dataUser[0].id_CB;
            quyenTK = dataUser[0].id_quyenTK;
            id_capDV = dataUser[0].id_capDV;
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


        return res.render('KQHL_NhapDiem.ejs', { dataKQHL: data, tenCanBo: tenCanBo, tenMonHoc: tenMonHoc, tenDV: tenDV, idMonHoc: idMonHoc, idDV: idDV, quyenTK: quyenTK, id_capDV: id_capDV })
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

module.exports = {
    getLogin, login, getHomepage, getDetailTrungDoan, createDthuocE, updateDVCoBand, deleteDVTTd, getDetailTieuDoan, createCthuocD, updateDVCoBanc, deleteDVTTc, getdsDV, createDV, updateDV, deleteDV, getdsCB, createCB, updateCB, deleteCanBo, getdsHVtheoKhoaHoc, getdsHVtheoDonVi, getdsKhoaHoc, createKhoaHoc, updateKhoaHoc, deleteKhoaHoc, createHVtheoKhoaHoc, updateHVtheoKhoaHoc, getdsDaiDoi, createHVtheoDonVi, updateHVtheoDonVi, deleteHVtheoDonVi, getdsTrungDoan, getdsChungLoai, createChungLoai, updateChungLoai, deleteChungLoai, getdsTTB, createTTB, updateTTB, deleteTTB, getdsBienChe, createBienCheTTB, updateBienCheTTB, deleteBienCheTTB, getdsMonHoc, createMonHoc, updateMonHoc, getdsBaiHoc, createBaiHoc, updateBaiHoc, getdsNDBH, createNDBH, updateNDBH, getKHHLdsTrungDoan, getKHHLTrungDoan, getKQHL, getdsDonVitheoMonHoc, getNhapDiem, nhapDiemKQHL
}
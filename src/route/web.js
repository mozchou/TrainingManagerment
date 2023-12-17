import express from 'express';
import homeController from '../controller/homeController';

let router = express.Router();

const initWebRoute = (app) => {
    router.get('/login', homeController.getLogin);
    router.post('/login', homeController.login);
    //quyền nào cũng dc
    router.get('/', homeController.getHomepage);

    router.get('/trungdoan/:id_DV', homeController.getDetailTrungDoan);

    router.get('/trungdoan/tieudoan/:id_DV', homeController.getDetailTieuDoan);
    //quyền 5
    router.get('/dsDonVi', homeController.getdsDV);
    router.post('/deleteDonVi', homeController.deleteDV);
    router.post('/createDV', homeController.createDV);
    router.post('/updateDV', homeController.updateDV);
    router.get('/dsCanBo/:id_DV', homeController.getdsCB);
    router.post('/createCB/:id_DV', homeController.createCB);
    router.post('/updateCB/:id_DV', homeController.updateCB);
    router.post('/deleteCanBo', homeController.deleteCanBo);
    router.get('/dsDonViCapDuoi/:id_DV', homeController.getDVCapDuoi);
    router.post('/createDV/:id_DV', homeController.createDVCapDuoi);
    router.post('/updateDV/:id_DV', homeController.updateDVCapDuoi);
    // quyền 2
    router.get('/QLHVtheoKhoaHoc', homeController.getdsKhoaHoc);
    router.post('/createKhoaHoc', homeController.createKhoaHoc);
    router.post('/updateKhoaHoc', homeController.updateKhoaHoc);
    router.get('/dsHVtheoKhoaHoc/:idKhoaHoc', homeController.getdsHVtheoKhoaHoc);

    router.get('/QLHVtheoDonViTrungDoan/:id_DV', homeController.getdsTieuDoan);
    router.get('/QLHVtheoDonViTieuDoan/:id_DV', homeController.getdsDaiDoi);
    router.get('/dsHVtheoDonVi/:id_DV', homeController.getdsHVtheoDonVi);
    router.post('/createHVtheoDonVi/:id_DV', homeController.createHVtheoDonVi);
    router.post('/updateHVtheoDonVi/:id_DV', homeController.updateHVtheoDonVi);
    router.post('/deleteHVtheoDonVi', homeController.deleteHVtheoDonVi);

    //quyền 3
    router.get('/dsCapDuoi/:id_DV', homeController.getdsCapDuoi);
    router.get('/QLTTB-ChungLoai/:id_DV', homeController.getdsChungLoai);
    router.post('/createChungLoai/:id_DV', homeController.createChungLoai);
    router.post('/updateChungLoai/:id_DV', homeController.updateChungLoai);
    router.post('/deleteChungLoai', homeController.deleteChungLoai);
    router.get('/QLTTB-ChungLoai/:id_DV/:id_chungLoai', homeController.getdsTTB);
    router.post('/createTTB/:id_DV/:id_chungLoai', homeController.createTTB);
    router.post('/updateTTB/:id_DV/:id_chungLoai', homeController.updateTTB);
    router.post('/deleteTTB', homeController.deleteTTB);

    router.get('/BienCheTTB/:id_DV', homeController.getdsBienChe);
    router.post('/createBienCheTTB/:id_DV', homeController.createBienCheTTB);
    router.post('/updateBienCheTTB/:id_DV', homeController.updateBienCheTTB);
    router.post('/deleteBienCheTTB', homeController.deleteBienCheTTB);
    //quyền 1
    router.get('/ChuongTrinhHuanLuyen', homeController.getdsMonHoc);
    router.post('/createMonHoc', homeController.createMonHoc);
    router.post('/updateMonHoc', homeController.updateMonHoc);
    router.get('/ChuongTrinhHuanLuyen/:id_monHoc', homeController.getdsBaiHoc);
    router.post('/createBaiHoc/:id_monHoc', homeController.createBaiHoc);
    router.post('/updateBaiHoc/:id_monHoc', homeController.updateBaiHoc);

    // router.get('/KHHLTrungDoan', homeController.getKHHLTrungDoan);
    router.get('/KHHLTrungDoan/:id_DV', homeController.getKHHLTrungDoan);
    router.post('/createKHHLTrungDoan/:id_DV', homeController.createKHHLTrungDoan);
    router.post('/updateKHHLTrungDoan/:id_DV', homeController.updateKHHLTrungDoan);
    router.get('/KHHLTieuDoan/:id_DV', homeController.getKHHLTieuDoan);
    router.post('/createKHHLTieuDoan/:id_DV', homeController.createKHHLTieuDoan);
    router.post('/updateKHHLTieuDoan/:id_DV', homeController.updateKHHLTieuDoan);
    router.get('/KHHLCapTren/:id_DV', homeController.getKHHLCapTren);
    router.get('/KHHLdsCapDuoi/:id_DV', homeController.getKHHLdsCapDuoi);
    router.get('/KHHLDaiDoi/:id_DV', homeController.getKHHLDaiDoi);
    router.post('/createKHHLDaiDoi/:id_DV', homeController.createKHHLDaiDoi);
    router.post('/updateKHHLDaiDoi/:id_DV', homeController.updateKHHLDaiDoi);

    // router.get('/KHHLTrungDoan', homeController.getdsDaiDoi);
    // quyền 4
    router.get('/KetQuaHuanLuyen', homeController.getKQHL);
    router.get('/DonVi/:id_monHoc', homeController.getdsDonVitheoMonHoc);
    router.get('/NhapDiem/:id_monHoc/:id_DV', homeController.getNhapDiem);
    router.post('/nhapDiemKQHL/:id_monHoc/:id_DV', homeController.nhapDiemKQHL);
    router.get('/KQHL_dsBuoiHoc/:id_monHoc/:id_DV', homeController.getdsBuoiHoc);
    router.get('/DiemDanh/:id_KHHL/:id_DV', homeController.getdsDiemDanh);
    router.post('/DiemDanh/:id_KHHL/:id_DV', homeController.DiemDanh);


    router.get('/QuanLyTaiKhoan', homeController.getQuanLyTaiKhoan);
    router.post('/createTaiKhoan', homeController.createTaiKhoan);
    router.post('/updateTaiKhoan', homeController.updateTaiKhoan);
    router.post('/deleteTaiKhoan', homeController.deleteTaiKhoan);



    return app.use('/', router)
}

export default initWebRoute;
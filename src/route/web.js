import express from 'express';
import homeController from '../controller/homeController';

let router = express.Router();

const initWebRoute = (app) => {
    router.get('/login', homeController.getLogin);
    router.post('/login', homeController.login);
    //quyền nào cũng dc
    router.get('/', homeController.getHomepage);
    //quyền 2
    router.get('/trungdoan/:id_DV', homeController.getDetailTrungDoan);
    router.post('/create-d-thuoc-e', homeController.createDthuocE);
    router.post('/updateDVCoBand', homeController.updateDVCoBand);
    router.post('/deleteDVTT-d', homeController.deleteDVTTd);

    router.get('/trungdoan/tieudoan/:id_DV', homeController.getDetailTieuDoan);
    router.post('/create-c-thuoc-d', homeController.createCthuocD);
    router.post('/updateDVCoBanc', homeController.updateDVCoBanc);
    router.post('/deleteDVTT-c', homeController.deleteDVTTc);

    router.get('/dsDonVi', homeController.getdsDV);
    router.post('/deleteDonVi', homeController.deleteDV);
    router.post('/createDV', homeController.createDV);
    router.post('/updateDV', homeController.updateDV);
    router.get('/dsCanBo/:id_DV', homeController.getdsCB);
    router.post('/createCB/:id_DV', homeController.createCB);
    router.post('/updateCB/:id_DV', homeController.updateCB);
    router.post('/deleteCanBo', homeController.deleteCanBo);

    router.get('/QLHVtheoKhoaHoc', homeController.getdsKhoaHoc);
    router.post('/createKhoaHoc', homeController.createKhoaHoc);
    router.post('/updateKhoaHoc', homeController.updateKhoaHoc);
    router.post('/deleteKhoaHoc', homeController.deleteKhoaHoc);
    router.get('/dsHVtheoKhoaHoc/:idKhoaHoc', homeController.getdsHVtheoKhoaHoc);
    router.post('/createHVtheoKhoaHoc/:idKhoaHoc', homeController.createHVtheoKhoaHoc);
    router.post('/updateHVtheoKhoaHoc/:idKhoaHoc', homeController.updateHVtheoKhoaHoc);

    router.get('/QLHVtheoDonVi', homeController.getdsDaiDoi);
    router.get('/dsHVtheoDonVi/:id_DV', homeController.getdsHVtheoDonVi);
    router.post('/createHVtheoDonVi/:id_DV', homeController.createHVtheoDonVi);
    router.post('/updateHVtheoDonVi/:id_DV', homeController.updateHVtheoDonVi);
    router.post('/deleteHVtheoDonVi', homeController.deleteHVtheoDonVi);

    //quyền 3
    router.get('/QLTTB', homeController.getdsTrungDoan);
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
    router.get('/ChuongTrinhHuanLuyen/:id_monHoc/:id_baiHoc', homeController.getdsNDBH);
    router.post('/createNDBH/:id_monHoc/:id_baiHoc', homeController.createNDBH);
    router.post('/updateNDBH/:id_monHoc/:id_baiHoc', homeController.updateNDBH);

    // router.get('/KHHLTrungDoan', homeController.getKHHLTrungDoan);
    router.get('/KHHLTrungDoan', homeController.getKHHLdsTrungDoan);
    router.get('/KHHLTrungDoan/:id_DV', homeController.getKHHLTrungDoan)

    // router.get('/KHHLTrungDoan', homeController.getdsDaiDoi);
    // quyền 4
    router.get('/KetQuaHuanLuyen', homeController.getKQHL);
    router.get('/DonVi/:id_monHoc', homeController.getdsDonVitheoMonHoc);
    router.get('/NhapDiem/:id_monHoc/:id_DV', homeController.getNhapDiem);
    router.post('/nhapDiemKQHL/:id_monHoc/:id_DV', homeController.nhapDiemKQHL);




    return app.use('/', router)
}

export default initWebRoute;
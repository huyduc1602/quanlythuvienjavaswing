/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkapt.com.ui;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;
import net.sf.jasperreports.engine.JRException;
import bkapt.com.dao.PhieuMuonDAO;
import bkapt.com.dao.SachDAO;
import bkapt.com.dao.SachPhieuMuonDao;
import bkapt.com.model.PhieuMuon;
import bkapt.com.model.Sach;
import bkapt.com.model.SachPhieuMuon;
import java.util.List;
import javax.swing.DefaultListModel;


/**
 *
 * @author PC
 */
public class QuanLyPhieuMuon extends javax.swing.JInternalFrame {

    private ArrayList<PhieuMuon> lists;
    private ArrayList<Sach> listMaSach;
    private List<Sach> listSach;
    DefaultListModel listDSsach;
    DefaultListModel modelList;
    private SachDAO sdao;
    private PhieuMuonDAO pmdao;
    int current;
    int addBookSuccess;
    public QuanLyPhieuMuon() {
        pmdao = new PhieuMuonDAO();
        sdao = new SachDAO();
        initComponents();
        load();
        loadSach();
        setStatus(true);
        
    }
    public void load(){
        txtSoLuong.setEditable(false);
        txtSoLuong.setEnabled(false);
        btnThemSach.setEnabled(false);
        lists = pmdao.load();
            DefaultTableModel model = (DefaultTableModel) tblBangPhieuMuon.getModel();
            model.setRowCount(0);
            model.setRowCount(0);
            for(PhieuMuon pm: lists){
                Object[] row = new Object[]{
                    pm.getMaPhieuMuon(),
                    pm.getMaSV(),
                    pm.getNgayMuon(),
                    pm.getNgayHenTra()
                };
                model.addRow(row);
            }
         
    }
     public void loadSach(){
        listDSsach = new DefaultListModel<>();
        modelList = new DefaultListModel();
        lists = pmdao.load();
        PhieuMuon pm = lists.get(current);
        SachPhieuMuonDao spmdao = new SachPhieuMuonDao();
        List<SachPhieuMuon> data = spmdao.findId(pm.getMaPhieuMuon());
        List<Sach> sachs = new ArrayList<>();
        for (SachPhieuMuon spm : data) {
             Sach s = sdao.findId(spm.getMaPhieuMuon());
             sachs.add(s);
//             listMaSach.add(s);
        }
        listSach = sdao.load();
         for (Sach sach : listSach) {
             listDSsach.addElement(sach.getTenSach());
             
         }
       listSachCon.setModel(listDSsach);
    }
    public void insert(){
        PhieuMuon pm =  new PhieuMuon();       
        pm.setMaPhieuMuon(txtMaPhieuMuon.getText());
        pm.setMaSV(txtMaSV.getText());
         for (int i = 0; i < modelList.getSize(); i++) {
            Object item = modelList.getElementAt(i);
            System.out.println("Item = " + item);
        }
        Date date = jDateChooser1.getDate();
        String ngayMuon = new SimpleDateFormat("yyyy-MM-dd").format(date);
        Date date1 = jDateChooser2.getDate(); 
        String ngayTra = new SimpleDateFormat("yyyy-MM-dd").format(date);
        pm.setNgayMuon(ngayMuon);
        pm.setNgayHenTra(ngayTra);
        PhieuMuonDAO pmdao =new PhieuMuonDAO() ;
        SachDAO sdao = new SachDAO();
        SachPhieuMuonDao spmdao = new SachPhieuMuonDao();
        if(pmdao.insert(pm)>0 && modelList.getSize()>0){
             //Duyệt sách
             addBookSuccess = 0;
             for (int i = 0; i < modelList.getSize(); i++) {
                 Sach s = sdao.findName(modelList.getElementAt(i).toString());
                     if (spmdao.insert(pm.getMaPhieuMuon(),s.getMaSach())>0 )
                     {    
                       addBookSuccess++;                     
                     }  
            }
             if(addBookSuccess == modelList.size()){
                 JOptionPane.showMessageDialog(null, "Thêm Phiếu Mượn thành công");
             }else{
              JOptionPane.showMessageDialog(null, "Vui lòng nhập đúng thông tin trong Phiếu Mượn");
             }    
        }
        
    }
        public void update(){
        PhieuMuon pm =  new PhieuMuon();
        pm.setMaPhieuMuon(txtMaPhieuMuon.getText());
        pm.setMaSV(txtMaSV.getText());
        Date date = jDateChooser1.getDate();
        String df = new SimpleDateFormat("yyyy-MM-dd").format(date);
        Date date1 = jDateChooser2.getDate(); 
        String dff = new SimpleDateFormat("yyyy-MM-dd").format(date);
        pm.setNgayMuon(df);
        pm.setNgayHenTra(dff);
        PhieuMuonDAO pmdao = new PhieuMuonDAO() ;
        SachPhieuMuonDao spmdao = new SachPhieuMuonDao();
       if(pmdao.update(pm)>0 && modelList.getSize()>0){
             //Duyệt sách
             spmdao.delete(pm.getMaPhieuMuon());
             addBookSuccess = 0;
             for (int i = 0; i < modelList.getSize(); i++) {
                 Sach s = sdao.findName(modelList.getElementAt(i).toString());
                     if (spmdao.insert(pm.getMaPhieuMuon(),s.getMaSach())>0 )
                     {    
                       addBookSuccess++;                     
                     }  
            }
             if(addBookSuccess == modelList.size()){
                 JOptionPane.showMessageDialog(null, "Cập nhật thành công");
             }else{
              JOptionPane.showMessageDialog(null, "Vui lòng nhập đúng thông tin trong Phiếu Mượn");
             }    
        }
       
    }
    public void delete(){
        int index = tblBangPhieuMuon.getSelectedRow();
        if (index == -1) {
            JOptionPane.showMessageDialog(this, "Vui lòng chọn 1 Phiếu Mượn trong bảng để xóa", "Thông Báo", 1);
            return;
        }
        PhieuMuonDAO pmdao = new PhieuMuonDAO();
        
        int tk = JOptionPane.showConfirmDialog(this, "Bạn có muốn xóa không");
      if (tk==JOptionPane.YES_OPTION)  
      {
        if (pmdao.delete(txtMaPhieuMuon.getText()))
        {
            JOptionPane.showMessageDialog(this, "Xóa Phiếu Mượn thành công", "Thông Báo", 1);
            
        } else {
            JOptionPane.showMessageDialog(this, "Lỗi hệ thống", "Thông Báo", 0);
        }
        
      }
      else
      {
          return;
          
      }
    }
    public void loadMaSV(){
        PhieuMuonDAO pmdao = new PhieuMuonDAO();
        lists = pmdao.SearchMaSVMaPhieu(txtSearch.getText());
            DefaultTableModel model = (DefaultTableModel) tblBangPhieuMuon.getModel();
            model.setRowCount(0);
            for(PhieuMuon pm: lists){
                Object[] row = new Object[]{
                    pm.getMaPhieuMuon(),pm.getMaSV(),pm.getNgayMuon(),pm.getNgayHenTra()
                };
                model.addRow(row);
            }
    }
    public void searchSach(){
        SachDAO sdao = new SachDAO();
        listSach = sdao.SearchTenSachMTL(txtSearchBook.getText());
        listDSsach.clear();
            for (Sach sach : listSach) {
             listDSsach.addElement(sach.getTenSach());
         }
       listSachCon.setModel(listDSsach);
    }

    public void display(int current){
        lists = pmdao.load();
        PhieuMuon pm = lists.get(current);
        txtMaPhieuMuon.setText(pm.getMaPhieuMuon());
        txtMaSV.setText(pm.getMaSV());
        modelList = new DefaultListModel();
        SachPhieuMuonDao spmdao = new SachPhieuMuonDao();
        List<SachPhieuMuon> data = spmdao.findId(txtMaPhieuMuon.getText());
        List<Sach> sachs  = new ArrayList<>();
//        JOptionPane.showMessagesachsDialog(this, "size : "+sachs.size());
        for (SachPhieuMuon spm : data) {
             Sach s = sdao.findId(spm.getMaSach());
             modelList.addElement(s);
             sachs.add(s);
        }
        for (int i = 0; i < modelList.getSize(); i++) {
            System.out.println(modelList.getElementAt(i));
        }
        listBookItem.setModel(modelList);
        txtSoLuong.setText(String.valueOf(modelList.getSize()));
        try {
            DefaultTableModel model = (DefaultTableModel) tblBangPhieuMuon.getModel();
            Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse((String)model.getValueAt(current, 2));
            jDateChooser1.setDate(date1);
            Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse((String)model.getValueAt(current, 3));
            jDateChooser2.setDate(date2);
        } catch (ParseException ex) {   
        }
    }
    public void clear(){
        txtMaPhieuMuon.setText("");
        txtMaSV.setText("");
        modelList.removeAllElements();
        txtSoLuong.setText("");
        lblMaSV1.setText("");
        lblMaSach1.setText("");
        lblSoLuong1.setText("");
        setStatus(true);
    }
    public void setStatus(boolean insertable){
    btnThem.setEnabled(insertable);
    btnSua.setEnabled(!insertable);
    btnXoa.setEnabled(!insertable);
    txtMaPhieuMuon.setEnabled(insertable);
    }
    public void inphieumuon(){
        PhieuMuonDAO pmdao = new PhieuMuonDAO();
        pmdao.inphieumuon(txtMaPhieuMuon.getText());
    }
    public void indsphieumuon() throws JRException{
        PhieuMuonDAO pmdao = new PhieuMuonDAO();
        pmdao.indsphieumuon();
    }
    public boolean valiform() {
        if (txtMaPhieuMuon.getText().equals("")){
            lblMaPhieuMuon.setText("Chưa nhập Mã Phiếu Mượn");
            txtMaPhieuMuon.requestFocus();
            return false;
        }else if (txtMaSV.getText().equals("")) {
            lblMaSV1.setText("Chưa nhập Mã Sinh Viên");
            txtMaSV.requestFocus();
            return false;
        }else if (modelList.getSize() <= 0) {
            lblMaSach1.setText("Chưa chọn Sách");
//            txtMaSach.requestFocus();
            return false;
        }else 
        return true;
    };
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        buttonGroup1 = new javax.swing.ButtonGroup();
        jPanel3 = new javax.swing.JPanel();
        jPanel1 = new javax.swing.JPanel();
        txtMaPhieuMuon = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        txtSoLuong = new javax.swing.JTextField();
        txtMaSV = new javax.swing.JTextField();
        jDateChooser1 = new com.toedter.calendar.JDateChooser();
        jDateChooser2 = new com.toedter.calendar.JDateChooser();
        lblSoLuong1 = new javax.swing.JLabel();
        lblMaSV1 = new javax.swing.JLabel();
        lblMaSach1 = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        listBookItem = new javax.swing.JList<>();
        jButton1 = new javax.swing.JButton();
        lblMaPhieuMuon = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jPanel2 = new javax.swing.JPanel();
        jLabel3 = new javax.swing.JLabel();
        txtSearch = new javax.swing.JTextField();
        btnPrintPM = new javax.swing.JButton();
        btnPrintDS = new javax.swing.JButton();
        jScrollPane4 = new javax.swing.JScrollPane();
        tblBangPhieuMuon = new javax.swing.JTable();
        jPanel4 = new javax.swing.JPanel();
        jScrollPane3 = new javax.swing.JScrollPane();
        listSachCon = new javax.swing.JList<>();
        btnTaoMoi = new javax.swing.JButton();
        btnThem = new javax.swing.JButton();
        btnSua = new javax.swing.JButton();
        btnXoa = new javax.swing.JButton();
        btnPrint = new javax.swing.JButton();
        jLabel4 = new javax.swing.JLabel();
        btnThemSach = new javax.swing.JButton();
        txtSearchBook = new javax.swing.JTextField();

        setBackground(new java.awt.Color(28, 56, 86));
        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setMinimumSize(new java.awt.Dimension(1200, 650));
        setPreferredSize(new java.awt.Dimension(1154, 754));

        jPanel3.setBackground(new java.awt.Color(28, 56, 86));
        jPanel3.setMinimumSize(new java.awt.Dimension(1000, 650));
        jPanel3.setPreferredSize(new java.awt.Dimension(1000, 650));

        jPanel1.setBackground(new java.awt.Color(209, 202, 202));
        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Thông Tin", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Times New Roman", 1, 14))); // NOI18N

        jLabel1.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        jLabel1.setText("Mã Phiếu Mượn:");

        jLabel5.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        jLabel5.setText("Mã Sinh Viên:");

        jLabel6.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        jLabel6.setText(" Sách:");

        jLabel7.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        jLabel7.setText("Số Lượng:");

        jLabel8.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        jLabel8.setText("Ngày Mượn: ");

        jLabel9.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        jLabel9.setText("Ngày Trả:");

        txtSoLuong.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txtSoLuongKeyReleased(evt);
            }
        });

        txtMaSV.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txtMaSVKeyReleased(evt);
            }
        });

        jDateChooser1.setDateFormatString("dd-MM-yyyy");

        jDateChooser2.setDateFormatString("dd-MM-yyyy");

        lblSoLuong1.setForeground(new java.awt.Color(255, 0, 0));

        lblMaSV1.setForeground(new java.awt.Color(255, 0, 0));

        lblMaSach1.setForeground(new java.awt.Color(255, 0, 0));

        listBookItem.addListSelectionListener(new javax.swing.event.ListSelectionListener() {
            public void valueChanged(javax.swing.event.ListSelectionEvent evt) {
                listBookItemValueChanged(evt);
            }
        });
        jScrollPane2.setViewportView(listBookItem);

        jButton1.setText("Xóa");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        lblMaPhieuMuon.setForeground(new java.awt.Color(255, 0, 0));

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(20, 20, 20)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jLabel6)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel1)
                            .addComponent(jLabel5))
                        .addGap(40, 40, 40)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(txtMaPhieuMuon, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txtMaSV, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(lblMaSV1, javax.swing.GroupLayout.PREFERRED_SIZE, 151, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel8)
                            .addComponent(jLabel9)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(5, 5, 5)
                                .addComponent(jLabel7)))
                        .addGap(59, 59, 59)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                                .addComponent(jDateChooser1, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, 150, Short.MAX_VALUE)
                                .addComponent(lblSoLuong1, javax.swing.GroupLayout.Alignment.LEADING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(jDateChooser2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                            .addComponent(txtSoLuong, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(jButton1))
                            .addComponent(lblMaSach1, javax.swing.GroupLayout.PREFERRED_SIZE, 150, javax.swing.GroupLayout.PREFERRED_SIZE)))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                        .addComponent(lblMaPhieuMuon, javax.swing.GroupLayout.PREFERRED_SIZE, 151, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(56, 56, 56)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                .addGap(32, 32, 32)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel1)
                    .addComponent(txtMaPhieuMuon, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(1, 1, 1)
                .addComponent(lblMaPhieuMuon, javax.swing.GroupLayout.PREFERRED_SIZE, 15, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(2, 2, 2)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(txtMaSV, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(3, 3, 3)
                .addComponent(lblMaSV1, javax.swing.GroupLayout.PREFERRED_SIZE, 15, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(18, 18, 18)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jLabel6)
                            .addComponent(jScrollPane2, javax.swing.GroupLayout.PREFERRED_SIZE, 125, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(lblMaSach1, javax.swing.GroupLayout.PREFERRED_SIZE, 15, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 11, Short.MAX_VALUE)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel1Layout.createSequentialGroup()
                                .addComponent(jLabel7)
                                .addGap(0, 0, Short.MAX_VALUE))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout.createSequentialGroup()
                                .addComponent(txtSoLuong, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(lblSoLuong1, javax.swing.GroupLayout.PREFERRED_SIZE, 18, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jDateChooser1, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel8))
                        .addGap(18, 18, 18)
                        .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jDateChooser2, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel9)))
                    .addGroup(jPanel1Layout.createSequentialGroup()
                        .addComponent(jButton1)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );

        jLabel2.setFont(new java.awt.Font("Times New Roman", 1, 36)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(255, 255, 255));
        jLabel2.setText("Quản Lý Phiếu Mượn");

        jPanel2.setBackground(new java.awt.Color(209, 202, 202));
        jPanel2.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Tìm kiếm theo mã SV, mã Sách", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Times New Roman", 1, 14))); // NOI18N

        jLabel3.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/bkapt/com/icon/Search.png"))); // NOI18N

        txtSearch.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txtSearchKeyReleased(evt);
            }
        });

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 50, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addComponent(txtSearch, javax.swing.GroupLayout.DEFAULT_SIZE, 275, Short.MAX_VALUE)
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(txtSearch, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)))
        );

        btnPrintPM.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        btnPrintPM.setIcon(new javax.swing.ImageIcon(getClass().getResource("/bkapt/com/icon/Card file.png"))); // NOI18N
        btnPrintPM.setText("In PM");
        btnPrintPM.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnPrintPMActionPerformed(evt);
            }
        });

        btnPrintDS.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        btnPrintDS.setIcon(new javax.swing.ImageIcon(getClass().getResource("/bkapt/com/icon/Print.png"))); // NOI18N
        btnPrintDS.setText("In DS");
        btnPrintDS.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnPrintDSActionPerformed(evt);
            }
        });

        tblBangPhieuMuon.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Mã Phiếu Mượn", "Mã SV", "Ngày Mượn", "Ngày Hẹn Trả"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        tblBangPhieuMuon.setRowHeight(30);
        tblBangPhieuMuon.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblBangPhieuMuonMouseClicked(evt);
            }
        });
        jScrollPane4.setViewportView(tblBangPhieuMuon);

        jPanel4.setLayout(new java.awt.BorderLayout());

        listSachCon.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                listSachConMouseClicked(evt);
            }
        });
        jScrollPane3.setViewportView(listSachCon);

        btnTaoMoi.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        btnTaoMoi.setIcon(new javax.swing.ImageIcon(getClass().getResource("/bkapt/com/icon/Create.png"))); // NOI18N
        btnTaoMoi.setText("Tạo mới");
        btnTaoMoi.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnTaoMoiActionPerformed(evt);
            }
        });

        btnThem.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        btnThem.setIcon(new javax.swing.ImageIcon(getClass().getResource("/bkapt/com/icon/Save.png"))); // NOI18N
        btnThem.setText("Thêm");
        btnThem.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnThemActionPerformed(evt);
            }
        });

        btnSua.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        btnSua.setIcon(new javax.swing.ImageIcon(getClass().getResource("/bkapt/com/icon/Save as.png"))); // NOI18N
        btnSua.setText("Sửa");
        btnSua.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSuaActionPerformed(evt);
            }
        });

        btnXoa.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        btnXoa.setIcon(new javax.swing.ImageIcon(getClass().getResource("/bkapt/com/icon/Delete.png"))); // NOI18N
        btnXoa.setText("Xóa");
        btnXoa.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnXoaActionPerformed(evt);
            }
        });

        btnPrint.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        btnPrint.setIcon(new javax.swing.ImageIcon(getClass().getResource("/bkapt/com/icon/Print.png"))); // NOI18N
        btnPrint.setText("In DS Sách");
        btnPrint.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnPrintActionPerformed(evt);
            }
        });

        jLabel4.setForeground(new java.awt.Color(255, 255, 255));
        jLabel4.setText("DANH SÁCH TÊN SÁCH");

        btnThemSach.setFont(new java.awt.Font("Times New Roman", 1, 14)); // NOI18N
        btnThemSach.setIcon(new javax.swing.ImageIcon(getClass().getResource("/bkapt/com/icon/book-add-black.png"))); // NOI18N
        btnThemSach.setText("Mượn sách");
        btnThemSach.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnThemSachActionPerformed(evt);
            }
        });

        txtSearchBook.setToolTipText("Tìm sách");
        txtSearchBook.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                txtSearchBookKeyReleased(evt);
            }
        });

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(btnTaoMoi, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(106, 106, 106)
                        .addComponent(btnThem, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(98, 98, 98)
                        .addComponent(btnSua, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addGap(215, 215, 215)
                                .addComponent(jPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addGap(28, 28, 28)
                                .addComponent(btnXoa, javax.swing.GroupLayout.PREFERRED_SIZE, 120, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(36, 36, 36)
                                .addComponent(btnThemSach, javax.swing.GroupLayout.PREFERRED_SIZE, 144, javax.swing.GroupLayout.PREFERRED_SIZE))))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGap(271, 271, 271)
                        .addComponent(jLabel2))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGap(1021, 1021, 1021)
                        .addComponent(btnPrintPM, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(87, 87, 87)
                        .addComponent(btnPrintDS, javax.swing.GroupLayout.PREFERRED_SIZE, 100, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addGap(168, 168, 168)
                                .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addGap(101, 101, 101)
                                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jScrollPane4, javax.swing.GroupLayout.PREFERRED_SIZE, 612, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addGroup(jPanel3Layout.createSequentialGroup()
                                        .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 149, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGap(18, 18, 18)
                                        .addComponent(txtSearchBook, javax.swing.GroupLayout.PREFERRED_SIZE, 441, javax.swing.GroupLayout.PREFERRED_SIZE))
                                    .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                        .addComponent(btnPrint, javax.swing.GroupLayout.PREFERRED_SIZE, 161, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 608, javax.swing.GroupLayout.PREFERRED_SIZE)))))))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING, false)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addContainerGap()
                        .addComponent(jLabel2)
                        .addGap(43, 43, 43)
                        .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addGap(51, 51, 51))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGap(70, 70, 70)
                        .addComponent(jPanel2, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jScrollPane4, javax.swing.GroupLayout.PREFERRED_SIZE, 178, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(txtSearchBook, javax.swing.GroupLayout.PREFERRED_SIZE, 30, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jScrollPane3)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(btnTaoMoi, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(btnThem, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(btnSua, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(btnXoa, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(btnThemSach, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(btnPrint, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jPanel4, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)))
                .addGap(168, 168, 168)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnPrintPM, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnPrintDS, javax.swing.GroupLayout.PREFERRED_SIZE, 40, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        jPanel2.getAccessibleContext().setAccessibleName("Tìm kiếm theo mã SV, mã phiếu mượn");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel3, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, 1138, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, 724, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnPrintPMActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnPrintPMActionPerformed
        int index = tblBangPhieuMuon.getSelectedRow();
        if (index == -1) {
            JOptionPane.showMessageDialog(this, "Vui lòng chọn 1 Phiếu Mượn trong bảng để In", "Thông Báo", 1);
            return;
        }
        else{
        inphieumuon();
        }
        
    }//GEN-LAST:event_btnPrintPMActionPerformed

    private void btnPrintDSActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnPrintDSActionPerformed
        try {
            indsphieumuon();
        } catch (JRException ex) {
            Logger.getLogger(QuanLyPhieuMuon.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_btnPrintDSActionPerformed

    private void txtSearchKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtSearchKeyReleased
        loadMaSV();
    }//GEN-LAST:event_txtSearchKeyReleased

    private void txtMaSVKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtMaSVKeyReleased
        if(!txtMaSV.getText().equals("")){
            lblMaSV1.setText(null);
        }
    }//GEN-LAST:event_txtMaSVKeyReleased

    private void txtSoLuongKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtSoLuongKeyReleased
        if(!txtSoLuong.getText().equals("")){
            lblSoLuong1.setText(null);
        }
    }//GEN-LAST:event_txtSoLuongKeyReleased

    private void tblBangPhieuMuonMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tblBangPhieuMuonMouseClicked
        // TODO add your handling code here: 
        loadSach();
        current = tblBangPhieuMuon.getSelectedRow();
        if (current>=0) {
           display(current);
        }
        setStatus(false);
    }//GEN-LAST:event_tblBangPhieuMuonMouseClicked

    private void btnTaoMoiActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnTaoMoiActionPerformed
        clear();
        loadSach();
    }//GEN-LAST:event_btnTaoMoiActionPerformed

    private void btnThemActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnThemActionPerformed
        if(valiform()==true){
            insert();
            load();
        }
    }//GEN-LAST:event_btnThemActionPerformed

    private void btnSuaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSuaActionPerformed
        if(valiform()==true){
            update();
            load();
        }
    }//GEN-LAST:event_btnSuaActionPerformed

    private void btnXoaActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnXoaActionPerformed
        delete();
        clear();
        load();
    }//GEN-LAST:event_btnXoaActionPerformed

    private void btnPrintActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnPrintActionPerformed
        try {
            indsphieumuon();
        } catch (JRException ex) {
            Logger.getLogger(QuanLyPhieuMuon.class.getName()).log(Level.SEVERE, null, ex);
        }
    }//GEN-LAST:event_btnPrintActionPerformed

    private void btnThemSachActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnThemSachActionPerformed
        // TODO add your handling code here:
       
        int selected[] = listSachCon.getSelectedIndices(); // Lấy về các item được chọn
        for (int i = 0; i < selected.length; i++) {
            String valueRemove = (String) listDSsach.getElementAt(selected[i]);
            modelList.addElement(valueRemove);
            listBookItem.setModel(modelList);
            txtSoLuong.setText(String.valueOf(modelList.getSize()));
        }
//        Sach s = sdao.findId(listSachCon.getSelectedValue().getMaSach());
//        modelList.addElement(s.getTenSach());
//        JOptionPane.showMessageDialog(this, s.getTenSach());
//        modelList.addElement(value); // Thêm và List bên trái
//        listDSsach.remove(listSachCon.getSelectedIndex()); // Xóa item List bên phải
    }//GEN-LAST:event_btnThemSachActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
         int index = listBookItem.getSelectedIndex();
            if(index >= 0){ //Remove only if a particular item is selected
                modelList.removeElementAt(index);
            }
    }//GEN-LAST:event_jButton1ActionPerformed

    private void listBookItemValueChanged(javax.swing.event.ListSelectionEvent evt) {//GEN-FIRST:event_listBookItemValueChanged
        // TODO add your handling code here:
        txtSoLuong.setText(String.valueOf(modelList.getSize()));
    }//GEN-LAST:event_listBookItemValueChanged

    private void txtSearchBookKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_txtSearchBookKeyReleased
        // TODO add your handling code here:
        searchSach();
    }//GEN-LAST:event_txtSearchBookKeyReleased

    private void listSachConMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_listSachConMouseClicked
        // TODO add your handling code here:
        btnThemSach.setEnabled(true);
    }//GEN-LAST:event_listSachConMouseClicked
    
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(QuanLyPhieuMuon.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(QuanLyPhieuMuon.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(QuanLyPhieuMuon.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(QuanLyPhieuMuon.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new QuanLyPhieuMuon().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnPrint;
    private javax.swing.JButton btnPrintDS;
    private javax.swing.JButton btnPrintPM;
    private javax.swing.JButton btnSua;
    private javax.swing.JButton btnTaoMoi;
    private javax.swing.JButton btnThem;
    private javax.swing.JButton btnThemSach;
    private javax.swing.JButton btnXoa;
    private javax.swing.ButtonGroup buttonGroup1;
    private javax.swing.JButton jButton1;
    private com.toedter.calendar.JDateChooser jDateChooser1;
    private com.toedter.calendar.JDateChooser jDateChooser2;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JScrollPane jScrollPane4;
    private javax.swing.JLabel lblMaPhieuMuon;
    private javax.swing.JLabel lblMaSV1;
    private javax.swing.JLabel lblMaSach1;
    private javax.swing.JLabel lblSoLuong1;
    private javax.swing.JList<Sach> listBookItem;
    private javax.swing.JList<Sach> listSachCon;
    private javax.swing.JTable tblBangPhieuMuon;
    private javax.swing.JTextField txtMaPhieuMuon;
    private javax.swing.JTextField txtMaSV;
    private javax.swing.JTextField txtSearch;
    private javax.swing.JTextField txtSearchBook;
    private javax.swing.JTextField txtSoLuong;
    // End of variables declaration//GEN-END:variables
}

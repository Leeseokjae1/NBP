//package com.study.nbnb;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import com.study.nbnb.dao.B1Dao;
//import com.study.nbnb.dto.B1Dto;
//
//@Service
//public class AdminController {
//
//    @Autowired
//    private B1Dao b1dao;
//  
// // 전체 게시글 조회
//    @GetMapping("/adminbd")
//    public String adB1post(Model model) {
//    	System.out.println("212213123");
//        List<B1Dto> b1Posts = b1dao.adB1post();
//        model.addAttribute("b1Posts", b1Posts);
//        return "adminboard/adminbd";
//    }
//
//    // 게시글 삭제
//    @RequestMapping(value = "/admin/delete/{b1_number}", method = RequestMethod.GET)
//    public String deleteB1Post(@PathVariable int b1_number) {
//        b1dao.addeleteB1(b1_number);
//        return "redirect:/admin";
//    }
//}

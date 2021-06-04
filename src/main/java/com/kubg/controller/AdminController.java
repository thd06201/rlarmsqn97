package com.kubg.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kubg.domain.CategoryVO;
import com.kubg.domain.CuGoodsVO;
import com.kubg.domain.GoodsVO;
import com.kubg.domain.GoodsViewVO;
import com.kubg.domain.MemberVO;
import com.kubg.service.AdminService;
import com.kubg.utils.UploadFileUtils;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Inject
	AdminService adminService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	//관리자 화면 
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void getIndex() throws Exception {
	 	
	}
	
	//관리자 화면 
		@RequestMapping(value = "/index2", method = RequestMethod.GET)
		public void getIndex2() throws Exception {
		 	
		}
	
	// 상품 등록
	@RequestMapping(value = "/goods/register", method = RequestMethod.GET)
	public void getGoodsRegister(Model model) throws Exception {
	 
	 List<CategoryVO> category = null;
	 category = adminService.category();
	 model.addAttribute("category", JSONArray.fromObject(category));
	
	}
	 //상품 등록
	 @RequestMapping(value = "/goods/register", method = RequestMethod.POST)
	 public String postGoodsRegister(GoodsVO vo, MultipartFile file) throws Exception {

		 String imgUploadPath = uploadPath + File.separator + "imgUpload";
		 String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		 String fileName = null;

		 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		  fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		
		 } else {
		  fileName = "none.png";
		 }

		 vo.setGdsImg(fileName);
		 vo.setGdsThumbImg("s_" + fileName);
		 
		 adminService.register(vo);
		
		return "redirect:/admin/index";
	}
	 
	 	// 상품 등록2
		@RequestMapping(value = "/goods/register2", method = RequestMethod.GET)
		public void getGoodsRegister2() throws Exception {
		
		}
		 //상품 등록2
		 @RequestMapping(value = "/goods/register2", method = RequestMethod.POST)
		 public String postGoodsRegister2(CuGoodsVO vo, MultipartFile file) throws Exception {

			 String imgUploadPath = uploadPath + File.separator + "imgUpload";
			 String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			 String fileName = null;

			 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			  fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
			
			 } else {
			  fileName = "none.png";
			 }

			 vo.setCuImg(fileName);
			 vo.setCuThumbImg("s_" + fileName);
			 
			 adminService.register2(vo);
			
			return "redirect:/admin/index";
		} 
	 
	 
	 
	 
	// ck 에디터에서 파일 업로드
	 @RequestMapping(value = "/goods/ckUpload", method = RequestMethod.POST)
	 public void postCKEditorImgUpload(HttpServletRequest req,
	           HttpServletResponse res,
	           @RequestParam MultipartFile upload) throws Exception {
	  
	  // 랜덤 문자 생성
	  UUID uid = UUID.randomUUID();
	  
	  OutputStream out = null;
	  PrintWriter printWriter = null;
	    
	  // 인코딩
	  res.setCharacterEncoding("utf-8");
	  res.setContentType("text/html;charset=utf-8");
	  
	  try {
	   
	   String fileName = upload.getOriginalFilename();  // 파일 이름 가져오기
	   byte[] bytes = upload.getBytes();
	   
	   // 업로드 경로
	   String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
	   
	   out = new FileOutputStream(new File(ckUploadPath));
	   out.write(bytes);
	   out.flush();  // out에 저장된 데이터를 전송하고 초기화
	   
	   String callback = req.getParameter("CKEditorFuncNum");
	   printWriter = res.getWriter();
	   String fileUrl = "/ckUpload/" + uid + "_" + fileName;  // 작성화면
	   
	   // 업로드시 메시지 출력
	   printWriter.println("<script type='text/javascript'>"
	      + "window.parent.CKEDITOR.tools.callFunction("
	      + callback+",'"+ fileUrl+"','이미지를 업로드하였습니다.')"
	      +"</script>");
	   
	   printWriter.flush();
	   
	  } catch (IOException e) { e.printStackTrace();
	  } finally {
	   try {
	    if(out != null) { out.close(); }
	    if(printWriter != null) { printWriter.close(); }
	   } catch(IOException e) { e.printStackTrace(); }
	  }
	  
	  return; 
	 }
	 
	
	
	 
	 
	 
	 //상품 목록
	 @RequestMapping(value= "/goods/list", method = RequestMethod.GET)
	 public void getGoodsList(Model model) throws Exception {
		 
		 List<GoodsViewVO> list = adminService.goodslist();
		 
		 model.addAttribute("list", list);
		 
	 }
	 
	// 상품 조회
	 @RequestMapping(value = "/goods/view", method = RequestMethod.GET)
	 public void getGoodsview(@RequestParam("n") int gdsNum, Model model) throws Exception {
	  
	  GoodsViewVO goods = adminService.goodsView(gdsNum);
	  
	  model.addAttribute("goods", goods);
	 }
	 
	 //상품 수정
	 @RequestMapping(value = "/goods/modify", method = RequestMethod.GET)
	 public void getGoodsModify(@RequestParam("n") int gdsNum, Model model) throws Exception {
	  
	  GoodsViewVO goods = adminService.goodsView(gdsNum);
	  model.addAttribute("goods",goods);

	  List<CategoryVO> category = null;
	  category = adminService.category();
	  model.addAttribute("category", JSONArray.fromObject(category));
	  
	 }
	 
	// 상품 수정
	 @RequestMapping(value = "/goods/modify", method = RequestMethod.POST)
	 public String postGoodsModify(GoodsVO vo, MultipartFile file, HttpServletRequest req) throws Exception {

	  // 새로운 파일이 등록되었는지 확인
	  if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
	   // 기존 파일을 삭제
	   new File(uploadPath + req.getParameter("gdsImg")).delete();
	   new File(uploadPath + req.getParameter("gdsThumbImg")).delete();
	   
	   // 새로 첨부한 파일을 등록
	   String imgUploadPath = uploadPath + File.separator + "imgUpload";
	   String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
	   String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
	   
	   vo.setGdsImg(fileName);
	   vo.setGdsThumbImg("s_" + fileName);
	   
	  } else {  // 새로운 파일이 등록되지 않았다면
	   // 기존 이미지를 그대로 사용
	   vo.setGdsImg(req.getParameter("gdsImg"));
	   vo.setGdsThumbImg(req.getParameter("gdsThumbImg"));
	   
	  }
	  
	  adminService.goodsModify(vo);
	  
	  return "redirect:/admin/index";
	 }
	 
	// 상품 삭제
	 @RequestMapping(value = "/goods/delete", method = RequestMethod.POST)
	 public String postGoodsDelete(@RequestParam("n") int gdsNum) throws Exception {

	  adminService.goodsDelete(gdsNum);
	  
	  return "redirect:/admin/index";
	 }
	 
	 //회원 목록
	 @RequestMapping(value = "/goods/member", method = RequestMethod.GET)
	 public void getGoodsMember(Model model) throws Exception {
		 
		 List<MemberVO> member = adminService.goodsmember();
		 
		 model.addAttribute("member",member);
		 
	 }
	
	
	 
}

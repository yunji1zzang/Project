package com.springapp.uglys.user.controller;

import java.io.File;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.springapp.uglys.user.service.UserService;
import com.springapp.uglys.user.vo.UserVO;
import com.springapp.uglys.utils.DeleteFileUtils;
import com.springapp.uglys.utils.UploadFileUtils;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/user/*")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Inject
	UserService service;

	// 파일 업로드
//	@Resource(name="uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage() throws Exception {
		return "login";
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		System.out.println("UserController.login");
		logger.info("login");
		HttpSession session = req.getSession();
		UserVO login = service.login(vo);
//		System.out.println("service.login(vo); :"+login.getUser_id());

		if (login == null) {
			session.setAttribute("user", null);
			rttr.addFlashAttribute("fail", false);
			return "redirect:/user/login";
		} else {
			session.setAttribute("user", login);
			System.out.println("로그인시 유저이름 : " + login.getUser_name());

			return "redirect:/";
//			UserVO vo2= (UserVO)session.getAttribute("user");
//			System.out.println("vo2.getUser_id() :"+vo2.getUser_id());
		}

	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		logger.info("logout");

		session.invalidate();
		return "redirect:/";
	}

	// 회원가입 get
	@RequestMapping(value = "/insertUser", method = RequestMethod.GET)
	public String getInsertUser() throws Exception {
		logger.info("get insert");
		return "join";

	}

	// 회원가입 post
	@RequestMapping(value = "/insertUser", method = RequestMethod.POST)
	public String postInsertUser(UserVO vo, HttpServletRequest req, RedirectAttributes rttr,
			HttpServletResponse response, MultipartFile file) throws Exception {
		logger.info("post insert");
		System.out.println("업로드할 파일이름 : " + file.getOriginalFilename());
		System.out.println("유저 아이디"+vo.getUser_id());

		// 아이디 중복체크
		// 아이디에 해당하는 정보를 불러옴
		int idChk = service.checkUser(vo.getUser_id());

		// 중복값이 있으면

		if (idChk == 1) {
			System.out.println("아이디 중복");
			rttr.addFlashAttribute("already", false);
			return "redirect:insertUser";
		}

		uploadPath = req.getSession().getServletContext().getRealPath("/resources");
		// 모바일 버전 변수
		String m_user_admin = req.getParameter("m_user_admin");
		String m_user_id = req.getParameter("m_user_id");
		String m_user_password = req.getParameter("m_user_password");
		String m_user_email = req.getParameter("m_user_email");
		String m_user_name = req.getParameter("m_user_name");
		String m_user_birth = req.getParameter("m_user_birth");
		String m_user_phone = req.getParameter("m_user_phone");
		String m_user_basic_address = req.getParameter("m_user_basic_address");
		String m_user_detail_address = req.getParameter("m_user_detail_address");
		String m_user_img = req.getParameter("m_user_img");
		System.out.println("모바일유저아이디" + m_user_id);
		if (!m_user_id.isEmpty()) {
			
			
			System.out.println("if (!m_user_admin.isEmpty())");
			

			int mIdChk = service.checkUser(m_user_id);
			if (mIdChk == 1) {
				System.out.println("모바일 아이디 중복");
				rttr.addFlashAttribute("already", false);
				return "redirect:insertUser";
			}

			vo.setUser_admin(m_user_admin);
			vo.setUser_id(m_user_id);
			vo.setUser_password(m_user_password);
			vo.setUser_email(m_user_email);
			vo.setUser_name(m_user_name);
			vo.setUser_birth(m_user_birth);
			vo.setUser_phone(m_user_phone);
			vo.setUser_basic_address(m_user_basic_address);
			vo.setUser_detail_address(m_user_detail_address);
			vo.setUser_img(m_user_img);
		}

		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		// 파일이 있다면
		if (!file.isEmpty()) {
			System.out.println("if (!file.isEmpty())");
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			vo.setUser_img(".." + File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			System.out.println("유저이미지 : " + vo.getUser_img());
		} else {
			vo.setUser_img("");
		}

		service.insertUser(vo);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('가입을 환영합니다.');</script>");
		out.flush();

		return "login";

	}

	// 회원 정보 뷰페이지
	@RequestMapping(value = "/userUpdateView", method = RequestMethod.GET)
	public String userUpdateView(HttpSession session, Model model, HttpServletResponse response) throws Exception {
		// 수정페이지로갈때 정보를 가지고 넘겨준다.
		if (session.getAttribute("user") == null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('먼저 로그인해 주세요');</script>");
			out.flush();

			return "login";
		}
		
		
		UserVO vo = (UserVO) session.getAttribute("user");
		System.out.println("vo.getUser_id() :" + vo.getUser_id());

		// 세션에 유저정보를 저장한다.
		UserVO user = (UserVO) service.selectUser(vo);
		model.addAttribute("user", user);
		System.out.println("user.getUser_id : " + user.getUser_id());
		System.out.println("user.getUser_name : " + user.getUser_name());
		System.out.println("user.getUser_email : " + user.getUser_email());
		System.out.println("user.getUser_birth : " + user.getUser_birth());
		System.out.println("user.getUser_admin : " + user.getUser_admin());
		System.out.println("user.getUser_detail_address : " + user.getUser_detail_address());
		return "myInfo";
	}

	// 수정 완료
	@RequestMapping(value = "/userUpdate", method = RequestMethod.POST)
	public String userUpdate(UserVO vo, HttpServletRequest req, RedirectAttributes rttr,
			HttpServletResponse response, MultipartFile file)
			throws Exception {
		
		uploadPath = req.getSession().getServletContext().getRealPath("/resources");
		System.out.println("업로드할 파일이름 : " + file.getOriginalFilename());
		System.out.println("업로드 패스 : " + uploadPath);
		logger.info("수정 처리 메서드");
		
		
		String m_user_admin = req.getParameter("m_user_admin");
		String m_user_id = req.getParameter("m_user_id");
		String m_user_password = req.getParameter("m_user_password");
		String m_user_email = req.getParameter("m_user_email");
		String m_user_name = req.getParameter("m_user_name");
		String m_user_birth = req.getParameter("m_user_birth");
		String m_user_phone = req.getParameter("m_user_phone");
		String m_user_basic_address = req.getParameter("m_user_basic_address");
		String m_user_detail_address = req.getParameter("m_user_detail_address");
		String m_user_img = req.getParameter("m_user_img");
		System.out.println("모바일유저아이디" + m_user_id);
		
		// 모바일인 경우
		/*
		 * if (!m_user_id.isEmpty()) {
		 * System.out.println("if (!m_user_admin.isEmpty())");
		 * 
		 * vo.setUser_admin(m_user_admin); vo.setUser_id(m_user_id);
		 * vo.setUser_password(m_user_password); vo.setUser_email(m_user_email);
		 * vo.setUser_name(m_user_name); vo.setUser_birth(m_user_birth);
		 * vo.setUser_phone(m_user_phone);
		 * vo.setUser_basic_address(m_user_basic_address);
		 * vo.setUser_detail_address(m_user_detail_address); vo.setUser_img(m_user_img);
		 * }
		 */

		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		// 파일이 있다면
		if (!file.isEmpty()) {
			System.out.println("if (!file.isEmpty())");
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			vo.setUser_img(".." + File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			System.out.println("유저이미지 : " + vo.getUser_img());
		} else {
			vo.setUser_img("");
		}
		service.updateUser(vo);

		return "redirect:/";
	}

	// 회원 탈퇴
    @RequestMapping(value="/userDelete", method = RequestMethod.GET)
    public void userDeleteView(HttpSession session, HttpServletResponse response) throws Exception{
        logger.info("get userDelete");
    }
	// 탈퇴 완료
	@RequestMapping(value = "/userDelete", method = RequestMethod.POST)
	public String userDelete(UserVO vo, HttpSession session, RedirectAttributes rttr, HttpServletRequest req)
			throws Exception {

		UserVO user = (UserVO) session.getAttribute("user");
		String sessionPassword = user.getUser_password();
		String voPassword = vo.getUser_password();

		if (!(sessionPassword.equals(voPassword))) {
			rttr.addFlashAttribute("fail", false);
			return "redirect:/user/userUpdateView";
		}

		// 파일 삭제
		DeleteFileUtils deleteFile = new DeleteFileUtils(); // 유저의 이미지 src를 받아온다.
		vo = service.selectUser(vo); // 파일 경로를 입력하면 해당 파일을 삭제한다.
		String filePath = req.getSession().getServletContext().getRealPath("/resources");
		//
		filePath += vo.getUser_img().substring(2);
		System.out.println("이미지 파일 경로" + filePath);

		deleteFile.deleteFiles(filePath);

		service.deleteUser(vo);

		session.invalidate();

		return "redirect:/";
	}

}
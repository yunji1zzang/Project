package com.springapp.uglys.review.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.springapp.uglys.review.service.ReviewService;
import com.springapp.uglys.review.vo.Criteria;
import com.springapp.uglys.review.vo.PageMaker;
import com.springapp.uglys.review.vo.ReviewVO;
import com.springapp.uglys.utils.UploadFileUtils;


@Controller
@RequestMapping("/reviews/*")
@SessionAttributes("review")
public class ReviewController {
	
	
	@Autowired
	private ReviewService reviewService;
	
	private String uploadPath;

	// 후기 등록
	@RequestMapping(value = "/insertReview.do", method = RequestMethod.GET)
	public String insertView(HttpSession session,HttpServletResponse response) throws IOException {
		if(session.getAttribute("user")==null) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('먼저 로그인해 주세요');</script>");
			out.flush();
			
			return "login";
		}
		return "insertReview";
	}
	
	// 후기 등록
	@RequestMapping(value = "/insertReview.do", method = RequestMethod.POST)
	public String insert(ReviewVO vo, MultipartHttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("/insertReview.do");
		
		String m_writer = req.getParameter("m_writer");
		String m_title = req.getParameter("m_title");
		String m_content = req.getParameter("m_content");
		
		if (!m_writer.isEmpty()) {
			vo.setWriter(m_writer);
		} 
		if (!m_title.isEmpty()) {
			vo.setTitle(m_title);
		} else if (!vo.getTitle().isEmpty()) {
			vo.setTitle(vo.getTitle());
		} else {
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('제목이 없어요'); location.href='insertReview.do';</script>");
		}
		if (!m_content.isEmpty()) {
			vo.setContent(m_content);
		} else if (!vo.getContent().isEmpty()) {
			
		} else {
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('내용이 없어요'); location.href='insertReview.do';</script>");
		}
		
		
		
		
		
//		if (!m_writer.isEmpty()) {
//			vo.setWriter(m_writer);
//		}
//		if (!m_title.isEmpty()) {
//			vo.setTitle(m_title);
//		}
//		if (!m_content.isEmpty()) {
//			vo.setContent(m_content);
//		}
		
		List<MultipartFile> fileList = req.getFiles("file");

		uploadPath = req.getSession().getServletContext().getRealPath("/resources");
		System.out.println("업로드 패스 : "+uploadPath);

		for (MultipartFile file : fileList) {
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = null;

			if(!file.isEmpty()) {
				fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
				vo.setContent_img(".." + File.separator + "imgUpload" + ymdPath + File.separator + fileName);
				break;
			}
			vo.setContent_img("");
		}

		reviewService.insert(vo);
		return "redirect:getReviewList.do";
	}
	
	// 후기 수정
	@RequestMapping(value = "/updateReview.do", method = RequestMethod.GET)
	public String updateView(ReviewVO vo,Model model) {
		System.out.println("updateView : "+vo.getReviewNum());
		model.addAttribute("review",reviewService.getReview(vo));
		return "updateReview";
	}
	
	// 후기 수정
	@RequestMapping(value = "/updateReview.do", method = RequestMethod.POST)
	public String update(ReviewVO vo, MultipartHttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String m_writer = req.getParameter("m_writer");
		String m_title = req.getParameter("m_title");
		String m_content = req.getParameter("m_content");
		
		if (!m_writer.isEmpty()) {
			vo.setWriter(m_writer);
		} 
		if (!m_title.isEmpty()) {
			vo.setTitle(m_title);
		} else if (!vo.getTitle().isEmpty()) {
			vo.setTitle(vo.getTitle());
		} else {
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('제목이 없어요'); location.href='updateReview.do?reviewNum="+ vo.getReviewNum() +"';</script>");
		}
		if (!m_content.isEmpty()) {
			vo.setContent(m_content);
		} else if (!vo.getContent().isEmpty()) {
			vo.setContent(vo.getContent());
		} else {
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('내용이 없어요'); location.href='updateReview.do?reviewNum="+ vo.getReviewNum()+"';</script>");
		}
		
		
		
		
		
//		if (!m_writer.isEmpty()) {
//			vo.setWriter(m_writer);
//		}
//		if (!m_title.isEmpty()) {
//			vo.setTitle(m_title);
//		}
//		if (!m_content.isEmpty()) {
//			vo.setContent(m_content);
//		}
		
		List<MultipartFile> fileList = req.getFiles("file");
		
		uploadPath = req.getSession().getServletContext().getRealPath("/resources");
		System.out.println("업로드 패스 : "+uploadPath);
		
		for (MultipartFile file : fileList) {
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = null;
		
			if(!file.isEmpty()) {
				fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
				vo.setContent_img(".." + File.separator + "imgUpload" + ymdPath + File.separator + fileName);
				break;
			} 
			vo.setContent_img(vo.getContent_img());
		}
		
		reviewService.update(vo);
		return "redirect:getReviewList.do";
	}
	
	// 후기 삭제
	@RequestMapping("/deleteReview.do")
	public String delete(ReviewVO vo) {
		reviewService.delete(vo);
		return "redirect:getReviewList.do";
	}
	
	// 후기 조회
	@RequestMapping("/getReview.do")
	public String getReview(ReviewVO vo, Model model) {
		reviewService.view_cnt(vo);
		model.addAttribute("review", reviewService.getReview(vo));
		vo =reviewService.getReview(vo);
		System.out.println(vo.getReviewNum());
		System.out.println(vo.getContent());

		return "review";
	}
	
	// 후기 목록 & 검색 & 페이징
	@RequestMapping("/getReviewList")
	public String getReviewList(ReviewVO vo, Criteria cri, Model model) {
		System.out.println("/getReviewList.do");
		
		if (vo.getSearchCondition() != null) {
			vo.setSearchCondition("TITLE");
		}

		if (vo.getSearchKeyword() != null) {
			vo.setSearchKeyword(""); 
		}
		
		List<ReviewVO> reviewList = reviewService.getReviewList(cri);	
		model.addAttribute("reviewList", reviewList);
		int total = reviewService.getTotalCount(cri); // 총 게시물
		PageMaker pageMaker =  new PageMaker(cri, total);
		for (ReviewVO reviewVO : reviewList) {
			System.out.println(reviewVO.getReviewNum());
			System.out.println(reviewVO.getContent_img());
		}
		model.addAttribute("pageMaker",pageMaker); // 테스트 숫자 : 108
		
		return "reviewList";
	}
	
	// 검색 조건 목록 설정
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		Map<String, String> conditionMap = new HashMap();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		return conditionMap;
	}
	
//	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
//	
//	/**
//	 * Simply selects the home view to render by returning its name.
//	 */
//	@RequestMapping(value = "/review", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "review";
//	}

}

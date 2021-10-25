package com.springapp.uglys.review.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.springapp.uglys.review.dao.ReviewDAO;
import com.springapp.uglys.review.vo.Criteria;
import com.springapp.uglys.review.vo.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	@Resource(name = "reviewDAO")
	private ReviewDAO reviewDAO;
	
	@Override
	public void insert(ReviewVO vo) {
		reviewDAO.insert(vo);
	}

	@Override
	public void update(ReviewVO vo) {
		reviewDAO.update(vo);
	}

	@Override
	public void delete(ReviewVO vo) {
		reviewDAO.delete(vo);
	}

	public ReviewVO getReview(ReviewVO vo) {
		return reviewDAO.getReview(vo);
	}


	// 후기 조회 & 페이징
	public List<ReviewVO> getReviewList(Criteria cri) {
		return reviewDAO.getReviewList(cri);
	}
	
	// 조회수 증가
	public int view_cnt(ReviewVO vo) {
		return reviewDAO.view_cnt(vo);
	}
	
	
	// 총 게시물
	public int getTotalCount(Criteria cri) {
		return reviewDAO.getTotalCount(cri);
	}
	
	
}

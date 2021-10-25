package com.springapp.uglys.review.service;

import java.util.List;

import com.springapp.uglys.review.vo.Criteria;
import com.springapp.uglys.review.vo.ReviewVO;

public interface ReviewService {
	// 리뷰 등록
	void insert(ReviewVO vo);
	// 리뷰 수정
	void update(ReviewVO vo);
	// 리뷰 삭제
	void delete(ReviewVO vo);
	// 리뷰 조회
	ReviewVO getReview(ReviewVO vo);
	
	// 리뷰 목록 조회 & 페이징
	List<ReviewVO> getReviewList(Criteria cri);
	
	// 조회수 증가
	public int view_cnt(ReviewVO vo);


	// 총 게시물
	public int getTotalCount(Criteria cri); 


}

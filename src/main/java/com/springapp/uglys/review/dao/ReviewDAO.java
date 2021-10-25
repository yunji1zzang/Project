package com.springapp.uglys.review.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springapp.uglys.review.vo.Criteria;
import com.springapp.uglys.review.vo.ReviewVO;

@Repository
public interface ReviewDAO {
	
	
	
		
	// 등록
	public void insert(ReviewVO vo);
	
	// 수정
	public void update(ReviewVO vo);
	
	// 삭제
	public void delete(ReviewVO vo);
	
	// 조회
	public ReviewVO getReview(ReviewVO vo);
	
	// 후기 목록
	public List<ReviewVO> getReviewList(Criteria cri);
	
	// 조회수 증가
	public int view_cnt(ReviewVO vo);
	
	// 총 게시물 
	public int getTotalCount(Criteria cri);
	
}

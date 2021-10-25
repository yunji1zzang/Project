package com.springapp.uglys.review.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springapp.uglys.review.vo.Criteria;
import com.springapp.uglys.review.vo.ReviewVO;

@Repository("reviewDAO")
public class ReviewDAOImpl implements ReviewDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
		
	// 등록
	public void insert(ReviewVO vo) {
		mybatis.insert("userMapping.reviewInsert", vo);
	}
	
	// 수정
	public void update(ReviewVO vo) {
		mybatis.update("userMapping.reviewUpdate", vo);
	}
	
	// 삭제
	public void delete(ReviewVO vo) {
		mybatis.delete("userMapping.reviewDelete", vo);
	}
	
	// 조회
	public ReviewVO getReview(ReviewVO vo) {
		return (ReviewVO) mybatis.selectOne("userMapping.getReview", vo);
	}
	
	// 후기 목록
	public List<ReviewVO> getReviewList(Criteria cri) {
		return mybatis.selectList("userMapping.paging", cri);
	} 
	
	
	// 조회수 증가
	public int view_cnt(ReviewVO vo) {
		return mybatis.update("userMapping.viewcnt", vo);
	}
	
	
	
	// 총 게시물
	public int getTotalCount(Criteria cri) {
		return mybatis.selectOne("userMapping.getlistCount", cri);
	}
}

package com.kh.minimalist.auction.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.minimalist.auction.model.vo.Auction;
import com.kh.minimalist.auction.model.vo.BidInfo;

@Repository("auctionDao")
public class AuctionDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//경매 물품 갯수 구하는 메소드  count(*) (전체보기)
	public int countRow(){
		int result=0;
		
		result=sqlSession.selectOne("Auction.countRow");
	
		return result;
	}
	
	//경매 물품 리스트 selectList (전체보기)
	public ArrayList<Auction> selectList(HashMap<String, Object> map){
		List<Auction> list=null;
		
		list=sqlSession.selectList("Auction.selectList", map);
		
		return (ArrayList<Auction>)list;
	}
	
	
	//카테고리 row수
	public int countRowCategory(String auction_category){
		
		return sqlSession.selectOne("Auction.countRowCategory", auction_category);
	}
	
	//카테고리 리스트
	public ArrayList<Auction> selectListAuctionCategory(HashMap<String, Object> map){
		List<Auction> list=null;
		
		list=sqlSession.selectList("Auction.selectListAcutionCategory", map);
		
		
		return (ArrayList<Auction>)list;
	}
	
	
	
	//경매 물품 보여주는 메소드(디테일) selectOne
	public Auction selectOne(int auction_code){
		
		
		Auction auction=sqlSession.selectOne("Auction.selectOne", auction_code);
		
		return auction;
		
	}
	
	
	//입찰 메소드 insert
	public int bid(BidInfo bid){
		
		int confirm=0;
		//해당 경매에 대해 입찰 여부 확인
		int result=0;
		
		int temp=0;
		//조건검사
		int startPrice=0;
		
		confirm=sqlSession.selectOne("Auction.bidConfirm", bid);
		
		
		if(confirm==1){
			//입찰이 처음이 아닌 경우 - update (입찰금액만 수정)
			//재입찰의 경우 가격을 낮출 수 없도록.
			temp=sqlSession.selectOne("Auction.beforeBid", bid);
			if(temp>=bid.getBid_price()){
				result=-1;
				//-1 리턴.
			}else {
				result=sqlSession.update("Auction.bid2", bid);
			}
			
		}else if(confirm==0) {
			//입찰이 처음인 경우 -  insert
			//첫 가격보다 높게
			startPrice=sqlSession.selectOne("Auction.startPriceCheck", bid.getAuction_code());
			
			if(startPrice>=bid.getBid_price()){
				result=-2;
				//-2 리턴
			}else {
				result=sqlSession.insert("Auction.bid", bid);
			}
			
			
		}
		
		return result;
	}

	
	public int deleteBid(BidInfo bid){
		return sqlSession.delete("Auction.deleteBid", bid);
	}
	
	//가격 새로고침
	public int reloadPrice(int auction_code){
		
		int result=0;
		if(sqlSession.selectOne("Auction.reloadPrice", auction_code) != null){
			result=sqlSession.selectOne("Auction.reloadPrice", auction_code);
		}
		
		
		return result;
	}
	
	
	//경매 올리기(관리자) insert
	
	public int insertAuction(Auction auction){
		
		return sqlSession.insert("Auction.insertAuction", auction);
	}
	
	
	
	//경매 삭제(관리자) delete
	public int deleteAuction(int auction_code){
		
		return sqlSession.delete("Auction.deleteAuction", auction_code);
	}
	
	
	//경매 수정
	public int updateAuction(Auction auction){
		
		return sqlSession.update("Auction.updateAuction", auction);
	}
	
	//종료된 경매 갯수 리턴
	public int countRowEnd(){
		
		return sqlSession.selectOne("Auction.countRowEndAuction");
	}
	
	//종료된 옥션 리스트
	public ArrayList<Auction> selectListEnd(HashMap<String, Object> map){
		List<Auction> list=null;
		
		list=sqlSession.selectList("Auction.selectListEnd", map);
		
		return (ArrayList<Auction>)list;
	}
	
	
	//종료된 옥션 - 결제 확인
	public int checkPayment(HashMap<String, Object> map){
		
		return sqlSession.update("Auction.checkPayment", map);
	}

	// MEMBER 별 AUCTION LIST 조회
	public ArrayList<Auction> selectMemberAuction(String member_id) {
		List<Auction> list = sqlSession.selectList("Auction.selectMemberAuction", member_id);
		return (ArrayList<Auction>)list;
	}
	
	//종료된 옥션 입찰정보 확인
	public Auction selectOneEnd(int auction_code){
		
		
		return sqlSession.selectOne("Auction.selectOneEnd", auction_code);
		
		
	}
	
	//경매 중지
	public int auctionStop(int auction_code){
		
		return sqlSession.update("Auction.auctionStop", auction_code);
	}
}

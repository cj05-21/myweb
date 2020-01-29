package net.bbs2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DBPKG.DBOpen;

public class BoardDBBean {

	public void insertArticle(BoardDataBean article) throws Exception{
		int num=article.getNum();
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		int number=0;
		
		try{
		Connection con =DBOpen.getConnection();
		StringBuilder sql =new StringBuilder();
		sql.append(" SELECT max(num) FROM board ");
		PreparedStatement pstmt=con.prepareStatement(sql.toString());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			number=rs.getInt(1)+1;
		}else{
			number=1;
		}//if end
		
		//답변쓰기에서 글 순서 재조정
		if(num!=0){
			sql.delete(0, sql.length());
			sql.append(" UPDATE board SET re_step=re_step+1 WHERE ref=? AND re_step>? ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_step);
			pstmt.executeUpdate();
			re_step=re_step+1;
			re_level=re_level+1;
		}else{
			ref=number;
			re_step=0;
			re_level=0;
		}//if end
		sql.delete(0, sql.length());
		sql.append(" INSERT INTO board(num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip) ");
		sql.append(" VALUES((select nvl(max(num),0)+1 from board),?,?,?,?,?,?,?,?,?,?) ");
		pstmt=con.prepareStatement(sql.toString());
		pstmt.setString(1, article.getWriter());
		pstmt.setString(2, article.getEmail());
		pstmt.setString(3, article.getSubject());
		pstmt.setString(4, article.getPasswd());
		pstmt.setTimestamp(5, article.getReg_date());
		pstmt.setInt(6, ref);
		pstmt.setInt(7, re_step);
		pstmt.setInt(8, re_level);
		pstmt.setString(9, article.getContent());
		pstmt.setString(10, article.getIp());
		pstmt.executeUpdate();
	
		}catch(Exception e){e.printStackTrace();}
		
	}//insert end
	
	public int getArticleCount() throws Exception{
		int x=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT count(*) FROM board");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				x=rs.getInt(1);
			}
		}catch(Exception e){e.printStackTrace();}
		return x;
	}//count end
	
	
	public List getArticles(int start, int end) throws Exception{
		List articleList=null;
		StringBuilder sql=new StringBuilder();
		
		sql.append(" select AA.* ");
		sql.append(" from( ");
		sql.append("		select rownum as rnum,BB.* ");
		sql.append("		from ( ");
		sql.append("			select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount ");
		sql.append("			from board order by ref desc,re_step asc ");
		sql.append("			) BB ");
		sql.append("		) AA ");
		sql.append(" where AA.rnum>=? and AA.rnum<=?");
		
		try{
			Connection con=DBOpen.getConnection();
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				articleList=new ArrayList(end);
				do{
					BoardDataBean article=new BoardDataBean();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("Writer"));
					article.setEmail(rs.getString("email"));
					article.setSubject(rs.getString("subject"));
					article.setPasswd(rs.getString("passwd"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip"));
					
					articleList.add(article);
				}while(rs.next());
			}
		}catch(Exception e){e.printStackTrace();}
		return articleList;
	}//getArticles end
	
	public BoardDataBean getArticle(int num) throws Exception{
		BoardDataBean article=null;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" update board set readcount=readcount+1 WHERE num=? ");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			sql.delete(0, sql.length());
			sql.append(" select num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip,readcount ");
			sql.append(" from board where num=? ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				article=new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
			}
		}catch(Exception e){e.printStackTrace();}
		return article;
	}//getArticle end
	
	public int bbsDel(BoardDataBean dto){
		int cnt=0;
		try{
			Connection con =DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" delete from board  ");
			sql.append(" where num=? and passwd=? ");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getPasswd());
			cnt=pstmt.executeUpdate();
			
		}catch(Exception e){System.out.println("게시물 삭제 실패!!"+e);}
		return cnt;
	}//bbsDel end
	
	public BoardDataBean bbsread(BoardDataBean dto){
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" select writer,subject,email,content,passwd ");
			sql.append(" from board ");
			sql.append(" where num=? and passwd=? ");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getPasswd());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				dto.setWriter(rs.getString("writer"));
				dto.setSubject(rs.getString("subject"));
				dto.setEmail(rs.getString("email"));
				dto.setContent(rs.getString("content"));
				dto.setPasswd(rs.getString("passwd"));
			}
		}catch(Exception e){System.out.println("게시물 불러오기 실패"+e);}
				return dto;
	}//bbsread end
	
	public int update(BoardDataBean dto){
		int cnt=0;
		try{
		Connection con=DBOpen.getConnection();
		StringBuilder sql=new StringBuilder();
		sql.append(" update board ");
		sql.append(" set writer=?,subject=?,email=?,content=?,passwd=? ");
		sql.append(" where num=? ");
		PreparedStatement pstmt=con.prepareStatement(sql.toString());
		pstmt.setString(1, dto.getWriter());
		pstmt.setString(2, dto.getSubject());
		pstmt.setString(3, dto.getEmail());
		pstmt.setString(4, dto.getContent());
		pstmt.setString(5, dto.getPasswd());
		pstmt.setInt(6, dto.getNum());
		cnt=pstmt.executeUpdate();
		
		}catch(Exception e){System.out.println("수정 실패"+e);}
		return cnt;
	}//update end
	
}//class end

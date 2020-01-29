package net.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.bbs.BbsDTO;
import net.pds.PdsDTO;
import net.utility.Utility;
import DBPKG.DBOpen;

public class NoticeDAO {

	public int noticeIns(NoticeDTO dto){
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" INSERT INTO tb_notice(noticeno,subject,content,id,regdt,conf)");
			sql.append(" VALUES( ");
			sql.append(" noticeno_seq.NEXTVAL,?,?,?,sysdate,?");
			sql.append(" ) ");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getId());
			pstmt.setString(4, dto.getConf());
			cnt=pstmt.executeUpdate();
		}catch(Exception e){System.out.println("공지사항 입력 실패!!"+e);}
		return cnt;
	}//insert end
	
	public ArrayList<NoticeDTO> NoticeList(){
		
		ArrayList<NoticeDTO> list=null;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" select noticeno,subject,content,id,regdt,conf,readcnt ");
			sql.append(" from tb_notice ");
			sql.append(" order by noticeno desc ");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			ResultSet rs= pstmt.executeQuery();
			if(rs.next()){
				list=new ArrayList<NoticeDTO>();
				do{
				NoticeDTO dto=new NoticeDTO();
				dto.setNoticeno(rs.getInt("noticeno"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setRegdt(rs.getString("regdt"));
				dto.setConf(rs.getString("conf"));
				dto.setReadcnt(rs.getInt("readcnt"));
				list.add(dto);
				}while(rs.next());
				
			}else{
				list=null;
			}
		}catch(Exception e){System.out.println("불러오기 실패"+e);}
			return list;
	}// list end
	
	public ArrayList<NoticeDTO> NoticeList(String col, String word){
		
		ArrayList<NoticeDTO> list=null;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" select noticeno,subject,content,id,regdt,conf,readcnt ");
			sql.append(" from tb_notice ");
			
			if(word.trim().length()>=1){//검색어가 있다면
				String search="";
				if(col.equals("id")){
					search+=" WHERE id LIKE '%"+word+"%' ";
				}
				if(col.equals("subject")){
					search+=" WHERE subject LIKE '%"+word+"%' ";
				}
				if(col.equals("content")){
					search+=" WHERE content LIKE '%"+word+"%' ";
				}
				if(col.equals("subject_content")){
					search+=" WHERE subject LIKE '%"+word+"%' ";
					search+=" OR content LIKE '%"+word+"%' ";
				}
				sql.append(search);
			}
			sql.append(" order by noticeno desc ");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			ResultSet rs= pstmt.executeQuery();
			if(rs.next()){
				list=new ArrayList<NoticeDTO>();
				do{
					NoticeDTO dto=new NoticeDTO();
					dto.setNoticeno(rs.getInt("noticeno"));
					dto.setSubject(rs.getString("subject"));
					dto.setContent(rs.getString("content"));
					dto.setId(rs.getString("id"));
					dto.setRegdt(rs.getString("regdt"));
					dto.setConf(rs.getString("conf"));
					dto.setReadcnt(rs.getInt("readcnt"));
					list.add(dto);
				}while(rs.next());
				
			}else{
				list=null;
			}
		}catch(Exception e){System.out.println("불러오기 실패"+e);}
		return list;
	}// list end
	public ArrayList<NoticeDTO> noticeList(String col, String word, int nowPage, int recordPerPage){
        ArrayList<NoticeDTO> list=null;
        
        // 페이지당 출력할 레코드 갯수 (10개를 기준)
        // 1 page : WHERE r>=1 AND r<=10
        // 2 page : WHERE r>=11 AND r<=20
        // 3 page : WHERE r>=21 AND r<=30
        int startRow = ((nowPage-1) * recordPerPage) + 1 ;
        int endRow   = nowPage * recordPerPage;
        
        try{
            Connection con=DBOpen.getConnection();
            StringBuilder sql=new StringBuilder();
          
          word = word.trim(); //검색어의 좌우 공백 제거
          
          if(word.length()==0) { //검색을 하지 않는 경우
            sql.append(" SELECT noticeno,subject,content,id,regdt,conf,readcnt, r");
            sql.append(" FROM( SELECT noticeno,subject,content,id,regdt,conf,readcnt,rownum as r");
            sql.append("       FROM ( SELECT noticeno,subject,content,id,regdt,conf,readcnt");
            sql.append("              FROM tb_notice");
           
          
            
            sql.append("              ORDER BY noticeno DESC");
            sql.append("           )");
            sql.append("     )");
            sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow) ;
          } else {
            //검색을 하는 경우
            sql.append(" SELECT noticeno,subject,content,id,regdt,conf,readcnt, r");
            sql.append(" FROM( SELECT noticeno,subject,content,id,regdt,conf,readcnt,rownum as r");
            sql.append("       FROM ( SELECT noticeno,subject,content,id,regdt,conf,readcnt");
            sql.append("              FROM tb_notice");
            
            String search="";
            if(col.equals("id")) {
              search += " WHERE id LIKE '%" + word + "%'";
            } else if(col.equals("subject")) {
              search += " WHERE subject LIKE '%" + word + "%'";
            } else if(col.equals("content")) {
              search += " WHERE content LIKE '%" + word + "%'";
            } else if(col.equals("subject_content")) {
              search += " WHERE subject LIKE '%" + word + "%'";
              search += " OR content LIKE '%" + word + "%'";
            }
            
            sql.append(search);        
            
            sql.append("              ORDER BY noticeno DESC");
            sql.append("           )");
            sql.append("     )");
            sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow) ;
          }//if end
          
          PreparedStatement pstmt=con.prepareStatement(sql.toString());
          ResultSet rs=pstmt.executeQuery();
          if(rs.next()){
            list=new ArrayList<NoticeDTO>();
            do{
              NoticeDTO dto=new NoticeDTO();
              dto.setNoticeno(rs.getInt("noticeno"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setRegdt(rs.getString("regdt"));
				dto.setConf(rs.getString("conf"));
				dto.setReadcnt(rs.getInt("readcnt"));
              list.add(dto);
            }while(rs.next());
          }//if end
          
        }catch(Exception e) {
          System.out.println("목록 페이징 실패: "+e);
        }   
        return list;
      }//list() end  
	

	
	public int count(String col, String word){
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT COUNT(*) as cnt ");
			sql.append("		FROM tb_notice ");
			if(word.trim().length()>=1){//검색어가 있다면
				String search="";
				if(col.equals("id")){
					search+=" WHERE id LIKE '%"+word+"%' ";
				}
				if(col.equals("subject")){
					search+=" WHERE subject LIKE '%"+word+"%' ";
				}
				if(col.equals("content")){
					search+=" WHERE content LIKE '%"+word+"%' ";
				}
				if(col.equals("subject_content")){
					search+=" WHERE subject LIKE '%"+word+"%' ";
					search+=" OR content LIKE '%"+word+"%' ";
				}
				sql.append(search);
			}
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				cnt=rs.getInt("cnt");
				
			}

		}catch(Exception e){System.out.println("글개수 실패"+e);}
		return cnt;
	}//count end
	
	public NoticeDTO noticeRead(int noticeno){
		NoticeDTO dto=null;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT noticeno,subject,content,regdt,id,conf,readcnt ");
			sql.append(" FROM tb_notice ");
			sql.append(" WHERE noticeno=? ");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, noticeno);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new NoticeDTO();
				dto.setNoticeno(rs.getInt("noticeno"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRegdt(rs.getString("regdt"));
				dto.setId(rs.getString("id"));
				dto.setConf(rs.getString("conf"));
				dto.setReadcnt(rs.getInt("readcnt"));
			}
			
		}catch(Exception e){System.out.println("공지사항 읽어 오기 실패"+e);}
		return dto;
		
	}
	
	public void increaseCnt(int noticeno){
	try{
		Connection con=DBOpen.getConnection();
		StringBuilder sql =new StringBuilder();
		sql.append(" UPDATE tb_notice SET ");
		sql.append(" readcnt=readcnt+1 ");
		sql.append(" WHERE noticeno=? ");
		PreparedStatement pstmt= con.prepareStatement(sql.toString());
		pstmt.setInt(1,noticeno);
		pstmt.executeUpdate();	
	}catch(Exception e){System.out.println("조회수 증가 실패"+e);}
		
	}
	
	public int repleset(int noticeno,String id,String reple){
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" INSERT INTO tb_notice_reple(noticeno,reple,resno,id,regdt) ");
			sql.append(" VALUES (?,?,(select NVL(max(resno),0)+1 from tb_notice_reple),?,sysdate ");
			sql.append(" ) ");
			PreparedStatement pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, noticeno);
			pstmt.setString(2, reple);
			pstmt.setString(3, id);
			cnt=pstmt.executeUpdate();

		}catch(Exception e){System.out.println("댓글 입력 실패"+e);}
		return cnt;
	}
	
	public ArrayList<NoticeDTO> repleget(int noticeno){
		ArrayList<NoticeDTO> list=null;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT member.mlevel,member.id,tb.noticeno,tb.reple,tb.resno,tb.regdt ");
			sql.append(" FROM member join tb_notice_reple tb ");
			sql.append(" on member.id=tb.id ");
			sql.append(" WHERE noticeno=? ");
			sql.append(" ORDER BY resno ");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, noticeno);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				list=new ArrayList<NoticeDTO>();
				do{
					NoticeDTO dto=new NoticeDTO();
					dto.setMlevel(rs.getString("mlevel"));
					dto.setId(rs.getString("id"));
					dto.setNoticeno(rs.getInt("noticeno"));
					dto.setReple(rs.getString("reple"));
					dto.setResno(rs.getInt("resno"));
					dto.setRegdt(rs.getString("regdt"));
					list.add(dto);
				}while(rs.next());
			}else{
				list=null;
			}

		}catch(Exception e){System.out.println("목록 조회 실패"+e);}
		return list;
	}

	public void noticeDeleteRe(int noticeno){
		
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" DELETE FROM tb_notice_reple ");
			sql.append(" WHERE noticeno=?");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1,noticeno);
			
			pstmt.executeUpdate();
		}catch(Exception e){System.out.println("댓글 삭제실패!!"+e);}
		
	}//pdsDelete end
	
	public int noticeDelete(int noticeno){
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" DELETE FROM tb_notice ");
			sql.append(" WHERE noticeno=?  ");
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1,noticeno);
			cnt=pstmt.executeUpdate();
			
		}catch(Exception e){System.out.println("사진 삭제실패!!"+e);}
		return cnt;
	}//pdsDelete end

	public int noticeUpdate (NoticeDTO dto){
			int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql =new StringBuilder();
			sql.append(" UPDATE tb_notice SET ");
			sql.append(" subject=?,content=?,conf=?");
			sql.append(" WHERE noticeno=? ");
			PreparedStatement pstmt= con.prepareStatement(sql.toString());
			pstmt.setString(1,dto.getSubject());
			pstmt.setString(2,dto.getContent());
			pstmt.setString(3,dto.getConf());
			pstmt.setInt(4,dto.getNoticeno());
			cnt=pstmt.executeUpdate();	
		}catch(Exception e){System.out.println("조회수 증가 실패"+e);}
			return cnt;
		}
	
	public int replecount(int noticeno){
		int cnt=0;
		try{
			Connection con=DBOpen.getConnection();
			StringBuilder sql=new StringBuilder();
			sql.append(" SELECT COUNT(*) as cnt ");
			sql.append("		FROM tb_notice_reple ");
			sql.append("		WHERE noticeno=?");
			
			PreparedStatement pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, noticeno);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				cnt=rs.getInt("cnt");
				
			}

		}catch(Exception e){System.out.println("글개수 실패"+e);}
		return cnt;
	}
}//class end
	

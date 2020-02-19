package joinmember;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import config.DB;


public class JoinMemberDAO {
	public void insert(JoinMemberDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConn();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into joinmember ");
			sql.append(" (name,id,pass1,pass2,email,tel,job) values ");
			sql.append(" (?,?,PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT(?),PACK_ENCRYPTION_DECRYPTION.FUNC_ENCRYPT(?),?,?,?)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPass1());
			pstmt.setString(4, dto.getPass2());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getTel());
			pstmt.setString(7, dto.getJob());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}
	
	public List<JoinMemberDTO> JoinList(){
		List<JoinMemberDTO> items = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DB.getConn();
			String sql = "select * from joinmember order by name";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				JoinMemberDTO dto = new JoinMemberDTO();
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPass1(rs.getString("pass1"));
				dto.setPass2(rs.getString("pass2"));
				dto.setEmail(rs.getString("email"));
				dto.setTel(rs.getString("tel"));
				dto.setJob(rs.getString("job"));
				items.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
		try {
			if(rs!=null) rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			if(pstmt!=null) pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			if(conn!=null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			}
		}
		return items;
	}

	public String loginCheck(String id, String pass1) {
		String name = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn=DB.getConn();
			String sql 
			= "select * from joinmember where id=? and pass1=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass1);
			rs= pstmt.executeQuery();
			if(rs.next()) { //로그인 성공
				name = rs.getString("name");
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt!=null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return name;
	}

	public List<JoinMemberDTO> mypage(String name) {
		List<JoinMemberDTO> items = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DB.getConn();
			String sql = "select * from joinmember where name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				JoinMemberDTO dto = new JoinMemberDTO();
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPass1(rs.getString("pass1"));
				dto.setPass2(rs.getString("pass2"));
				dto.setEmail(rs.getString("email"));
				dto.setTel(rs.getString("tel"));
				dto.setJob(rs.getString("job"));
				items.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
		try {
			if(rs!=null) rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			if(pstmt!=null) pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			if(conn!=null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			}
		}
		return items;
	}

	public void update(JoinMemberDTO dto) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConn();
			StringBuilder sb = new StringBuilder();
			sb.append("update joinmember set ");
			sb.append(" id=?, pass1=?, pass2=?, email=?, tel=?, job=? ");
			sb.append(" where name=?");
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass1());
			pstmt.setString(3, dto.getPass2());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getTel());
			pstmt.setString(6, dto.getJob());
			pstmt.setString(7, dto.getName());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn!=null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}//end update()

	public void delete(String id) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		try {
			conn = DB.getConn();
			StringBuilder sb = new StringBuilder();
			sb.append("delete from joinmember where id=? ");
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)
					pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn!=null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}

	public String findid(String name, String email) {
		String id = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn=DB.getConn();
			String sql 
			= "select id from joinmember where name=? and email=? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs= pstmt.executeQuery();
			if(rs.next()) { //로그인 성공
				id = rs.getString("id");
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt!=null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return id;
	}

	public String findpw(String id, String email) {
		String pass1 = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn=DB.getConn();
			String sql 
			= "select pass1 from joinmember where id=? and email=? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, email);
			rs= pstmt.executeQuery();
			if(rs.next()) { //로그인 성공
				pass1 = rs.getString("pass1");
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(pstmt!=null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return pass1;
	}
}


		

	


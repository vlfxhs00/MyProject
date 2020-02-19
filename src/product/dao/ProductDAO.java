package product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;


import product.dto.ProductDTO;
import sqlmap.MybatisManager;

public class ProductDAO {
	public List<ProductDTO> getList(){
		SqlSession session=MybatisManager.getInstance().openSession();
		List<ProductDTO> list=null;
		list=session.selectList("product.pdList");
		session.close();
		return list;
	}
	//¹æ¸í·Ï insert
		public void pdInsert(ProductDTO dto) {
			SqlSession session=MybatisManager.getInstance().openSession();
			session.insert("product.pdInsert", dto);
			session.commit();
			session.close();
			
		}
		public List<ProductDTO> getPro_List(String pro) {
			SqlSession session=MybatisManager.getInstance().openSession();
			List<ProductDTO> list=null;
			list=session.selectList("product.pdpro_List", pro);
			session.close();
			return list;
		}
}
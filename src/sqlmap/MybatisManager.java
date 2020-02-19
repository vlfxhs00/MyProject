package sqlmap;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisManager {
	
	//SqlSession ��ü ������
	private static SqlSessionFactory instance;
	/* �����ڴ� ���� public�ε� privateó�� �ߴ�. ���� �ܺο���
	 * ������ �ȵȴ�. new�ؼ� ���� �ȵǱ� ������ getInstance()��ȸ�ؼ� �����Ѵ�.
	 * public�����ڸ� ���Ƽ� �ܺο��� �����ϴ°��� ���´�.
	 * ���� ����ڵ��� ���� ������ ������ �� ����
	 * MybatisManager m=new MybatisManager();�� �����ϸ� �޸𸮰�
	 * �þ�� ������ �ټ��� �ν��Ͻ� ������ ���� �ϳ��� �ν��Ͻ���
	 * �������� ó���Ѵ�. ��, �̱������ϱ���̴�.
	 */
	private MybatisManager() {
		
	}
	//SqlSessionFactoryBuilder => SqlSessionFactory => SqlSession
	public static SqlSessionFactory getInstance() {
		Reader reader = null;//Reader�� InputStreamReader�� ������ü
		try {
			reader = Resources.getResourceAsReader("sqlmap/sqlMapConfig.xml");

			instance = new SqlSessionFactoryBuilder().build(reader);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(reader != null)
					reader.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}//finally
		return instance;
	}

}

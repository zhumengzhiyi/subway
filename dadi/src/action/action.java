package action;

import java.util.ArrayList;
import java.util.List;
import com.Dao.Dao1;

import com.Bean.Bean1;

public class action {
	
	
	public static String[] chaxianlu(String station) {
		
		
		List<Bean1> list = new ArrayList<Bean1>();
		list=new Dao1().selectByName(station);
		String[] nol= new String[8];
		int i=0;
		for(Bean1 s:list) {
			System.out.println("����");
			System.out.println(s.getID()+",��վ:"+s.getName()+"·��"+s.getNol());
			 nol[i++]=s.getNol();
		}
		return nol;
	}
	
	//����·�鳵վ
	public static List<Bean1> chastation(String nol){
		List<Bean1> list = new ArrayList<Bean1>();
		list=new Dao1().selectByNol(nol);
		
		for(Bean1 s:list) {
			System.out.println("����");
			System.out.println(s.getID()+",��վ:"+s.getName()+"·��"+s.getNol());
			
		}
		return list;
		
		
	}
	public static void main(String[] args) {
		String qishizhang="ƻ��԰";
		String[] nol1=chaxianlu(qishizhang);
		String endstation="����";
		String[] nol2=chaxianlu(endstation);
		for(int i=0;i<nol2.length;i++) {
		if(nol1[0].equals(nol2[i])) {
			List<Bean1> list = new ArrayList<Bean1>();
			list=new Dao1().selectByNol(nol1[0]);
			
			}
		}

	}
	
}

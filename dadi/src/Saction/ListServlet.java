package Saction;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Bean.Bean1;
import com.Dao.Dao1;
import action.action;

/**
 * Servlet implementation class ListServlet
 */
@WebServlet("/ListServlet")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String stStation=request.getParameter("stStation");
		String enStation=request.getParameter("enStation");
		
		String[] nol1=new action().chaxianlu(stStation);
		String[] nol2=new action().chaxianlu(enStation);
		List<Bean1> list = new ArrayList<Bean1>();
		for(int i=0;i<nol2.length;i++) {
		if(nol1[0].equals(nol2[i])) {
			
			list=new Dao1().selectByNol(nol1[0]);
			}
		}
		request.setAttribute("list", list);
		request.getRequestDispatcher("/main.jsp").forward(request, response);//转发到指定页面    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

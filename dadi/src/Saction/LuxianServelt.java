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
 * Servlet implementation class LuxianServelt
 */
@WebServlet("/LuxianServelt")
public class LuxianServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LuxianServelt() {
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
		String nol1=request.getParameter("nol1");
		String nol2=request.getParameter("nol2");
		if(nol1.equals("线路名称，如1号线")) {
			List<Bean1> list = new ArrayList<Bean1>();
				list=new Dao1().selectByNol(nol2);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/main.jsp").forward(request, response);//转发到指定页面    
		}else {
			List<Bean1> list = new ArrayList<Bean1>();
				list=new Dao1().selectByNol(nol1);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/main.jsp").forward(request, response);//转发到指定页面    
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

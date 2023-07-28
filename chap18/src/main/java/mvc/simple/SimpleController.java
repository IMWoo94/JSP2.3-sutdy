package mvc.simple;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SimpleController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processRequest(req, resp);
	}
	
	private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		// 2단계 요청 파악
		String type = req.getParameter("type");
		
		// 3단계 요청한 기능을 수행
		Object resultObject = null;
		if(type == null || type.equals("greeting")) {
			resultObject = "안녕하세요";
		}else if(type.equals("date")) {
			resultObject = new Date();
		}else {
			resultObject = "Invalid Type";
		}
		
		// 4단계 request, session에 결과를 저장
		req.setAttribute("result", resultObject);
		
		// 5단계 requestdispather사용하여 알맞은 뷰로 포워딩
		RequestDispatcher dis = req.getRequestDispatcher("/simpleView.jsp");
		dis.forward(req, resp);
	}

}

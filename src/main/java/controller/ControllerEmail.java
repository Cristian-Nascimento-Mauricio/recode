package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAO;
import model.mensagens;

/**
 * Servlet implementation class ControllerEmail
 */
@WebServlet("/sendEmail")
public class ControllerEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DAO db = new DAO();
	
    public ControllerEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    mensagens mensagens = new mensagens(); 
	    
	    mensagens.setEmail(request.getParameter("email"));
	    mensagens.setMensagem(request.getParameter("mensagem"));
	    
	    System.out.println("\nEmail recebido" +
	            "\n - Email: " + mensagens.getEmail() +
	            "\n - Mensagem: " + mensagens.getMensagem());
	    
	    try {
			db.insertMensagem(mensagens);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.print("Erro ao fazer insert do messagem");
		}

	    doGet(request, response);
	}

}

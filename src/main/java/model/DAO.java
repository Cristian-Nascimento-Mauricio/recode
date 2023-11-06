package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAO {
	
	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3306/teste?useTimeZone=true&serverTimeZone=UTC";
	private String user = "root";
	private String passowrd = "Creeper27";
	
	public Connection conectar() {
		Connection  connection = null;
		
		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url,user,passowrd);
			return connection;

		} catch (Exception e) {
			System.out.println("Erro na conexão com o banco de dado: " + e);
			return null;
		}
	}
	public void testConectcar() {
		
		try {
			Connection connection = conectar();
			connection.close();
			System.out.println("Okay");

		} catch (Exception e) {
			System.out.println("Teste de conexão de erro: " + e);
			
		}
		
	} 	
	
	public void insertMensagem(mensagens obj) throws SQLException {
		Connection connection = conectar();
		
		String sql = "INSERT INTO mensagens (email , messagem ) VALUES (? , ? )";
		
		PreparedStatement pStatement = connection.prepareStatement(sql);
		
		pStatement.setString(1, obj.getEmail());
		pStatement.setString(2, obj.getMensagem());
		
		pStatement.execute();
		
		connection.close();
		
	}
	
	public List<trips> getTrips(String type) {
		
		List<trips> list = new ArrayList<trips>();
		String sql = type;
		
		if(type.equals("nacional")) {
			sql = " SELECT * , price * promotion AS price_with_promotion FROM teste.trips WHERE country = 'Brazil'";

		} else if(type.equals("internacional")) {
			sql = " SELECT * , price * promotion AS price_with_promotion FROM teste.trips WHERE country != 'Brazil'";

		} else if(type.equals("promocoes")) {
			sql = " SELECT * , (price * promotion) AS price_with_promotion FROM teste.trips WHERE promotion < 1";
		} else {
			return null;
		}
			
		Connection connection = conectar();
		
		PreparedStatement preparedStatement;
		try {
			preparedStatement = connection.prepareStatement(sql);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				
				list.add( new trips( resultSet.getString("from_"), resultSet.getString("to_"), resultSet.getFloat("price_with_promotion") ));
				
				resultSet.getString("from_");
			}
			
			connection.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		}
		
		
		return list;
	}
}

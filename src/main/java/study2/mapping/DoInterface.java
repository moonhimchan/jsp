package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface DoInterface {
	//execute는 맘대로 적어도 된다(메소드 이름) 인터페이스는 추상메소드를 가지는데 추상메소드는 실행하지 않는다.
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
	
}

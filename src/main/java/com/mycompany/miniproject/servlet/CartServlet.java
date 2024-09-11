package com.mycompany.miniproject.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

@WebServlet("/cart/*")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getPathInfo().substring(1); // add or delete
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject result = new JSONObject();

        try {
            BufferedReader reader = request.getReader();
            StringBuilder json = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                json.append(line);
            }

            JSONObject jsonData = new JSONObject(json.toString());

            if ("add".equals(action)) {
                // 상품 추가 로직 (예: DB에 상품 추가)
                String productName = jsonData.getString("product_name");
                
                int productPrice = jsonData.getInt("product_price");
                int cartCount = jsonData.getInt("cart_count");

                // 로그 출력
                System.out.println("상품 추가: " + productName + ", 수량: " + cartCount);

                // 여기서 DB에 삽입하는 로직 추가

                result.put("success", true);
            } else if ("delete".equals(action)) {
                // 상품 삭제 로직 (예: DB에서 상품 삭제)
                String productName = jsonData.getString("product_name");

                // 로그 출력
                System.out.println("상품 삭제: " + productName);

                // 여기서 DB에서 삭제하는 로직 추가

                result.put("success", true);
            } else {
                result.put("success", false);
                result.put("message", "Invalid action.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("message", e.getMessage());
        }

        out.print(result.toString());
        out.flush();
    }
}


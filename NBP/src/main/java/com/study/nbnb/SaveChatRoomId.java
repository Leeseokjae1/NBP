package com.study.nbnb;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;

import com.study.nbnb.dao.ChatRoomDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SaveChatRoomId")
public class SaveChatRoomId extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	ChatRoomDao croomDao;
        String chatRoomId = request.getParameter("chatRoomId");
        croomDao.saveChatRoom(null);
        HttpSession session = request.getSession();
        session.setAttribute("roomid", chatRoomId);
        response.getWriter().write("Success");
    }
}
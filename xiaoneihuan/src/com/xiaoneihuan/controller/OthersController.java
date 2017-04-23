package com.xiaoneihuan.controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OthersController {
	@RequestMapping(value = "handleSuggestions")
	@ResponseBody
	public String handleSuggestions(String title,String content,String email){
		Properties prop = new Properties();
        prop.setProperty("mail.host", "mail.163.com");
        prop.setProperty("mail.transport.protocol", "smtp");
        prop.setProperty("mail.smtp.auth", "true");
        
        Session session = Session.getInstance(prop);
        try {
			Transport transport = session.getTransport();
			transport.connect("mail.163.com", "13571875808@163.com", "85999369zt");
			String sContent = "标题:"+title+"\n内容:\n"+content+"\n邮箱:"+email;
			Message msg = createSimpleMail(session,"校内换意见反馈",sContent);
			transport.sendMessage(msg, msg.getAllRecipients());
			return "1";
		} catch (NoSuchProviderException e) {
			e.printStackTrace();
			return "0";
		} catch (MessagingException e) {
			System.out.println("用户名或密码不正确");
			e.printStackTrace();
			return "0";
		}
		
	}

	private Message createSimpleMail(Session session,String title,String content) throws AddressException, MessagingException {
		 //创建邮件对象
		MimeMessage message = new MimeMessage(session);
		//指明邮件的发件人
		message.setFrom(new InternetAddress("13571875808@163.com"));
		//指明邮件的收件人
		message.setRecipient(Message.RecipientType.TO, new InternetAddress("13571875808@163.com"));
		//邮件的标题
		message.setSubject(title);
		//邮件的文本内容
		message.setContent(content, "text/html;charset=UTF-8");
		//返回创建好的邮件对象
		return message;
	}
}

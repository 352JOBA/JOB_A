package com.kh.joba.user.attachment.controller;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kh.joba.user.attachment.model.service.AttachmentService;
import com.kh.joba.user.attachment.model.vo.Attachment;


@RestController
public class AttachmentController {
	

	@RequestMapping("/insertImage.do")
	public String fileUpload(@RequestParam(value = "file", required = false)MultipartFile[] upFiles, HttpServletRequest request) {
	      
		String savePath = 
	            request.getServletContext().getRealPath("/resources/uplaodFiles/board/");
	      
	      String renamedFileName = null;
	      
	      for(MultipartFile f : upFiles) {
	         if( !f.isEmpty() ) {
	            // 파일 이름 재생성해서 저장하기
	            String originalFileName = f.getOriginalFilename();
	            String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
	            // sample.jpg --> .jpg
	            
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
	            
	            int rndNum = (int)(Math.random()*1000);
	            
	            renamedFileName
	             = sdf.format(new Date(System.currentTimeMillis()))+"_"+rndNum+"."+ext;  
	            // --> 20191230_154500_1.jpg
	            
	            try {
	               
	               f.transferTo(new File(savePath + renamedFileName));
	               
	            } catch (IllegalStateException e) {
	               e.printStackTrace();
	            } catch (IOException e) {
	               e.printStackTrace();
	            }
	         }
	      }
	      String uploadPath = "";
	         InetAddress inet = null;
       try {
          inet = InetAddress.getLocalHost();
       } catch (UnknownHostException e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
       }
       System.out.println(request.getServerPort());
       String serverPath = "http://localhost:"+request.getServerPort()+"/joba/resources/uplaodFiles/board/"; 
	   		System.out.println(serverPath);
	     
	      uploadPath = serverPath + renamedFileName;
	    System.out.println(uploadPath);
	      return uploadPath;
	      
	   }
	
	@RequestMapping("/updateImage.do")
	   public String updateFileUpload(@RequestParam(value = "file", required = false)MultipartFile[] upFiles, HttpServletRequest request) {
	      
		String savePath = 
	            request.getServletContext().getRealPath("/resources/uplaodFiles/board/");
	      
	      String renamedFileName = null;
	      
	      for(MultipartFile f : upFiles) {
	         if( !f.isEmpty() ) {
	            // 파일 이름 재생성해서 저장하기
	            String originalFileName = f.getOriginalFilename();
	            String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
	            // sample.jpg --> .jpg
	            
	            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
	            
	            int rndNum = (int)(Math.random()*1000);
	            
	            renamedFileName
	             = sdf.format(new Date(System.currentTimeMillis()))+"_"+rndNum+"."+ext;  
	            // --> 20191230_154500_1.jpg
	            
	            try {
	               
	               f.transferTo(new File(savePath + renamedFileName));
	               
	            } catch (IllegalStateException e) {
	               e.printStackTrace();
	            } catch (IOException e) {
	               e.printStackTrace();
	            }
	         }
	      }
	      String uploadPath = "";
	      
	      InetAddress inet = null;
    try {
       inet = InetAddress.getLocalHost();
    } catch (UnknownHostException e) {
       // TODO Auto-generated catch block
       e.printStackTrace();
    }
    
    
    String serverPath = "http://localhost:"+request.getServerPort()+"/joba/resources/uplaodFiles/board/"; 
	     
	      uploadPath = serverPath + renamedFileName;
	    		  
	      return uploadPath;
	      
	   }
}
